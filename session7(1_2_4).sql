create database SaleDB;
use SaleDB;
create table Customers (
CustomerID int primary key auto_increment,
CustomerName varchar(100) not null,
Phone varchar(15),
CreatedAt datetime
);
create table Products (
ProductID int primary key auto_increment,
ProductName varchar(255) not null,
Category varchar(255),
Price decimal(10,2) not null
);
create table Orders (
OrderID int primary key auto_increment,
CustomerID int,
TotalAmount decimal(10,2) not null,
FOREIGN KEY (CustomerID) REFERENCES Customers (CustomerID)
);
create table OrderDetails (
OrderDetailID int primary key auto_increment,
OrderID int,
ProductID int,
Quantity int not null,
UnitPrice decimal(10,2) not null,
foreign key (OrderID) references Orders (OrderID),
foreign key (productID) references Products (ProductID)
);

-- Thêm chỉ số cho cột Email trong bảng Customers
ALTER TABLE Customers
ADD COLUMN Email VARCHAR(255) NOT NULL;
CREATE INDEX idx_email ON Customers(Email);

--  Thêm chỉ số cho cột OrderDate trong bảng Orders.
ALTER TABLE Orders
ADD COLUMN OrderDate DATETIME NOT NULL,
ADD INDEX idx_orderDate (OrderDate);

-- Hãy tạo một view CustomerOrders với các cột: OrderID, CustomerName (họ và tên của khách hàng), 
-- OrderDate, TotalAmount.
CREATE VIEW CustomerOrders AS
SELECT 
    o.OrderID,
    c.CustomerName,
    o.OrderDate,
    o.TotalAmount
FROM Orders o
JOIN Customers c ON o.CustomerID = c.CustomerID;

-- Cập nhật TotalAmount cho đơn hàng có OrderID là 1 thành 250.00.
update orders
set TotalAmount = 250.00
where OrderID = 1;