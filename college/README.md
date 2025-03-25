# Covid-19 Cases in U.S. Colleges (2020-2023) - MySQL Queries

This repository contains MySQL queries to analyze and gain insights from the [Covid-19 dataset](https://github.com/nytimes/covid-19-data) released by The New York Times, which tracks Covid-19 cases reported at U.S. colleges and universities during the 2020-2023 academic year.


## Data Source

The data used in this project is sourced from The New York Times, which surveyed U.S. colleges and universities to track Covid-19 cases among students, faculty, staff, and other workers during the 2020-2023 academic year.

- Dataset link: [Colleges Covid-19 Data (CSV)](https://raw.githubusercontent.com/nytimes/covid-19-data/master/colleges/colleges.csv)
- The dataset includes information such as:
  - Date of report
  - College name
  - Location (state, county, city)
  - Total reported cases since the start of the pandemic
  - Cases reported in 2021
  - Methodological notes
 
  
[The data file](college.csv) contains the following columns:

| Column | Definition |
| ------------- | ------------- |
| **date** | The date of the most recent update |
| **state** | The state where the college is located in the U.S. |
| **county** | The county in each state where the college is located | 
| **city** | The city where the college is located |
| **ipeds_id** | The Integegrated Postsecondary Education Data System (IPEDS) ID number for the college in question |
| **cases** | The total number of reported Covid-19 cases among university students and staff across all fields, including individuals in high-risk roles such as doctors, nurses, pharmacists, and medical students, from the start of the pandemic|
| **cases_2021** | Cases reported specifically since January 1, 2021 only |
| **notes** | Any special notes on the data collection |

Colleges and universities that have reported zero cases will be listed with a zero for cases, while colleges which have not reported data will have a blank in the cases field.

You can find more details and access the dataset from [the original GitHub repository](https://github.com/nytimes/covid-19-data?tab=readme-ov-file).
Note: This dataset is for non-commercial use only as per the terms of its license. Please review the full terms of use in [the original repository](https://github.com/nytimes/covid-19-data/tree/master?tab=License-1-ov-file).

Data can be found in the **[colleges.csv](colleges.csv)** file. ([Raw CSV](https://raw.githubusercontent.com/nytimes/covid-19-data/master/colleges/colleges.csv))

```
date,state,county,city,ipeds_id,college,cases,cases_2021,notes
2021-02-26,Alabama,Madison,Huntsville,100654,Alabama A&M University,41,,
…
2021-02-26,Alabama,Jefferson,Birmingham,100663,University of Alabama at Birmingham,2856,570,"Total is known to include one or more cases from a medical school, medical center, teaching hospital, clinical setting or other academic program in health sciences."
```


## Project Description

This project aims to analyze Covid-19 cases at U.S. colleges and universities using MySQL queries. The dataset is imported into a MySQL database, and various queries are written to gain insights, such as:
- Trends in Covid-19 cases by region
- Comparison of reported cases across institutions
- Analyzing the number of cases reported in 2021
- Investigating colleges with zero cases or missing data

## Setup and Usage

### Prerequisites
- MySQL Server (version 5.x or higher)
- MySQL Workbench or any MySQL client for running queries
- Basic understanding of SQL

### Installation Steps
1. **Clone this repository:**
   ```bash
   git clone https://github.com/branndonle/covid-data-analysis.git


## Methodology
### Data Wrangling:
This is the first step where inspection of data occurs to ensure NULL values and missing values are detected and data replacement methods are used to occupy missing or NULL values.
This is the first step where data inspection occurs to ensure NULL and missing values are detected and value replacement methods are used to fill in missing null values.
- Process:
  1. Create a database
  2. Create a table with matching format to import data
  3. Import data into table
  4. Alter table column 'date' format from VARCHAR to DATE
  5. Alter the table column 'ipeds_id' format from varchar to INT format
  6. Adjust the cases_2021 null values to 0

### General Insight
> 1. How many unique cities are there?
> 2. What are the earliest and latest Dates in the dataset?
> 3. Find the College with the Most Cases in 2021
> 4. ind the average case per college
> 5. Find the average in cases and cases_2021
> 6. List Colleges with More Than 1,000 Cases in Any Year
> 7. Year-over-Year Case Change (2020 vs. 2021)
> 8. Find the top 5 counties with the most cases
> 9. Find all colleges in a specific state (e.g., California).
> 10. List all unique states present in the dataset.
> 11. Retrieve the top 10 colleges with the most recorded cases in 2021.
> 12. Find colleges that had zero reported cases in both years.
> 13. Identify colleges that have missing (NULL) values in any column
> 14. Count how many colleges are in each state.
> 15.  Find the total number of cases per county across all colleges.
> 16.  Retrieve the average number of cases per state in 2021.
> 17.  Find the college with the highest and lowest cases in 2021 in each state.
> 18.  Calculate the percentage of total cases each state contributed to the dataset.

## Attribution

The data used in this project is sourced from The New York Times. The dataset tracks Covid-19 cases at U.S. colleges and universities, collected between July 2020 and March 2023. 

You can find the data [here](https://raw.githubusercontent.com/nytimes/covid-19-data/master/colleges/colleges.csv).

### Data Description:
This dataset includes the total number of reported Covid-19 cases among university students and employees, including those in high-risk roles such as doctors, nurses, pharmacists, and medical students, from the beginning of the pandemic.

For a more detailed description of the data, refer to "The New York Times survey of U.S. Colleges and Universities".

### License:
The data is licensed under the same terms as the [Coronavirus Data in the United States data](https://github.com/nytimes/covid-19-data).

### Link to Original Graphic:
If you use this data in an online presentation, please link to The New York Times graphic discussing these results: [College Covid Tracker](https://www.nytimes.com/interactive/2021/us/college-covid-tracker.html).

### Contact:
For questions regarding the data, contact: covid-data@nytimes.com.

