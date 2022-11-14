USE bdgtz9j1xtvceikhuc8p;

SHOW TABLES;

select * from production_brands;
select * from production_categories;
select * from production_products;
select * from production_stocks;
select * from sales_customers;
select * from sales_order_items;
select * from sales_orders;
select * from sales_staffs;
select * from sales_stores;

-- SQL Assignments 

-- 1 Write a single SQL select statement to find the following:
-- a. A list of all employee names (first and last) from sales_staff table.
select first_name, last_name from sales_staffs;

-- b. CEO from the sales_staff table.
select * from sales_staffs
where staff_id = 1;
-- c. All managers from the sales_staff table.
select * from sales_staffs
where manager_id = 1;
-- d. A list of all customers including their first_name, last_name, email and phone
-- number.
select first_name, last_name, email, phone from sales_customers;
-- e. A list of all stores including their store name and city.
select store_name, city from sales_stores;
-- f. A list of all products including their product_name list_price and brand_name from a
-- join of production_products and production_brands tables.
-- select * from production_brands;
select product_name, list_price, brand_name from production_products
JOIN production_brands ON production_products.brand_id = production_brands.brand_id;
-- 2 Write a single SQL select statement to find the following:
-- a. A count of all orders from the sales_orders table.
	select * from sales_orders;
    select count(*) FROM sales_orders;
-- b. A count of all products from production_products table.
select * from production_products;
select count(*) FROM production_products;
-- c. A count of all order_items from the sales_order_items table.
select * from sales_order_items;
select count(*) FROM sales_order_items;

-- 3 Write a single SQL statement to find the following:
-- a. A sum of all quantities from the sales_order_items table.
select * from sales_order_items;
select sum(quantity) FROM sales_order_items;
-- b. A sum of all quantities multiplied by their individual list_price from the
-- sales_order_items table.
select * from sales_order_items;
select sum(quantity*list_price) FROM sales_order_items;
-- c. A sum of all quantities multiplied by their individual list_prices including their
-- discount (i.e. multiplied by 1 – discount).
select sum(quantity*list_price*(1-discount)) FROM sales_order_items;
-- d. A sum of all quantities multiplied by their individual list_prices including their
-- discount (i.e. multiplied by 1 – discount) but formatted using the FORMAT option to
-- 2 decimal places and including commas.
select format(sum(quantity*list_price*(1-discount)),2)  FROM sales_order_items;
-- e. A sum of all quantities multiplied by their individual list_prices including their
-- discount (i.e. multiplied by 1 – discount) but formatted using the FORMAT option to
-- 2 decimal places and including commas with the column heading changed to
-- Revenue using the AS option.
select format(sum(quantity*list_price*(1-discount)),2) AS revenue FROM sales_order_items;

-- 4 Write a single SQL statement to find the following:
-- a. A list of all orders sorted ascending by order_id from sales_orders.
select * from sales_orders
order by order_id ASC;
-- b. A list of all order_items sorted ascending by order_id and item_id from sales_orders
-- using an INNER JOIN to join sales_orders and sales_order_items.
select * from sales_order_items;
select * from sales_orders;
select sales_orders.order_id, product_id from sales_orders
JOIN sales_order_items on sales_orders.order_id = sales_order_items.order_id
order by order_id ASC;
-- c. A list of all order_items and their value (see 3 above) GROUPed by order_id and
-- item_id sorted ascending by order_id and item_id from sales_orders using an INNER
-- JOIN to join sales_orders and sales_order_items. Rename the column with value to
-- be Item Value.
select sales_orders.order_id, product_id, list_price AS itemvalue from sales_orders
JOIN sales_order_items on sales_orders.order_id = sales_order_items.order_id
group by order_id
order by order_id, item_id ASC;

-- 5. Write a single SQL statement to find the following:
-- a. A list of employees (first and last name) and their store name ordered by store
-- name, last_name and first_name mis descending order.

-- 6 Write a single SQL statement to find the following:
-- a. A list of revenue per employee in descending order (two inner joins will be required)

-- 7. Write a single SQL statement to find the following:
-- a. Total revenue per store descending.
-- b. Total revenue and total quantity ordered per item by revenue descending.
-- c. Total revenue per category descending.
-- d. Total revenue per customer (displaying customer name) descending.

-- 8. Write a single SQL statement to find the following:
-- a. Identify all orders where the sales list price does not equal the production list price.

-- 9. Write a single SQL statement to find the following:
-- a. All orders that have not shipped yet.
-- b. For all orders that have not shipped yet, the sum of the quantity ordered.
-- c. From the production_stocks table the total stock available per product_id, labelling
-- the total stock column as “total_stock”
-- d. Using the example from answer c as an SQL derived table and using a WHERE
-- statement to join all tables, create a table by product_id showing current quantity of
-- orders not yet shipped and total stock available.


select * from sales_order_items;
select avg(discount) from sales_order_items;

select min(list_price), max(list_price) FROM sales_order_items;
select avg(list_price) FROM sales_order_items;

select sum(list_price*quantity*(1-discount)) FROM sales_order_items;