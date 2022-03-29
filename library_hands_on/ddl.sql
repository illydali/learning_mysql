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

insert into reservations (member_id) 
    values (1);

-- create editions 
create table editions (
    edition_id int unsigned auto_increment primary key,
    isbn varchar(13) not null 
) engine = innodb;

-- add in foreign keys for editions table : publisher_id / book_id
alter table editions add column publisher_id smallint unsigned, add column book_id int unsigned; -- add two foreign keys
alter table editions add constraint fk_edition_publisher 
    foreign key (publisher_id) references publishers(publisher_id);

alter table editions add constraint fk_edition_book 
    foreign key (book_id) references books(book_id);

insert into editions (isbn, publisher_id, book_id) values
    ('9780395647387', 1, 1),
    ('9780395647295' , 2, 2); 

-- create copies table 
create table copies (
    copy_id int unsigned auto_increment primary key,
    quality int unsigned not null 
) engine = innodb;

-- add in foreign keys for copies table : book_id / reservation_id
alter table copies add column book_id int unsigned, add column reservation_id int unsigned;
alter table copies add constraint fk_copies_books 
    foreign key(book_id) references books(book_id);

alter table copies add constraint fk_copies_res 
    foreign key(reservation_id) references reservations(reservation_id); 

insert into copies (book_id, quality, reservation_id) values
    (1, 2, 1);

-- create loans
create table loans (
    loan_id int unsigned auto_increment primary key,
    date_due date not null,
    date_returned date not null
) engine = innodb;   

alter table loans add column copy_id int unsigned, add column member_id mediumint unsigned;

alter table loans add constraint fk_loan_copy 
    foreign key(copy_id) references copies(copy_id);

alter table loans add constraint fk_loan_member 
    foreign key(member_id) references members(member_id);

insert into loans (date_due, date_returned, copy_id, member_id) values 
    ('2022-01-02', '2022-02-01', 1, 1);

-- create writingcredits 
create table writingCredits (
    writing_credit_id int unsigned auto_increment primary key
) engine = innodb;   

alter table writingCredits  add column author_id int unsigned, 
                            add column book_id int unsigned;

alter table writingCredits add constraint fk_wcredits_author 
    foreign key(author_id) references authors(author_id);

alter table writingCredits add constraint fk_wcredits_book
    foreign key(book_id) references books(book_id);

insert into writingCredits (author_id, book_id) values 
    (1,1);