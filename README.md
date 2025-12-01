📊 Netflix Movies Analytics — Python & SQL Project

A data analysis project exploring Netflix movies using Python, MySQL, and advanced analytics.

📁 Project Overview

This project performs exploratory data analysis (EDA) and SQL-based analytics on a detailed Netflix movie dataset.
It covers data cleaning, transformation, visualization, and insight generation using Python notebooks and MySQL queries.
(Reference: Python documentation 

Netflix Movies Doc_Python

, SQL documentation 

Netflix_Project_Documentation_S…

)

📦 Technologies Used
Python Libraries

pandas

seaborn

matplotlib

SQLAlchemy

PyMySQL

urllib.parse

Database Tools

MySQL 8.x

MySQL Workbench

🗂 Dataset Fields

The dataset includes:
show_id, title, type, director, cast, country, date_added, release_year, rating, genres, duration, language, popularity, vote_count, vote_average, budget, revenue, and derived fields like date_N, Rev, Year.
(From project PDF 

Netflix_Project_Documentation_S…

)

🔍 Python Workflow Summary

Key analysis steps performed in the notebook include:

Loading & inspecting the dataset

Removing duplicates

Handling missing values (including heatmap visualization)

Date extraction (Year, date_N)

Creating revenue-in-millions column

Filtering, grouping, binning & visualization
(Workflow described in the Python doc 

Netflix Movies Doc_Python

)

🧮 SQL Analysis Included

Sample advanced analytics queries:

Top 10 ROI movies

High-performing directors

Genres with highest average revenue

High popularity but low rating titles

Revenue trends across years

Revenue category insights (low/medium/high)
(From SQL PDF pages 2–4 

Netflix_Project_Documentation_S…

)

🚀 How to Run

Load the CSV into MySQL using SQLAlchemy.

Open the Jupyter Notebook and run all cells.

Visualize insights and execute SQL queries for deeper analysis.

📘 Key Insights

ROI reveals the profitability of top-performing films.

Certain directors consistently produce high-rated content.

Genre patterns show strong variation in revenue potential.

Popularity does not always align with audience ratings.

Yearly trends highlight production cycles and performance shifts.
(Summarized from SQL report
