show databases
create database if not exists ecommerce_sales_data
use ecommerce_sales_data
-- installing miniconda then install csvkit via miniconda
-- then run command: csvsql --dialect mysql --snifflimit 1000 Sales_Dataset.csv > Result.sql
-- we'll get the file with the create command inside it

CREATE TABLE `Sales_Dataset` (
	order_id VARCHAR(15) NOT NULL,
	order_date DATE NOT NULL,
	ship_date DATE NOT NULL,
	ship_mode VARCHAR(14) NOT NULL,
	customer_name VARCHAR(22) NOT NULL,
	segment VARCHAR(11) NOT NULL,
	state VARCHAR(36) NOT NULL,
	country VARCHAR(32) NOT NULL,
	market VARCHAR(6) NOT NULL,
	region VARCHAR(14) NOT NULL,
	product_id VARCHAR(16) NOT NULL,
	category VARCHAR(15) NOT NULL,
	sub_category VARCHAR(11) NOT NULL,
	product_name VARCHAR(127) NOT NULL,
	sales DECIMAL(38, 0) NOT NULL,
	quantity DECIMAL(38, 0) NOT NULL,
	discount DECIMAL(38, 3) NOT NULL,
	profit DECIMAL(38, 5) NOT NULL,
	shipping_cost DECIMAL(38, 2) NOT NULL,
	order_priority VARCHAR(8) NOT NULL,
	year DECIMAL(38, 0) NOT NULL
);

load data infile "/home/awaiz/Desktop/dev/SQL/course notes/Sales_Dataset.csv"
into table Sales_Dataset fields terminated by ','
enclosed by '"'lines terminated by '\n' ignore 1 rows

-- then u will get Error Code: 1290. The MySQL server is running with the --secure-file-priv option so it cannot execute this statement

SHOW VARIABLES LIKE 'secure_file_priv';
--state,  highest sum shipping cost
select state, sum(shipping_cost) as highest_sum_shipping_cost
from Sales_Dataset group by state
 order by highest_sum_shipping_cost desc limit 3

 -- common table expressions - complex queries+reusability
 with states as (
	select state, sum(shipping_cost) as highest_sum_shipping_cost
from Sales_Dataset group by state
 order by highest_sum_shipping_cost desc limit 3
 )select * from states
--  here 'states' is a virtual table that can only be used by querying right after making the table as above
-- whenever you feel a lot of subqueries or join are there in ur sql queries go for CTE

-- permium users of our LMS
-- use cte
-- total_orders>avg_orders