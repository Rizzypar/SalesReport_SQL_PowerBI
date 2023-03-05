/****** Script for SelectTopNRows command from SSMS  ******/
SELECT 
  [DateKey], 
  [FullDateAlternateKey] AS Date, 
  --[DayNumberOfWeek]
  [EnglishDayNameOfWeek] AS Day, 
  --[SpanishDayNameOfWeek]
  --[FrenchDayNameOfWeek]
  --[DayNumberOfMonth]
  --[DayNumberOfYear]
  [WeekNumberOfYear] AS WeekNr, 
  [EnglishMonthName] AS Month, 
  LEFT([EnglishMonthName],3) AS MonthShort,
  --[SpanishMonthName]
  --[FrenchMonthName]
  [MonthNumberOfYear] AS MonthNr,
  [CalendarQuarter] AS Quarter, 
  [CalendarYear] AS year
  --[CalendarSemester]
  --[FiscalQuarter]
  --[FiscalYear]
  --[FiscalSemester]
FROM 
  [AdventureWorksDW2019].[dbo].[DimDate]
  WHERE CalendarYear >= 2021
