CREATE DATABASE tgc16_hr;
USE tgc16_hr;

CREATE TABLE employees(
    employee_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    surname VARCHAR(100) NOT NULL,
    given_name VARCHAR(100) NOT NULL,
    date_of_employment DATETIME NOT NULL
) ENGINE = innodb;

CREATE TABLE employee_supervisor (
    employee_supervisor_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY
) ENGINE = innodb;

CREATE TABLE reviews (
    review_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY
) ENGINE = innodb;

CREATE TABLE employee_taskforce (
    employee_taskforce_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    role VARCHAR(100) NOT NULL
) ENGINE = innodb;

CREATE TABLE taskforces (
    taskforce_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL
) ENGINE = innodb;

CREATE TABLE departments (
    department_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL
) ENGINE = innodb;

CREATE TABLE addresses (
    address_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    blk_number VARCHAR(100) NOT NULL,
    street VARCHAR(100) NOT NULL,
    unit_code VARCHAR(100),
    postal_code VARCHAR(100) NOT NULL
) ENGINE = innodb;

/* Add foreign keys to employees table */
ALTER TABLE employees ADD COLUMN supervisor_id INT UNSIGNED;
ALTER TABLE employees ADD CONSTRAINT fk_supervisor_id
    FOREIGN KEY (supervisor_id) REFERENCES employees(employee_id);

ALTER TABLE employees ADD COLUMN department_id INT UNSIGNED;
ALTER TABLE employees ADD CONSTRAINT fk_department_id
    FOREIGN KEY (department_id) REFERENCES departments(department_id);

/* Add foreign keys to employee_supervisor table */
ALTER TABLE employee_supervisor ADD COLUMN supervisor_id INT UNSIGNED;
ALTER TABLE employee_supervisor ADD CONSTRAINT fk_employee_supervisor_supervisor_id
    FOREIGN KEY (supervisor_id) REFERENCES employees(employee_id);

ALTER TABLE employee_supervisor ADD COLUMN employee_id INT UNSIGNED;
ALTER TABLE employee_supervisor ADD CONSTRAINT fk_employee_supervisor_employee_id
    FOREIGN KEY (employee_id) REFERENCES employees(employee_id);

/* Add foreign keys to reviews table */
ALTER TABLE reviews ADD COLUMN supervisor_id INT UNSIGNED;
ALTER TABLE reviews ADD CONSTRAINT fk_reviews_supervisor_id
    FOREIGN KEY (supervisor_id) REFERENCES employees(employee_id);

ALTER TABLE reviews ADD COLUMN employee_id INT UNSIGNED;
ALTER TABLE reviews ADD CONSTRAINT fk_reviews_employee_id
    FOREIGN KEY (employee_id) REFERENCES employees(employee_id);

/* Add foreign keys to employee_taskforce table */
ALTER TABLE employee_taskforce ADD COLUMN employee_id INT UNSIGNED;
ALTER TABLE employee_taskforce ADD CONSTRAINT fk_employee_taskforce_employee_id
    FOREIGN KEY (employee_id) REFERENCES employees(employee_id);

ALTER TABLE employee_taskforce ADD COLUMN taskforce_id INT UNSIGNED;
ALTER TABLE employee_taskforce ADD CONSTRAINT fk_employee_taskforce_taskforce_id
    FOREIGN KEY (taskforce_id) REFERENCES taskforces(taskforce_id);

/* Add foreign keys to addresses table */
ALTER TABLE addresses ADD COLUMN employee_id INT UNSIGNED;
ALTER TABLE addresses ADD CONSTRAINT fk_addresses_employee_id
    FOREIGN KEY (employee_id) REFERENCES employees(employee_id);

INSERT INTO departments (name) VALUES 
    ("Group Technology"),
    ("Marketing"),
    ("Office Admin");

INSERT INTO taskforces (name) VALUES 
    ("Fire Drill"),
    ("Welfare");

INSERT INTO employees (surname, given_name, date_of_employment, department_id) VALUES 
    ("Xavier", "Chan", "2010-09-10", 1),
    ("Mary", "Lim", "2020-01-23", 2),
    ("Sorelle", "Ang", "2009-05-07", 3);

INSERT INTO employees (surname, given_name, date_of_employment, supervisor_id, department_id) VALUES 
    ("Jean", "See", "2017-07-08", 1, 1),
    ("Karen", "Tan", "2019-06-13", 2, 2),
    ("Arif", "bin Othman", "2010-10-07", 3, 3);

INSERT INTO addresses (blk_number, street, unit_code, postal_code, employee_id) VALUES 
    ("Blk 18", "Some street", "#07-40", "123456", 1),
    ("Blk 408", "Jln Pengsan", "#02-140", "1234367", 2),
    ("Blk 2", "Anchor Road", "#10-123", "101567", 3),
    ("Blk 533", "Far Away Ave", "#05-10", "123467", 4),
    ("Blk 76", "Under the Sea", "#05-181", "123527", 5),
    ("Blk 56", "On the Hill", "#11-109", "124567", 6);

