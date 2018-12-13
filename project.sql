USE master
go

/********* Object: Database projectDB ***********/

IF DB_ID('projectDB') IS NOT NULL
	DROP DATABASE projectDB
GO

CREATE DATABASE projectDB
GO

USE projectDB
GO

IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES
			WHERE TABLE_NAME = N'Inventory')
			DROP TABLE Inventory

IF OBJECT_ID('dbo.SafetyStockInfo') IS NOT NULL
	DROP TABLE dbo.SafetyStockInfo

IF OBJECT_ID('dbo.QuantityStatus') IS NOT NULL
	DROP TABLE dbo.QuantityStatus

IF OBJECT_ID('dbo.Vendor') IS NOT NULL
	DROP TABLE dbo.Vendor

IF OBJECT_ID('dbo.VendorProduct') IS NOT NULL
	DROP TABLE dbo.VendorProduct

IF OBJECT_ID('dbo.Customer') IS NOT NULL
	DROP TABLE dbo.Customer

IF OBJECT_ID('dbo.Invoice') IS NOT NULL
	DROP TABLE dbo.Invoice

IF OBJECT_ID('dbo.InvoiceLineItems') IS NOT NULL
	DROP TABLE dbo.InvoiceLineItems

IF OBJECT_ID('dbo.SalesTax') IS NOT NULL
	DROP TABLE dbo.SalesTax

IF OBJECT_ID('dbo.CreditReference') IS NOT NULL
	DROP TABLE dbo.CreditReference
	
IF OBJECT_ID('dbo.Resource') IS NOT NULL
	DROP TABLE dbo.CreditReference

IF OBJECT_ID('dbo.PurchaseOrder') IS NOT NULL
	DROP TABLE dbo.PurchaseOrder

IF OBJECT_ID('dbo.SerialNumber') IS NOT NULL
	DROP TABLE dbo.SerialNumber

IF OBJECT_ID('dbo.PurchaseOrderLine') IS NOT NULL
	DROP TABLE dbo.PurchaseOrderLine

IF OBJECT_ID('dbo.JobOrders') IS NOT NULL
	DROP TABLE dbo.JobOrders

IF OBJECT_ID('dbo.HILODriver') IS NOT NULL
	DROP TABLE dbo.HILODriver

IF OBJECT_ID('dbo.BillOfMaterial') IS NOT NULL
	DROP TABLE dbo.BillOfMaterial

/****** Object: Table Inventory ***********/
CREATE TABLE Inventory (
	InventoryID int IDENTITY(1,1) NOT NULL,
	Name varchar(50) NULL,
	Description varchar(200) NULL,
	Unit varchar(10) NULL,
	Type varchar(2) NULL,
	FactoryCost DECIMAL(4,2),
	VendorCost DECIMAL(4,2), 
	BestPrice DECIMAL(4,2),
	Manufacturer varchar(50) NULL,
	Image varchar(50) NULL,
	PRIMARY KEY (InventoryID)
)
GO 

/***** Object: Table SafetyStockInfo **********/
CREATE TABLE SafetyStockInfo (
	SafetyStockID int IDENTITY(1,1) NOT NULL,
	InventoryID int,
	SafetyStock int,
	MaxLevel int,
	OrderLeadTime int,
	PRIMARY KEY (SafetyStockID),
	FOREIGN KEY (InventoryID) REFERENCES Inventory(InventoryID)
)
GO

/******* Object: Table Quantity Status *******/ 
CREATE TABLE QuantityStatus (
	StatusID int IDENTITY(1,1) NOT NULL,
	InventoryID int,
	OnHand int,
	OnOrder int,
	Committed int,
	PRIMARY KEY (StatusID),
	FOREIGN KEY (InventoryID) REFERENCES Inventory(InventoryID)
)
GO 

/******Object: Table Vendor **********/ 
Create TABLE Vendor (
	VendorID int IDENTITY(1,1) NOT NULL,
	VendorName varchar(50),
	Contact varchar(50), 
	PhoneNumber varchar(15), 
	addressStreet varchar(100),
	addressCity varchar(50),
	addressState varchar(2), 
	Rating varchar(2),
	PRIMARY KEY (VendorID)
)
GO 

