# Sales-and-Customer-Management-System
Database management system for managing sales, customers, and orders.
Project Description
This project is an E-commerce Database Management System designed to efficiently manage sales, customers, orders, and inventory for a fictional online store. The system tracks various entities, including customers, products, orders, order details, payments, and shipping information. It provides a robust framework for managing data and supports essential operations needed to facilitate e-commerce transactions, ensuring smooth operations and a better customer experience.

Instructions for Setting Up the Database
Install MySQL:

Ensure you have MySQL installed on your machine. You can download it from the official MySQL website.
Open MySQL Workbench:

Launch MySQL Workbench after installation.
Create a New Database:

Open a new SQL query tab and run the following command to create the database:
SQL
Copy code
CREATE DATABASE e_commerce_db;
Select the newly created database for use:
SQL
Copy code
USE e_commerce_db;
Create the Tables:

Copy and execute the SQL scripts provided in the project (such as create_tables.sql) to create the necessary tables for customers, products, orders, etc.
Insert Sample Data:

Run the SQL scripts that populate your tables with sample data (e.g., insert_data.sql).
Verify the Setup:

Execute simple SELECT queries (e.g., SELECT * FROM customers;) to ensure that your tables are populated correctly.
Steps to Run Queries
Open MySQL Workbench:

Launch MySQL Workbench and connect to your database instance.
Select Your Database:

Use the following command to select the e-commerce database:
SQL
Copy code
USE e_commerce_db;
Write and Execute SQL Queries:

In the query editor, type any SQL command (e.g., SELECT, INSERT, UPDATE, or DELETE) you want to run against your database.
Click the "Execute" button (lightning bolt icon) to run the query and view results.
Review the Output:

The results will appear in the result grid below the query editor, where you can analyze and interpret them.
Explanation of Results or Output
Query Results:

When you run SELECT queries, the output will display rows of data that match your query criteria, allowing you to see the current state of your database. For instance, querying the customers table will show all registered customers, including their names, emails, and contact information.
Data Manipulation Outputs:

If you use INSERT statements to add new records, you can expect confirmation messages indicating the number of rows affected.
For UPDATE queries, the output will show how many records were modified, helping ensure that your changes were applied correctly.
Error Messages:

If there are any issues (e.g., syntax errors), the output will provide error messages to guide you in troubleshooting.
