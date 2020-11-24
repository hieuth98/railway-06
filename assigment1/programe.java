package assigment1;

import java.time.LocalDate;
import java.time.LocalDateTime;

public class programe {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
// create department
		Department department1 = new Department();
		department1.Id = 1;
		department1.Name = "Sale";
		Department department2 = new Department();
		department2.Id = 2;
		department2.Name = "Marketing";
		Department department3 = new Department();
		department3.Id = 3;
		department3.Name = "Security";
// create Position
		Position position1= new Position ();
		position1.Id=1;
		position1.name = PositionName.DEV;
		Position position2= new Position ();
		position2.Id=2;
		position2.name = PositionName.DEV;
		Position position3= new Position ();
		position3.Id=3;
		position3.name = PositionName.SCRUM_MASTER;
// create group	
		Group group1= new Group ();
		group1.Id =1;
		group1.Name = "Java";
		group1.CreateDate = LocalDate.of(2020, 9, 8);
		Group group2= new Group ();
		group2.Id =2;
		group2.Name = "C#";
		group2.CreateDate = LocalDate.of(2020, 10, 8);
		Group group3= new Group ();
		group3.Id =3;
		group3.Name = "Mysql";
		group3.CreateDate = LocalDate.of(2018, 12, 8);
// create account
		Account account1 = new Account();
		account1.Id = 1;
		account1.email = "nguyena@gmail.com";
		account1.username = "nguyena";
		account1.fullname = "nguyen van a";
		account1.department = department1;
		account1.Position = position1;
		account1.CreateDate = LocalDate.of(2019, 12, 24);
		
		
		Account account2 = new Account();
		account2.Id = 2;
		account2.email = "nguyenb@gmail.com";
		account2.username = "nguyenb";
		account2.fullname = "nguyen van b";
		account2.department = department2;
		account2.Position = position2;
		account2.CreateDate = LocalDate.of(2018, 11, 24);
		
		
		Account account3 = new Account();
		account3.Id = 3;
		account3.email = "nguyenc@gmail.com";
		account3.username = "nguyenc";
		account3.fullname = "nguyen van c";
		account3.department = department3;
		account3.Position = position3;
		account3.CreateDate = LocalDate.of(2019, 10, 24);
		
		Account account3 = new Account();
		account3.Id = 3;
		account3.email = "nguyenc@gmail.com";
		account3.username = "nguyenc";
		account3.fullname = "nguyen van c";
		account3.department = department3;
		account3.Position = position3;
		account3.CreateDate = LocalDate.of(2019, 10, 24);
		
		Group []  groupsofaccount1 = {group1 ,group2};
		account1.Groups = groupsofaccount1;
		Group []  groupsofaccount2 = {group1 ,group3};
		account2.Groups = groupsofaccount2;
		Group []  groupsofaccount3 = {group1 ,group2,group3};
		account3.Groups = groupsofaccount3;
		
		Account[] accountsofgroup1 = {account1, account2, account3};
		group1.accounts = accountsofgroup1;
		Account[] accountsofgroup2 = {account1, account3};
		group2.accounts = accountsofgroup2;
		Account[] accountsofgroup3 = {account2, account3};
		group3.accounts = accountsofgroup3;
		
//		create type question
		TypeQuestion typequestion1 = new TypeQuestion();
		typequestion1.Id = 1;
		typequestion1.Name = "TuLuan";
		
		TypeQuestion typequestion2 = new TypeQuestion();
		typequestion2.Id = 2;
		typequestion2.Name = "TracNghiem";
				
		TypeQuestion typequestion3 = new TypeQuestion();
		typequestion3.Id = 3;
		typequestion3.Name = "ThucHanh";
		
//		create categoryquestion
		CategoryQuestion categoryquestion1 = new CategoryQuestion();
		categoryquestion1.Id = 1;
		categoryquestion1.Name = "Java";
				
		CategoryQuestion categoryquestion2 = new CategoryQuestion();
		categoryquestion2.Id = 2;
		categoryquestion2.Name = "C#";
					
