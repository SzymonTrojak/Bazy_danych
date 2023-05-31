Use AdventureWorks2022
CREATE SCHEMA ciagi;

-- zadanie 1
CREATE FUNCTION ciagi.Fibonaciego(@num INT)
RETURNS @TabelaFibonaciego TABLE("Ciag Fibonaciego" INT)
AS
BEGIN
	DECLARE  @n2 INT, @n1 INT, @n0 INT, @i INT;
	SET @n0=0;
	SET @n1=1;
	SET @n2=0;
	SET @i=1;
	IF (@num=0)
		INSERT INTO @TabelaFibonaciego VALUES(NULL);
	IF (@num>=1)
		WHILE (@num>=@i)
		BEGIN
			INSERT INTO @TabelaFibonaciego VALUES(@n0);
			SET @n2=@n0;
			SET @n0=@n1+@n0;
			SET @n1=@n2;
			SET @i=@i+1;
		END
RETURN
END;

SELECT * FROM ciagi.Fibonaciego(15);

CREATE PROCEDURE ciagi.FibonacciProcedura (@n INT)
AS
DECLARE @i INT;
SET @i=0;
BEGIN
	WHILE(@i=0)
	BEGIN
		SELECT * FROM ciagi.Fibonaciego(@n);
		SET @i+=1;
	END;
END;

EXEC ciagi.FibonacciProcedura 45;

-- zadanie 2

Create Trigger Duze_Litery on Person.Person
AFTER Insert,UPDATE 
AS
begin
	UPDATE Person.Person
	SET LastName = UPPER(LastName)
	From Person.Person;
end

INSERT INTO Person.BusinessEntity(rowguid)
VALUES(newid())

INSERT INTO AdventureWorks2022.Person.Person (BusinessEntityID,PersonType,FirstName,LastName) VALUES (20785,'IN','Szymon','Trojak')
GO

SELECT * FROM Person.Person

-- zadanie 3

Create Trigger taxRateMonitoring on Sales.SalesTaxRate 
AFTER UPDATE 
AS
begin
	Declare @NowyTaxRate smallmoney,@TaxRate smallmoney
	Select @TaxRate=TaxRate From deleted
	Select @NowyTaxRate=TaxRate From inserted
	if @NowyTaxRate>@TaxRate*1.3
	PRINT 'Za duze podatki, czas uciekac z kraju'
end
Update Sales.SalesTaxRate
set TaxRate=TaxRate*1.5

SELECT * FROM Sales.SalesTaxRate;