/********Object: Table VendorProductJoint ******/

Create TABLE VendorProduct (
	VendorID int,
	ProductID int, 
	PRIMARY KEY (VendorID, ProductID),
	FOREIGN KEY (VendorID) REFERENCES Vendor(VendorID),
	FOREIGN KEY (ProductID) REFERENCES Inventory(InventoryID)
)
GO 

/******Object: Table Customer *********/
CREATE TABLE Customer ( 
	CustomerID int IDENTITY(1,1) NOT NULL,
	Name varchar(50), 
	AddressShippingStreet varchar(100), 
	AddressShippingCity varchar(50),
	AddressShippingState varchar(2),
	AddressBillingStreet varchar(100),
	AddressBillingCity varchar(50), 
	AddressBillingState varchar(2), 
	DefaultCreditCard varchar(19), 
	CreditReferecenceID int,
	PRIMARY KEY (CustomerID)
) 
GO 

/**********Object: Table Invoice **********/ 
CREATE TABLE Invoice (
	InvoiceID int IDENTITY(1,1) NOT NULL, 
	CustomerID int,	
	OneShipment BIT, 
	OrderTotalPrice DECIMAL(4,2),
	EstimatedShippingDate date,
	InvoiceDateTime date,
	PRIMARY KEY (InvoiceID),
	FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID)
)
GO 

/**********Object: Table InvoiceLineItems **********/
CREATE TABLE InvoiceLineItems (
	InvoiceID int,
	InvoiceLineNO int, 
	InvoiceLineItemAmount int,
	ProductID int,
	Quantity int,
	PRIMARY KEY (InvoiceID, InvoiceLineNO),
	FOREIGN KEY (InvoiceID) REFERENCES Invoice(InvoiceID)
)
GO 

/**********Object: Table SalesTax ************/
CREATE TABLE SalesTax (
	StateCode varchar(2),
	SalesTax DECIMAL(4,3), 
	PRIMARY KEY (StateCode)
)
GO 

/**********Object: Table Credit Reference ***********/ 
CREATE TABLE CreditReference (
	CreditReferenceID int IDENTITY(1,1) NOT NULL, 
	CustomerID int,
	CreditorName varchar(100),
	AccountNumber int,
	CurrentBalance DECIMAL(10,2), 
	CreditLimit DECIMAL(10,2),
	PRIMARY KEY (CreditReferenceID),
	FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID)
)
GO 

/*******************Object: Table Resource ***********************/
CREATE TABLE Resource (
	ResourceID int IDENTITY(1,1) NOT NULL,
	InventoryID int,
	LoactionID int,
	PRIMARY KEY (ResourceID),
	FOREIGN KEY (InventoryID) REFERENCES Inventory(InventoryID)
)
GO


/***********Object: Table PurchaseOrder *********************/
CREATE TABLE PurchaseOrder ( 
	PurchaseOrderID int IDENTITY(1,1) NOT NULL, 
	PurchaseOrderLineID int, 
	VendorID int,
	Quantity DECIMAL(10,2),
	Unit varchar(10),
	CostPerUnit DECIMAL(10,2),
	FullfilledDate date,
	BilltoAddress varchar(200),
	PRIMARY KEY (PurchaseOrderID),
	FOREIGN KEY (VendorID) REFERENCES Vendor(VendorID)
) 
GO 

/************Object: Table SerialNumber *************/
CREATE TABLE SerialNumber (
	InventoryID int,
	StartNumber int,
	EndNumber int,
	FOREIGN KEY (InventoryID) REFERENCES Inventory(InventoryID)
)
GO

/************Object: Table PurchaseOrderLine ************/
CREATE TABLE PurchaseOrderLine (
	PurchaseOrderID int,
	PurchaseOrderLineID int,
	PurchaaseOrderLineItemAmount int,
	PRIMARY KEY (PurchaseOrderID, PurchaseOrderLineID),
	FOREIGN KEY (PurchaseOrderID) REFERENCES PurchaseOrder(PurchaseOrderID)
)
GO 

