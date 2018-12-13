----------- 1. create order

IF OBJECT_ID('NewCustomer', 'P') IS NOT NULL
DROP PROCEDURE NewCustomer; 
GO 

CREATE PROCEDURE NewCustomer
	@name varchar(50), 
	@addressShippingStreet varchar(100), 
	@addressShippingCity varchar(50),
	@addressShippingState varchar(2),
	@addressBillingStreet varchar(100),
	@addressBillingCity varchar(50), 
	@addressBillingState varchar(2), 
	@defaultCreditCard varchar(19), 
	@creditReferecenceID int
AS
BEGIN
INSERT INTO Customer(Name, AddressShippingStreet, AddressShippingCity, AddressShippingState,  AddressBillingStreet, 
AddressBillingCity, AddressBillingState, DefaultCreditCard, CreditReferecenceID )
Values (@name, @addressShippingStreet,
@addressShippingCity,
@addressShippingState, 
@addressBillingStreet, 
@addressBillingCity, 
@addressBillingState, 
@defaultCreditCard,
@creditReferecenceID)
END

GO

SELECT * FROM customer;


--testing exec
EXEC dbo.NewCustomer 
@name = 'super luigi',
@addressShippingStreet = 'burton',
@addressShippingCity = 'gr',
@addressShippingState = ' ca',
@addressBillingStreet = 'burton',
@addressBillingCity ='sf',
@addressBillingState ='df',
@defaultCreditCard = 213452,
@creditReferecenceID =3
GO



----------- 2. create order

IF OBJECT_ID('NewOrder', 'P') IS NOT NULL
DROP PROCEDURE NewOrder; 
GO 

CREATE PROCEDURE NewOrder
	@customerID int,	
	@oneShipment BIT, 
	@orderTotalPrice DECIMAL(4,2),
	@products varchar(10),
	@quantities varchar(10)
AS
BEGIN

DECLARE @currentDate varchar(10)
DECLARE @shippingdate varchar(10)
DECLARE @productArray table(product int) 
DECLARE @quantityArray table (quantity int)
SET @currentDate = ( SELECT CONVERT (date, SYSDATETIME()) )
SET @shippingdate = ( SELECT DATEADD(day, 5, (SELECT CONVERT (date, SYSDATETIME()))))

Insert into Invoice( CustomerID, OneShipment, OrderTotalPrice, EstimatedShippingDate, InvoiceDateTime)
Values (@customerID, @oneShipment, @orderTotalPrice, @shippingdate, @currentDate)

INSERT INTO @productArray
SELECT CAST(value AS int) FROM STRING_SPLIT(@products, ',');

INSERT INTO @quantityArray
SELECT CAST (value AS int) FROM STRING_SPLIT(@quantities, ',');

DECLARE @count int = 1;

DECLARE @length int;
SELECT @length = COUNT(*) FROM @productArray

DECLARE @invoice int;
SELECT @invoice = InvoiceID FROM Invoice WHERE CustomerID = @customerID
WHILE @count <= @length
BEGIN
	DECLARE @product int;
	DECLARE @quantity int;

	SELECT TOP 1 @product = product FROM @productArray;
	SELECT TOP 1 @quantity = quantity FROM @quantityArray;

	INSERT INTO InvoiceLineItems (InvoiceID, InvoiceLineNO, InvoiceLineItemAmount, ProductID, Quantity)
	SELECT @invoice, @count, BestPrice, @product, @quantity FROM Inventory WHERE InventoryID = @product;

	DELETE FROM @productArray WHERE product = @product;
	DELETE FROM @quantityArray WHERE quantity = @quantity;

	SET @count = @count + 1;
END

END
GO

--select * from Invoice;

--testing exec
--EXEC dbo.NewOrder
--@customerID = 1, @oneShipment = 0, @orderTotalPrice = 12.56, @products = '1,2,3', @quantities = '2,1,5'
--GO
--SELECT * FROM Invoice;
--SELECT * FROM InvoiceLineItems;