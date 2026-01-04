-- create database online_book_store ;
-- use online_book_store ;

-- # Creating Tables------------------------------------------------------------------------------------------------------------------------------------------------

-- CREATE TABLE books (
--     Book_ID SERIAL PRIMARY KEY,
--     Title VARCHAR(100),
--     Author VARCHAR(100),
--     Genre VARCHAR(50),
--     Published_Year INT,
--     Price NUMERIC(10, 2),
--     Stock INT ) ;

-- CREATE TABLE Customers (
--     Customer_ID SERIAL PRIMARY KEY,
--     Name VARCHAR(100),
--     Email VARCHAR(100),
--     Phone VARCHAR(15),
--     City VARCHAR(50),
--     Country VARCHAR(150)
-- );

-- CREATE TABLE Orders (
--     Order_ID SERIAL PRIMARY KEY,
--     Customer_ID INT REFERENCES Customers(Customer_ID),
--     Book_ID INT REFERENCES Books(Book_ID),
--     Order_Date DATE,
--     Quantity INT,
--     Total_Amount NUMERIC(10, 2)
-- );

-- #  checking table data  

select * from books;
select * from customers ;
select * from orders ; 

-- # Data cleaning--------------------------------------------------------------------------------------------------------------------------------------------------------
-- Check duplicates 

-- select * from books
-- group by Book_ID
-- having count(*) > 1 ;

-- select * from customers 
-- group by Customer_ID 
-- having count(*) > 1 ; 

-- select * from orders 
-- group by Order_ID 
-- having count(*) > 1 ;

-- # questions to solve---------------------------------------------------------------------------------------------------------------------------------------------

-- 1) Retrieve all books in the "Fiction" genre:

-- select * from books 
-- where Genre ='Fiction' ;


-- 2) Find books published after the year 1950:

-- select * from books 
-- where Published_Year > 1950 ;


-- 3) List all customers from the Canada:

-- select * from  customers
-- where country = "Canada"


-- 4) Show orders placed in November 2023:

-- select * from orders
-- where Order_Date between '2023-11-1' and '2023-11-30' ;


-- 5) Retrieve the total stock of books available: 

-- select * from books 
-- where Stock not like '0' ;


-- 6) Find the details of the most expensive book:

-- select * from books 
-- order by Price desc 
-- limit 1

-- 7) Show all customers who ordered more than 1 quantity of a book:

-- select * from orders where 
-- Quantity > 1 ;


-- 8) Retrieve all orders where the total amount exceeds $20:

-- select * from orders
-- where Total_Amount > 20 ;


-- 9) List all genres available in the Books table:

-- select distinct Genre from 
-- books ;


-- 10) Find the book with the lowest stock:

-- select * from books 
-- order by Stock asc 
-- limit 1 ;


-- 11) Calculate the total revenue generated from all orders:

-- select sum(Total_Amount) as Total_Revanue
-- from orders ; 


-- Advance Questions : ----------------------------------------------------------------------------------------------------------------------------------------------

-- 12) Retrieve the total number of books sold for each genre:--

-- select b.Genre , sum(o.Quantity) as total_sold 
-- from books as b join orders as o on  b.Book_ID = o.Book_ID
-- group by b.Genre; 


-- 13) Find the average price of books in the "Fantasy" genre:--

-- select avg(price) as avg_price from books 
-- where Genre = 'Fantasy';

-- 14) List customers who have placed at least 2 orders:-

-- select o.customer_id , c.Name , count(o.order_id)
-- from orders as o join customers as c on o.Customer_ID = c.Customer_ID
-- group by o.customer_id , c.Name 
-- having count(o.order_id) >= 2 ;

-- 15) Find the most frequently ordered book:--

-- select o.book_id, b.title, count(o.order_id) as total_sold_count 
-- from orders as o join books as b on o.Book_ID = b.Book_ID 
-- group by o.book_id, b.title 
-- order by count(o.order_id) desc limit 1 ;


-- 16) Show the top 3 most expensive books of 'Fantasy' Genre :

-- select * from books 
-- where Genre = 'Fantasy'
-- order by Price desc limit 3 ; 


-- 17) Retrieve the total quantity of books sold by each author:-

-- select b.author , sum(o.quantity) as total_book_sold 
-- from books as b left join orders as o on b.Book_ID = o.Book_ID
-- group by b.author 


-- 18) List the cities where customers who spent over $30 are located:

-- select c.city , c.Name , sum( o.Total_Amount) as Total_spent
-- from customers as c join orders as o on c.Customer_ID = o.Customer_ID
-- group by c.city , c.Name 
-- having sum(o.Total_Amount) > 30 



-- 19) Find the customer who spent the most on orders:

-- select c.customer_id, c.name , sum(o.Total_Amount) as total_spent
-- from customers as c join orders as o on c.Customer_ID = o.Customer_ID
-- group by c.customer_id, c.name
-- order by sum(o.Total_Amount) desc limit 1 ;


 -- 20) Calculate the stock remaining after fulfilling all orders:

--  SELECT b.book_id, b.title, b.stock, COALESCE(SUM(o.quantity),0) AS Order_quantity,  
-- 	b.stock- COALESCE(SUM(o.quantity),0) AS Remaining_Quantity
-- FROM books b
-- LEFT JOIN orders o ON b.book_id=o.book_id
-- GROUP BY b.book_id ORDER BY b.book_id;


--  End Project --------------------------------------------------------------------------------------------------------------------------------------------------------- 

