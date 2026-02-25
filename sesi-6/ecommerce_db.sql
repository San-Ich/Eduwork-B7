CREATE DATABASE ecommerce_db;
USE ecommerce_db;

#tabel product
CREATE TABLE products (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nama_produk VARCHAR(150) NOT NULL,
    harga DECIMAL(12,2) NOT NULL,
    deskripsi TEXT,
    stok INT NOT NULL DEFAULT 0,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

#tabel user
CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nama VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

#tabel orders
CREATE TABLE orders (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    product_id INT NOT NULL,
    quantity INT NOT NULL,
    total DECIMAL(12,2) NOT NULL,
    order_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE,
    FOREIGN KEY (product_id) REFERENCES products(id) ON DELETE CASCADE
);

#query create
INSERT INTO products (nama_produk, harga, deskripsi, stok)
VALUES 
('Laptop Asus ROG', 15000000, 'Laptop gaming performa tinggi', 10),
('Sepatu New Balance', 800000, 'Sepatu sporty dan nyaman', 20);

#query read
SELECT * FROM products;

#query update
UPDATE products
SET harga = 14000000,
    stok = 8
WHERE id = 1;

#query delete
DELETE FROM products
WHERE id = 2;