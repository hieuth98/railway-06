USE testing_system3;
-- Question 2: lấy ra tất cả các phòng ban
SELECT *FROM department
-- Question 3: lấy ra id của phòng ban sale
SELECT department_id FROM department
WHERE department_name= 'Sale'
-- Question 4: lấy ra thông tin account có full name dài nhất
SELECT *
FROM `account`
WHERE LENGTH(full_name) = (SELECT MAX(LENGTH(full_name)) FROM `account`)
-- Question 5: lấy ra thông tin account có full name dài nhất và thuộc phòng ban có id =3
SELECT *FROM `account`
WHERE LENGTH(full_name) = ( SELECT MAX(LENGTH(full_name)) FROM `account`) 
AND department_id = 3
-- Question 6 : lấy ra tên group đã tham gia trước 	20/12/2019
SELECT*FROM `group`
WHERE create_date < '2019/12/20'
-- Question 7: lấy ra id của question có >=4 câu trả lời
SELECT question_id FROM answers
HAVING COUNT(question_id)>=4
-- Question 8: lấy ra các mã đề thi có thời gian thi >=60ph và được tạo trước ngày 20/12/2019
SELECT `code` FROM exam
WHERE duration >= '60' and create_date < '2019/12/20'
-- Question 9: lấy ra 5 group được tạo gần đây nhất
SELECT *FROM `group` 
ORDER BY create_date DESC 
LIMIT 5;
-- Question 10: đếm số nhân viên thuộc department có id =2
SELECT COUNT(*) FROM `account`
WHERE department_id = 2
-- Question 11: lấy ra nhân viên có tên bắt đầu bằng chữ "D" và kết thúc bằng chữ "o"
SELECT full_name FROM `account`
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


