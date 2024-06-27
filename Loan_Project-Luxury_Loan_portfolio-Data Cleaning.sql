create database Loan_Project
use loan_project

select * from luxuryloanportfolio

-- Renaming The Table name from [luxuryloanportfolio] to [Loan_Portfolio]

sp_rename  'luxuryloanportfolio', 'Loan_Portfolio'

-- Cheack the table with new name.

select * from Loan_Portfolio

-- Validate the data structure, and the data consistency in the table

select column_name,data_type
from INFORMATION_SCHEMA.COLUMNS
where table_name='Loan_Portfolio'


select * from Loan_Portfolio

--- Lets Changes the Data types as required to avoid any anamollies in the analysis.

alter table loan_portfolio
alter column funded_amount money

alter table loan_portfolio
alter column funded_date date


alter table loan_portfolio
alter column duration_years int


alter table loan_portfolio
alter column duration_months int



-- Long column name changing to shorter and changing date types

exec sp_rename 'Loan_Portfolio._10_yr_treasury_index_date_funded', 
                'tenyr_dateIndex', 'COLUMN'
alter table loan_portfolio
alter column tenyr_dateIndex decimal(5,2)

alter table loan_portfolio
alter column interest_rate_percent decimal(5,2)

alter table loan_portfolio
alter column interest_rate decimal(5,2)


alter table loan_portfolio
alter column payments money

alter table loan_portfolio
alter column total_past_payments int

alter table loan_portfolio
alter column loan_balance money

alter table loan_portfolio
alter column property_value money

alter table loan_portfolio
alter column employment_length int

alter table loan_portfolio
alter column LAND_SQUARE_FEET int

SELECT * FROM LOAN_PORTFOLIO

select land_square_feet, gross_square_feet from loan_portfolio
where land_square_feet is null

update loan_portfolio 
set land_square_feet=''
where land_square_feet is null

update loan_portfolio 
set gross_square_feet=''
where gross_square_feet is null

alter table loan_portfolio
alter column LAND_SQUARE_FEET int

alter table loan_portfolio
alter column gross_SQUARE_FEET int

select column_name,data_type
from INFORMATION_SCHEMA.COLUMNS
where table_name='Loan_Portfolio'
---------------------------------------------------------------------------------------------------------