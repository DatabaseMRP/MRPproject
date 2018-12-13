CREATE PROCEDURE CalculatePrice @InventoryID int, 
@previousPrice DECIMAL(4,2), 
@TOTALPRICE DECIMAL(4,2) OUTPUT 
AS
SET @TOTALPRICE = @previousPrice + 
(SELECT BestPrice From Inventory
WHERE InventoryID = @InventoryID);

RETURN @TOTALPRICE
GO 

/*example of usage 
DECLARE @id int;
SET @id = 2;
DECLARE @Total decimal(4,2); 

exec CalculatePrice 2, 0, @Total OUTPUT;

select @Total;
*/
