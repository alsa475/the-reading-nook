-- Dana Yarges
-- Amy Lucas
-- CS340
-- Project Step 4: This file contains the Data Definition Queries for the database.

-- Data Definition - Create Entity Tables
DROP TABLE IF EXISTS `Customers`;

CREATE TABLE `Customers` (
`customer_id` int(11) UNIQUE NOT NULL AUTO_INCREMENT,
`first_name` varchar(255) NOT NULL,
`last_name` varchar(255) NOT NULL,
`email` varchar(255),
`street_address` varchar(255),
`city` varchar(255),
`state` varchar(255),
`zip_code` varchar(255),
PRIMARY KEY (`customer_id`)
) ENGINE=InnoDB;


DROP TABLE IF EXISTS `Books`;

CREATE TABLE `Books` (
`book_id` int(11) UNIQUE NOT NULL AUTO_INCREMENT,
`title` varchar(255) NOT NULL,
`author` varchar(255) NOT NULL,
`genre` varchar(255),
`price` decimal(6,2) UNSIGNED NOT NULL,
`quantity_in_stock` int(11) UNSIGNED NOT NULL,
PRIMARY KEY (`book_id`)
) ENGINE=InnoDB;


DROP TABLE IF EXISTS `Employees`;

CREATE TABLE `Employees` (
`employee_id` int(11) UNIQUE NOT NULL AUTO_INCREMENT,
`first_name` varchar(255) NOT NULL,
`last_name` varchar(255) NOT NULL,
PRIMARY KEY (`employee_id`)
) ENGINE=InnoDB;


DROP TABLE IF EXISTS `Orders`;

CREATE TABLE `Orders` (
`order_number` int(11) UNIQUE NOT NULL AUTO_INCREMENT,
`customer_id` int(11) NOT NULL,
`employee_id` int(11),
`order_date` date,
`order_complete` boolean NOT NULL,
`to_be_shipped` boolean NOT NULL,
FOREIGN KEY (customer_id) REFERENCES Customers(customer_id),
FOREIGN KEY (employee_id) REFERENCES Employees(employee_id),
PRIMARY KEY (`order_number`)
) ENGINE=InnoDB;


DROP TABLE IF EXISTS `Order_items`;

CREATE TABLE `Order_items` (
`order_number` int(11) NOT NULL,
`book_id` int(11) NOT NULL,
`quantity` int(11) UNSIGNED NOT NULL,
`order_item_complete` boolean NOT NULL,
FOREIGN KEY (order_number) REFERENCES Orders(order_number),
FOREIGN KEY (book_id) REFERENCES Books(book_id),
PRIMARY KEY (order_number, book_id)
) ENGINE=InnoDB;
