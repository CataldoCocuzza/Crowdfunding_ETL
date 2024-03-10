# Crowdfunding_ETL

Completed by Li Chen and Cataldo Cocuzza, 3/8/2024

description:

This is an ETL pratice. We have 2 source xlsx files in Resources folder.

steps:
1) read crowdfunding.xlsx and extract data into Pandas DataFrame
2) review data, get columns, verify data type and counts
3) split column to get category and sub-category columns
4) get unique values of the 2 above columns
5) transform by using numpy array/list comprehension/zip to generate 2 new DataFrames respectively
6) export category and sub-category DataFrames to csv
7) more data transformation, rename columns, change data type, merge category and sub-category, drop redundant columns
8) export cleaned data to campaign.csv

9) read contacts.xlsx and extract data into Pandas DataFrame
10) option1, use Pandas to get a clean and nice DataFrame (json.loads, str.split)
11) export to contacts.csv
12) option2, use regex to achieve the same goal
  **contact_id name are fairly easy, email pattern is more challenging and took me a few minutes to figure out

13) create a new PostgreSQL database crowdfunding_db
14) create 4 empty table with proper schema,     
15) load 4 csv files in sequence (cat-subcat-contact-campaign) into table respectively
16) get deliverable ready, crowdfunding_db_schema.sql, ERD screenshot, select statement, etc.
