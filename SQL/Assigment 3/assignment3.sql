USE testing_system3;
-- q1: lấy ra tất cả các phòng ban
SELECT 
*FROM department
-- q2: lấy ra id của phòng ban Sale
SELECT 
*FROM department
WHERE department_name ='Sale'
-- q4: lấy ra thông tin account có full name dài nhất
SELECT *, length(full_name)
FROM `account`
WHERE length(full_name) = (SELECT MAX(length(full_name)) FROM `account`);
-- q5: lấy ra thông tin account có full name dài nhất và thuộc phòng ban có id=3
SELECT*, length(full_name)
FROM `account` 
WHERE length(full_name) = (SELECT MAX(length(full_name)) FROM `account` WHERE
department_id=3)
-- q6: lấy ra tên group đã tham gia trước ngày 20/12/2019
SELECT group_name, create_date
FROM `group`
WHERE create_date < '2019/12/20'
-- q7: lấy ra id của quesiton có >=4 câu trả lời
SELECT COUNT(*), question_id  
FROM
answers
GROUP BY question_id
HAVING COUNT(*) >=4

-- q8 lấy ra các mã đề thi có thời gian thi >=60ph và đc tạo trước 20/12/2019
SELECT *
FROM exam
WHERE duration >=60 AND create_date < '2019/12/20'
-- q9 lấy ra 5 group được tạo ra gần nhất
SELECT *
FROM `group`
ORDER BY create_date DESC
LIMIT 5
-- q10: đếm số nhân viên thuộc department có id =2
SELECT *
FROM `account`
WHERE department_id = 2
-- q11: lấy ra tên nhân viên có tên bắt đầu bằng chữ D và kết thúc bằng chữ o
SELECT *
FROM `account`
WHERE full_name LIKE 'D%o'
-- Question 12: Xóa tất cả các exam được tạo trước ngày 20/12/2019
SET FOREIGN_KEY_CHECKS = 0;
DELETE 
FROM exam 
WHERE create_date < '2019/12/20';
-- Question 13: Xóa tất cả các question có nội dung bắt đầu bằng từ "câu hỏi"
SET FOREIGN_KEY_CHECKS= 0;
DELETE
FROM `question`
WHERE content LIKE ('câu hỏi%');
-- Question 14: update thông tin của account có id =5 thành tên Nguyễn Bá Lộc và email thành loc.nguyenba@vti.com.vn
UPDATE `account` SET full_name = 'Nguyễn Bá Lộc' , email = 'loc.nguyenba@vti.com.vn'
WHERE account_id=5
-- Question 15: update account có id =5 sẽ thuộc group có id =4
UPDATE `group_account` SET group_id =4
WHERE account_id =5 
