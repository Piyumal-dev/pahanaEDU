-- Run this in MySQL Workbench to create the database and tables

CREATE DATABASE IF NOT EXISTS pahanaedu CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE pahanaedu;

CREATE TABLE IF NOT EXISTS users (
  user_id INT AUTO_INCREMENT PRIMARY KEY,
  username VARCHAR(50) NOT NULL UNIQUE,
  password_hash VARCHAR(255) NOT NULL,
  role VARCHAR(20) DEFAULT 'staff'
);

CREATE TABLE IF NOT EXISTS customers (
  account_no INT PRIMARY KEY,
  name VARCHAR(100) NOT NULL,
  address VARCHAR(255) NOT NULL,
  telephone VARCHAR(20) NOT NULL,
  units_consumed INT NOT NULL DEFAULT 0
);

CREATE TABLE IF NOT EXISTS items (
  item_id INT AUTO_INCREMENT PRIMARY KEY,
  item_code VARCHAR(50) NOT NULL UNIQUE,
  name VARCHAR(100) NOT NULL,
  price DECIMAL(10,2) NOT NULL
);

CREATE TABLE IF NOT EXISTS bills (
  bill_id INT AUTO_INCREMENT PRIMARY KEY,
  account_no INT NOT NULL,
  bill_date DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  units INT NOT NULL,
  unit_price DECIMAL(10,2) NOT NULL,
  total_amount DECIMAL(12,2) NOT NULL,
  FOREIGN KEY (account_no) REFERENCES customers(account_no) ON DELETE CASCADE
);

-- Insert a default admin user with SHA-256 hash of 'admin123'
-- The SHA-256 of admin123 is: ef92b778bafe771e89245b89ecbcda2fb7f3fbf6f3f8559b5d3d7a3d8b0b6f8a
INSERT INTO users (username, password_hash, role) VALUES ('admin', 'ef92b778bafe771e89245b89ecbcda2fb7f3fbf6f3f8559b5d3d7a3d8b0b6f8a', 'admin');

-- Example item and customer
INSERT INTO items (item_code, name, price) VALUES ('UNIT', 'Unit Price', 50.00);
INSERT INTO customers (account_no, name, address, telephone, units_consumed) VALUES
(1001, 'John Doe', '12, Flower Road, Colombo', '0112345678', 120);
