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






--Question 3 --
SELECT
    i.INS_FNAME || ' ' || i.INS_SNAME AS INSTRUCTOR_FULL_NAME,
    c.CUST_FNAME || ' ' || c.CUST_SNAME AS CUSTOMER_FULL_NAME,
    d.DIVE_LOCATION,
    de.DIVE_PARTICIPANTS
FROM
    DIVE_EVENT de
JOIN
    INSTRUCTOR i ON de.INS_ID = i.INS_ID
JOIN
    CUSTOMER c ON de.CUST_ID = c.CUST_ID
JOIN
    DIVE d ON de.DIVE_ID = d.DIVE_ID
WHERE
    TO_NUMBER(de.DIVE_PARTICIPANTS) BETWEEN 8 AND 10;
    
--Question 4 --
Select 
    d.DIVE_NAME,
    de.DIVE_DATE
FROM
    DIVE_EVENT de
JOIN
    DIVE d ON de.DIVE_ID = d.DIVE_ID
WHERE
    TO_NUMBER(de.DRIVE_PARTICIPANTS) >=10;
    
-- Question 5--
SET SERVEROUTPUT ON;

DECLARE
    -- Cursor to select the required data
    CURSOR dive_cursor IS
        SELECT
            c.CUST_FNAME || ' ' || c.CUST_SNAME AS CUSTOMER_FULL_NAME,
            d.DIVE_NAME,
            de.DIVE_PARTICIPANTS,
            d.DIVE_COST
        FROM
            DIVE_EVENT de
        JOIN
            CUSTOMER c ON de.CUST_ID = c.CUST_ID
        JOIN
            DIVE d ON de.DIVE_ID = d.DIVE_ID
        WHERE
            d.DIVE_COST > 500;

    -- Variables to hold cursor data
    v_customer_full_name VARCHAR2(100);
    v_dive_name VARCHAR2(30);
    v_dive_participants VARCHAR2(20);
    v_dive_cost DECIMAL(10, 2);
    v_instructors_count NUMBER;

BEGIN
    -- Open the cursor
    OPEN dive_cursor;

    -- Loop through each row fetched by the cursor
    LOOP
        FETCH dive_cursor INTO v_customer_full_name, v_dive_name, v_dive_participants, v_dive_cost;
       
        -- Exit the loop if no more rows are found
        EXIT WHEN dive_cursor%NOTFOUND;
       
        -- Determine the number of instructors based on the number of participants
        IF TO_NUMBER(v_dive_participants) <= 4 THEN
            v_instructors_count := 1;
        ELSIF TO_NUMBER(v_dive_participants) BETWEEN 5 AND 7 THEN
            v_instructors_count := 2;
        ELSE
            v_instructors_count := 3;
        END IF;
       
        -- Output the results
        DBMS_OUTPUT.PUT_LINE('Customer: ' || v_customer_full_name || ', Dive Name: ' || v_dive_name || ', Participants: ' || v_dive_participants || ', Status: ' || v_instructors_count);
    END LOOP;
   
    -- Close the cursor
    CLOSE dive_cursor;
END;
/

--Question 6--
CREATE VIEW Vw_Dive_Event AS
SELECT
    de.INS_ID,
    de.CUST_ID,
    c.CUST_ADDRESS,
    d.DIVE_DURATION
FROM
    DIVE_EVENT de
JOIN
    CUSTOMER c ON de.CUST_ID = c.CUST_ID
JOIN
    DIVE d ON de.DIVE_ID = d.DIVE_ID
WHERE
    de.DIVE_DATE < TO_DATE('19-07-2017', 'DD-MM-YYYY');
    
--Question 7--
//Create Trigger
CREATE OR REPLACE TRIGGER New_Dive_Event
BEFORE INSERT OR UPDATE ON DIVE_EVENT
FOR EACH ROW
BEGIN
    IF :NEW.DIVE_PARTICIPANTS <= 0 OR :NEW.DIVE_PARTICIPANTS > 20 THEN
        RAISE_APPLICATION_ERROR(-20001, 'Invalid number of participants. The number must be between 1 and 20.');
    END IF;
END;
/

