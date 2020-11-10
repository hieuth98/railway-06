USE testing_system3;
-- Q1: lấy ra danh sách nhân viên và thông tin phòng ban của họ
SELECT *
FROM `account`
LEFT JOIN department USING (department_id)
-- Q2: lấy ra thông tin các account được tạo sau ngày 20/12/2010
SELECT *
FROM `account`
WHERE create_date > 2010/12/20
-- Q3: viết lệnh để lấy ra tất cả các developer
SELECT *FROM `account`
JOIN position USING (position_id)
WHERE position_name = 'Dev'
-- Q4: lấy ra danh sách các phòng ban có >3 nhân viên
SELECT COUNT(*), department_name
FROM `account`
JOIN department USING (department_id)
GROUP BY (department_id)
HAVING COUNT(*) >3
-- Q5: lấy ra danh sách câu hỏi được sử dụng trong đề thi nhiều nhất
SELECT COUNT(*),content
FROM question
JOIN exam_question USING (question_id)
GROUP BY question_id
ORDER BY (COUNT(*)) DESC
LIMIT 1;
-- Q6: thống kê mỗi category question được sử dụng trong bao nhiêu question
SELECT *, COUNT(category_id) 
FROM question
RIGHT JOIN category_question USING (category_id)
GROUP BY category_id
-- Q7: thống kê mỗi question được sử dụng trong bao nhiêu exam
SELECT GROUP_CONCAT(xamID), QuestionID,COUNT(1),Content
FROM ExamQuestion
JOIN Question USING(QuestionID)
GROUP BY QuestionID
HAVING COUNT(1) = (
SELECT COUNT(1)
FROM ExamQuestion
GROUP BY QuestionID
ORDER BY COUNT(1) DESC
LIMIT 1
-- Q8: lấy ra question có nhiều câu trả lời nhất
SELECT COUNT(*),a.question_id,a.content
FROM question q
JOIN answers a ON q.question_id = a.question_id
GROUP BY a.question_id
ORDER BY COUNT(*) DESC
LIMIT 1
-- Q9: thống kê số lượng account trong mỗi group

SELECT COUNT(account_id), group_id, group_name
FROM group_account
RIGHT JOIN `group` USING (group_id)
GROUP BY group_id




-- Q10: tìm chức vụ có ít người nhất
SELECT *, COUNT(1)
FROM `account`
GROUP BY position_id
HAVING COUNT(1)=2

-- Q11: thống kê mỗi phòng ban có bao nhiêu nhân viên thuộc 4 chức vụ (dev, test, scrum master, PM)
SELECT COUNT(*), d.department_name,p.position_name 
FROM `account` a
JOIN department d ON d.department_id = a.department_id
JOIN position p ON p.position_id = a.position_id
GROUP BY department_name,position_name
ORDER BY d.department_name ASC
-- Q12: lấy thông tin chi tiết của câu hỏi bao gồm: thông tin cơ bản của question, loại câu hỏi, ai là người tạo ra câu hỏi, câu trả lời là gì..
SELECT *
FROM question q
JOIN answers a ON a.question_id = q.question_id
JOIN type_question tq ON tq.type_id = q. type_id
-- Q13: lấy ra số lượng câu hỏi	của mỗi loại tự luận hay trắc nghiệm
SELECT COUNT(*),type_name
FROM question
JOIN type_question USING (type_id)
GROUP BY type_name
-- Q14: lấy ra group ko có account nào
SELECT DISTINCT g.group_name
FROM `group` g 
LEFT JOIN group_account ga ON g.group_id = ga.group_id
WHERE ga.account_id is NULL
-- Q15 giống Q14
-- Q16:  lấy ra question không có answer nào
SELECT *
FROM question 
LEFT JOIN answers USING (question_id)
WHERE answers is NULL 
-- Q 17 lấy các account thuộc nhóm 1, lấy ra các account thuộc nhóm 3 sau đó ghép sao cho không có record trùng nhau
SELECT account_id, user_name
FROM `account` 
JOIN group_account USING(account_id)
WHERE group_id =1
UNION
SELECT account_id, user_name
FROM `account` 
JOIN group_account USING(account_id)
WHERE group_id =3;

-- Q18 : lấy ra các group >5 thành viên, các group <7 thành viên và nối
SELECT COUNT(*),g.group_name
FROM group_account gc
JOIN `group`g ON g.group_id = gc.group_id
JOIN `account`a ON a.account_id = gc.account_id
GROUP BY g.group_id
HAVING COUNT(*)>5
UNION
SELECT COUNT(*), g.group_name
FROM group_account gc
JOIN `group`g ON g.group_id = gc.group_id
JOIN `account`a ON a.account_id = gc.account_id
GROUP BY g.group_id
HAVING COUNT(*)<7
