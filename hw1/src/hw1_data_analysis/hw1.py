"""Analyze Fremont Bridge bicycle counts, focusing on 2016."""

from pathlib import Path
import sys

import matplotlib
import pandas as pd

matplotlib.use("Agg")
import matplotlib.pyplot as plt


def decode_dates(date_column):
    """Convert the entire date column from strings to pandas datetimes."""
    # The hint uses yyyy-mm-ddThh, for example 2016-01-01T08.
    # A literal T is different from a tab character (\t).
    # Normalize actual tabs to T so that both separators are accepted.
    text = date_column.astype("string").str.strip().str.replace("\t", "T", regex=False)
    try:
        # %Y = year, %m = month, %d = day, T = separator, %H = 24-hour hour.
        return pd.to_datetime(text, format="%Y-%m-%dT%H", errors="raise")
    except ValueError:
        # The supplied Seattle CSV uses MM/DD/YYYY hh:mm:ss AM/PM.
        # Also support ISO timestamps with minutes/seconds and mixed formats.
        # Invalid dates raise an error rather than silently losing observations.
        return pd.to_datetime(text, format="mixed", errors="raise")


def main():
    # 1. Read a local CSV. An optional command-line argument overrides its path.
    # Default location: beside this script in src/hw1_data_analysis/.
    csv_file = Path(sys.argv[1]) if len(sys.argv) > 1 else Path(__file__).with_name("bicycle_data.csv")
    df = pd.read_csv(csv_file)

    # 2. Original columns and intended data types:
    # Date: observation date and hour; pandas datetime64, not a string.
    # ... Total: source-provided hourly total; nullable integer (Int64).
    # ... Cyclist West Sidewalk: hourly west count; nullable integer (Int64).
    # ... Cyclist East Sidewalk: hourly east count; nullable integer (Int64).
    # Nullable integers represent whole-number counts while preserving missing data.
    # The CSV initially loads dates as strings and counts as floats.
    prefix = "Fremont Bridge Sidewalks, south of N 34th St"
    df = df.rename(columns={
        "date": "Date",
        f"{prefix} Total": "Reported_Total",
        f"{prefix} Cyclist West Sidewalk": "West",
        f"{prefix} Cyclist East Sidewalk": "East",
    })
    df["Date"] = decode_dates(df["Date"])
    if df["Date"].isna().any():
        raise ValueError("Missing dates must be resolved before filtering by year.")
    for column in ["Reported_Total", "West", "East"]:
        df[column] = pd.to_numeric(df[column], errors="raise").astype("Int64")

    # 3. Add total count, hour, and year using the decoded datetime column.
    # Addition preserves missing values instead of treating missing counts as zero.
    df["Total"] = df["East"] + df["West"]
    df["Hour"] = df["Date"].dt.hour
    df["Year"] = df["Date"].dt.year

    # 4. Create a separate dataframe for 2016.
    df_2016 = df.loc[df["Year"] == 2016].copy()

    # 5. Missing time points: 1 (2016-03-13 02:00:00) in the supplied CSV.
    # Count incomplete observations, not individual missing cells.
    missing_points = int(df_2016[["East", "West"]].isna().any(axis=1).sum())
    print(f"Missing time points: {missing_points}")
    # Remove incomplete observations before plotting and calculating averages.
    df_2016 = df_2016.dropna(subset=["East", "West"]).copy()
    if df_2016.empty:
        raise ValueError("No valid 2016 observations")

    # 6. Sum counts across all days for each hour of the day.
    counts_by_hour = df_2016.groupby("Hour")["Total"].sum()
    fig, ax = plt.subplots(figsize=(10, 6))
    counts_by_hour.plot(kind="bar", ax=ax, color="steelblue", rot=0)
    ax.set_title("Fremont Bridge Bicycle Counts by Hour (2016)")
    ax.set_xlabel("Hour of Day (0–23)")
    ax.set_ylabel("Total Bicycle Count Across All Days in 2016")
    fig.tight_layout()
    fig.savefig(Path(__file__).with_name("counts_by_hour.png"), dpi=200)
    plt.close(fig)

    # 7. Busiest hour on average: 17:00–18:00 (about 399.03 bicycles).
    # Compare means to account for differing numbers of valid observations.
    average_by_hour = df_2016.groupby("Hour")["Total"].mean()
    busiest_hour = int(average_by_hour.idxmax())
    print(f"Busiest hour: {busiest_hour:02d}:00–{busiest_hour + 1:02d}:00")
    print(f"Average bicycle count: {average_by_hour.loc[busiest_hour]:.2f}")


if __name__ == "__main__":
    main()