//Test 1 with 0 participants
BEGIN
    INSERT INTO DIVE_EVENT (DIVE_EVENT_ID, DIVE_DATE, DIVE_PARTICIPANTS, INS_ID, CUST_ID, DIVE_ID) VALUES ('test_001', TO_DATE('01-07-17', 'DD-MM-YY'),
    0,'101', 'C115', '550');
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE(SQLERRM);
END;
/

//Test 2 with 22 participants
BEGIN
    INSERT INTO DIVE_EVENT (DIVE_EVENT_ID, DIVE_DATE, DIVE_PARTICIPANTS, INS_ID, CUST_ID, DIVE_ID) VALUES ('test_001', TO_DATE('01-07-17', 'DD-MM-YY'),
    22,'101', 'C115', '550');
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE(SQLERRM);
END;
/
//Test 3 with valid number of participants like 6
BEGIN
    INSERT INTO DIVE_EVENT (DIVE_EVENT_ID, DIVE_DATE, DIVE_PARTICIPANTS, INS_ID, CUST_ID, DIVE_ID) VALUES ('test_001', TO_DATE('01-07-17', 'DD-MM-YY'),
    6,'101', 'C115', '550');
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE(SQLERRM);
END;
/


SET SERVEROUTPUT ON;

--Question 8--
//Create stored Procedure
CREATE OR REPLACE PROCEDURE sp_Customer_Details (
    p_Cust_ID IN VARCHAR2,
    p_Dive_Date IN DATE
)
IS
    v_Cust_Full_Name VARCHAR2(100);
    v_Dive_Name VARCHAR2(50);
BEGIN
    SELECT c.CUST_FNAME || ' ' || c.CUST_SNAME, d.DIVE_NAME
    INTO v_Cust_Full_Name, v_Dive_Name
    FROM DIVE_EVENT de
    JOIN CUSTOMER c ON de.CUST_ID = c.CUST_ID
    JOIN DIVE d ON de.DIVE_ID = d.DIVE_ID
    WHERE de.CUST_ID = p_Cust_ID AND de.DIVE_DATE = p_Dive_Date;

    DBMS_OUTPUT.PUT_LINE('CUSTOMER DETAILS: ' || v_Cust_Full_Name || ' booked for the ' || v_Dive_Name || ' on ' || TO_CHAR(p_Dive_Date, 'DD-Mon-YY') || '.');

EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('No booking found for the provided customer ID and dive date.');
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('An unexpected error occurred: ' || SQLERRM);
END;
/

//Execute the procedure with an exception handling
BEGIN
    sp_Customer_Details('C115', TO_DATE('15-07-17', 'DD-MM-YY'));
END;

//Invalid customer ID
BEGIN
    sp_Customer_Details('C759', TO_DATE('15-07-17', 'DD-MM-YY'));
END;

--Question 9--
//Create a function

CREATE OR REPLACE FUNCTION calculate_dive_revenue (
    p_Dive_Event_ID IN VARCHAR2
) RETURN NUMBER
IS
    -- Variables to store data retrieved from the database
    v_Participants NUMBER;
    v_Dive_Cost NUMBER;
    v_Total_Revenue NUMBER;
BEGIN
    -- Retrieve the number of participants and dive cost for the given dive event ID
    SELECT TO_NUMBER(de.DIVE_PARTICIPANTS), d.DIVE_COST
    INTO v_Participants, v_Dive_Cost
    FROM DIVE_EVENT de
    JOIN DIVE d ON de.DIVE_ID = d.DIVE_ID
    WHERE de.DIVE_EVENT_ID = p_Dive_Event_ID;
   
    -- Calculate total revenue
    v_Total_Revenue := v_Participants * v_Dive_Cost;
   
    -- Return the calculated total revenue
    RETURN v_Total_Revenue;

EXCEPTION
    WHEN NO_DATA_FOUND THEN
        -- Handle case where the dive event ID is not found
        DBMS_OUTPUT.PUT_LINE('No data found for the provided dive event ID.');
        RETURN -1;
    WHEN OTHERS THEN
        -- Handle any other unexpected errors
        DBMS_OUTPUT.PUT_LINE('An unexpected error occurred: ' || SQLERRM);
        RETURN -1;
END;
/

//Execute function
SET SERVEROUTPUT ON;

DECLARE
    v_Revenue NUMBER;
