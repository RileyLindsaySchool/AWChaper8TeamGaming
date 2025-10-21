USE aw_sim;

-- ==============================================
-- 0. Appliances 
-- ==============================================
CREATE TABLE Appliances (
    ...
);

-- ==============================================
-- 1. Customers Table
-- ==============================================
CREATE TABLE Customers (
    CustomerID INT AUTO_INCREMENT PRIMARY KEY,
    FirstName VARCHAR(20) NOT NULL,
    LastName VARCHAR(20) NOT NULL,
    Email VARCHAR(30) NOT NULL,
    Phone CHAR(12) NOT NULL, -- DDD-DDD-DDDD
    ServiceCalls INT NOT NULL DEFAULT 0,
    HasServicePlan TINYINT(1) NOT NULL DEFAULT 0
);

-- ==============================================
-- 2. Service Calls Table
-- ==============================================
CREATE TABLE ServiceCalls (
    ServiceCallID INT AUTO_INCREMENT PRIMARY KEY,
    CustomerID INT NOT NULL,
    TechnicianID INT NOT NULL,
    Date DATETIME NOT NULL,
    DurationInMins INT,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID),
    FOREIGN KEY (TechnicianID) REFERENCES Technicians(EmployeeID)
);

-- ==============================================
-- 3. Technician Notes for Service Calls Table
-- ==============================================
CREATE TABLE ServiceNotes (
    NoteID INT AUTO_INCREMENT PRIMARY KEY,
    ServiceCallID INT NOT NULL,
    NoteBody VARCHAR(500),
    FOREIGN KEY (ServiceCallID) REFERENCES ServiceCalls(ServiceCallID)
);

-- ==============================================
-- 4. Technicians Table
-- ==============================================
CREATE TABLE Technicians (
    EmployeeID CHAR(5) PRIMARY KEY,
    FirstName VARCHAR(20) NOT NOT,
    LastName VARCHAR(20) NOT NULL,
    Email VARCHAR(30) NOT NULL,
    Phone CHAR(12) NOT NULL -- DDD-DDD-DDDD
);

-- ==============================================
-- 5. Customer Satisfaction Ratings Table
-- ==============================================
CREATE TABLE CustomerSatisfactionRatings (
    RatingID INT AUTO_INCREMENT PRIMARY KEY,
    CustomerID,
    EmployeeID,
    PRIMARY KEY (CustomerID, EmployeeID)
);