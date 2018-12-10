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
	AddressBilling varchar(100), 
	AddressShippingStreet varchar(100),
	AddressShippingCity varchar(50), 
	AddressShippingState varchar(2), 
	DefaultCreditCard varchar(19), 
	CreditReferecenceID int,
	PRIMARY KEY (CustomerID)
) 
GO 

/**********Object: Table Invoice **********/ 
CREATE TABLE Invoice (
	InvoiceID int IDENTITY(1,1) NOT NULL, 
	CustomerID int,
	Quantity int,
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
	Name varchar(50)
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
