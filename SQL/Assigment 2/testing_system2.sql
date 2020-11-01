DROP DATABASE IF EXISTS testing_system;
CREATE DATABASE testing_system;
USE testing_system;
DROP TABLE IF EXISTS department;
CREATE TABLE department(
department_id		TINYINT UNSIGNED PRIMARY KEY,
department_name		VARCHAR(20)
);
DROP TABLE IF EXISTS positon;
CREATE TABLE positon(
position_id			TINYINT UNSIGNED PRIMARY KEY,
position_name		ENUM('Dev','Test','Scrum Master','PM')
);
DROP TABLE IF EXISTS `account`;
CREATE TABLE `account`(
account_id			TINYINT UNSIGNED PRIMARY KEY,
email				VARCHAR(50),
user_name			VARCHAR(50),
full_name			VARCHAR(50),
department_id		TINYINT UNSIGNED,
position_id			VARCHAR(50),
create_date			DATE
);
DROP TABLE IF EXISTS `group`;
CREATE TABLE `group`(
group_id			TINYINT UNSIGNED,
group_name			VARCHAR(50),
creator_id			TINYINT UNSIGNED,
create_date			DATE
);
DROP TABLE IF EXISTS group_account;
CREATE TABLE group_account(
group_id			TINYINT UNSIGNED,
account_id			TINYINT UNSIGNED,
join_date			DATE
);
DROP TABLE IF EXISTS type_question;
CREATE TABLE type_question(
type_id				TINYINT UNSIGNED
);
CREATE TABLE category_question(
    category_id				TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    category_name			NVARCHAR(50) NOT NULL UNIQUE KEY
);

-- create table 8: question
DROP TABLE IF EXISTS question;
CREATE TABLE question(
    question_id					TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    content						NVARCHAR(100) NOT NULL,
    category_id					TINYINT UNSIGNED NOT NULL,
    type_id						TINYINT UNSIGNED NOT NULL,
    creator_id					TINYINT UNSIGNED NOT NULL UNIQUE KEY,
    create_date					DATETIME DEFAULT NOW(),
    FOREIGN KEY(category_id) 	REFERENCES category_question(category_id),
    FOREIGN KEY(type_id) 		REFERENCES type_question(type_id),
    FOREIGN KEY(creator_id) 	REFERENCES `account`(account_id)
);

-- create table 9: answer
DROP TABLE IF EXISTS answer;
CREATE TABLE answer(
    answers					TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    content					NVARCHAR(100) NOT NULL,
    questionID				TINYINT UNSIGNED NOT NULL,
    is_correct				BIT DEFAULT 1,
    FOREIGN KEY(question_id) REFERENCES question(question_id)
);

-- create table 10: Exam
DROP TABLE IF EXISTS exam;
CREATE TABLE exam(
    examID					TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    `Code`					CHAR(10) NOT NULL,
    title					NVARCHAR(50) NOT NULL,
    category_id				TINYINT UNSIGNED NOT NULL,
    duration				TINYINT UNSIGNED NOT NULL,
    creator_id				TINYINT UNSIGNED NOT NULL,
    createdate				DATETIME DEFAULT NOW(),
    FOREIGN KEY(category_id) REFERENCES category_question(category_id),
    FOREIGN KEY(creator_id) 	REFERENCES `account`(account_id)
);

-- create table 11: exam_question
DROP TABLE IF EXISTS exam_question;
CREATE TABLE exam_question(
    exam_id				TINYINT UNSIGNED NOT NULL,
	question_id			TINYINT UNSIGNED NOT NULL,
    FOREIGN KEY(question_id) REFERENCES question(question_id),
    FOREIGN KEY(exam_id) REFERENCES exam(exam_id),
    PRIMARY KEY (exam_id,question_id)
);
	
