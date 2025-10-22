USE aw_sim;

-- ==============================================
-- 1. Customers Table
-- ==============================================
CREATE TABLE Customers (
    CustomerID INT AUTO_INCREMENT PRIMARY KEY,
    FirstName VARCHAR(20) NOT NULL,
    LastName VARCHAR(20) NOT NULL,
    Email VARCHAR(30) NOT NULL,
    Phone CHAR(12) NOT NULL,
    State CHAR(2) NOT NULL,
    City VARCHAR(50) NOT NULL,
    StreetAddress VARCHAR(100),
    ServiceCalls INT NOT NULL DEFAULT 0,
    HasServicePlan TINYINT(1) NOT NULL DEFAULT 0
);

-- ==============================================
-- 2. Technicians Table
-- ==============================================
CREATE TABLE Technicians (
    EmployeeID CHAR(6) PRIMARY KEY,
    FirstName VARCHAR(20) NOT NULL,
    LastName VARCHAR(20) NOT NULL,
    Email VARCHAR(50) NOT NULL,
    Phone CHAR(12) NOT NULL,
    ReportsTo CHAR(6)
);

-- ==============================================
-- 3. Service Calls Table
-- ==============================================
CREATE TABLE ServiceCalls (
    ServiceCallID INT AUTO_INCREMENT PRIMARY KEY,
    CustomerID INT NOT NULL,
    TechnicianID CHAR(6) NOT NULL,
    Date DATETIME NOT NULL,
    DurationInMins INT,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID),
    FOREIGN KEY (TechnicianID) REFERENCES Technicians(EmployeeID)
);

-- ==============================================
-- 4. Technician Notes for Service Calls Table
-- ==============================================
CREATE TABLE ServiceNotes (
    NoteID INT AUTO_INCREMENT PRIMARY KEY,
    ServiceCallID INT NOT NULL,
    NoteBody VARCHAR(500),
    FOREIGN KEY (ServiceCallID) REFERENCES ServiceCalls(ServiceCallID)
);

-- ==============================================
-- 5. Customer Satisfaction Ratings Table
-- ==============================================
CREATE TABLE CustomerSatisfactionRatings (
    ServiceCallID INT NOT NULL,
    PercentSatisfaction INT NOT NULL,
    PRIMARY KEY (ServiceCallID),
    FOREIGN KEY (ServiceCallID) REFERENCES ServiceCalls(ServiceCallID)
);