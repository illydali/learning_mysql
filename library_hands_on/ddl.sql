-- create book table
create table books(
    book_id int unsigned auto_increment primary key,
    title varchar(200) not null
) engine = innodb;

-- insert
insert into books (title) values ('Lord of The Rings');

-- show all rows
select * from books;

-- insert multiple
insert into books (title) values 
    ('Pride and Prejudice'), 
    ('The Little Prince');

-- create author table
create table authors (
    author_id int unsigned auto_increment primary key,
    first_name varchar(30) not null,
    last_name varchar(30) not null,
    date_of_birth date
) engine = innodb;

-- insert author
insert into authors (first_name, last_name, date_of_birth) values
    ('JK' , 'Rowling', '1975-09-04'),
    ('Gary', 'Barlow', '1965-03-12');

-- create publishers table 
create table publishers (
    publisher_id smallint unsigned auto_increment primary key,
    name varchar(100) not null,
    address varchar(255) not null,
    contact_email varchar(50) not null
) engine = innodb;

-- insert into publisher
insert into publishers (name, address, contact_email) values
    ('Penguin', '123 Oxley St, San Bernando, CA, 10232', 'sarah_lee@penguin.com'),
    ('StarBooks', '89A, Brickland Rd, Phoenix, AZ, 12832', 'jim_malley@starbooks.com');

-- create members table 
create table members (
    member_id mediumint unsigned auto_increment primary key,
    first_name varchar(30) not null,
    last_name varchar(30) not null,
    address varchar(255) not null
) engine = innodb; 

-- insert members info
insert into members (first_name, last_name, address) values 
    ('Cassie', 'Tan', '20, Amber Road, S(291022)'),
    ('Anthony G.', 'Smith', '122, Ang Mo Kio St 12, S(12123)' );


-- create reservations table
create table reservations (
    reservation_id int unsigned auto_increment primary key
) engine = innodb;

-- step one
alter table reservations add column member_id mediumint unsigned; 

-- step two 
alter table reservations add constraint fk_res_member 
    foreign key (member_id) references members(member_id); 