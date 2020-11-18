DROP DATABASE IF EXISTS thuc_tap;
CREATE DATABASE thuc_tap;
USE thuc_tap;
DROP TABLE IF EXISTS country;
CREATE TABLE country(
	country_id				TINYINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
	country_name			VARCHAR(50)	
);
DROP TABLE IF EXISTS location;
CREATE TABLE location(
	location_id				TINYINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
	street_address			VARCHAR(200),
    postal_code				CHAR(6),
    country_id				TINYINT UNSIGNED,
    FOREIGN KEY (country_id) REFERENCES country(country_id)
);
DROP TABLE IF EXISTS employee;
CREATE TABLE employee(
	employee_id				INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    full_name				VARCHAR(100),
    email					VARCHAR(100),
    location_id				TINYINT UNSIGNED, 
    FOREIGN KEY (location_id) REFERENCES location(location_id)
);
INSERT INTO country 	(country_name)
VALUES					('America'),
						('England'),
						('China'),
                        ('Vietnam');
INSERT INTO location 	(street_address,		postal_code,			country_id)
VALUES					('123_Bach_Mai',		111111		,			1),
						('246_Xuan_Thuy',		222222		,			1),
                        ('357_Hang_Trong',		333333		,			3),
                        ('233_Xuan_Mai',		444444		,			4);
                        
                        
INSERT INTO employee   	( full_name,			email,				location_id)
VALUES					('David B',		'nn03@gmail.com',		1),
						('Wu Yang',		'wuyang@weibo.com',		1),
                        ('Micheal',		'micheal@gmail.com',	3),
                        ('Nguyen A',	'anguyen@gmail.com',	4);
                        
                        
-- Q2:
-- a) lấy tất cả nhân viên thuộc việt nam
SELECT full_name
FROM employee 
JOIN location USING (location_id)
WHERE country_id= 0004
-- b) lấy ra tên quốc gia của employee có email là 'nn03@gmail.com'
SELECT country_id
FROM employee 
JOIN location USING (location_id)
WHERE email = 'nn03@gmail.com'

SELECT country_name
FROM country
WHERE country_id = 1

-- c) Thống kê mỗi country, mỗi location có bao nhiêu employee đang làm việc
-- thống ke location
SELECT COUNT(*), location_id
FROM location
GROUP BY location_id
-- thông kê country
SELECT country_id,COUNT(*)
FROM location
GROUP BY country_id

-- Q3:
DROP TRIGGER IF EXISTS check_insert_employee;
DELIMITER $$
CREATE TRIGGER check_insert_employee
BEFORE INSERT ON employee
FOR EACH ROW
BEGIN
	DELETE FROM employee
	WHERE employee_id IN ( 	SELECT COUNT(*) 
						FROM employee JOIN location USING (location_id)
						GROUP BY country_id
                        HAVING COUNT(*) > 10);
END$$
DELIMITER ;

-- Q4: hãy cấu hình table sao cho khi xóa 1 location nào đó thì tất cả employee ở location đó sẽ có location_id = null
DROP PROCEDURE IF EXISTS cau_hinh_table;
DELIMITER $$
CREATE PROCEDURE cau_hinh_table (IN id_location TINYINT UNSIGNED)
BEGIN
UPDATE employee 
SET location_id = NULL
WHERE location_id = id_location;
END$$
DELIMITER ;
SET FOREIGN_KEY_CHECKS = 0;

call thuc_tap.cau_hinh_table(1);
SELECT *
FROM employee;
