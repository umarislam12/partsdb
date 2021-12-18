-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2021-12-17 13:35:16.385

-- tables
-- Table: Customer
CREATE TABLE Customer (
    Id int NOT NULL,
    First_name varchar(30) NOT NULL,
    Last_name varchar(30) NOT NULL,
    Phone_number varchar(11) NOT NULL,
    CONSTRAINT Customer_pk PRIMARY KEY (Id)
);

-- Table: Order
CREATE TABLE `Order` (
    Id int NOT NULL,
    Order_quantity int NOT NULL,
    Order_date_time timestamp NOT NULL,
    Order_status varchar(20) NOT NULL,
    product_Id int NOT NULL,
    Customer_Id int NOT NULL,
    employees_Id int NOT NULL,
    CONSTRAINT Order_pk PRIMARY KEY (Id)
);

-- Table: Purchase_order
CREATE TABLE Purchase_order (
    Id int NOT NULL,
    Order_date date NOT NULL,
    Expected_shipement date NOT NULL,
    Product_quantity int NOT NULL,
    Description varchar(120) NOT NULL,
    supplier_Id int NOT NULL,
    product_Id int NOT NULL,
    CONSTRAINT Purchase_order_pk PRIMARY KEY (Id)
);

-- Table: employees
CREATE TABLE employees (
    Id int NOT NULL,
    First_name varchar(20) NOT NULL,
    Last_name varchar(20) NOT NULL,
    Phone_number varchar(11) NOT NULL,
    Hired_date date NOT NULL,
    job_Id int NOT NULL,
    CONSTRAINT employees_pk PRIMARY KEY (Id)
);

-- Table: job
CREATE TABLE job (
    Id int NOT NULL,
    Job_title varchar(120) NOT NULL,
    Salary int NOT NULL,
    CONSTRAINT job_pk PRIMARY KEY (Id)
);

-- Table: product
CREATE TABLE product (
    Id int NOT NULL,
    Name varchar(20) NOT NULL,
    Description varchar(40) NULL,
    Quantity_stock int NOT NULL,
    Price int NOT NULL,
    CONSTRAINT product_pk PRIMARY KEY (Id)
);

-- Table: supplier
CREATE TABLE supplier (
    Id int NOT NULL,
    Company_name varchar(30) NOT NULL,
    Phone_number varchar(11) NOT NULL,
    product_Id int NOT NULL,
    CONSTRAINT supplier_pk PRIMARY KEY (Id)
);

-- foreign keys
-- Reference: Order_Customer (table: Order)
ALTER TABLE `Order` ADD CONSTRAINT Order_Customer FOREIGN KEY Order_Customer (Customer_Id)
    REFERENCES Customer (Id);

-- Reference: Order_employees (table: Order)
ALTER TABLE `Order` ADD CONSTRAINT Order_employees FOREIGN KEY Order_employees (employees_Id)
    REFERENCES employees (Id);

-- Reference: Order_product (table: Order)
ALTER TABLE `Order` ADD CONSTRAINT Order_product FOREIGN KEY Order_product (product_Id)
    REFERENCES product (Id);

-- Reference: Purchase_order_product (table: Purchase_order)
ALTER TABLE Purchase_order ADD CONSTRAINT Purchase_order_product FOREIGN KEY Purchase_order_product (product_Id)
    REFERENCES product (Id);

-- Reference: Purchase_order_supplier (table: Purchase_order)
ALTER TABLE Purchase_order ADD CONSTRAINT Purchase_order_supplier FOREIGN KEY Purchase_order_supplier (supplier_Id)
    REFERENCES supplier (Id);

-- Reference: employees_job (table: employees)
ALTER TABLE employees ADD CONSTRAINT employees_job FOREIGN KEY employees_job (job_Id)
    REFERENCES job (Id);

-- Reference: supplier_product (table: supplier)
ALTER TABLE supplier ADD CONSTRAINT supplier_product FOREIGN KEY supplier_product (product_Id)
    REFERENCES product (Id);

-- End of file.

