-- create new database
create database swimming_school;

-- check current selected database
select DATABASE();

-- to switch database
use swimming_school; 

-- create table <table name>
-- <name of column> <data type> <options>
create table parents(
    parent_id int unsigned auto_increment primary key,
    first_name varchar(200) not null,
    last_name varchar(200) not null
) engine = innodb;
-- `engine = innodb` is for FK to work

-- note: < auto_increment > is for +1 
-- < not null > is to ensure field is compulsory, can also use < default "" >

-- show all tables
show tables; 

-- insert 
-- insert into <table name> (<column1> , <column2 > , ... ) values (value1, value2) 

insert into parents (first_name, last_name) values ('Ah Kow' , 'Tan');

-- show all rows from a table
select * from parents;

-- insert multiple rows at one go -- separate by comma, each set of () represents one row
insert into parents (first_name, last_name) values 
    ('Chu Kang', 'Phua') ,
    ('Ah Teck' , 'Tan') ,
    ('See Mei' , 'Liang');

-- creating students table - dont forget innodb for foreign key to work later
CREATE TABLE students (
    student_id INT UNSIGNED auto_increment primary key,
    name varchar(45) not null,
    swimming_level varchar(45),
    date_of_birth date
) ENGINE = innodb;

-- view table datatype to check primary key datatype ! must match when adding in foreign key
describe parents;

-- Add in a foreign key (FK) 
-- step one : create the column for foreign key first
ALTER TABLE students ADD COLUMN parent_id int unsigned;

-- step two : set up foreign key
-- constraint - to set rule in mysql for foreign keys -> just for sql benefit and debugging
-- adding to "students" table a new foreign key where the 'parent_id' in "parents" table 
-- will refer to the 'parent_id' that belongs to the "students" table 
alter table students add constraint fk_students_parents 
    foreign key (parent_id) references parents(parent_id);

-- insert in some students
insert into students (name, swimming_level, date_of_birth, parent_id)
    values ('Xiao Kow', 'beginner', '2010-09-10', 4);


-- update -> ! remember the WHERE at the back to specify student_id otherwise mysql will update all rows
-- no warning, no undo hor 
update students set swimming_level='intermediate' WHERE student_id=1;

-- delete 
delete from students WHERE student_id=1;

-- to rename a column name 
-- <name> is original name <first_name> is what we changing it to
alter table students rename column name to first_name; 

-- to rename a table
-- orig name <students> chg to <swimming_students> 
rename table students to swimming_students; 