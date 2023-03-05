/****** Script for SelectTopNRows command from SSMS  ******/
SELECT 
  c.[CustomerKey] AS [Customer Key], 
  c.[GeographyKey] AS [Geography Key], 
  --,[CustomerAlternateKey]
  --[Title]
  c.[FirstName] AS [First Name], 
  --,[MiddleName]
  c.[LastName] AS [Last Name], 
  c.[FirstName] + ' ' + c.[LastName] AS [Full Name], 
  --,[NameStyle]
  --,[BirthDate]
  --,[MaritalStatus]
  --,[Suffix]
  c.[Gender], 
  CASE c.[Gender] WHEN 'M' THEN 'Male' WHEN 'F' THEN 'Female' END AS [Gender Role], 
  --,[EmailAddress]
  --[YearlyIncome]
  --,[TotalChildren]
  --,[NumberChildrenAtHome]
  --,[EnglishEducation]
  --,[SpanishEducation]
  --,[FrenchEducation]
  --,[EnglishOccupation]
  --,[SpanishOccupation]
  --,[FrenchOccupation]
  --,[HouseOwnerFlag]
  --,[NumberCarsOwned]
  --,[AddressLine1]
  --,[AddressLine2]
  --,[Phone]
  c.[DateFirstPurchase] AS [Data First Purchase], 
  --,[CommuteDistance]
  g.[city] AS [Customer City] -- from gegoraphy table
FROM 
  [AdventureWorksDW2019].[dbo].[DimCustomer] AS c 
  LEFT JOIN [AdventureWorksDW2019].[dbo].[DimGeography] AS g ON c.GeographyKey = g.GeographyKey 
Order By 
  CustomerKey ASC
