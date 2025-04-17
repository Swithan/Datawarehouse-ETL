/*CREATE DATABASE Datawarehouse;
USE Datawarehouse; 

TRUNCATE TABLE Fact_Order;
TRUNCATE TABLE Dim_Product;
TRUNCATE TABLE Dim_Customer;
TRUNCATE TABLE Dim_Destination;

*/

CREATE TABLE Dim_Customer (
    customer_id int IDENTITY(1,1) PRIMARY KEY,
    "name" VARCHAR(100) NOT NULL,
    gender VARCHAR(10) NOT NULL,
    birthdate DATE NOT NULL
);

CREATE TABLE Dim_Product (
    product_id int IDENTITY(1,1) PRIMARY KEY,
    category VARCHAR(100) NOT NULL,
    sub_category VARCHAR(100) NOT NULL
);

CREATE TABLE Dim_Destination (
    destination_id int IDENTITY(1,1) PRIMARY KEY,
    "state" VARCHAR(100) NOT NULL,
    city VARCHAR(100) NOT NULL
);

CREATE TABLE Fact_Order (
    order_id VARCHAR(6) PRIMARY KEY,
    customer_id int NOT NULL,
    product_id int NOT NULL,
    destination_id int NOT NULL,
    order_date DATE NOT NULL,
    sales DECIMAL(10, 2) NOT NULL,
    discount DECIMAL(3, 2) NOT NULL,
    profit DECIMAL(10, 2) NOT NULL,
    warehouse_region VARCHAR(10) NOT NULL,
);

ALTER TABLE Fact_Order 
    ADD CONSTRAINT FK_FactOrder_Customer 
    FOREIGN KEY (customer_id) REFERENCES Dim_Customer(customer_id);

ALTER TABLE Fact_Order 
    ADD CONSTRAINT FK_FactOrder_Product 
    FOREIGN KEY (product_id) REFERENCES Dim_Product(product_id);

ALTER TABLE Fact_Order 
    ADD CONSTRAINT FK_FactOrder_Destination 
    FOREIGN KEY (destination_id) REFERENCES Dim_Destination(destination_id);