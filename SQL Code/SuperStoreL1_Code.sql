select Row_ID
    , Order_ID
    , date_format(str_to_date(Order_Date, '%d-%m-%Y'), '%Y-%m-%d') 
	as OrderDate,
 date_format(str_to_date(Order_Date, '%d-%m-%Y'), '%Y') 
	as OrderYear, 
	date_format(str_to_date(Order_Date, '%d-%m-%Y'), '%m') 
	as OrderMonth,
    Region,
    Category,
    SubCategory,
    Sales, Quantity, Profit, Discount
from superstore_l1.superstore_data;

select 
	date_format(str_to_date(Order_Date, '%d-%m-%Y'), '%Y') 
	as OrderYear, 
	date_format(str_to_date(Order_Date, '%d-%m-%Y'), '%m') 
	as OrderMonth,
    Region,
    Category,
    SubCategory,
    sum(Sales) as Sales, 
    sum(Quantity) as Quantity, 
    sum(Profit) as Profit,
    sum(Discount) as Discount
from superstore_l1.superstore_data
where date_format(str_to_date(Order_Date, '%d-%m-%Y'), '%Y') in ('2016' , '2017')
GROUP BY date_format(str_to_date(Order_Date, '%d-%m-%Y'), '%Y') 
        , date_format(str_to_date(Order_Date, '%d-%m-%Y'), '%m') 
        , Region
        , Category
        , SubCategory;

