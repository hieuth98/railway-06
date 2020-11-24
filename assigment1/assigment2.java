package assigment1;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.ZoneId;
import java.util.Date;
import java.util.Locale;
import java.util.Random;
import java.util.RandomAccess;
import java.util.Scanner;

public class assigment2 {
	public static void main(String[] args) {
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
				
				Department[] departments = {department1,department2,department3};
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
				
				Account account4 = new Account();
				account4.Id = 4;
				account4.email = "nguyenD@gmail.com";
				account4.username = "nguyenD";
				account4.fullname = "nguyen van D";
				account4.department = department3;
				account4.Position = position3;
				account4.CreateDate = LocalDate.of(2019, 10, 24);
				
				Account [] accounts= {account1, account2,account3,account4};
				
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
//				create type question
				TypeQuestion typequestion1 = new TypeQuestion();
				typequestion1.Id = 1;
				typequestion1.Name = "TuLuan";
				
				TypeQuestion typequestion2 = new TypeQuestion();
				typequestion2.Id = 2;
				typequestion2.Name = "TracNghiem";
						
				TypeQuestion typequestion3 = new TypeQuestion();
				typequestion3.Id = 3;
				typequestion3.Name = "ThucHanh";
				
//				create categoryquestion
				CategoryQuestion categoryquestion1 = new CategoryQuestion();
				categoryquestion1.Id = 1;
				categoryquestion1.Name = "Java";
						
				CategoryQuestion categoryquestion2 = new CategoryQuestion();
				categoryquestion2.Id = 2;
				categoryquestion2.Name = "C#";
							
				CategoryQuestion categoryquestion3 = new CategoryQuestion();
				categoryquestion3.Id = 3;
				categoryquestion3.Name = "SQL";
				
//				create question
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
				
//				create answer
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
				
//				create exam
				Exam exam1 = new Exam();
				exam1.Id = 1;
				exam1.Code = "A1";
				exam1.Title= "Kiemtra1";
				exam1.Category = categoryquestion2;
				exam1.Duration = 60;
				exam1.Creator = account2;
				exam1.CreateDate = LocalDate.of(2019, 12, 23);
				
				
				Exam exam2 = new Exam();
				exam2.Id = 2;
				exam2.Code = "A2";
				exam2.Title= "Kiemtra2";
				exam2.Category = categoryquestion1;
				exam2.Duration = 90;
				exam2.Creator = account1;
				exam2.CreateDate = LocalDate.of(2019, 10, 23);
				
				
				Exam exam3 = new Exam();
				exam3.Id = 3;
				exam3.Code = "A3";
				exam3.Title= "Kiemtra3";
				exam3.Category = categoryquestion3;
				exam3.Duration = 120;
				exam3.Creator = account1;
				exam3.CreateDate = LocalDate.of(2019, 9, 23);

				Exam[] examsOfQuestion1 = { exam1, exam2 };
				question1.exams = examsOfQuestion1;

				Exam[] examsOfQuestion2 = { exam2, exam3 };
				question2.exams = examsOfQuestion2;

				Exam[] examsOfQuestion3 = { exam1, exam3 };
				question3.exams = examsOfQuestion3;

				Question[] questionsOfExam1 = { question1, question3 };
				exam1.questions = questionsOfExam1;

				Question[] questionsOfExam2 = { question1, question2 };
				exam2.questions = questionsOfExam2;

				Question[] questionsOfExam3 = { question2, question3 };
				exam3.questions = questionsOfExam3;

				
////				Q1:
//				if (account2.department == null) {
//					System.out.println("nhân viên này chưa có phòng ban");
//				} else {
//					System.out.println("Phòng ban của nhân viên này là: " +account2.department.Name);
//				}
//					
	
////				Q2 :
//				if (account2.Groups == null) {
//					System.out.println("nhân viên này chưa có group");
//				} else if (account2.Groups.length == 1 || account2.Groups.length ==2 ) {
//					System.out.println("Group của nhân viên này là: " );
//					for (Group group : groupsofaccount2 ) {
//						System.out.println(group.Name);}
//					} else if (account2.Groups.length == 3) {
//						System.out.println("Nhân viên này là người quan trọng,..");
//					} else {
//							System.out.println("nhân viên này ...");
//						}
////					Q3: toán tử ternary
//				System.out.println(account2.department == null? "nhân vien này ..." : 
//					"phòng ban của..." +account2.department.Name);
//				Q4:
//				System.out.println(account1.Position.name == PositionName.DEV? "day la dev" :
//					"ko phai dev");
//				
//				q5:
//				switch (group1.accounts.length) {
//				case 1:
//					System.out.println("1 thanh vien");
//					break;
//				case 2:
//					System.out.println("2 thanh vien");
//					break;
//				case 3:
//					System.out.println("3 thanh vien");
//					break;
//				default :
//					System.out.println("nhieu thanh vien");
//				
//				break;
				
////				q6:
//				switch (account2.Groups.length) {
//				case 0:
//					System.out.println("0 co group");
//					 break;
//				case 1:	
//				case 2:	
//					System.out.println("Group la:" );
//					for (Group group : groupsofaccount2) {
//						System.out.println(group.Name);}
//					break;
//				case 3:
//					System.out.println("case3");
//					break;
//				default :
//					System.out.println("default");
//					break;
//					}
					
//				
				
//				Q8:
//				Account[] accounts = { account1, account2, account3 };
//				int i = 1;
//				for (Account account : accounts) {
//					System.out.println("Thông tin account thứ " + i + " là:");
//					System.out.println("Email: " + account.email);
//					System.out.println("Full Name: " + account.fullname);
//					System.out.println("Phòng ban: " + account.department.Name);
//					System.out.println("\n");
//					i++;
//				}
				
////	Q9:
//				Department[] department = {department1, department2, department3};
//				int i =1;
//				for (Department departmentt : department) {
//					System.out.println("Thông tin department thứ " + i +"là");
//					System.out.println("id :" + departmentt.Id);
//					System.out.println("Name: " + departmentt.Name);
//					i++;
//				}
				
//				Q10:
//				
//				for (int i = 0; i < accounts.length; i ++) {
//				System.out.println("Thông tin account thứ " + (i + 1) + " là:");
//				System.out.println("Email: " + accounts[i].email);
//				System.out.println("Full Name: " + accounts[i].fullname);
//				System.out.println("Phòng ban: " + accounts[i].department.Name);
//				
//			}
//			  	Q11:
//				
//				for (int i= 1 ; i< departments.length; i ++ ) {
//					System.out.println("Thông tin department thứ " + i + " là");
//					System.out.println("Id :" + departments[i].Id);
//					System.out.println("Name: " + departments[i].Name);
//					
//				}
//				Q12:
//				
//				for (int i = 1; i < 3; i ++) {
//					System.out.println("Thông tin account thứ " + i + " là:");
//					System.out.println("Email: " + accounts[i].email);
//					System.out.println("Full Name: " + accounts[i].fullname);
//					System.out.println("Phòng ban: " + accounts[i].department.Name);
				
//				Q13:
//				for (int i = 0; i < accounts.length;  i ++) {
//					if (i == 1) {
//						continue;
//					}
//					System.out.println("Thông tin account thứ " + (i + 1) + " là:");
//					System.out.println("Email: " + accounts[i].email);
//					System.out.println("Full Name: " + accounts[i].fullname);
//					System.out.println("Phòng ban: " + accounts[i].department.Name);
//}
//					Q14:
//				for (int i = 0; i < accounts.length ;  i ++) {
//					if (accounts[i].Id <4) {
//					System.out.println("Thông tin account thứ " + (i + 1) + " là:");
//					System.out.println("Email: " + accounts[i].email);
//					System.out.println("Full Name: " + accounts[i].fullname);
//					System.out.println("Phòng ban: " + accounts[i].department.Name);
//				
//	}		
//	
//				}			
	
//	
////					Q15:
//				for (int i=0; i<=20; i++) {
//					if(i % 2 == 0) {
//						System.out.println(i);
//					}
//				}
	
				
//				Q16:
//				int i = 0; i++ ;
//				do {
//					System.out.println("Thông tin account thứ " + (i + 1) + " là:");
//					System.out.println("Email: " + accounts[i].email);
//					System.out.println("Full Name: " + accounts[i].fullname);
//					System.out.println("Phòng ban: " + accounts[i].department.Name);
//					break;
//				} while (i < accounts.length);
//				
//				int i = 0;
//				while (i < accounts.length) {
//					System.out.println("Thông tin account thứ " + (i + 1) + " là:");
//					System.out.println("Email: " + accounts[i].email);
//					System.out.println("Full Name: " + accounts[i].fullname);
//					System.out.println("Phòng ban: " + accounts[i].department.Name);
//					i++ ;
//				}
//					phần do và while giống hệt phần for chỉ thay lại 1 số chỗ nên e làm 2 bài thôi vì thời
//				gian có hạn :D
//				
//				
//				EX2:
////				Q1:
//				int i=5;
//				System.out.printf("%d %n", i);
//				
				
////				Q2:
//				int a= 100000000;
//				System.out.printf(Locale.US, "%,d %n", a);
//				
////				Q3:
//				float c = 5.5676767f ;
//			System.out.printf("%.4f%n", c);
//			
////			Q4:
//				String hoten = "Nguyễn Văn A";
//				System.out.println("Tên tôi là: " + hoten + " và tôi đang độc thân");
//	Q5:
//				String pattern = "dd/MM/yyyy HH:mm:ss";
//				SimpleDateFormat simpleDateFormat = new SimpleDateFormat(pattern);
//				String date = simpleDateFormat.format(new Date());
//				System.out.println(date);
				
				
//				Ex3: Dateformat
				
//	q1:
//				System.out.println("Question 1:");
//				System.out.println("Thông tin account thứ 1:");
//				System.out.println("ID: " + account1.Id);
//				System.out.println("Email: " + account1.email);
//				System.out.println("User Name: " + account1.username);
//				System.out.println("Full Name: " + account1.fullname);
//				Locale locale = new Locale("vi", "VN");
//				DateFormat dateFormat = DateFormat.getDateInstance(DateFormat.DEFAULT, locale);
//				ZoneId defaultZoneId = ZoneId.systemDefault();
//				Date date = Date.from(account1.CreateDate.atStartOfDay(defaultZoneId).toInstant());
//				String createDate1 = dateFormat.format(date);
//				System.out.println("Create Date: " + createDate1);
//				System.out.println("\n");
//	
	
	
//	Ex4: Random number
//				Q1:
//				Random random = new Random();
//				int x = random.nextInt();
//				System.out.println(x);
////				Q2:
//				Random random = new Random();
//				float a = random.nextFloat();
//				System.out.println(a);
//				
////				Q3:
//				String[] studentList = { "Lại Tuấn Đạt", "Nguyễn Văn Điển", "Đặng Thìn Đông", "Nguyễn Mạnh Dũng",
//						"Nguyễn Văn Hiến", "Nguyễn Minh Hiếu", "Ngô Xuân Hoàn", "Nguyễn Nguyên Lộc", "Nguyễn Tuấn Minh",
//						"Nguyễn Khắc Tiến", "Hoàng Anh Tú", "Lê Thanh Tùng", "An Toàn Việt" };
//				int index = random.nextInt(studentList.length);
//				System.out.println(studentList[index]);
//				
				
//				Q4:
				
//				int minDate = (int) LocalDate.of(1995, 7, 24).toEpochDay();
//				int maxDate = (int) LocalDate.of(2020, 12, 20).toEpochDay();
//
//				long randomLong = minDate + random.nextInt(maxDate - minDate);
//
//				LocalDate randomDate = LocalDate.ofEpochDay(randomLong);
//				System.out.println(randomDate);
//				int today = (int) LocalDate.now().toEpochDay();
//
//				long randomLong = today - (int) (Math.random() * 365);
//
//				LocalDate randomDate = LocalDate.ofEpochDay(randomLong);
//				System.out.println(randomDate);
				
//				 
//				int i = random.nextInt(999 - 100 + 1) + 100;
//				System.out.println(i);
//	
				
//	ex5 input for console
//				Q1
//				Scanner scanner = new Scanner(System.in);
//				System.out.println("Moi ban nhap vao so nguyen thu nhat");
//				int int1 = scanner.nextInt();
//				System.out.println("Number1: " + int1);
//
//				System.out.print("Moi ban nhap vao so nguyen thu hai: ");
//				int int2 = scanner.nextInt();
//				System.out.println("Number 2: " + int2);
//
//				System.out.print("Moi ban nhap vao so nguyen thu ba: ");
//				int int3 = scanner.nextInt();
//				System.out.println("Number 3: " + int3);
				
//				Q2:
//				Scanner scanner = new Scanner(System.in);
//				System.out.println("Mời bạn nhập vào sơ thực thứ nhất");
//				float float1 = scanner.nextFloat();
//				System.out.println("Number1: " + float1);
//				System.out.println("Mời bạn nhập vào sơ thực thứ hai");
//				float float2 = scanner.nextFloat();
//				System.out.println("Number2: " + float2);
//				
//	
//	Q3:
				
//				Scanner scanner = new Scanner(System.in);
//				System.out.println("Mời bạn nhập vào họ tên: ");
//				String string1 = scanner.nextLine();
//				System.out.println(string1);

//	Q4: 
////				Q5:
//				Scanner scanner = new Scanner(System.in);
//				Account account = new Account();
//				System.out.println("Mời bạn nhập vào id: ");
//				int id = scanner.nextInt();
//				account.Id =id;
//				System.out.println("Mời bạn nhập vào email:");
//				String email = scanner.next();
//				account.email = email;
//				System.out.println("Mời bạn nhập vào username:");
//				String username = scanner.next();
//				account.username = username;
//				System.out.println("Mời bạn nhập vào fullname:");
//				String fullname = scanner.next();
//				account.fullname = fullname;
//				System.out.println("Mời bạn nhập vào position:");
//				int position = scanner.nextInt();
//				
//				System.out.println("Tạo thành công");
//				System.out.println("Thông tin account:");
//				System.out.println("Id: " + account.Id);
//				System.out.println("Email: " + account.email);
//				System.out.println("Username: " + account.username);
//				System.out.println("Fullname: " + account.fullname);
//				
//				switch(position) {
//				case 1:
//					System.out.println("DEV");
//					break;
//				case 2:
//					System.out.println("TEST");
//					break;
//				case 3:
//					System.out.println("SCRUMMASTER");
//					break;
//				case 4:
//					System.out.println("PM");
//					break;
//				default:
//					break;
//				}
				
//				Q6:
//				Scanner scanner = new Scanner(System.in);
//				Department department = new Department();
//				System.out.println("Mời bạn nhập vào id phòng ban:");
//				int id = scanner.nextInt();
//				id = department.Id;
//				System.out.println("Mời bạn nhập vào tên phòng ban:");
//				String name = scanner.next();
//				name = department.Name;
//				System.out.println("Tạo thành công");
//				System.out.println("Id: " + department.Id);
//				System.out.println("Department Name: " + department.Name);
				
				
//				Q7:
//				Scanner scanner = new Scanner(System.in);
//				int input;
//
//				do {
//					System.out.println("Moi ban nhap vao mot so chan:");
//					input = scanner.nextInt();
//
//					if (input % 2 != 0) {
//						System.out.println("So ban vua nhap la so le, moi ban nhap lai!");
//					} else {
//						System.out.println("So ban vua nhap hop le!");
//					}
//				} while (input % 2 != 0);
				
//				Q8:
				
					
				

	}
}
	

				

				
						
	
	
	
	


 