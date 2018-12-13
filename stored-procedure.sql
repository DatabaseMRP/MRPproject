create procedure sp_NewCustomer
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
EXEC dbo.sp_NewCustomer 
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



------ create order

IF OBJECT_ID('NewOrder', 'P') IS NOT NULL
DROP PROCEDURE NewOrder; 
GO 

create procedure NewOrder
	@customerID int,	
	@oneShipment BIT, 
	@orderTotalPrice DECIMAL(4,2)
	--@estimatedShippingDate date
	--@invoiceDateTime date
as
begin

declare @currentDate varchar(10)
declare @shippingdate varchar(10)
set @currentDate = (
SELECT CONVERT (date, SYSDATETIME())  
)

set @shippingdate = (
SELECT CONVERT (date, SYSDATETIME())  + 5
)

select @currentDate

SELECT DATEADD(day, 1, ) AS DateAdd;


declare @

Insert into Invoice( CustomerID, OneShipment, OrderTotalPrice, EstimatedShippingDate)
Values (@customerID, @oneShipment, @orderTotalPrice, @estimatedShippingDate)

end
go

select * from Invoice;

select datetime(3)
select sysdatetime()

--testing exec
EXEC dbo.sp_NewOrder
@customerID = '1', @oneShipment ='', @orderTotalPrice ='', @estimatedShippingDate ='2/2/3000'
go



CustomerID int,	
OneShipment BIT, 
OrderTotalPrice DECIMAL(4,2),
EstimatedShippingDate date,
InvoiceDateTime date,

CustomerID 
OneShipment 
OrderTotalPrice 
EstimatedShippingDate 
InvoiceDateTime 

@customerID 
@oneShipment 
@orderTotalPrice 
@estimatedShippingDate 
@invoiceDateTime 
