create table customer(
    customer_id int unsigned auto_increment primary key,
    name varchar(100),
    address varchar(200),
    country varchar(50),
    email varchar(100) NOT NULL,
    phone varchar(20),
    status varchar(20)
);

create table orders(
    order_no int unsigned primary key,
    order_date date,
    delivery_date date,
    delivery_address varchar(200),
    shipmode varchar(25),
    status varchar(20),
    customer_customer_id int unsigned,
    CONSTRAINT fk_orders_customer FOREIGN KEY (customer_customer_id) REFERENCES customer(customer_id)
) engine = innodb;


create table product (
    product_id int unsigned primary key,
    description varchar(50),
    unit_price float unsigned,
    stock float,
    uom varchar(5),
    status varchar(20)
)


create table order_item(
    item_no int unsigned auto_increment primary key,
    order_order_no int unsigned,
    product_product_id int unsigned,
    quantity float,
    status varchar(10),
    CONSTRAINT fk_order_item_orders FOREIGN KEY (order_order_no) REFERENCES orders(order_no),
    CONSTRAINT fk_order_item_product FOREIGN KEY (product_product_id) REFERENCES PRODUCT(product_id)
);



create table invoice (
    invoice_no int unsigned primary key,
    invoice_date date,
    payment_terms varchar(300),
    tax float,
    status varchar(20),
    order_order_no int unsigned,
    CONSTRAINT fk_invoice_orders FOREIGN KEY (order_order_no) REFERENCES orders(order_no)
) engine = innodb
;

create table invoice_item(
    invoice_item_id int unsigned auto_increment primary key ,
    item_no int unsigned,
    invoice_invoice_no int unsigned,
    product_product_id int unsigned,
    quantity float,
    status varchar (20),
    CONSTRAINT fk_invoice_item_invoice FOREIGN KEY(invoice_invoice_no) REFERENCES invoice(invoice_no),
    CONSTRAINT fK_invoice_item_product FOREIGN KEY(product_product_id) REFERENCES product(product_id)
) engine = innodb;

insert into customer (name, address, country, email, phone, status) values ('Tan ah kow','Singapore 555333 Blk 411 #8-88', 'Singapore','SingapureAhkow@singmail.com','91141113','Premium');
insert into orders (order_date, delivery_date, delivery_address, shipmode, status, customer_customer_id, order_no) values ('2021-01-03','2021-03-04','Singapure 55333 #04-44','Air freight','Quick',1,1);
insert into product (product_id,description, unit_price, stock, uom, status) values (1,'Best product', 1.33,5.5, 'aaa11','Quick mode ');
insert into order_item (item_no,order_order_no, product_product_id, quantity,status) values (1,1,1,43,'shipping');
insert into invoice  (invoice_no, invoice_date, payment_terms, tax, status, order_order_no) values (1, '2022-02-02', 'mastercard',1.5,'Shipping-q1', 1);
insert into invoice_item (item_no, invoice_invoice_no, product_product_id, quantity, status) values (1,1,1,44,'ship-sg');
