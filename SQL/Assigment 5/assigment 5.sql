USE testing_system3;
-- q1: tạo view có chứa danh sách nhân viên thuộc phòng ban sale
CREATE OR REPLACE VIEW view12 AS
SELECT *
FROM `account` JOIN department USING (department_id)
WHERE department_name = 'Sale';

-- q2: tạo view có chứa thông tin các account tham gia vào nhiều group nhất
CREATE OR REPLACE VIEW view13 AS
SELECT*,COUNT(*)
FROM `account` a
JOIN `group` g ON g.creator_id = a.account_id
GROUP BY account_id
HAVING COUNT(*) =2;

--  q3: tạo view có chứa câu hỏi có những content quá dài ( quá 15 từ) và xóa nó đi
CREATE OR REPLACE VIEW view_question3 AS
SELECT *,length(content)
FROM question
WHERE length(content) > 15
SET FOREIGN_KEY_CHECKS = 0
DELETE 
FROM view_question3

-- q4: tạo view có chứa danh sách các phòng ban có nhiều nhân viên nhất
CREATE OR REPLACE VIEW view2 AS
SELECT COUNT(*), d.department_name
FROM `account`a
JOIN department d ON a.department_id = d.department_id
GROUP BY d.department_name
HAVING COUNT(*)= ( 	SELECT COUNT(*)
					FROM `account`a
					JOIN department d ON a.department_id = d.department_id
					GROUP BY d.department_name
                    ORDER BY COUNT(*) DESC
                    LIMIT 1);
-- q5: tạo view có chứa tất cả các câu hỏi do user họ Nguyễn tạo
CREATE OR REPLACE VIEW view_user1 AS
SELECT *
FROM question q
JOIN `account`a
ON q.creator_id = a.account_id 
WHERE full_name LIKE ('Nguyen%')


