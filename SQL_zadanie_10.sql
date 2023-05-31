USE AdventureWorks2022;

--1
Begin Transaction Transation_1
Update Production.Product
Set ListPrice=1.1*ListPrice
where ProductID=680
Commit Transaction Transation_1

SELECT * FROM Production.Product
--2
EXEC sp_msforeachtable "ALTER TABLE ? NOCHECK CONSTRAINT all"
Begin Transaction Transation_2
Delete from Production.Product
Where ProductID=707
Rollback Transaction Transation_2

SELECT * FROM Production.Product;

--3
Begin Transaction Transation_3
INSERT INTO Production.Product (Name, ProductNumber, MakeFlag, FinishedGoodsFlag, Color,SafetyStockLevel,ReorderPoint, StandardCost, ListPrice,DaysToManufacture,SellStartDate,ModifiedDate) 
VALUES ('kilow gurniczy','T-72',0,0, 'meski',9999,770, 21.37, 21.37,0,'2010-05-31 00:00:00.000','2013-01-02 10:44:31.002');
Commit Transaction Transation_3

--4
Begin Transaction Transation_4
Update Production.Product
Set StandardCost=1.1*StandardCost
If (Select Sum(StandardCost)From Production.Product)<50000
	Begin 
		Commit Transaction Transation_4
	End
else
	Begin
		Rollback Transaction Transation_4
	end
SELECT * FROM Production.Product
SELECT SUM(StandardCost) FROM Production.Product

--5
Begin Transaction Transation_5
If exists (Select * From Production.Product WHERE ProductNumber = 'T-34-85')
	Begin 
		Rollback Transaction Transation_5
	End
else
	Begin
		INSERT INTO Production.Product (Name, ProductNumber, MakeFlag, FinishedGoodsFlag, Color,SafetyStockLevel,ReorderPoint, StandardCost, ListPrice,DaysToManufacture,SellStartDate,ModifiedDate) 
		VALUES ('kilow gurniczy','T-34-85',0,0, 'meski',9999,770, 21.37, 21.37,0,'2010-05-31 00:00:00.000','2013-01-02 10:44:31.002');
	end
SELECT * FROM Production.Product

--6
Begin Transaction Transation_6
If exists (Select * From Sales.SalesOrderDetail WHERE OrderQty = 0)
	Begin 
		Rollback Transaction Transation_6
	End
else
	Begin
		UPDATE Sales.SalesOrderDetail
		Set OrderQty=OrderQty*21.37
		Commit Transaction Transation_6
	end
SELECT * FROM Production.Product

--7
Begin Transaction Transation_7
Declare 
	@przed_usunieciem int,
	@po_usunieciu int;

SET @przed_usunieciem=(SELECT COUNT (ProductID) FROM Production.Product);
	
	Delete From Production.Product 
	where StandardCost>( select avg(StandardCost) from Production.Product)

SET @po_usunieciu=(SELECT COUNT (ProductID) FROM Production.Product);

If (@przed_usunieciem-@po_usunieciu>10)
	begin
		Rollback Transaction Transation_7
		Print 'transakcja wycofana';
	end
Else
	 Begin
		Commit Transaction Transation_7
	 End
 