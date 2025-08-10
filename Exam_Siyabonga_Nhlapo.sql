CREATE TABLE INSTRUCTOR
(
    INS_ID VARCHAR(20) NOT NULL PRIMARY KEY,
    INS_FNAME VARCHAR(50) NOT NULL,
    INS_SNAME VARCHAR(50) NOT NULL,
    INS_CONTACT VARCHAR(50) NOT NULL,
    INS_LEVEL VARCHAR(20) NOT NULL
);


CREATE TABLE CUSTOMER
(
    CUST_ID VARCHAR(20) NOT NULL PRIMARY KEY,
    CUST_FNAME VARCHAR(50) NOT NULL,
    CUST_SNAME VARCHAR(50) NOT NULL,
    CUST_ADDRESS VARCHAR(50) NOT NULL,
    CUST_CONTACT VARCHAR(20) NOT NULL
);

CREATE TABLE DIVE
(
    DIVE_ID VARCHAR(20) NOT NULL PRIMARY KEY,
    DIVE_NAME VARCHAR(30) NOT NULL,
    DIVE_DURATION VARCHAR(20) NOT NULL,
    DIVE_LOCATION VARCHAR(50) NOT NULL,
    DIVE_EXP_LEVEL VARCHAR(20) NOT NULL,
    DIVE_COST DECIMAL(10,2) NOT NULL
);

CREATE TABLE DIVE_EVENT
(
    DIVE_EVENT_ID VARCHAR(20) NOT NULL PRIMARY KEY,
    DIVE_DATE DATE NOT NULL,
    DIVE_PARTICIPANTS VARCHAR(20) NOT NULL,
    INS_ID VARCHAR(20) NOT NULL,
    CUST_ID VARCHAR(20) NOT NULL,
    DIVE_ID VARCHAR(20) NOT NULL,
    FOREIGN KEY (INS_ID) REFERENCES INSTRUCTOR (INS_ID),
    FOREIGN KEY (CUST_ID) REFERENCES CUSTOMER (CUST_ID),
    FOREIGN KEY (DIVE_ID) REFERENCES DIVE (DIVE_ID)
);

INSERT INTO INSTRUCTOR VALUES ('101','James','Willis','0843569851','7');
INSERT INTO INSTRUCTOR VALUES ('102','Sam','Wait','07686598521','2');
INSERT INTO INSTRUCTOR VALUES ('103','Sally','Gumede','0786598521','8');
INSERT INTO INSTRUCTOR VALUES ('104','Bob','Du Preez','0796369857','3');
INSERT INTO INSTRUCTOR VALUES ('105','Simon','Jones','0826598741','9');

INSERT INTO CUSTOMER VALUES ('C115','Heinrich','Willis','3 Main Road','0821253659');
INSERT INTO CUSTOMER VALUES ('C116','David','Watson','13 Cape Road','0769658547');
INSERT INTO CUSTOMER VALUES ('C117','Waldo','Smith','3 Mountain Road','0863256574');
INSERT INTO CUSTOMER VALUES ('C118','Alex','Hanson','8 Cirle Road','0762356587');
INSERT INTO CUSTOMER VALUES ('C119','Kuhle','Bitterhout','15 Main Road','0821235258');
INSERT INTO CUSTOMER VALUES ('C120','Thando','Zolani','88 Summer Road','0847541254');
INSERT INTO CUSTOMER VALUES ('C121','Phillip','Jackson','3 Long Road','0745556658');
INSERT INTO CUSTOMER VALUES ('C122','Sarah','Jones','7 Sea Road','0814745745');
INSERT INTO CUSTOMER VALUES ('C123','Catherine','Howard','31 Lake Side Road','0822232521');

INSERT INTO DIVE VALUES ('550', 'Shark Dive', '3 Hours', 'Shark Point', '8', 'R 500');
INSERT INTO DIVE VALUES ('551', 'Coral Dive', '1 hour', 'Break Point', '7', 'R 300');
INSERT INTO DIVE VALUES ('552', 'Wave Cresent', '2 hours', 'Ship wreck ally', '3', 'R 800');
INSERT INTO DIVE VALUES ('553', 'Underwater Exploration', '1 hour', 'Coral ally', '2', 'R 250');
INSERT INTO DIVE VALUES ('554', 'Underwater Adventure', '3 hours', 'Sandy Beach', '3', 'R 750');
INSERT INTO DIVE VALUES ('555', 'Deep Blue Ocean', '30 minutes', 'Lazy Waves', '2', 'R 120');
INSERT INTO DIVE VALUES ('556', 'Rough Seas', '1 hour', 'Pipe', '9', 'R 700');
INSERT INTO DIVE VALUES ('557', 'White Water', '2 hours', 'Drifts', '5', 'R 200');
INSERT INTO DIVE VALUES ('558', 'Current Adventure', '2 hours', 'Rock Lands', '3', 'R 150');

INSERT INTO DIVE_EVENT VALUES ('de_101', '15-07-17', '5', '103', 'C115', '558');
INSERT INTO DIVE_EVENT VALUES ('de_102', '16-07-17', '7', '102', 'C117', '555');
INSERT INTO DIVE_EVENT VALUES ('de_103', '18-07-17', '8', '104', 'C118', '552');
INSERT INTO DIVE_EVENT VALUES ('de_104', '19-07-17', '3', '101', 'C119', '551');
INSERT INTO DIVE_EVENT VALUES ('de_105', '21-07-17', '5', '104', 'C121', '558');
INSERT INTO DIVE_EVENT VALUES ('de_106', '22-07-17', '8', '105', 'C120', '556');
INSERT INTO DIVE_EVENT VALUES ('de_107', '25-07-17', '10', '105', 'C115', '554');
INSERT INTO DIVE_EVENT VALUES ('de_108', '27-07-17', '5', '101', 'C122', '552');
INSERT INTO DIVE_EVENT VALUES ('de_109', '28-07-17', '3', '102', 'C123', '553');

