# Dive Event Schema & Revenue Calculator (SQL + Java)

<p>📘 <strong>Overview</strong></p>

<p>This project demonstrates backend skills through the creation of a mini e-commerce database schema and a Java program that interacts with it. It's designed as part of a skillset assessment, showcasing the ability to build normalized relational databases, write stored logic, and connect that logic through a Java application.</p>

<hr>

<h2>🧱 SQL Structure</h2>

<p><strong>Tables Created:</strong></p>
<ul>
  <li><code>customer</code>: Stores customer details.</li>
  <li><code>product</code>: Stores product catalog.</li>
  <li><code>invoice</code>: Links customer purchases with transaction totals.</li>
  <li><code>invoice_line</code>: Breaks down individual invoice items.</li>
</ul>

<p><strong>Additional SQL Features:</strong></p>
<ul>
  <li>Sample Data: Inserted for demonstration.</li>
  <li>Stored Procedure: <code>UpdateCustomerEmail</code> updates email based on ID.</li>
  <li>Stored Function: <code>CalculateTotalRevenueForMonth</code> calculates revenue for a given month.</li>
</ul>

<hr>

<h2>☕ Java Integration</h2>

<p>Java class <code>CalculateRevenueForMonth</code> connects to MySQL via JDBC.</p>
<ul>
  <li>Uses <code>CallableStatement</code> to invoke the SQL function.</li>
  <li>Handles user input for dynamic data retrieval.</li>
</ul>

<hr>

<h2>🧠 Skills Demonstrated</h2>

<ul>
  <li>SQL schema design, constraints, stored routines.</li>
  <li>JDBC in Java, callable statements, user interaction.</li>
</ul>

<hr>

<h2>📌 Reflections</h2>

<p>This project improved my confidence in backend logic and highlighted areas to strengthen like data validation, security, and UI design. It confirms my ability to bridge SQL and Java effectively, while setting clear next steps for growth.</p>

<hr>

<h2>📂 How to Run</h2>

<ol>
  <li>Execute the SQL script in MySQL to set up schema.</li>
  <li>Compile and run the Java class.</li>
  <li>Input any <code>YYYY-MM</code> month format to fetch revenue results from stored data.</li>
</ol>

<hr>

<h2>🔧 Requirements</h2>

<ul>
  <li>MySQL 8+</li>
  <li>Java JDK 11+</li>
  <li>JDBC driver (MySQL Connector/J)</li>
</ul>

<hr>

<h2>📥 Author</h2>

<p><strong>Siyabonga Nhlapo</strong> – Software Development Student, demonstrated backend logic and systems integration.</p>
