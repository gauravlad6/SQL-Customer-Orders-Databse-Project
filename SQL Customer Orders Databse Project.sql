create database practice
select * from customers;
/*1.Write a SQL query to retrieve the first 5 rows from the "customers" table*/
select * from customers limit 5;

/*2.Write a SQL query to retrieve the unique city names from "customers" table sorted in descending order*/
select distinct city from customers order by city desc

/*3.Write a SQL query to get the number of unique city names "offices" table*/
select count(distinct city) from offices

/*4.Write a SQL query to get the maximum, minimum and average value from the "credit limit" column in the "customers" table*/
select max(creditLimit) as Maximum_Credit_Limit, min(creditLimit) as Minimum_Credit_Limit, avg(creditLimit) as Average_Credit_Limit from customers

/*5.Write a SQL query to get the city names which are present in “offices” table but not in “customer” table*/
select city from offices where city not in(select city from customers)

/*6.Write a SQL query to get the city names which are present in “offices” table as well as in “customers” table*/
select city from offices intersect select city from customers

/*7. Write a SQL query to get records where city or state is not given in “customer” table and creditlimit is in the range – 80000 to 130000*/
select * from customers where city is null or state is null and creditLimit between 80000 and 130000

/*8. Write a SQL query to get the maximum number of orders placed on a particular date and what is that date in orders table*/
select count(orderNumber) as max_orders_on_a_day, orderDate from orders
group by orderDate
order by count(orderNumber) desc limit 1;

/*9. For the records which we get in previous question(Q8), write a SQL query to get the customer names and their phone numbers*/
select customerName, phone from customers where customerNumber in (select customerNumber from orders where orderdate='2004-11-24')

/*10.SQL query to get the customer phone number and customer name from customers table where order is either cancelled or disputed in orders table.*/
select customerName, phone from customers where customerNumber in (select customerNumber from orders where status = 'cancelled' or status = 'disputed')

/*11.Write a SQL query to get the top 4 highest selling products from orderdetails table.*/
select quantityOrdered, productCode from orderdetails
order by quantityOrdered desc limit 4;

/*12. Write a SQL query to get the count of orders placed by each customer in 2003 and 2004.*/
select distinct customers.customerName, count(orders.orderDate) as count_of_orders
from customers
inner join orders on customers.customerNumber = orders.customerNumber
where orders.orderDate between "01-01-2003" and "31-12-2004"
group by customers.customerName;

/*13. Write a SQL query to get the city names from customer table where more than 4 customers reside.*/
select city from customers 
group by city
having count(customerNumber) > 4;