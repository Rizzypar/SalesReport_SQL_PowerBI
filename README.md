# SalesReport_SQL_PowerBI
## STEP BY STEP APPROACH
1. Intro and setup
2. Business request and planning
3. Data cleansing and transformation
4. Creating dashboards
5. Putting portfolio together, recap and next steps

SQL Server Express - https://www.microsoft.com/en-ca/sql-server/sql-server-downloads#:~:text=SQL%20Server%202022%20Express%20is,web%2C%20and%20small%20server%20applications
choose -express and choose basic 

SQL Server Management Studio (SSMS) - https://learn.microsoft.com/en-us/sql/ssms/download-sql-server-management-studio-ssms?redirectedfrom=MSDN&view=sql-server-ver15

DB used - https://learn.microsoft.com/en-us/sql/samples/adventureworks-install-configure?view=sql-server-ver15&tabs=ssms
PowerBI Desktop- use the appstore one 

#Questions asked:
why SQL server and manager ?
“SQL Server” is the name of the database management product by Microsoft.
“SQL Server Management Studio” (SSMS) is the GUI to do management activities 
(like adding users, doing backups, creating databases) and 
query/update the database tables interactively.

what is this db extension?
.bak 
In computing, ". bak" is a filename extension commonly used to signify a backup 
copy of a file. When a program is about to overwrite an existing file 
(for example, when the user saves the document they are working on), the program 
may first make a copy of the existing file, with . bak appended to the filename.

now after downloading both server and manager
copy and paste the Connection string (like in a notepad or smtn)
which looks like the statement below:
Server=localhost\SQLEXPRESS01;Database=master;Trusted_Connection=True;

now go to the SQL management and put in the server name: 
how to find the server name?
its in the statement saved in the noteback earliar, after the backslash 
SQLEXPRESS01 (its diff in diff pcs obvio)
for local host it is .
so my servername would be .\SQLEXPRESS01 


now lets go to the dbs, 
i went ahead and downloaded the adventureworks db 
https://learn.microsoft.com/en-us/sql/samples/adventureworks-install-configure?view=sql-server-ver15&tabs=ssms
 
the data warehouse version 
and further saved it in the location given in the website which is 
C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\Backup.

restore the adventure works file into the sql database, 
right click the database and click restore and select the database by 
clicking on device and browse.

now this needs to be updated with the most recent years info, so a code already provided by 
David Alzamendi can be used.
https://github.com/techtalkcorner/SampleDemoFiles/blob/master/Database/AdventureWorks/Update_AdventureWorksDW_Data.sql

right click on the [AdventureWorksDW2019] and click  new script and paste the above script and execute.

this updates the data into the most recent year	


## DATA CLEANING
Fact table vs dimension table 

fact table is numbers and dimensions is the textvalue for the rows or the earlier said numbers


## Business request 
: in this project we will be considering 

A mail from the Sales manager Richard ,
Richard - Sales Manager:

Hi All!

I hope you are doing well. 
We need to improve our internet sales reports and want to move from
static reports to visual dashboards.
Essentially, we want to focus it on how much we have sold of what products, 
to which clients and how it has been over time.
Seeing as each sales person works on different products and 
customers it would be beneficial to be able to filter them also.
We measure our numbers against budget so I added that in a spreadsheet 
so we can compare our values against performance.
The budget is for 2021 and we usually look 2 years back in time when we do 
analysis of sales.
Let me know if you need anything else!

// Richard

### Key takeaways:
- Visual dashboard needed
- how many products has been sold and to whom
- numbers and budget(spreadsheet not in data warehouse)
 must be checked to compare values against performance
- the budget in hand is for 2023, can go 2 years back 

## CODE SNIPPETS AND NOTES
just for checkin purposes 
to see what years are present

SELECT DISTINCT CalendarYear
  FROM [AdventureWorksDW2019].[dbo].[DimDate]
  GROUP BY CalendarYear
  ORDER BY CalendarYear;


Output 
2005
2006
2007
2008
2009
2010
2011
2012
2013
2014
2015
2016
2017
2018
2019
2020
2021
2022
2023

so we can use the data from 2021 to 2023 


CASE
    WHEN condition1 THEN result1
    WHEN condition2 THEN result2
    WHEN conditionN THEN resultN
    ELSE result
END;

soo in our code

for replacing values: 


CASE GENDER WHEN 'M' THEN 'MALE' WHEN 'F' THEN 'FEMALE' END AS Gender

JOIN STATEMENT: 

SELECT column_name(s)
FROM table1
LEFT JOIN table2
ON table1.column_name = table2.column_name;


while saving the tables of each cleaned stats, make sure your query settings include the headers as well
to check 
right click your query and then go to Query Options->Select Grid under Results node in the left navigation pane. 
Now, check the Include column headers when copying or saving the results
 # POWERBI
 
 After importing the changed csvs into the powerbi desktop, make sure to model the data accordingly. 
 further which change the datas as well.
 
 #### guided project with the help of Ali Ahmed https://www.youtube.com/watch?v=aavJvdlMaJ4&t=369s


<img width="491" alt="sales" src="https://user-images.githubusercontent.com/115044557/222977191-455c351c-1f99-42b7-bfd5-a7f5c1f03346.png">
