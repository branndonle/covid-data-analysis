CREATE DATABASE covid_database;

DROP TABLE IF EXISTS colleges_raw;
CREATE TABLE colleges_raw(
	_date_ VARCHAR(15) NOT NULL,
	state_college VARCHAR(100),
	county VARCHAR(100),	
	city VARCHAR(100),
	ipeds_id VARCHAR(15),
	college VARCHAR(100),
	cases INT NULL,
	cases_2021 FLOAT NULL,
	notes VARCHAR(500) NULL
);

SELECT *
FROM colleges_raw;

DROP TABLE IF EXISTS colleges;
CREATE TABLE colleges(
	_date_ VARCHAR(15) NOT NULL,
	state_college VARCHAR(100),
	county VARCHAR(100),	
	city VARCHAR(100),
	ipeds_id VARCHAR(15),
	college VARCHAR(100),
	cases INT NULL,
	cases_2021 FLOAT NULL,
	notes VARCHAR(500) NULL
);

SELECT *
FROM colleges;
-- ------------------------------------------------------------- DATA WRANGLING ------------------------------------------------------------------------
-- Alter the table column '_date_' format from VARCHAR to DATE format
ALTER TABLE colleges
ALTER COLUMN _date_ TYPE DATE
USING TO_DATE(_date_, 'MM/DD/YYYY');

-- Alter the table column 'ipeds_id' format from varchar to INT format
SELECT * FROM colleges 
WHERE ipeds_id !~ '^[0-9]+$';

-- This finds and sets the ipeds_id to null
UPDATE colleges
SET ipeds_id = null
WHERE ipeds_id !~ '^[0-9]+$';

-- Removes the ipeds_id that have null values
DELETE FROM colleges WHERE ipeds_id IS NULL;

SELECT * 
FROM colleges
WHERE notes IS NULL

-- Adjust the cases_2021 null values to 0
UPDATE colleges
SET cases_2021 = 0
WHERE cases_2021 IS NULL

-- -----------------------------------------------------------END OF DATA WRANGLING-------------------------------------------------------------------
-- ------------------------------------------------------------EXPLORATORY DATA ANALYSIS (EDA)--------------------------------------------------------

-- Q1.Count Total Colleges in the Dataset
SELECT COUNT(*)
FROM colleges;

-- Q2. Get the Earliest and Latest Date in the Dataset
SELECT MIN(_date_) AS min_date, MAX(_date_) AS max_date
FROM colleges

-- Q3. Find the College with the Most Cases in 2021
SELECT college, state_college, MAX(cases_2021) AS max_cases_2021
FROM colleges
GROUP BY college, state_college
ORDER BY max_cases_2021 DESC

-- Q4. Find the average case per college
SELECT college, ROUND(AVG(cases), 2) AS avg_cases
FROM colleges
GROUP BY college
ORDER BY avg_cases DESC;

-- Q5. Find the average in cases and cases_2021 
SELECT college, AVG(cases_2021) AS avg_cases2021
FROM colleges
GROUP BY college
ORDER BY avg_cases2021 DESC;

-- Q6. List Colleges with More Than 1,000 Cases in Any Year
SELECT college, cases, cases_2021
FROM colleges
WHERE cases > 1000 AND cases_2021 > 1000

-- Q7. Year-over-Year Case Change (2020 vs. 2021)


-- -----------------------------------------------------------END OF EXPLORATORY DATA ANALYSIS----------------------------------------------------------