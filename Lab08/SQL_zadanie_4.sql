USE AdventureWorks2022

--a CTE zbuduj zapytanie, kt�re znajdzie informacje na temat stawki pracownika oraz jego danych, a nast�pnie zapisze je do tabeli tymczasowej TempEmployeeInfo.
WITH TempEmployeeInfo (FirstName, MiddleName, LastName, JobTitle, BirthDate, Gender, HireDate, MaritalStatus, Rate)
AS
 (
	SELECT FirstName, MiddleName, LastName, JobTitle, BirthDate, Gender, HireDate, MaritalStatus, Rate FROM HumanResources.Employee AS employee
	JOIN HumanResources.EmployeePayHistory AS pay
	ON employee.BusinessEntityID = pay.BusinessEntityID
	JOIN Person.Person AS person
	ON employee.BusinessEntityID = person.BusinessEntityID
 )
 SELECT * FROM TempEmployeeInfo;


 --b Uzyskaj informacje na temat przychod�w ze sprzeda�y wed�ug firmy i kontaktu (za pomoc� CTE i bazy AdventureWorksL)
 USE AdventureWorksLT2022

 WITH CTE (Company, Revenue)
 AS
 (
 SELECT CompanyName+'('+FirstName+' '+LastName+')',TotalDue  FROM SalesLT.Customer AS sc
JOIN SalesLT.SalesOrderHeader AS soh
ON soh.CustomerID= sc.CustomerID
 )
 SELECT * FROM CTE
ORDER BY Company 


 --c Napisz zapytanie, kt�re zwr�ci warto�� sprzeda�y dla poszczeg�lnych kategorii produkt�w
 USE AdventureWorksLT2022

WITH CTE_1(Category,SalesValue)
AS 
(
SELECT pc.Name ,SUM(s.LineTotal)
FROM SalesLT.Product AS p
JOIN SalesLT.ProductCategory AS pc ON pc.ProductCategoryID = p.ProductCategoryID
JOIN SalesLT.SalesOrderDetail AS s ON s.ProductID = p.ProductID
GROUP BY pc.Name
)
SELECT * FROM CTE_1