-- Question 3: Create the "customer" table
-- This table stores customer information including name and contact details
CREATE TABLE customer (
    CustomerID INT AUTO_INCREMENT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Email VARCHAR(100),
    PhoneNumber VARCHAR(20)
);

-- Question 4: Create the "product" table
-- This table stores product details such as name, description, and price
CREATE TABLE product (
    ProductID INT AUTO_INCREMENT PRIMARY KEY,
    ProductName VARCHAR(100),
    Description TEXT,
    Price DECIMAL(10,2)
);

-- Question 5: Create the "invoice" table
-- This table records invoices, associating customers with transaction details
CREATE TABLE invoice (
    InvoiceID INT AUTO_INCREMENT PRIMARY KEY,
    CustomerID INT,
    InvoiceDate DATE,
    TotalAmount DECIMAL(10,2),
    FOREIGN KEY (CustomerID) REFERENCES customer(CustomerID)
);

-- Question 6: Create the "invoice_line" table
-- This table lists individual items on an invoice with product and quantity details
CREATE TABLE invoice_line (
    InvoiceLineID INT AUTO_INCREMENT PRIMARY KEY,
    InvoiceID INT,
    ProductID INT,
    Quantity INT,
    LineTotal DECIMAL(10,2),
    FOREIGN KEY (InvoiceID) REFERENCES invoice(InvoiceID),
    FOREIGN KEY (ProductID) REFERENCES product(ProductID)
);

-- Question 7: Insert at least five records into each table
-- Insert sample data into customers
INSERT INTO customer (FirstName, LastName, Email, PhoneNumber) VALUES
('Alice', 'Smith', 'alice@example.com', '0123456789'),
('Bob', 'Johnson', 'bob@example.com', '0234567891'),
('Charlie', 'Williams', 'charlie@example.com', '0345678912'),
('Diana', 'Brown', 'diana@example.com', '0456789123'),
('Evan', 'Jones', 'evan@example.com', '0567891234');

-- Insert sample data into products
INSERT INTO product (ProductName, Description, Price) VALUES
('Mask', 'Diving mask with anti-fog lens', 350.00),
('Snorkel', 'Dry-top snorkel for easy breathing', 150.00),
('Fins', 'Full-foot diving fins for speed', 500.00),
('Wetsuit', 'Thermal wetsuit for cold waters', 1200.00),
('Tank', 'Compressed air diving tank', 2500.00);

-- Insert sample data into invoices
INSERT INTO invoice (CustomerID, InvoiceDate, TotalAmount) VALUES
(1, '2024-04-01', 1000.00),
(2, '2024-04-15', 1750.00),
(3, '2024-05-05', 2500.00),
(4, '2024-05-20', 3000.00),
(5, '2024-06-01', 450.00);

-- Insert sample data into invoice_lines
INSERT INTO invoice_line (InvoiceID, ProductID, Quantity, LineTotal) VALUES
(1, 1, 2, 700.00),
(1, 2, 1, 300.00),
(2, 3, 2, 1000.00),
(2, 4, 1, 750.00),
(3, 5, 1, 2500.00);

-- Question 8: Create a stored procedure to update a customer's email
-- This procedure updates the email address of a customer based on their ID
DELIMITER //
CREATE PROCEDURE UpdateCustomerEmail(
    IN p_CustomerID INT,
    IN p_NewEmail VARCHAR(100)
)
BEGIN
    UPDATE customer
    SET Email = p_NewEmail
    WHERE CustomerID = p_CustomerID;
END //
DELIMITER ;

-- Question 9: Create a function to calculate total revenue for a given month
-- This function takes a month as input and returns the total revenue for that month
DELIMITER //
CREATE FUNCTION CalculateTotalRevenueForMonth(input_month VARCHAR(7))
RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
    DECLARE total_revenue DECIMAL(10,2);

    -- Calculate the sum of total amounts for invoices matching the input month (YYYY-MM)
    SELECT SUM(TotalAmount) INTO total_revenue
    FROM invoice
    WHERE DATE_FORMAT(InvoiceDate, '%Y-%m') = input_month;

    RETURN total_revenue;
END //
DELIMITER ;

-- Question 10: Java class that connects to the MySQL database and calls the CalculateTotalRevenueForMonth function
-- This class establishes a database connection, invokes the stored function, and prints the result

import java.sql.*;
import java.util.Scanner;

public class CalculateRevenueForMonth {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);

        // Prompt user to enter a month in YYYY-MM format
        System.out.print("Enter month (YYYY-MM): ");
        String inputMonth = scanner.nextLine();

        // Database connection parameters
        String url = "jdbc:mysql://localhost:3306/ecommerce";
        String username = "root";
        String password = "password";

        try {
            // Load JDBC driver
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Establish database connection
            Connection conn = DriverManager.getConnection(url, username, password);

            // Prepare a callable statement to invoke the function
            CallableStatement stmt = conn.prepareCall("{ ? = call CalculateTotalRevenueForMonth(?) }");

            // Register output parameter and set input parameter
            stmt.registerOutParameter(1, Types.DECIMAL);
            stmt.setString(2, inputMonth);

            // Execute the function
            stmt.execute();

            // Retrieve and display the result
            double revenue = stmt.getDouble(1);
            System.out.println("Total revenue for " + inputMonth + ": R" + revenue);

            // Close resources
            stmt.close();
            conn.close();

        } catch (Exception e) {
            // Handle exceptions and print error details
            System.out.println("Error: " + e.getMessage());
            e.printStackTrace();
        } finally {
            scanner.close();
        }
    }
}
