-- Create the database
CREATE DATABASE IF NOT EXISTS InventoryDB;
USE InventoryDB;

-- ==========================
-- 1. Vendors Table
-- ==========================
CREATE TABLE Vendors (
    VendorID INT AUTO_INCREMENT PRIMARY KEY,
    VendorName VARCHAR(50) NOT NULL,
    ContactInfo VARCHAR(100)
);

-- ==========================
-- 2. Items Table
-- ==========================
CREATE TABLE Items (
    ItemID VARCHAR(20) PRIMARY KEY,
    VendorID INT NOT NULL,
    UnitPrice DECIMAL(10,2) NOT NULL,
    QuantityInStock INT NOT NULL,
    LastInventoried DATETIME,
    OrderSize INT,
    FOREIGN KEY (VendorID) REFERENCES Vendors(VendorID)
);

-- ==========================
-- 3. InventoryRequests Table
-- ==========================
CREATE TABLE InventoryRequests (
    RequestID INT AUTO_INCREMENT PRIMARY KEY,
    ItemID VARCHAR(20) NOT NULL,
    QuantityRequested INT NOT NULL,
    QuantityShort INT DEFAULT 0,
    QuantityToOrder INT DEFAULT 0,
    NextOrderCost DECIMAL(10,2) DEFAULT 0.00,
    FOREIGN KEY (ItemID) REFERENCES Items(ItemID)
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

-- Items
INSERT INTO Items (ItemID, VendorID, UnitPrice, QuantityInStock, LastInventoried, OrderSize)
VALUES
('WDX50934', 1, 29.00, 374, '2025-10-17 08:43:00', 16),
('SAM12345', 2, 45.00, 210, '2025-10-20 09:00:00', 20),
('LG98765', 3, 55.00, 95, '2025-10-19 14:30:00', 10);

-- Inventory Requests
INSERT INTO InventoryRequests (ItemID, QuantityRequested, QuantityShort, QuantityToOrder, NextOrderCost)
VALUES
('WDX50934', 29, 0, 0, 0.00),
('SAM12345', 50, 10, 10, 450.00),
('LG98765', 20, 5, 5, 275.00);