		CategoryQuestion categoryquestion3 = new CategoryQuestion();
		categoryquestion3.Id = 3;
		categoryquestion3.Name = "SQL";
		
//		create question
		Question question1 = new Question();
		question1.Id = 1;
		question1.content = "abc";
		question1.categoryquestion = categoryquestion1;
		question1.typequestion = typequestion1;
		question1.CreatorId = account1;
		question1.CreateDate = LocalDate.of(2020, 10, 12);
		
		Question question2 = new Question();
		question2.Id = 2;
		question2.content = "xyz";
		question2.categoryquestion = categoryquestion3;
		question2.typequestion = typequestion2;
		question2.CreatorId = account1;
		question2.CreateDate = LocalDate.of(2019, 10, 12);
		
		Question question3 = new Question();
		question3.Id = 3;
		question3.content = "abcd";
		question3.categoryquestion = categoryquestion2;
		question3.typequestion = typequestion1;
		question3.CreatorId = account3;
	 	question3.CreateDate = LocalDate.of(2018, 10, 12);
		
//		create answer
		Answer answer1= new Answer();
		answer1.Id = 1;
		answer1.content = "traloi1";
		answer1.Question = question1;
		answer1.isCorrect = false;
		
		Answer answer2= new Answer();
		answer2.Id = 2;
		answer2.content = "traloi2";
		answer2.Question = question3;
		answer2.isCorrect = true;
		
		Answer answer3= new Answer();
		answer3.Id = 3;
		answer3.content = "traloi3";
		answer3.Question = question3;
		answer3.isCorrect = false;
		
//		create exam
		Exam exam1 = new Exam();
		exam1.Id = 1;
		exam1.Code = "A1";
		exam1.Title= "Kiemtra1";
		exam1.Category = categoryquestion2;
		exam1.Duration = 60;
		exam1.Creator = account2;
		exam1.CreateDate = LocalDate.of(2019, 12, 23);
		Question [] questionofexam1 = {question1,question2};
		
		Exam exam2 = new Exam();
		exam2.Id = 2;
		exam2.Code = "A2";
		exam2.Title= "Kiemtra2";
		exam2.Category = categoryquestion1;
		exam2.Duration = 90;
		exam2.Creator = account1;
		exam2.CreateDate = LocalDate.of(2019, 10, 23);
		Question [] questionofexam2 = {question1,question3};
		
		
		Exam exam3 = new Exam();
		exam3.Id = 3;
		exam3.Code = "A3";
		exam3.Title= "Kiemtra3";
		exam3.Category = categoryquestion3;
		exam3.Duration = 120;
		exam3.Creator = account1;
		exam3.CreateDate = LocalDate.of(2019, 9, 23);
		Question [] questionofexam3 = {question1,question2,question3};
//		Print
//		department
		System.out.println("DepartmentId: " + department1.Id);
		System.out.println("Departmentname: " + department1.Name);
//		position
		System.out.println("PositionId: " + position1.Id);
		System.out.println("PositionName: " + position1.name);
//		group
		System.out.println("GroupId: " + group1.Id);
		System.out.println("GroupName: " + group1.Name);
		System.out.println("CreatorId: " + group1.accounts);
		System.out.println("CreateDate: " + group1.CreateDate);

		System.out.println("GroupId: " + group2.Id);
		System.out.println("GroupName: " + group2.Name);
		System.out.println("CreatorId: " + group2.accounts);
		System.out.println("CreateDate: " + group2.CreateDate);
//		account
		System.out.println("AccountId: " + account1.Id);
		System.out.println("Email: " + account1.email);
		System.out.println("Username: " + account1.username);
		System.out.println("Fullname: " + account1.fullname);
		System.out.println("DepartmentId: " +account1.department.Id);
		System.out.println("PositionId: " + account1.Position.Id );
		System.out.println("CreateDate: " + account1.CreateDate);
		System.out.println("Group: " + groupsofaccount1);
	}
	

}
