/*============================== CREATE DATABASE =======================================*/
/*======================================================================================*/
DROP DATABASE IF EXISTS testing_system3;
CREATE DATABASE testing_system3;
USE testing_system3;

/*============================== CREATE TABLE=== =======================================*/
/*======================================================================================*/

-- create table 1: department
DROP TABLE IF EXISTS department;
CREATE TABLE department(
	department_id 			TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    department_name 		NVARCHAR(30) NOT NULL UNIQUE KEY
);

-- create table 2: posittion
DROP TABLE IF EXISTS position;
CREATE TABLE `position` (
	position_id				TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    position_name			ENUM('Dev','Test','Scrum Master','PM') NOT NULL UNIQUE KEY
);

-- create table 3: account
DROP TABLE IF EXISTS `account`;
CREATE TABLE `account`(
	account_id				TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    email					VARCHAR(50) NOT NULL UNIQUE KEY,
    user_name				VARCHAR(50) NOT NULL UNIQUE KEY,
    full_name				NVARCHAR(50) NOT NULL,
    department_id 			TINYINT UNSIGNED ,
    position_id				TINYINT UNSIGNED ,
    create_date_a				DATETIME DEFAULT NOW(),
    FOREIGN KEY(department_id) 	REFERENCES department(department_id),
    FOREIGN KEY(position_id) 	REFERENCES `position`(position_id)
);

-- create table 4: group
DROP TABLE IF EXISTS `group`;
CREATE TABLE `group`(
	group_id				TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    group_name				NVARCHAR(50) NOT NULL UNIQUE KEY,
    creator_id				TINYINT UNSIGNED NOT NULL,
    create_date				DATETIME DEFAULT NOW(),
    FOREIGN KEY (creator_id) REFERENCES `account`(account_id)
);

-- create table 5: group_account
DROP TABLE IF EXISTS group_account;
CREATE TABLE group_account(
	group_id				TINYINT UNSIGNED NOT NULL,
    account_id				TINYINT UNSIGNED NOT NULL,
    join_date				DATETIME DEFAULT NOW(),
    PRIMARY KEY (group_id,account_id)
);
-- create table 6: type_question
DROP TABLE IF EXISTS type_question;
CREATE TABLE type_question (
    type_id 		TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    type_name 		ENUM('Essay','Multiple-Choice') NOT NULL UNIQUE KEY
);

-- create table 7: category_question
DROP TABLE IF EXISTS category_question;
CREATE TABLE category_question(
    category_id				TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    category_name			NVARCHAR(50) NOT NULL UNIQUE KEY
);

-- create table 8: question
DROP TABLE IF EXISTS question;
CREATE TABLE question(
    question_id				TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    content					NVARCHAR(100) NOT NULL,
    category_id				TINYINT UNSIGNED NOT NULL,
    type_id					TINYINT UNSIGNED NOT NULL,
    creator_id				TINYINT UNSIGNED NOT NULL UNIQUE KEY,
    create_date				DATETIME DEFAULT NOW(),
    FOREIGN KEY(category_id) 	REFERENCES category_question(category_id),
    FOREIGN KEY(type_id) 		REFERENCES type_question(type_id),
    FOREIGN KEY(creator_id) 		REFERENCES `account`(account_id)
);

-- create table 9: answer
DROP TABLE IF EXISTS answers;
CREATE TABLE answers(
    answers					TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    content					NVARCHAR(100) NOT NULL,
    question_id				TINYINT UNSIGNED NOT NULL,
    is_correct				BIT DEFAULT 1,
    FOREIGN KEY(question_id) REFERENCES question(question_id)
);

