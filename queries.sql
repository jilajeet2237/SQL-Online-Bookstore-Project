-- ============================================
-- Online Bookstore Analysis using SQL (MySQL)
-- Database: onlinebookstore
-- Tables: Books, Customers, Orders
-- ============================================

USE onlinebookstore;

-- 1. Retrieve all books in the 'Fiction' genre
SELECT * FROM books WHERE genre = 'Fiction';

-- 2. Books published after 1950
SELECT * FROM books WHERE published_year > 1950;

-- 3. Customers from Canada
SELECT * FROM customers WHERE country = 'Canada';

-- 4. Orders placed in November 2023
SELECT * FROM orders
WHERE order_date BETWEEN '2023-11-01' AND '2023-11-30';

-- 5. Total stock of all books
SELECT SUM(stock) AS total_stock FROM books;

-- 6. Most expensive book
SELECT * FROM books ORDER BY price DESC LIMIT 1;

-- 7. All books arranged by price (high to low)
SELECT * FROM books ORDER BY price DESC;

-- 8. Customers who ordered more than 1 book in a single order (JOIN)
SELECT c.*, o.quantity
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id
WHERE o.quantity > 1;

-- 9. Orders with total amount greater than $20
SELECT * FROM orders WHERE total_amount > 20;

-- 10. All unique genres
SELECT DISTINCT genre FROM books;

-- 11. Book with the lowest stock
SELECT * FROM books ORDER BY stock ASC LIMIT 1;

-- 12. Total revenue
SELECT SUM(total_amount) AS total_revenue FROM orders;

-- ============================================
-- BONUS: Customer with the maximum quantity in one order
-- ============================================
SELECT c.name, c.country, o.quantity
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id
ORDER BY o.quantity DESC
LIMIT 1;
