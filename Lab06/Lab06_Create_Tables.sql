-- Create and populate the tables needed for Lab 6

-- Create the tables

CREATE TABLE customers (
  customer_id INTEGER
    CONSTRAINT customers_pk PRIMARY KEY,
  first_name VARCHAR2(10) NOT NULL,
  last_name VARCHAR2(10) NOT NULL,
  dob DATE,
  phone VARCHAR2(12)
);

CREATE TABLE product_types (
  product_type_id INTEGER
    CONSTRAINT product_types_pk PRIMARY KEY,
  name VARCHAR2(10) NOT NULL
);

CREATE TABLE products (
  product_id INTEGER
    CONSTRAINT products_pk PRIMARY KEY,
  product_type_id INTEGER
    CONSTRAINT products_fk_product_types
    REFERENCES product_types(product_type_id),
  name VARCHAR2(30) NOT NULL,
  description VARCHAR2(50),
  price NUMBER(5, 2)
);

CREATE TABLE order_status (
  order_status_id INTEGER
    CONSTRAINT default_example_pk PRIMARY KEY,
  status VARCHAR2(20) DEFAULT 'Order placed' NOT NULL,
  last_modified DATE DEFAULT SYSDATE
);

CREATE TABLE product_changes (
  product_id INTEGER
    CONSTRAINT prod_changes_pk PRIMARY KEY,
  product_type_id INTEGER
    CONSTRAINT prod_changes_fk_product_types
    REFERENCES product_types(product_type_id),
  name VARCHAR2(30) NOT NULL,
  description VARCHAR2(50),
  price NUMBER(5, 2)
);

-- insert sample data into customers table

INSERT INTO customers(
  customer_id, first_name, last_name, dob, phone
) VALUES (
  1, 'John', 'Brown', '01-JAN-1965', '800-555-1211'
);

INSERT INTO customers(
  customer_id, first_name, last_name, dob, phone
) VALUES (
  2, 'Cynthia', 'Green', '05-FEB-1968', '800-555-1212'
);

INSERT INTO customers(
  customer_id, first_name, last_name, dob, phone
) VALUES (
  3, 'Steve', 'White', '16-MAR-1971', '800-555-1213'
);

INSERT INTO customers(
  customer_id, first_name, last_name, dob, phone
) VALUES (
  4, 'Gail', 'Black', NULL, '800-555-1214'
);

INSERT INTO customers(
  customer_id, first_name, last_name, dob, phone
) VALUES (
  5, 'Doreen', 'Blue', '20-MAY-1970', NULL
);

INSERT INTO customers(
  customer_id, first_name, last_name, dob, phone
) VALUES (
  6, 'Stephanie', 'Jobs', '21-JUN-1980', NULL
);


-- commit the transaction

COMMIT;

-- insert sample data into product_types table

INSERT INTO product_types (
  product_type_id, name
) VALUES (
  1, 'Book'
);

INSERT INTO product_types (
  product_type_id, name
) VALUES (
  2, 'Video'
);

INSERT INTO product_types (
  product_type_id, name
) VALUES (
  3, 'DVD'
);

INSERT INTO product_types (
  product_type_id, name
) VALUES (
  4, 'CD'
);

INSERT INTO product_types (
  product_type_id, name
) VALUES (
  5, 'Magazine'
);

-- commit the transaction

COMMIT;

-- insert sample data into products table

INSERT INTO products (
  product_id, product_type_id, name, description, price
) VALUES (
  1, 1, 'Modern Science', 'A description of modern science', 19.95
);

INSERT INTO products (
  product_id, product_type_id, name, description, price
) VALUES (
  2, 1, 'Chemistry', 'Introduction to Chemistry', 30.00
);

INSERT INTO products (
  product_id, product_type_id, name, description, price
) VALUES (
  3, 2, 'Supernova', 'A star explodes', 25.99
);

INSERT INTO products (
  product_id, product_type_id, name, description, price
) VALUES (
  4, 2, 'Tank War', 'Action movie about a future war', 13.95
);

INSERT INTO products (
  product_id, product_type_id, name, description, price
) VALUES (
  5, 2, 'Z Files', 'Series on mysterious activities', 49.99
);

INSERT INTO products (
  product_id, product_type_id, name, description, price
) VALUES (
  6, 2, '2412: The Return', 'Aliens return', 14.95
);

INSERT INTO products (
  product_id, product_type_id, name, description, price
)
VALUES (
  7, 3, 'Space Force 9', 'Adventures of heroes', 13.49
);

INSERT INTO products (
  product_id, product_type_id, name, description, price
) VALUES (
  8, 3, 'From Another Planet', 'Alien from another planet lands on Earth', 12.99
);

INSERT INTO products (
  product_id, product_type_id, name, description, price
) VALUES (
  9, 4, 'Classical Music', 'The best classical music', 10.99
);

INSERT INTO products (
  product_id, product_type_id, name, description, price
) VALUES (
  10, 4, 'Pop 3', 'The best popular music', 15.99
);

INSERT INTO products (
  product_id, product_type_id, name, description, price
) VALUES (
  11, 4, 'Creative Yell', 'Debut album', 14.99
);

INSERT INTO products (
  product_id, product_type_id, name, description, price
) VALUES (
  12, NULL, 'My Front Line', 'Their greatest hits', 13.49
);

-- commit the transaction
COMMIT;

-- insert sample data into order_status table

INSERT INTO order_status (
  order_status_id
) VALUES (
  1
);

INSERT INTO order_status (
  order_status_id, status, last_modified
) VALUES (
  2, 'Order shipped', '10-JUN-2004'
);

-- commit the transaction
COMMIT;

-- insert sample data into product_changes table

INSERT INTO product_changes (
  product_id, product_type_id, name, description, price
) VALUES (
  1, 1, 'Modern Science', 'A description of modern science', 40.00
);

INSERT INTO product_changes (
  product_id, product_type_id, name, description, price
) VALUES (
  2, 1, 'New Chemistry', 'Introduction to Chemistry', 35.00
);

INSERT INTO product_changes (
  product_id, product_type_id, name, description, price
) VALUES (
  3, 1, 'Supernova', 'A star explodes', 25.99
);

INSERT INTO product_changes (
  product_id, product_type_id, name, description, price
) VALUES (
  13, 2, 'Lunar Landing', 'Documentary', 15.99
);

INSERT INTO product_changes (
  product_id, product_type_id, name, description, price
) VALUES (
  14, 2, 'Submarine', 'Documentary', 15.99
);

INSERT INTO product_changes (
  product_id, product_type_id, name, description, price
) VALUES (
  15, 2, 'Airplane', 'Documentary', 15.99
);

-- commit the transaction
COMMIT;

