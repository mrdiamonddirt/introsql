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
	select * from sales_stores;
    select first_name, last_name, sales_staffs.store_id, store_name from sales_staffs
    join sales_stores on sales_staffs.store_id = sales_stores.store_id
    order by store_name, last_name, first_name DESC;
    
-- 6 Write a single SQL statement to find the following:
-- a. A list of revenue per employee in descending order (two inner joins will be required)
	select * from sales_order_items;
    select * from sales_staffs;
    select * from sales_orders;
	select sales_order_items.order_id, sum(list_price*quantity) as salesvalue, sales_staffs.staff_id, sales_staffs.first_name from sales_order_items
    join sales_orders on sales_order_items.order_id = sales_orders.order_id
    join sales_staffs on sales_orders.staff_id = sales_staffs.staff_id
    group by first_name
    order by salesvalue desc;

-- 7. Write a single SQL statement to find the following:
select * from sales_customers;
select * from sales_order_items;
select * from sales_orders;
select * from sales_staffs;
select * from sales_stores;
-- a. Total revenue per store descending.
	select * from sales_stores;
    select * from sales_order_items;
    select * from sales_orders;
    
    select sales_order_items.order_id, sum(list_price*quantity) AS revenue, store_name from sales_order_items
    join sales_orders on sales_orders.order_id = sales_order_items.order_id
    join sales_stores on sales_orders.store_id = sales_stores.store_id
    group by store_name
    order by revenue desc;
    
-- b. Total revenue and total quantity ordered per item by revenue descending.
	select sales_order_items.order_id, sum(list_price*quantity) AS revenue, COUNT(quantity) AS totalquantity, store_name from sales_order_items
    join sales_orders on sales_orders.order_id = sales_order_items.order_id
    join sales_stores on sales_orders.store_id = sales_stores.store_id
    group by store_name
    order by revenue desc;

-- c. Total revenue per category descending.
	select * from sales_stores;
    select * from sales_order_items;
    select * from sales_orders;
	select * from production_products;
	select * from production_categories;
	select production_categories.category_name, sum(sales_order_items.list_price*quantity) AS revenue, COUNT(quantity) AS totalquantity from sales_order_items
    join sales_orders on sales_orders.order_id = sales_order_items.order_id
    join sales_stores on sales_orders.store_id = sales_stores.store_id
    join production_products on production_products.product_id = sales_order_items.product_id
    join production_categories on production_categories.category_id = production_products.category_id
    group by category_name
    order by revenue desc;

-- d. Total revenue per customer (displaying customer name) descending.
	select * from sales_customers;
	select  sales_customers.first_name, sum(sales_order_items.list_price*quantity) AS revenue, COUNT(quantity) AS totalquantity from sales_order_items
    join sales_orders on sales_orders.order_id = sales_order_items.order_id
    join sales_stores on sales_orders.store_id = sales_stores.store_id
    join production_products on production_products.product_id = sales_order_items.product_id
    JOIN sales_customers on sales_customers.customer_id = sales_orders.customer_id
    group by sales_customers.customer_id
    order by revenue desc;
    
    
-- 8. Write a single SQL statement to find the following:
-- a. Identify all orders where the sales list price does not equal the production list price.
	select * from production_products;
    select * from sales_order_items;
    select sales_order_items.product_id, item_id, product_name, sales_order_items.list_price from sales_order_items
    join production_products on sales_order_items.product_id = production_products.product_id
    where sales_order_items.list_price <> production_products.list_price
    order by product_name;
    
-- 9. Write a single SQL statement to find the following:
select * from production_brands;
select * from production_categories;
select * from production_products;
select * from production_stocks;
select * from sales_customers;
select * from sales_order_items;
select * from sales_orders;
select * from sales_staffs;
select * from sales_stores;

-- a. All orders that have not shipped yet.
select order_id, shipped_date from sales_orders
where shipped_date is null
group by order_id;

-- b. For all orders that have not shipped yet, the sum of the quantity ordered.
select shipped_date, sum(list_price*quantity) AS sumoforders from sales_orders
join sales_order_items on sales_orders.order_id = sales_order_items.order_id
where shipped_date is null
group by shipped_date;

-- c. From the production_stocks table the total stock available per product_id, labelling
-- the total stock column as “total_stock”
select * from production_stocks;
select * from production_products;
select production_stocks.product_id, product_name, sum(quantity) AS total_stock from production_stocks
JOIN production_products on production_stocks.product_id = production_products.product_id
group by product_id;


-- d. Using the example from answer c as an SQL derived table and using a WHERE
-- statement to join all tables, create a table by product_id showing current quantity of
-- orders not yet shipped and total stock available.
select * from sales_order_items;
select * from sales_orders;
select * from production_stocks;
select * from production_products;

select production_stocks.product_id, product_name, sum(production_stocks.quantity) AS total_stock, count(order_status= 3) AS orders_outstanding from production_stocks
JOIN production_products on production_stocks.product_id = production_products.product_id
join sales_order_items on sales_order_items.product_id = production_stocks.product_id
join sales_orders on sales_orders.order_id = sales_order_items.order_id
where shipped_date is null
group by product_id;