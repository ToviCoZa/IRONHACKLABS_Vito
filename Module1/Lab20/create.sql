use lab_mysql;
DROP TABLE Cars ;
DROP TABLE Invoices ;
DROP TABLE Salespersons ;
DROP TABLE Customers ;


CREATE TABLE Cars ( ID INTEGER primary key, VIN VARCHAR(255), Manufacturer VARCHAR(255), Model VARCHAR(255), year INTEGER, Color VARCHAR(255));
CREATE TABLE Invoices ( ID INTEGER PRIMARY KEY, Invoice_number INTEGER, Date DATE, Car INTEGER, Customer INTEGER, Salesperson INTEGER);
CREATE TABLE Salespersons ( ID INTEGER PRIMARY KEY, Staff_id INTEGER, Name VARCHAR(255), Store VARCHAR(255));
CREATE TABLE Customers ( ID INTEGER primary key, Customer_id INTEGER, Name VARCHAR(255), Phone VARCHAR(255), Email VARCHAR(255), Adress VARCHAR(255), City VARCHAR(255), State_province VARCHAR(255), Country VARCHAR(255), Postal INTEGER);