-- create table 10: exam
DROP TABLE IF EXISTS exam;
CREATE TABLE exam(
    exam_id					TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    `code`					CHAR(10) NOT NULL,
    title					NVARCHAR(50) NOT NULL,
    category_id				TINYINT UNSIGNED NOT NULL,
    duration				TINYINT UNSIGNED NOT NULL,
    creator_id				TINYINT UNSIGNED NOT NULL,
    create_date				DATETIME DEFAULT NOW(),
    FOREIGN KEY(category_id) 	REFERENCES category_question(category_id),
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

/*============================== INSERT DATABASE =======================================*/
/*======================================================================================*/
-- Add data Department
INSERT INTO department(department_name) 
VALUES
						(N'Marketing'	),
						(N'Sale'		),
						(N'Bảo vệ'		),
						(N'Nhân sự'		),
						(N'Kỹ thuật'	),
						(N'Tài chính'	),
						(N'Phó giám đốc'),
						(N'Giám đốc'	),
						(N'Thư kí'		),
						(N'Bán hàng'	);
    
-- Add data position
INSERT INTO position	(position_name	) 
VALUES 					('Dev'			),
						('Test'			),
						('Scrum Master'	),
						('PM'			); 


-- Add data account
INSERT INTO `account`(email								, user_name			, full_name				, department_id	, position_id, create_date_a)
VALUES 				('haidang29productions@gmail.com'	, 'dangblack'		,'Nguyen Hai Dang'		,   '5'			,   '1'		 ,'2020-12-05'),
					('account1@gmail.com'				, 'quanganh'		,'Tong Quang Anh'		,   '1'			,   '2'		 ,'2020-03-05'),
                    ('account2@gmail.com'				, 'vanchien'		,'Nguyen Van Chien'		,   '1'			,   '3'		 ,'2020-11-07'),
                    ('account3@gmail.com'				, 'cocoduongqua'	,'Duong Do'				,   '2'			,   '4'		 ,'2020-03-08'),
                    ('account4@gmail.com'				, 'doccocaubai'		,'Nguyen Chien Thang'	,   '2'			,   '4'		 ,'2020-03-10'),
                    ('dapphatchetngay@gmail.com'		, 'khabanh'			,'Ngo Ba Kha'			,   '3'			,   '3'		 ,'2020-01-05'),
                    ('songcodaoly@gmail.com'			, 'huanhoahong'		,'Bui Xuan Huan'		,   '3'			,   '2'		 ,'2020-02-05'),
                    ('sontungmtp@gmail.com'				, 'tungnui'			,'Nguyen Thanh Tung'	,   '3'			,   '1'		 ,'2020-03-07'),
                    ('duongghuu@gmail.com'				, 'duongghuu'		,'Duong Van Huu'		,   '3'			,   '2'		 ,'2020-04-07'),
                    ('vtiaccademy@gmail.com'			, 'vtiaccademy'		,'Vi Ti Ai'				,   NULL			,   NULL	,'2020-04-09');

-- Add data group
INSERT INTO `group`	(  group_name			, creator_id	, create_date)
VALUES 				(N'Testing System'		,   5			,'2019-03-05'),
					(N'Developement'		,   1			,'2020-03-07'),
                    (N'VTI Sale 01'			,   2			,'2020-03-09'),
                    (N'VTI Sale 02'			,   3			,'2020-03-10'),
                    (N'VTI Sale 03'			,   4			,'2020-03-28'),
                    (N'VTI Creator'			,   6			,'2020-04-06'),
                    (N'VTI Marketing 01'	,   7			,'2020-04-07'),
                    (N'Management'			,   8			,'2020-04-08'),
                    (N'Chat with love'		,   9			,'2020-04-09'),
                    (N'Vi Ti Ai'			,   1			,'2020-04-10');

-- Add data group_account
INSERT INTO `group_account`	(  group_id	, account_id, join_date	 )
VALUES 						(	1		,    1		,'2019-03-05'),
							(	1		,    2		,'2020-03-07'),
							(	3		,    3		,'2020-03-09'),
							(	3		,    4		,'2020-03-10'),
							(	5		,    5		,'2020-03-28'),
							(	1		,    3		,'2020-04-06'),
							(	1		,    7		,'2020-04-07'),
							(	8		,    3		,'2020-04-08'),
							(	1		,    9		,'2020-04-09'),
							(	10		,    10		,'2020-04-10');


-- Add data type_question
INSERT INTO type_question	(type_name			) 
VALUES 						('Essay'			), 
							('Multiple-Choice'	); 


-- Add data category_question
INSERT INTO category_question		(category_name	)
VALUES 								('Java'			),
									('ASP.NET'		),
									('ADO.NET'		),
									('SQL'			),
									('Postman'		),
									('Ruby'			),
									('Python'		),
									('C++'			),
									('C Sharp'		),
									('PHP'			);
													
-- Add data question
INSERT INTO question	(content			, category_id	, type_id		, creator_id	, create_date )
VALUES 					(N'Câu hỏi về Java'	,	1			,   '1'			,   '1'			,'2020-11-09'),
						(N'Câu Hỏi về PHP'	,	10			,   '2'			,   '2'			,'2020-04-05'),
						(N'Hỏi về C#'		,	9			,   '2'			,   '3'			,'2020-04-06'),
						(N'Hỏi về Ruby'		,	6			,   '1'			,   '4'			,'2020-04-06'),
						(N'Hỏi về Postman'	,	5			,   '1'			,   '5'			,'2020-04-06'),
						(N'Hỏi về ADO.NET'	,	3			,   '2'			,   '6'			,'2020-04-06'),
						(N'Hỏi về ASP.NET'	,	2			,   '1'			,   '7'			,'2020-04-06'),
						(N'Hỏi về C++'		,	8			,   '1'			,   '8'			,'2020-04-07'),
						(N'Hỏi về SQL'		,	4			,   '2'			,   '9'			,'2020-04-07'),
						(N'Hỏi về Python'	,	7			,   '1'			,   '10'		,'2020-04-07');

-- Add data answers
INSERT INTO answers	(  content		, question_id	, is_correct)
VALUES 				(N'Trả lời 01'	,   1			,	0		),
					(N'Trả lời 02'	,   1			,	1		),
                    (N'Trả lời 03'	,   1			,	0		),
                    (N'Trả lời 04'	,   1			,	1		),
                    (N'Trả lời 05'	,   2			,	1		),
                    (N'Trả lời 06'	,   3			,	1		),
                    (N'Trả lời 07'	,   4			,	0		),
                    (N'Trả lời 08'	,   8			,	0		),
                    (N'Trả lời 09'	,   9			,	1		),
                    (N'Trả lời 10'	,   10			,	1		);
	
-- Add data exam
INSERT INTO exam	(`code`			, title					, category_id	, duration	, creator_id	, create_date )
VALUES 				('VTIQ001'		, N'Đề thi C#'			,	1			,	60		,   '5'			,'2019-04-05'),
					('VTIQ002'		, N'Đề thi PHP'			,	10			,	60		,   '1'			,'2019-04-05'),
                    ('VTIQ003'		, N'Đề thi C++'			,	9			,	120		,   '2'			,'2019-04-07'),
                    ('VTIQ004'		, N'Đề thi Java'		,	6			,	60		,   '3'			,'2020-04-08'),
                    ('VTIQ005'		, N'Đề thi Ruby'		,	5			,	120		,   '4'			,'2020-04-10'),
                    ('VTIQ006'		, N'Đề thi Postman'		,	3			,	60		,   '6'			,'2020-04-05'),
                    ('VTIQ007'		, N'Đề thi SQL'			,	2			,	60		,   '7'			,'2020-04-05'),
                    ('VTIQ008'		, N'Đề thi Python'		,	8			,	60		,   '8'			,'2020-04-07'),
                    ('VTIQ009'		, N'Đề thi ADO.NET'		,	4			,	90		,   '9'			,'2020-04-07'),
                    ('VTIQ010'		, N'Đề thi ASP.NET'		,	7			,	90		,   '10'		,'2020-04-08');
                    
                    
-- Add data exam_question
INSERT INTO exam_question	(exam_id	, question_id) 
VALUES 						(	1	,		5		),
							(	2	,		10		), 
							(	3	,		4		), 
							(	4	,		3		), 
							(	5	,		7		), 
							(	6	,		10		), 
							(	7	,		2		), 
							(	8	,		10		), 
							(	9	,		9		), 
							(	10	,		8		); 
                            
                            
                            CREATE OR REPLACE VIEW view1 AS
                            SELECT *
                            FROM `account`;
                        