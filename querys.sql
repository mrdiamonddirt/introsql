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

select * from sales_order_items;
select avg(discount) from sales_order_items;

select min(list_price), max(list_price) FROM sales_order_items;
select avg(list_price) FROM sales_order_items;

select sum(sum*quantity*(1-discount)) FROM sales_order_items;