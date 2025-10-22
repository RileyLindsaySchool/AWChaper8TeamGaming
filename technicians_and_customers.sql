USE aw_sim;

-- Technicians
INSERT INTO Technicians (EmployeeID, FirstName, LastName, Email, Phone)
VALUES
('SV0001', 'Liam', 'Henson', 'lhenson@appliancewarehouse.com', '555-104-8642'),
('SV0002', 'Mark', 'Robles', 'mrobles@appliancewarehouse.com', '555-985-4319'),
('SV0003', 'Lee', 'Wong', 'lwong@appliancewarehouse.com', '555-336-6335');

-- Customers
INSERT INTO Customers (FirstName, LastName, Email, Phone, State, City, StreetAddress, ServiceCalls, HasServicePlan)
VALUES
('Bill', 'Smith', 'bsmith905@gmail.com', '555-239-2197', 'AR', 'Fort Smith', '3 Abbey St.', 2, 1),
('John', 'Doe', 'jdoe349@gmail.com', '555-404-3920', 'AR', 'Russellville', '11 Oak St.', 4, 1),
('Jessica', 'McGraw', 'jmcg298@gmail.com', '555-117-6601', 'OK', 'Sallisaw', '23 Cherry St.', 1, 0);

-- Service Calls
INSERT INTO ServiceCalls (CustomerID, TechnicianID, Date, DurationInMins)
VALUES
(1, 'SV0002', STR_TO_DATE('01/25/2025 2:30 PM', '%m/%d/%Y %h:%i %p'), 25),
(2, 'SV0001', STR_TO_DATE('01/24/2025 1:45 PM', '%m/%d/%Y %h:%i %p'), 40),
(3, 'SV0003', STR_TO_DATE('01/5/2025 5:30 PM', '%m/%d/%Y %h:%i %p'), 30);

-- Technician Notes for Service Calls
INSERT INTO ServiceNotes (ServiceCallID, NoteBody)
VALUES
(1, 'Symptoms point to a bad fuse.'),
(1, 'The light bulb has blown.'),
(3, 'Check dryer door latch.');

-- Customer Satisfaction Ratings Table
INSERT INTO CustomerSatisfactionRatings(ServiceCallID, PercentSatisfaction)
VALUES
(1, 89),
(2, 95),
(3, 92);
