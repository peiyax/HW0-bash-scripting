# CSE 583 Homework 1: Bicycle Data Analysis

This project uses pandas and matplotlib to analyze hourly bicycle counts on the Fremont Bridge, focusing on data from 2016.

## Dataset

The data come from the City of Seattle's [Fremont Bridge bicycle counter dataset](https://data.seattle.gov/Transportation/Fremont-Bridge-Hourly-Bicycle-Counts-by-Month-Octo/65db-xm6k). Each row contains an observation date and time, bicycle counts for the east and west sidewalks, and a total count supplied by the source.

## Process

1. Loaded the CSV into a pandas DataFrame and inspected its columns and data types.
2. Converted the date column to a datetime type and the bicycle count columns to nullable integers so that whole-number counts and missing values could both be represented.
3. Calculated a new total count by adding the east and west counts, then extracted the hour and year from each timestamp. Adding the counts directly preserves missing values rather than treating them as zero.
4. Created a separate DataFrame containing only observations from 2016.
5. Counted rows with a missing east or west count. There was **one missing time point**, at **2016-03-13 02:00**. Removed this incomplete observation before plotting and calculating averages.
6. Grouped the remaining observations by hour and summed the counts across all days in 2016. Created a bar chart with a title and labeled axes, and saved it as `counts_by_hour.png`.
7. Calculated the mean total count for each hour and used `idxmax()` to identify the busiest hour computationally.

## Results

The busiest hour on average was **17:00–18:00**, with approximately **399.03 bicycles** per observation. The plot also shows a morning peak around 08:00.

I used OpenAI's Codex to help write the analysis code, explain the pandas operations, and draft this README. 