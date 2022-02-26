CREATE TABLE customers (
id SERIAL PRIMARY KEY,
email VARCHAR(50) NOT NULL,
first_name VARCHAR(50) NOT NULL,
last_name VARCHAR(50) NOT NULL,
sex ENUM("M", "F", "O") NOT NULL,
address VARCHAR(100) NULL,
date_of_birth DATE NULL,
mob_phone VARCHAR(14) NULL
);
 
CREATE TABLE items (
id SERIAL PRIMARY KEY,
name VARCHAR(100) NOT NULL,
status ENUM('available', 'unavailable', 'paused') DEFAULT ‘available’ NOT NULL,
price_in_cents INTEGER NOT NULL,
measure INTEGER NOT NULL,
stock INTEGER NOT NULL,
seller_id INTEGER NOT NULL REFERENCES customer (id),
created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
 
CREATE TABLE categories (
id SERIAL PRIMARY KEY,
name VARCHAR(50) NOT NULL
);
 
CREATE TABLE items_categories (
 id SERIAL PRIMARY KEY,
 item_id INTEGER NOT NULL UNIQUE,
 customer_id INTEGER NOT NULL UNIQUE,
 FOREIGN KEY (item_id) REFERENCES items (id),
 FOREIGN KEY (customer_id) REFERENCES categories (id)