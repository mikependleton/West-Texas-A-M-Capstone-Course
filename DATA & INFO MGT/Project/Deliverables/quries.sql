USE UtilityCompany;

-- Task 2.1


-- Q1 - Add new customers

INSERT INTO customer (Number, First_Name, Last_Name)
VALUES ('742', 'Julie', 'Hamilton');

INSERT INTO customer (Number, First_Name, Last_Name)
VALUES ('831', 'John', 'Fluence');

-- Q2 - Assign one of the Reader employees to do next reading of some customers (at least 2)

UPDATE meter
SET cur_reader_number = 4
WHERE ID = 3;

UPDATE meter
SET cur_reader_number = 5
WHERE ID = 8;

-- Q3 - make one of the readers add a new reading from his assignments list. Note that when a new reading is completed 
-- and if it is not the first reading for that customer a new bill will be issued, so create a bill for the entered 
-- reading according to the previous reading

UPDATE meter
SET cur_reading = 388
WHERE ID = 3;

UPDATE meter
SET cur_reading_date = 20201115
WHERE ID = 3;

UPDATE meter
SET Notes = null
WHERE ID = 3;

-- Q4 - deactivate the service for a customer at his current address. Note that deactivating the service will require 
-- a new reading to be scheduled on the date of termination request. And new bill to be issued after the reading

ALTER TABLE contract
ADD COLUMN deactivation_date date;

UPDATE contract
SET deactivation_date = '2020-11-15'
WHERE premise_number = 10;

UPDATE meter
SET cur_reader_number = 4,
cur_reading_date = '2020-11-15',
Cur_reading = 940,
Notes = null
WHERE ID = 17;

insert into bill (Number, Premise_Number, Customer_Number, Contract_Rate, Meter_Number, Bill_Date, Consumption, Bill_Amount, Balance)
values ('1005', '10', '1125', '0.38', '56', '20201115', '50', '19', '19');



-- Task 2.2

-- How many customer have a balance over 100
-- Q1

select customer.first_name as 'First Name', customer.last_name as 'Last Name', 
payment.Bill_Number, sum(bill.bill_amount) as Total_Billed, (bill.bill_amount - payment.Payment_Amount) As Balance from payment
INNER JOIN customer on customer.number = payment.Customer_Number
INNER JOIN bill on bill.number = payment.Bill_Number
Group by payment.Bill_Number Having Balance > '100';

-- Q2
-- list all Current readings Seperated this out because I was not sure if current and previous is needed


Select 
reader.first_name as 'First Name', reader.last_name as 'Last Name',
cur_reader_number, meter.cur_reading , meter.cur_reading_date, Meter.number, premise.address, meter.notes
from meter
INNER JOIN reader on reader.number = meter.cur_reader_number
INNER JOIN premise on premise.number = meter.premise_number
where reader.number = meter.cur_reader_number and meter.cur_reader_number = '5' order by meter.cur_reading_date 
;

-- list all previous readings
-- Q2 cont

Select 
reader.first_name as 'First Name', reader.last_name as 'Last Name',
prev_reader_number, meter.prev_reading, meter.prev_reading_date, Meter.number, premise.address, meter.notes
from meter
INNER JOIN reader on reader.number = meter.prev_reader_number
INNER JOIN premise on premise.number = meter.premise_number
where reader.number = meter.prev_reader_number and meter.prev_reader_number = '5' order by meter.prev_reading_date 
;

-- List all reading and bills....etc 
-- Q3

select distinct bill.number,bill.bill_date, payment.payment_amount, 
payment.payment_date, cur_reading, Prev_reading, premise.address,
concat(customer.first_name, ' ' ,customer.last_name) as 'Cust Name'
from bill
INNER JOIN payment on Payment.id = bill.payment_number
INNER JOIN customer on customer.number = payment.customer_number
INNER JOIN premise on premise.number = customer.id
INNER JOIN meter on meter.number = premise.meter_number
where (customer.id = '3' or customer.id = '4') 
;

-- Q4
-- how many readings from employee Genvieve Creighton = 2 (between '2019-05-15' and '2019-06-15')

select prev_reading, reader.first_name, reader.last_name, 
prev_reading_date, 
(select count(*) from meter
where prev_reader_number = '3' 
and (prev_reading_date between '2019-05-15' and '2019-06-15')) 
as 'Total number of Readings'
from meter
INNER JOIN reader on reader.number = meter.prev_reader_number
where prev_reader_number = '3' 
and (prev_reading_date between '2019-05-15' and '2019-06-15') 
and meter.prev_reader_number = reader.number
;
-- Q5
-- customer bill find 1st and last reading

select bill.number as 'Bill Number', concat(reader.first_name, ' ' ,reader.last_name) as 'Cur Reader Name', 
meter.cur_reader_number, meter.cur_reading,  
(select concat(reader.first_name, ' ' ,reader.last_name) from reader where meter.prev_reader_number = reader.number) as 'Prev reader name'
, meter.prev_reader_number, meter.prev_reading
from meter
INNER JOIN bill on bill.premise_number = meter.premise_number
INNER JOIN 	reader on reader.number = meter.cur_reader_number
where bill.number = '1005' and meter.id = '15' 
;

-- Q6
-- Kalie Gratton has the highest consumption at avg of 284

select avg(consumption) as consumption, bill_date, customer_number,
concat(customer.first_name, ' ' ,customer.last_name) as 'Cust Name' from bill
INNER JOIN customer on customer.number = bill.customer_number
where bill_date < '2019-11-23'
group by customer_number 
;

-- Q7
-- Avg of all consuptions betwee two dates

select avg(consumption) as consumption
from bill
where bill_date between '2019-05-15' and '2020-06-15'
;

-- Q8
-- what customers are above average Ruperta Horsewood is above average

select avg(consumption) as consumption,
concat(customer.first_name, ' ' ,customer.last_name) as 'Cust Name' from bill
INNER JOIN customer on customer.number = bill.customer_number
where bill_date between '2019-05-15' and '2020-06-15'
group by customer_number
;