/*********Object: Table JobOrders *************/
CREATE TABLE JobOrders (
	JobOrderID int IDENTITY(1,1) NOT NULL,
	ProductID int,
	InventoryID int, 
	Quantity Decimal(10,2),
	PRIMARY KEY (JobOrderID),
	FOREIGN KEY (ProductID) REFERENCES Inventory(InventoryID),
	FOREIGN KEY (InventoryID) REFERENCES Inventory(InventoryID) 
	)
GO 

/***********Object: Table HILODriver **********/
CREATE TABLE HILODriver (
	DriverID int IDENTITY(1,1),
	Name varchar(50),
	PRIMARY KEY (DriverID) 
)
GO

/*************Object: Table BoM *******************/
CREATE TABLE BillOfMaterial (
	BillOfMaterialID int IDENTITY(1,1) NOT NULL,
	ProductAssemblyID int,
	ComponentID int, 
	UnitMeasureCode int ,
	PerAssemblyQuantity DECIMAL(10,2)
	PRIMARY KEY (BillOfMaterialID)
)
GO 


/********INSERT VALUES INTO TABLES *************/ 

Insert INTO Inventory (Name, Description, FactoryCost, BestPrice) 
Values ('Long-sleeve Logo Jersey, S','Unisex long-sleeve AWC logo microfiber cycling jersey', 38.49, 49.99 ),
('Long-sleeve Logo Jersey, M', 'Unisex long-sleeve AWC logo microfiber cycling jersey', 38.49, 49.99),
( 'Long-sleeve Logo Jersey, L', 'Unisex long-sleeve AWC logo microfiber cycling jersey', 38.49, 49.99),
( 'Women Tights, S', 'Warm spandex tights for winter riding; seamless chamois construction eliminates pressure points.', 24.74, 30.00),
( 'Women Tights, M', 'Warm spandex tights for winter riding; seamless chamois construction eliminates pressure points.',24.74, 30.00),
( 'Women Tights, L', 'Warm spandex tights for winter riding; seamless chamois construction eliminates pressure points.' ,24.74, 30.00),
( 'Racing Socks, M', '', 3.36, 8.99),
( 'Racing Socks, L', '', 3.36, 8.99)

GO

Insert INTO SafetyStockInfo 
Values (1, 100, 5, 12)
GO

Insert INTO QuantityStatus
Values (1, 20, 30, 20)
GO

Insert INTO Vendor (VendorName, Contact, PhoneNumber, Rating) 
VALUES ( 'Blade Manufacturing Co.', 'Kelly Oh', '6163451044', 'AA')
GO  
/*
Insert INTO VendorProduct
VALUES (1,1)
GO
*/

Insert into Customer(Name, AddressShippingStreet, AddressShippingCity, AddressShippingState,  AddressBillingStreet, 
AddressBillingCity, AddressBillingState, DefaultCreditCard, CreditReferecenceID )
VALUES ( 'Kelly', '3435 Burton ST', 'Grand Rapids', 'MI','3435 Bursont ST', 'Grand Rapids', 'MI', '33332664695310', 1) ,
('Luke', '4675 Tully Street', 'Detroit', 'MI', '4675 Tully Street', 'Detroit' , 'MI', '55553635401028', 2 ), 
('Judy', '1055 George Avenue', 'Mobile', 'AL','1055 George Avenue', 'Mobile', 'AL', '33332150058339', 3 ) 
GO 
/*
INSERT INTO Invoice 
VALUES ()
GO 
INSERT INTO InvoiceLineItems
VALUES () 
GO
*/

INSERT INTO SalesTax
VALUES ('AL', 4.00), ('AK', 0.00), ('AZ', 5.60),
('MI', 6.00)
GO 


INSERT INTO CreditReference (CustomerID, CurrentBalance, CreditLimit)
VALUES (1,  100.00, 500.00),
(2, 300.00, 250.00), 
(3, 300.00, 700.00)