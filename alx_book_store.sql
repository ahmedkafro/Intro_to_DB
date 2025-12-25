-- CREATE DATABASE
CREATE DATABASE IF NOT EXISTS alx_book_store;
USE alx_book_store;

-- AUTHORS TABLE
CREATE TABLE authors (
	    author_id INT AUTO_INCREMENT PRIMARY KEY,
	    author_name VARCHAR(215) NOT NULL
);

-- BOOKS TABLE
CREATE TABLE books (
	    book_id INT AUTO_INCREMENT PRIMARY KEY,
	    title VARCHAR(130) NOT NULL,
	    author_id INT NOT NULL,
	    price DOUBLE NOT NULL,
	    publication_date DATE,
	    CONSTRAINT fk_books_author
	        FOREIGN KEY (author_id)
		        REFERENCES authors(author_id)
			        ON UPDATE CASCADE
				        ON DELETE RESTRICT
				);

				-- CUSTOMERS TABLE
				CREATE TABLE customers (
					    customer_id INT AUTO_INCREMENT PRIMARY KEY,
					    customer_name VARCHAR(215) NOT NULL,
					    email VARCHAR(215) NOT NULL,
					    address TEXT
				);

				-- ORDERS TABLE
				CREATE TABLE orders (
					    order_id INT AUTO_INCREMENT PRIMARY KEY,
					    customer_id INT NOT NULL,
					    order_date DATE,
					    CONSTRAINT fk_orders_customer
					        FOREIGN KEY (customer_id)
						        REFERENCES customers(customer_id)
							        ON UPDATE CASCADE
								        ON DELETE CASCADE
								);

								-- ORDER DETAILS TABLE
								CREATE TABLE order_details (
									    orderdetailid INT AUTO_INCREMENT PRIMARY KEY,
									    order_id INT NOT NULL,
									    book_id INT NOT NULL,
									    quantity DOUBLE NOT NULL,
									    CONSTRAINT fk_orderdetails_order
									        FOREIGN KEY (order_id)
										        REFERENCES orders(order_id)
											        ON UPDATE CASCADE
												        ON DELETE CASCADE,
													    CONSTRAINT fk_orderdetails_book
													        FOREIGN KEY (book_id)
														        REFERENCES books(book_id)
															        ON UPDATE CASCADE
																        ON DELETE RESTRICT
																);

