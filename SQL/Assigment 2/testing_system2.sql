DROP DATABASE IF EXISTS testing_system2;
CREATE DATABASE testing_system2;
USE testing_system2;
-- CREATE TABLE department
DROP TABLE IF EXISTS department;
CREATE TABLE department  (
	department_id			TINYINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
	department_name			NVARCHAR(50) CHECK(length(department_name)>=8),
    `description`			TEXT
);
-- CREATE TABLE position
DROP TABLE IF EXISTS position; 
CREATE TABLE position (
	position_id				TINYINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
	position_name			ENUM('Dev','Test','Scrum Master','PM')
);
-- CREATE TABLE `account`
DROP TABLE IF EXISTS `account`;
CREATE TABLE  `account`(
	account_id				TINYINT PRIMARY KEY AUTO_INCREMENT,
    email					VARCHAR(50) UNIQUE KEY NOT NULL,
    user_name				VARCHAR(50) UNIQUE KEY CHECK(length(user_name)>=6),
    full_name				VARCHAR(50) CHECK(length(full_name)>=6),
    department_id			TINYINT UNSIGNED DEFAULT(1), 
    position_id				TINYINT UNSIGNED DEFAULT(1),
    create_date				DATETIME,
    age 					TINYINT UNSIGNED CHECK (age >=18 && age <=30),
    FOREIGN KEY (department_id) REFERENCES department(department_id)
    );
    -- CREATE TABLE `group`
DROP TABLE IF EXISTS `group`;
CREATE TABLE `group` (
	group_id				TINYINT UNSIGNED PRIMARY KEY,
    group_name				VARCHAR(50),
    creator_id				TINYINT UNSIGNED,
    create_date				DATETIME
    );
    -- CREATE TABLE `group account`
DROP TABLE IF EXISTS `group_account`;
CREATE TABLE `group_account` (
	group_id				TINYINT UNSIGNED UNIQUE KEY,
    account_id				TINYINT UNSIGNED NOT NULL,
    join_date 				DATETIME
    );
    -- CREATE TABLE type_question
DROP TABLE IF EXISTS type_question;
CREATE TABLE type_question (
	type_id					TINYINT UNSIGNED,
    type_name				ENUM('Essay','Multiple-Choice')
    );
    

