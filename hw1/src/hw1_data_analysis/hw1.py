"""Analyze Fremont Bridge bicycle counts."""

from pathlib import Path

import matplotlib
import pandas as pd

matplotlib.use("Agg")
import matplotlib.pyplot as plt


# 1. Read the CSV into a dataframe
# Replace this URL with a local CSV path if desired
CSV_FILE = "https://data.seattle.gov/api/views/65db-xm6k/rows.csv"
df = pd.read_csv(CSV_FILE)

# 2. Original columns and intended types
# Date: observation date and hour; datetime
# ... Total: source-provided hourly total
# ... Cyclist West Sidewalk: hourly west count
# ... Cyclist East Sidewalk: hourly east count
# All three counts should be nullable integers (Int64)
# CSV initially loads Date as text and counts as floats because of missing values.
prefix = "Fremont Bridge Sidewalks, south of N 34th St"
df = df.rename(columns={
    f"{prefix} Total": "Reported_Total",
    f"{prefix} Cyclist West Sidewalk": "West",
    f"{prefix} Cyclist East Sidewalk": "East",
})
df["Date"] = pd.to_datetime(df["Date"], format="%m/%d/%Y %I:%M:%S %p")
for column in ["Reported_Total", "West", "East"]:
    df[column] = pd.to_numeric(df[column], errors="raise").astype("Int64")

# 3. Add total, hour, and year
# Addition preserves missing values; a missing side is not treated as zero.
df["Total"] = df["East"] + df["West"]
df["Hour"] = df["Date"].dt.hour
df["Year"] = df["Date"].dt.year

# 4. Create a separate dataframe for 2016
df_2016 = df.loc[df["Year"] == 2016].copy()

# 5. Missing time points: 1 (2016-03-13 02:00:00).
# Count rows with either side missing, not individual missing cells.
missing_points = int(df_2016[["East", "West"]].isna().any(axis=1).sum())
print(f"Missing time points: {missing_points}")
# Remove incomplete observations before plotting and calculating averages.
df_2016 = df_2016.dropna(subset=["East", "West"]).copy()
if df_2016.empty:
    raise ValueError("No valid 2016 observations")

# 6. Sum counts across all days for each hour
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
# Compare hourly means so differing numbers of valid observations are respected.
average_by_hour = df_2016.groupby("Hour")["Total"].mean()
busiest_hour = int(average_by_hour.idxmax())
print(f"Busiest hour: {busiest_hour:02d}:00–{busiest_hour + 1:02d}:00")
print(f"Average bicycle count: {average_by_hour.loc[busiest_hour]:.2f}")
