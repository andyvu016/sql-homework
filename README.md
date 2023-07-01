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
You can clone or download this GitHub project and build the database using the [`schema.sql`](https://github.com/andyvu016/sql-homework/blob/main/schema.sql) and [`all_tables_seed.sql`](https://github.com/andyvu016/sql-homework/blob/main/Data/all_tables_seed.sql) seed file in the [\Data](https://github.com/andyvu016/sql-homework/tree/main/Data) folder in PostgreSQL. After that, open the [`visual_data_analysis.ipynb`](https://github.com/andyvu016/sql-homework/blob/main/visual_data_analysis.ipynb) using Jupyter Notebook. The Jupyter Notebook is seperated into sections that cover different aspects of the analysis. Each section contains explanations, code snippets, and interactive visualizations. By executing each cell in the Jupyter Notebook you can then interact with the visualizations.

## Report
### Data Analysis - Part 1 
#### Small Transactions
It is a known tactic that fraudsters hack a credit card by making multiple small transactions which are typically ignored by the cardholders. These transactions are generally less than $2.00. By using the data provided in the transaction and credit card tables, a `JOIN` clause can be used to combine the tables by the card number, i.e. isolating the transactions of each cardholder. Extending this query by using a `COUNT()` on the transactions with the condition that the amount is less than $2.00, and grouping by the cardholder id, it is possible to get a count for the number of small transactions a cardholder makes. 

Running the query returned results for every cardholder. By sorting the small transactions count in descending order, it is evident that there are 18 cardholders with 10 or more small transactions with the top 5 having over 20. Having a few small transactions is normal, but having over 10, let alone 20, raises great suspicion of fraudulent activity. It is also possible that those in the top 5 make more transactions overall relative to those below. However, based on the abnormal number of small transactions, **there is** evidence to suggest that those credit cards have been hacked.

#### Early Transactions
The time period is said to be a potential leading factor in which fraudulent transactions are made. Consider the time period between 7:00 am and 9:00 am, this is a time where most cardholders are doing their morning routines. Transactions made during this time have a possibility of going unnoticed. By running the query to get the top 100 highest transactions made between 7:00 am and 9:00 am, the top 7 transactions are over $1000. These are potential transactions that could be fraudulent. However, considering the top 100 highest transactions made during the rest of the day, the top 64 transactions are over $1000. Thus continuing with the same logic it must mean that there is a higher number of fraudulent transactions made during the rest of the day. Considering the relative number of transactions to the length of the time period, it does not seem that time period is a factor for fraudulent transactions.

#### Prone Merchants 
The top 5 merchants prone to being hacked using small transactions in descending order are **Wood-Ramirez**, **Hood-Phillips**, **Baker Inc**, **Mcdaniel, Hines and Mcfarland**, and **Hamilton-Mcfarland**.

### Data Analysis - Part 2
#### Hacked Cardholders
Deviations from a cardholder's usual consumption pattern may suggest fraudulent transactions. By first looking at the plot of transactions for cardholder 2, the variance between each transaction seems to be consistent. There are no significant outliers that may suggest fraudulent activity. On the other hand , the plot of transactions for cardholder 18 is the complete opposite. There are a few significant extreme outliers throughout the year that may suggest fraudulent activity. The difference between both the cardholders is most evident in the combined plot. The difference may suggest fraudulent activity for cardholder 18. It is out of the ordinary for a cardholder to make such large transactions throughout the year, especially when the amounts are for more than 100 times their usual transactions. The firm should contact the customer to confirm any transaction that deviates from the customers usual consumption pattern.

#### Unauthorized Usage
Unauthorized usage of a credit card is a common form of fraud. Looking at the box plot for the transactions for cardholder 25, there are quite a few outliers from January 2018 to June 2018. There are 4 outliers in June, 3 outliers in April and 1 outlier in January, March and May. These outlier transactions also seem to be increasing in amount and frequency. Of all the outliers, all but 2 occur in April, May and June. The amount for the outlier in March is higher than that of the one in January, and the highest outlier in June, is higher than the one in March. These anomalies indicate a developing greediness in a sense that the unauthorized user thinks that they are "getting away" with using the corporate credit card for expensive purchases. Based on the evidence, it is certain that there has been fraud committed on cardholder 25's credit card.

## References
- [Quick Database Diagrams](https://www.quickdatabasediagrams.com/) - Used to generate entity relationship diagram (ERD)

## Contributor
Andy Vu