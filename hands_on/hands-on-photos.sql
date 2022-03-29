-- create photo table
create table photo (
    photo_id int unsigned auto_increment primary key,
    title varchar(120) not null,
    descripton varchar(255) not null,
    privacy varchar(20) not null,
    upload_date date not null,
    view int(10) unsigned not null
) engine = innodb;

-- create member table
create table member (
    member_id int unsigned auto_increment primary key,
    member_name varchar(255) not null,
    phone_number varchar(20) not null,
    email varchar(200) not null,
    member_address varchar(255) not null
) engine = innodb;

-- create location table
create table location (
    location_id int unsigned auto_increment primary key,
    location_name varchar(200) not null,
    short_name varchar(50) not null
) engine = innodb;

-- create comment table
create table comment (
    comment_id int unsigned auto_increment primary key,
    post_date date not null,
    content varchar(255) not null
) engine = innodb;

-- create album table
create table album (
    album_id int unsigned auto_increment primary key,
    title varchar(120) not null,
    album_description varchar(255) not null,
    view int(10) unsigned not null
) engine = innodb;

-- create tag table
create table tag (
    tag_id int unsigned auto_increment primary key,
    title varchar(120) not null
) engine = innodb;

-- create photoTag table
create table photoTag (
    photoTag_id int unsigned auto_increment primary key
) engine = innodb;

-- add in foreign key to photoTag table (for many to many relationship)
alter table photoTag add column photo_id int unsigned;

alter table photoTag add constraint fk_photoTag_photo
    foreign key (photo_id) references photo(photo_id);

alter table photoTag add column tag_id int unsigned;

alter table photoTag add constraint fk_photoTag_tag
    foreign key (tag_id) references tag(tag_id);

-- insert new photo
insert into photo (title, descripton, privacy, upload_date, view) values ("sunset", "blur blur", "unknown", "2022-03-29", 1);

-- add foreign key in location table
alter table location add column photo_id int unsigned;

alter table location add constraint fk_location_photo
    foreign key (photo_id) references photo(photo_id);

-- insert new location
insert into location (location_name, short_name, photo_id) values ("choa chu kang", "cck", 1);
select * from location
