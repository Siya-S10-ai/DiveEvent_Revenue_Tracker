Dive Event Schema & Revenue Calculator (SQL + Java)

📘 Overview

This project demonstrates core backend skills through the creation of a mini e-commerce database schema and a Java program that interacts with it. It's designed as part of a skillset assessment, showcasing the ability to build normalized relational databases, write stored logic, and connect that logic through a Java application.

🧱 SQL Structure

Tables Created:

customer: Stores customer details.

product: Stores product catalog.

invoice: Links customer purchases with transaction totals.

invoice_line: Breaks down individual invoice items.

Additional SQL Features:

Sample Data: Inserted for demonstration.

Stored Procedure: UpdateCustomerEmail updates email based on ID.

Stored Function: CalculateTotalRevenueForMonth calculates revenue for a given month.

☕ Java Integration

Java class CalculateRevenueForMonth connects to MySQL via JDBC.

Uses CallableStatement to invoke the SQL function.

Handles user input for dynamic data retrieval.

🧠 Skills Demonstrated

SQL schema design, constraints, stored routines.

JDBC in Java, callable statements, user interaction.

📌 Reflections

This project improved my confidence in backend logic and highlighted areas to strengthen like data validation, security, and UI design. It confirms my ability to bridge SQL and Java effectively, while setting clear next steps for growth.

📂 How to Run

Execute the SQL script in MySQL to set up schema.

Compile and run the Java class.

Input any YYYY-MM month format to fetch revenue results from stored data.

🔧 Requirements

MySQL 8+

Java JDK 11+

JDBC driver (MySQL Connector/J)

📥 Author

Siya Nhlapo – Software Development Student, Passionate about backend logic and systems integration.
