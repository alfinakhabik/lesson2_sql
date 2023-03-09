DROP DATABASE IF EXISTS `skillbox`;
CREATE DATABASE `skillbox`;
USE `skillbox`;
SHOW TABLES;

DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
id_user int primary key not null auto_increment unique,
login char(30) unique not null,
us_password char(60)not null);

DROP TABLE IF EXISTS `profile`;
CREATE TABLE `profile` (
id_profile int primary key not null auto_increment unique,
name char(60),
surname char(120),
phone int unique,
credit_card int unique,
birthday date,
user_id int  unique not null,
FOREIGN KEY (user_id) REFERENCES `user` (id_user));


DROP TABLE IF EXISTS `teachers`;
CREATE TABLE `teachers` (
id_teachers int primary key not null auto_increment unique,
name char(60),
surname char(60),
position_id int unique not null,
birthday date);

DROP TABLE IF EXISTS `media`;
CREATE TABLE `media` (
id_media int primary key not null auto_increment unique,
name char(60),
url text,
category_id int unique not null,
user_id int not null,
teach_id int not null,
FOREIGN KEY (user_id) REFERENCES `user` (id_user),
foreign key (teach_id) references `teachers` (id_teachers));

DROP TABLE IF EXISTS `category`;
CREATE TABLE `category` (
id_cat int primary key not null auto_increment unique,
name char(60),
FOREIGN KEY (id_cat) REFERENCES `media` (category_id));

DROP TABLE IF EXISTS `position`;
CREATE TABLE `position` (
id_position int primary key not null auto_increment unique,
name char(60),
FOREIGN KEY (id_position) REFERENCES `teachers` (position_id));


DROP TABLE IF EXISTS `courses`;
CREATE TABLE `courses` (
id_courses int primary key not null auto_increment unique,
id_director int not null,
price FLOAT,
name char(60));

DROP TABLE IF EXISTS `cours_teach`;
CREATE TABLE `cours_teach` (
id int primary key not null auto_increment unique,
teach_id int not null,
courses_id int not null,
foreign key (teach_id) references `teachers` (id_teachers),
FOREIGN KEY (courses_id) REFERENCES `courses` (id_courses));

DROP TABLE IF EXISTS `directions`;
CREATE TABLE `directions` (
id_direction int primary key not null auto_increment unique,
name char(60),
price FLOAT,
duration int,
foreign key (id_direction) references courses (id_courses));

DROP TABLE IF EXISTS `cours_user`;
CREATE TABLE `cours_user` (
id int primary key not null auto_increment unique,
user_id int not null,
courses_id int not null,
foreign key (user_id) references `user` (id_user),
FOREIGN KEY (courses_id) REFERENCES `courses` (id_courses));