BEGIN
    -- Call the function with a valid dive event ID
    v_Revenue := calculate_dive_revenue('de_103');
    -- Display the result
    DBMS_OUTPUT.PUT_LINE('Total Revenue for Dive Event ID de_103: R ' || v_Revenue);
END;
/

--Quetion 10--
//Create GUI for reports
import javax.swing.*;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.sql.*;

public class GearDealerGUI extends JFrame {

    private JTextField customerIdField;
    private JTextField diveDateField;
    private JTextArea outputArea;

    public GearDealerGUI() {
        super("IT Gear Dealer Reports");

        // Initialize components
        customerIdField = new JTextField(10);
        diveDateField = new JTextField(10);
        outputArea = new JTextArea(10, 30);
        outputArea.setEditable(false);

        JButton searchButton = new JButton("Search");
        searchButton.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                // Call stored procedure sp_customer_details
                String customerId = customerIdField.getText().trim();
                String diveDateStr = diveDateField.getText().trim();

                // Perform database query and update outputArea
                String result = executeSP_CustomerDetails(customerId, diveDateStr);
                outputArea.setText(result);
            }
        });

        JButton calculateRevenueButton = new JButton("Calculate Revenue");
        calculateRevenueButton.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                // Call function fn_Dive_Adjustments
                String result = executeFN_Dive_Adjustments();
                outputArea.setText(result);
            }
        });

        // Layout components using BorderLayout
        JPanel inputPanel = new JPanel(new FlowLayout());
        inputPanel.add(new JLabel("Customer ID: "));
        inputPanel.add(customerIdField);
        inputPanel.add(new JLabel("Dive Date: "));
        inputPanel.add(diveDateField);
        inputPanel.add(searchButton);

        JPanel outputPanel = new JPanel(new BorderLayout());
        outputPanel.add(new JLabel("Output Area:"), BorderLayout.NORTH);
        outputPanel.add(new JScrollPane(outputArea), BorderLayout.CENTER);

        JPanel buttonPanel = new JPanel(new FlowLayout());
        buttonPanel.add(calculateRevenueButton);

        // Main frame layout
        setLayout(new BorderLayout());
        add(inputPanel, BorderLayout.NORTH);
        add(outputPanel, BorderLayout.CENTER);
        add(buttonPanel, BorderLayout.SOUTH);

        // JFrame settings
        setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        setSize(400, 300);
        setLocationRelativeTo(null); // Center the frame
        setVisible(true);
    }

    // Method to execute stored procedure sp_customer_details
    private String executeSP_CustomerDetails(String customerId, String diveDateStr) {
        String result = "";

        try (Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "username", "password");
             CallableStatement stmt = conn.prepareCall("{call sp_customer_details(?, ?)}")) {

            // Set input parameters
            stmt.setString(1, customerId);
            stmt.setDate(2, new java.sql.Date(new java.util.Date(diveDateStr).getTime()));

            // Execute query
            ResultSet rs = stmt.executeQuery();

            // Process result set
            if (rs.next()) {
                String customerDetails = rs.getString(1); // Adjust based on your stored procedure result
                result = "CUSTOMER DETAILS: " + customerDetails;
            } else {
                result = "No customer details found.";
            }

        } catch (SQLException | ParseException e) {
            result = "Error: " + e.getMessage();
            e.printStackTrace();
        }

        return result;
    }

    // Method to execute function fn_Dive_Adjustments
    private String executeFN_Dive_Adjustments() {
        String result = "";

        try (Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "username", "password");
             CallableStatement stmt = conn.prepareCall("{? = call fn_Dive_Adjustments()}")) {

            // Register the output parameter
            stmt.registerOutParameter(1, Types.NUMERIC);

            // Execute function
            stmt.execute();

            // Retrieve the output value
            double revenue = stmt.getDouble(1);
            result = "Total Revenue: R " + revenue;

        } catch (SQLException e) {
            result = "Error: " + e.getMessage();
            e.printStackTrace();
        }

        return result;
    }

    public static void main(String[] args) {
        // Run GUI in the Event Dispatch Thread (EDT)
        SwingUtilities.invokeLater(new Runnable() {
            @Override
            public void run() {
                new GearDealerGUI();
            }
        });
    }
}
 







