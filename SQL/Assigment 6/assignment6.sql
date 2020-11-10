USE testing_system3
-- q1: tạo store để người dùng nhập vào tên phòng ban và in ra tất cả các account thuộc phòng ban đó
DROP PROCEDURE IF EXISTS assigment1;
DELIMITER $$
CREATE PROCEDURE assigment1 (	IN name_department VARCHAR(100)) 
BEGIN
SELECT *
FROM `account`
JOIN department USING (department_id)
WHERE department_name like concat ('%', name_department , '%') ;
 END $$
DELIMITER ;
SET @abc='';
call testing_system3.assigment1 ('sale');
-- q2: Tạo store để in ra số lượng account trong mỗi group
DROP PROCEDURE IF EXISTS question2;
DELIMITER $$
CREATE PROCEDURE question2 () 
BEGIN
SELECT *, COUNT(1)
FROM group_account
GROUP BY group_id;
 END $$
DELIMITER ;
-- q3: tạo store để thống kê mỗi type question có bao nhiêu question được tạo trong tháng hiện tại
DROP PROCEDURE IF EXISTS question3
DELIMITER $$
CREATE PROCEDURE question3 ()
BEGIN
SELECT COUNT(type_id)
FROM question
WHERE MONTH (create_date) = MONTH (NOW());
END $$
DELIMITER ;
-- q4: Tạo store để trả ra id của type question có nhiều câu hỏi nhất
DROP PROCEDURE IF EXISTS question4
DELIMITER $$
CREATE PROCEDURE question4 ()
BEGIN
WITH max_count_type_id AS (
SELECT COUNT(type_id)
FROM question 
GROUP BY type_id
ORDER BY COUNT(type_id) DESC
LIMIT 1
)
SELECT type_id
FROM question
GROUP BY type_id
HAVING COUNT(type_id) = (SELECT * FROM max_count_type_id);
END $$
DELIMITER ;

-- q5: 
-- q6:
-- q7:
-- q8
-- q9:Viết 1 store cho phép người dùng xóa exam dựa vào ID
DROP PROCEDURE IF EXISTS sp_delete_exam_with_id;
DELIMITER $$
CREATE PROCEDURE sp_delete_exam_with_id (IN in_exam_id TINYINT UNSIGNED)
BEGIN
	DELETE 	
    FROM 	exam 
    WHERE	exam_id = in_exam_id;	
END$$
DELIMITER ;
--