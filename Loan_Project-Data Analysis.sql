
-- In this particular project, our main objective is to thoroughly investigate the loaning procedures 
-- of a financial establishment, particularly in relation to the loans granted to High Net Worth Individuals (HNIs). 
-- Through a comprehensive analysis of the information gathered from these loan transactions, our goal is to gain insight 
-- into the specific strategies employed by the institution when it comes to lending and to identify the various patterns 
-- that influence its overall business strategies and decisions.

use loan_project

-- Letrs understand the initial disbursement loan purpose

select distinct purpose from loan_portfolio

-- Lets analyse the performance of loan across different purpose to optimize the landing strategies.

select * from Loan_Portfolio

select purpose,
       avg(funded_amount) as Avg_Funded_Amount,
	   avg(Interest_rate) as Avg_Interest_Rate,
	   avg(Duration_Years) as 'Loan Duration in Years'
  from Loan_Portfolio
  group by purpose
  order by Avg_Funded_Amount desc

-- Lets analyse the trends of Loan amount over the years to anticipate the future funding requirement.


select * from Loan_Portfolio

select year(funded_date) as Year,
       sum(funded_amount) as 'Total Fund Released'
	   from Loan_Portfolio
	   group by year (funded_date)
	   order by year

-- Lets cheack the Yearly Difference by total fund released 

select 
    Year,
    [Total fund released],
    [total fund released] - lag([total fund released], 1, 0) over (order by year) as [Difference from previous year]
from 
    (select 
        year(funded_date) as year,
        sum(funded_amount) as [Total fund released]
        from loan_portfolio
        group by year (funded_date)) as yearly_totals
order by year

-- Lets cheack the purpose wise the fund released in different year

select 
    [Purpose of Loan],
    Year,
    [Total fund released],
    [total fund released] - lag([total fund released], 1, 0) over (order by year) as [Difference disbursement]
from 
    (select
	    purpose as 'Purpose of Loan',
        year(funded_date) as year,
        sum(funded_amount) as [Total fund released]
        from loan_portfolio
        group by Purpose,year (funded_date)) as yearly_totals
order by year

-- Let's analyze how many loans were disbursed each year for each purpose.

select 
    year(funded_date) as Year,
    purpose as Loan_Purpose,
    count(loan_id) as 'Countof loans disbursed',
	sum(funded_amount) as Total_Fund_Released
from loan_portfolio
group by year(funded_date),
         purpose
order by purpose, 
         year

 
 -- Let's understand the disbursement amount in relation to future risk. 
 -- To do so, we need to comprehend the mortgage value.
 
-- The property should be evaluated as per the segment.So that we need to find out the min max and average 
-- of property value then segregate based on property value. 

select * from Loan_Portfolio 
select min(property_value) as 'Min Pro Value',
       max(property_value) as 'Max Prop Value',
	   avg(property_value) as 'Average Prop Value'
	from Loan_Portfolio

-- from the above, we can set 
-- Low segment: Less then 10L
-- Middle Segment: Between 10L To 20L
-- Upper segment: More than 20L 

-- Based segregate the property value and understand the loan balance and interest rate.
-- Portporty Portfolio


select purpose,count(loan_id) Noof_Loan,
        case when property_value<= 1000000 then 'Low Segment'
            when property_value between 1000000 and 2000000 then 'Middle segment'
		else 'Upper Segment'
		end as 'Prop_Value',
		avg(interest_rate) as 'Avg Intrest Rate',
		avg(loan_balance) as 'Avg Loan Balance'
	from Loan_Portfolio
	group by purpose,case when property_value<= 1000000 then 'Low Segment'
            when property_value between 1000000 and 2000000 then 'Middle segment'
		    else 'Upper Segment'
		  end
    order by purpose


 

-- From the above Property evaluation portfolio, so that bnking institution can manage and plan 
-- for any default risk involved in the future


-- Based on interest rate seggrigate the customer base for lending

select distinct interest_rate from loan_portfolio

-- 3 types of interest rate 0.05,0.04, 0.03

select case when funded_amount <= 1500000 And interest_rate < 0.04 then segment1
            when funded_amount between 1500000 and 2500000 and interest_rate < 0.05 then segment2
			else segment3
		end as customer_segment,
		avg(loan_balance) as avg_loan_balance
	from loan_portfolio
	group by case when funded_amount <= 1500000 And interest_rate < 0.04 then segment1
            when funded_amount between 1500000 and 2500000 and interest_rate < 0.05 then segment2
			else segment3
		end

select min(funded_amount) as min_fund_amount,
       max (funded_amount) as max_fund_amount,
	   avg (funded_amount) as avg_fund_amount from loAN_PORTFOLIO


select * from loan_portfolio