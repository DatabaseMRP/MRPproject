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
