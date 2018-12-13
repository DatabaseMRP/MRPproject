----------- 1. create order

IF OBJECT_ID('NewCustomer', 'P') IS NOT NULL
DROP PROCEDURE NewCustomer; 
GO 

create procedure NewCustomer
	@name varchar(50), 
	@addressShippingStreet varchar(100), 
	@addressShippingCity varchar(50),
	@addressShippingState varchar(2),
	@addressBillingStreet varchar(100),
	@addressBillingCity varchar(50), 
	@addressBillingState varchar(2), 
	@defaultCreditCard varchar(19), 
	@creditReferecenceID int
as
begin
Insert into Customer(Name, AddressShippingStreet, AddressShippingCity, AddressShippingState,  AddressBillingStreet, 
AddressBillingCity, AddressBillingState, DefaultCreditCard, CreditReferecenceID )
Values (@name, @addressShippingStreet,
@addressShippingCity,
@addressShippingState, 
@addressBillingStreet, 
@addressBillingCity, 
@addressBillingState, 
@defaultCreditCard,
@creditReferecenceID)
end

go

select * from customer;


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
go



----------- 2. create order

IF OBJECT_ID('NewOrder', 'P') IS NOT NULL
DROP PROCEDURE NewOrder; 
GO 

create procedure NewOrder
	@customerID int,	
	@oneShipment BIT, 
	@orderTotalPrice DECIMAL(4,2)
as
begin

declare @currentDate varchar(10)
declare @shippingdate varchar(10)
set @currentDate = ( SELECT CONVERT (date, SYSDATETIME()) )
set @shippingdate = ( SELECT DATEADD(day, 5, (SELECT CONVERT (date, SYSDATETIME()))))

Insert into Invoice( CustomerID, OneShipment, OrderTotalPrice, EstimatedShippingDate, InvoiceDateTime)
Values (@customerID, @oneShipment, @orderTotalPrice, @shippingdate, @currentDate)

end
go

select * from Invoice;

--testing exec
EXEC dbo.NewOrder
@customerID = '1', @oneShipment ='', @orderTotalPrice ='12.56'
go