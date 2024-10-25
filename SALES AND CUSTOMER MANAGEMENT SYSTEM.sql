CREATE DATABASE sales_management;
USE sales_management;

CREATE TABLE customers (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(100),
    phone VARCHAR(15),
    address VARCHAR(255)
);

INSERT INTO customers (customer_id, first_name, last_name, email, phone, address)
VALUES 
    (1, 'John', 'Doe', 'john.doe@gmail.com', '999-858-4142', '123 Main St, Springfield, IL'),
    (2, 'Jane', 'Smith', 'jsmith@gmail.com', '210-875-3469', '456 Oak St, Columbus, OH'),
    (3, 'Bob', 'Brown', 'bob.b@gmail.com', '431-743-0486', '789 Pine St, Albany, NY'),
    (4, 'Alice', 'Johnson', 'ali.johnson2@gmail.com', '403-876-4036', '101 Maple Ave, Denver, CO'),
    (5, 'Charlie', 'Davis', 'charlie.davis98@gmail.com', '864-179-1097', '1202 Elm St, Austin, TX');

CREATE TABLE products (
    product_id INT AUTO_INCREMENT PRIMARY KEY,
    product_name VARCHAR(100),
    category VARCHAR(50),
    price DECIMAL(10, 2),
    stock_quantity INT
);

CREATE TABLE orders (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    order_date DATE,
    customer_id INT,
    total_amount DECIMAL(10, 2),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

CREATE TABLE order_details (
    order_id INT,
    product_id INT,
    quantity INT,
    unit_price DECIMAL(10, 2),
    total_price DECIMAL(10, 2),
    PRIMARY KEY (order_id, product_id),
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

CREATE TABLE payments (
    payment_id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT,
    payment_method VARCHAR(50),
    payment_date DATE,
    amount DECIMAL(10, 2),
    FOREIGN KEY (order_id) REFERENCES orders(order_id)
);

CREATE TABLE shipping (
    shipping_id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT,
    shipping_date DATE,
    shipping_address VARCHAR(255),
    status VARCHAR(50),
    FOREIGN KEY (order_id) REFERENCES orders(order_id)
);

INSERT INTO products (product_id, product_name, category, price, stock_quantity)
VALUES 
    (101, 'Laptop', 'Electronics', 799.99, 50),
    (102, 'Wireless Mouse', 'Electronics', 19.99, 200),
    (103, 'Coffee Maker', 'Appliances', 49.99, 30),
    (104, 'Office Chair', 'Furniture', 89.99, 25),
    (105, 'Bluetooth Speaker', 'Electronics', 29.99, 100);
	
INSERT INTO orders (order_id, order_date, customer_id, total_amount)
VALUES 
    (1001, '2024-10-01', 1, 869.97),
    (1002, '2024-10-03', 2, 49.99),
    (1003, '2024-10-05', 3, 109.98),
    (1004, '2024-10-06', 4, 19.99),
    (1005, '2024-10-07', 5, 119.98);
    
INSERT INTO order_details (order_id, product_id, quantity, unit_price, total_price)
VALUES
	(1001, 101, 1, 799.99, 799.99),
    (1001, 102, 2, 19.99, 39.98),
    (1002, 103, 1, 49.99, 49.99),
    (1003, 104, 1, 89.99, 89.99),
    (1003, 105, 1, 19.99, 19.99),
    (1004, 102, 1, 19.99, 19.99),
    (1005, 104, 1, 89.99, 89.99),
    (1005, 103, 1, 29.99, 29.99);
    
INSERT INTO	 payments (payment_id, order_id, payment_date, amount, payment_method)
VALUE
	(5001, 1001, '2024-10-01', 869.97, 'Credit Card'),
    (5002, 1002, '2024-10-03', 49.99, 'PayPal'),
    (5003, 1003, '2024-10-05', 109.98, 'Credit Card'),
    (5004, 1004, '2024-10-06', 19.99, 'PayPal'),
    (5005, 1005, '2024-10-07', 119.98, 'Bank Transfer');
    
INSERT INTO shipping (shipping_id, order_id, shipping_date, shipping_address, status)
VALUES
	(7001, 1001, '2024-10-02', '123 Main St, Springfield, IL', 'Shipped'),
    (7002, 1002, '2024-10-04', '456 Oak St, Columbus, OH', 'Shipped'),
    (7003, 1003, '2024-10-06', '789 Pine St, Albany, NY', 'Processing'),
    (7004, 1004, '2024-10-07', '101 Maple Ave, Denver, CO', 'Delivered'),
    (7005, 1005, '2024-10-08', '202 Elm St, Austin, TX', 'Shipped');
    
SELECT c.first_name, c.last_name, o.order_id, o.order_date, o.total_amount
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id;

SELECT p.product_name, SUM(od.quantity) AS total_sold
FROM order_details od
JOIN products p ON od.product_id = p.product_id
GROUP BY p.product_id
ORDER BY total_sold DESC;

SELECT DATE_FORMAT(order_date, '%Y=%m') AS MONTH, SUM(total_amount) AS total_sales
FROM orders
GROUP BY month;

START TRANSACTION;

UPDATE products SET stock_quantity = stock_quantity -2 WHERE product_id = 1;

INSERT INTO payments (order_id, payment_method, payment_date, amount)
VALUES (1001, 'Credit Card', '2024-10-25', 83.97);

COMMIT;

DELIMITER //

CREATE TRIGGER update_shipping_status
AFTER INSERT ON shipping
FOR EACH ROW
BEGIN
	UPDATE orders 
	SET shipping_status = 'Shipped' 
	WHERE order_id = NEW.order_id;
END //

DELIMITER ;

CREATE INDEX idx_order_date ON orders(order_date);

CREATE INDEX idx_customer_id 
ON customers (customer_id);

CREATE INDEX idx_product_id
ON products (product_id);