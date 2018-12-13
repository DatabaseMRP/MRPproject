IF OBJECT_ID('CalculatePrice', 'P') IS NOT NULL
DROP PROCEDURE CalculatePrice; 
GO 



CREATE PROCEDURE CalculatePrice @InventoryID int, 
@previousPrice DECIMAL(10,2), 
@quantity int, 
@TOTALPRICE DECIMAL(10,2) OUTPUT 
AS
SET @TOTALPRICE = @previousPrice + 
(SELECT BestPrice From Inventory
WHERE InventoryID = @InventoryID) * @quantity;

RETURN @TOTALPRICE
GO 

/*
DECLARE @id int;
SET @id = 2;
DECLARE @Total decimal(10,2); 
exec CalculatePrice 2, 0, 3, @Total OUTPUT;
select @Total;
*/

CREATE NONCLUSTERED INDEX price ON Inventory(BestPrice);
