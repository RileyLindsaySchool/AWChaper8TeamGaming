USE aw_sim;

-- ==========================
-- 1. Vendors Table
-- ==========================
CREATE TABLE Vendors (
    VendorID INT AUTO_INCREMENT PRIMARY KEY,
    VendorName VARCHAR(50) NOT NULL,
    ContactInfo VARCHAR(100)
);

-- ==========================
-- 2. Parts Table
-- ==========================
CREATE TABLE Parts (
    PartID VARCHAR(20) PRIMARY KEY,
    VendorID INT NOT NULL,
    UnitPrice DECIMAL(10,2) NOT NULL,
    QuantityInStock INT NOT NULL,
    LastInventoried DATETIME,
    OrderSize INT,
    FOREIGN KEY (VendorID) REFERENCES Vendors(VendorID)
);

-- ==========================
-- 3. Appliances Table
-- ==========================
CREATE TABLE Appliances (
    ApplianceID VARCHAR(20) PRIMARY KEY,
    VendorID INT NOT NULL,
    OrderPrice DECIMAL(10,2) NOT NULL,
    SalesPrice DECIMAL(10,2),
    QuantityInStock INT NOT NULL,
    FOREIGN KEY (VendorID) REFERENCES Vendors(VendorID)
);

-- ==========================
-- 4. InventoryRequests Table
-- ==========================
CREATE TABLE InventoryRequests (
    RequestID INT AUTO_INCREMENT PRIMARY KEY,
    PartID VARCHAR(20) NOT NULL,
    QuantityRequested INT NOT NULL,
    DuringServiceCallID INT NOT NULL,
    FOREIGN KEY (PartID) REFERENCES Parts(PartID),
    FOREIGN KEY (DuringServiceCallID) REFERENCES ServiceCalls(ServiceCallID)
);

-- ==========================
-- Insert Sample Data
-- ==========================

-- Vendors
INSERT INTO Vendors (VendorName, ContactInfo)
VALUES 
('Whirlpool', 'whirlpool@suppliers.com'),
('Samsung', 'samsung@suppliers.com'),
('LG', 'lg@suppliers.com');

-- Parts
INSERT INTO Parts (PartID, VendorID, UnitPrice, QuantityInStock, LastInventoried, OrderSize)
VALUES
('WDX50934', 1, 29.00, 374, '2025-10-17 08:43:00', 16),
('SAM12345', 2, 45.00, 210, '2025-10-20 09:00:00', 20),
('LG98765', 3, 55.00, 95, '2025-10-19 14:30:00', 10);

-- Appliances
INSERT INTO Appliances (ApplianceID, VendorID, OrderPrice, SalesPrice, QuantityInStock)
VALUES
('WRQA59CNKZ', 1, 1808.99, 1993.99, 1),
('DW80CG4021SR', 2, 429.99, 479.99, 2),
('MSER0990S', 3, 149.99, 199.99, 5);

-- Inventory Requests
INSERT INTO InventoryRequests (PartID, QuantityRequested, DuringServiceCallID)
VALUES
('WDX50934', 29, 2),
('SAM12345', 50, 1),
('LG98765', 20, 3);
