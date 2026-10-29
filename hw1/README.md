# CSE 583 Homework 1: Bicycle Data Analysis

This project uses **pandas** and **matplotlib** to analyze hourly bicycle counts on the Fremont Bridge, focusing on 2016.

## Dataset and Usage

The data come from the City of Seattle's [Fremont Bridge bicycle counter dataset](https://data.seattle.gov/Transportation/Fremont-Bridge-Hourly-Bicycle-Counts-by-Month-Octo/65db-xm6k). Each row includes a date and time, east and west sidewalk counts, and a source-provided total.

Place `bicycle_data.csv` beside `hw1.py`. From the `hw1` project folder, run:

```bash
uv run python src/hw1_data_analysis/hw1.py
```

If the CSV is in `src` instead, supply its path:

```bash
uv run python src/hw1_data_analysis/hw1.py src/bicycle_data.csv
```

The script saves `counts_by_hour.png` beside `hw1.py`.

## Process

1. Loaded the CSV into a pandas DataFrame and inspected the columns and types.
2. Converted the entire `Date` column to pandas datetimes and the count columns to nullable integers (`Int64`).
3. Added `Total` as east plus west, then extracted `Hour` and `Year` using `.dt.hour` and `.dt.year`.
4. Created a separate DataFrame containing only 2016 observations.
5. Identified **one missing time point**, at **2016-03-13 02:00**, and removed this incomplete observation before analysis.
6. Summed counts by hour across all days in 2016 and saved a labeled bar chart.
7. Calculated the mean count for each hour and used `idxmax()` to identify the busiest hour: **17:00–18:00**, averaging approximately **399.03 bicycles**.

## Bonus: Date Decoding and Datetime Types

For a string such as `2016-01-01T08`, the format `%Y-%m-%dT%H` decodes the year, month, day, and 24-hour hour:

```python
df["Date"] = pd.to_datetime(df["Date"], format="%Y-%m-%dT%H")
```

> A literal `T` is a separator character; an actual tab is written as `\t` in Python. The script normalizes tabs to `T` before decoding. It also accepts the supplied CSV's `MM/DD/YYYY hh:mm:ss AM/PM` format and ISO timestamps containing minutes and seconds.

| Type | Description | Typical use |
|---|---|---|
| Python `datetime.datetime` | A standard-library object representing one date and time, with microsecond precision and optional timezone information. | Working with individual dates in Python. |
| NumPy `datetime64` | A date/time scalar or array dtype with a specified unit, such as seconds or nanoseconds. It has no timezone metadata. | Efficient array-based date arithmetic. |
| pandas datetime | A Series has a datetime dtype such as `datetime64[us]` or `datetime64[ns]`; individual values are usually `Timestamp` objects. Supports `NaT`, vectorized `.dt` access, and timezone-aware types. | Filtering, grouping, and analyzing tabular time-series data. |

I used pandas datetimes because they allow the whole column to be converted together and make extracting the hour and year straightforward. The storage resolution depends on the pandas version and input; it is not always nanoseconds.

References: [Python datetime](https://docs.python.org/3/library/datetime.html), [NumPy datetime64](https://numpy.org/doc/stable/reference/arrays.datetime.html), and [pandas to_datetime](https://pandas.pydata.org/docs/reference/api/pandas.to_datetime.html).

## AI Assistance

I used OpenAI's Codex to help write and revise the analysis code, explain pandas operations and datetime types, and draft this README. 
