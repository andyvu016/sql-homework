# Fraud Analysis: Credit Card Transactions
The aim of this project is to analyze historical credit card transactions and spending patterns of consumers to detect the possibility of fraud. The goal is to determine a trend and find outliers that could posssibly be fraud.

## About
As cashless payment methods become the norm, credit card networks are processing millions of transactions each second. Given the volume, how can one determine which transaction are legitimate, and which are not. Big or small, fraud is something that cost businesses millions, if not billions of dollars each year. Although there are new technologies such as machine learning and artificial intelligence being employed to detect fraud, there are still many instances where fraud can only be detected by explicit data analysis. Thjs project will use PostgreSQL to create a database in which will be analyzed through visualization in Python, with the use of the Pandas, hvPlot and SQLAlchemy libraries.

## Getting Started
To create the Database using the SQL schema and run the queries, you need to have the following SQL database management system and development platform installed:

- PostgreSQL
- pgAdmin 

To run the Jupyter notebook and interact with the visualizations, you need to have the following software and Python libraries installed:

- Python 3.10 or later
- Anaconda Distribution
- Pandas
- hvPlot
- SQLAlchemy

## Installing
1. Install the latest version of PostgreSQL and pgAdmin [here](https://www.enterprisedb.com/downloads/postgres-postgresql-downloads)

2. Install the latest verion of Python [here](https://www.python.org/downloads/).

3. Install the latest version of Anaconda [here](https://www.anaconda.com/download).

4. Installing Anaconda includes the Pandas package.

5. To install the hvPlot and SQLAlchemy packages, run the following command in your terminal.

```
conda install -c pyviz hvplot 
conda install -c anaconda sqlalchemy
pip install psycopg2
```

## Usage
You can clone or download this GitHub project and build the database using the `schema.sql` and seed files in the [\Data](https://github.com/andyvu016/sql-homework/tree/main/Data) folder in PostgreSQL. After that, open the [`visual_data_analysis.ipynb`](https://github.com/andyvu016/sql-homework/blob/main/visual_data_analysis.ipynb) using Jupyter Notebook. The Jupyter Notebook is seperated into sections that cover different aspects of the analysis. Each section contains explanations, code snippets, and interactive visualizations. By executing each cell in the Jupyter Notebook you can then interact with the visualizations.

## Contributor
Andy Vu