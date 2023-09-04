CREATE DATABASE customer_order;
CREATE USER customer_order WITH PASSWORD 'testing';
GRANT ALL PRIVILEGES ON DATABASE customer_order to customer_order;
\c customer_order

CREATE TABLE manufacturers (
  manufacturer_id INTEGER NOT NULL,
  name            VARCHAR(128) NOT NULL,
  street_address  VARCHAR(256) NOT NULL,
  city            VARCHAR(64) NOT NULL,
  state           VARCHAR(32) NOT NULL,
  zip             VARCHAR(16) NOT NULL,
  phone           VARCHAR(16) NOT NULL,
  PRIMARY KEY     ( manufacturer_id )
);

CREATE TABLE customers (
  customer_id     INTEGER NOT NULL,
  firstName	      VARCHAR(50) NOT NULL,
  lastName     	  VARCHAR(50) NOT NULL,
  address 	      VARCHAR(256) NOT NULL,
  city            VARCHAR(64) NOT NULL,
  state           VARCHAR(32) NOT NULL,
  zip             VARCHAR(16) NOT NULL,
  email 		  VARCHAR(100) NOT NULL,
  phone           VARCHAR(16) NOT NULL,
  PRIMARY KEY     ( customer_id )
);

CREATE TABLE items (
  item_id         INTEGER NOT NULL,
  name            VARCHAR(128) NOT NULL,
  description     TEXT NOT NULL,
  manufacturer_id INTEGER NOT NULL,
  PRIMARY KEY ( item_id ),
  CONSTRAINT fk_manufacturer FOREIGN KEY (manufacturer_id) REFERENCES manufacturers(manufacturer_id)
);

CREATE TABLE orders (
  order_id        INTEGER NOT NULL,
  item_id         INTEGER NOT NULL,
  customer_id     INTEGER NOT NULL,
  quantity        INTEGER NOT NULL,
  PRIMARY KEY ( order_id, customer_id, item_id ),
  CONSTRAINT fk_part FOREIGN KEY (item_id) REFERENCES items(item_id), 
  CONSTRAINT fk_customer FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

GRANT ALL PRIVILEGES ON manufacturers, customers, items, orders TO customer_order;


INSERT INTO Customers VALUES (1, 'Parth', 'Barot', '413 Oaktree Rd', 'edison', 'NJ' , '08820','pbarot@gmail.com', '353-424-8967');
INSERT INTO Customers VALUES (2, 'Jose', 'Diego', '24 Free Ave', 'West Windsor' , 'NJ' , '08850' , 'jdiego@gmail.com', '423-978-2689');
INSERT INTO Customers VALUES (3, 'Varun', 'Patel', '474 Mechanic Dr', 'New Brunswick' , 'NJ' , '08901' ,  'vpatel@gmail.com', '484-631-2336');


INSERT INTO manufacturers VALUES (1, 'Kohler', '160 NJ-17 N', 'Paramus', 'NJ', '07652', '201-322-5000');
INSERT INTO manufacturers VALUES (2, 'Badtime Auto', '321 Legit Drive', 'Newark', 'NJ', '07101', '732-555-5555');
INSERT INTO manufacturers VALUES (3, 'Soft paper', '1 Philodendron Way', 'Cranford', 'NJ', '07016', '1234567890');

INSERT INTO items VALUES (1, 'Toilet Seat', 'White,Stonewood, round-front', 1);
INSERT INTO items VALUES (2, 'Tires', 'Rubber things for going', 2);
INSERT INTO items VALUES (3, 'Paper Towels', 'White, 8 Family Rolls, Quick-size', 3);

INSERT INTO orders VALUES (1, 1, 2, 5);
INSERT INTO orders VALUES (1, 2, 2, 20);
INSERT INTO orders VALUES (3, 2, 1, 4);
INSERT INTO orders VALUES (1, 1, 2, 2);
INSERT INTO orders VALUES (1, 2, 2, 2);
INSERT INTO orders VALUES (2, 1, 3, 40);