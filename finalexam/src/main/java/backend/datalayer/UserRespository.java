package backend.datalayer;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;

import com.vti.Utils.JdbcUltils;

import entity.Employee;
import entity.Manager;
import entity.Project;
import entity.User;

public class UserRespository {
	JdbcUltils jdbcUltils;
	static Connection connection;

	public UserRespository() throws ClassNotFoundException, SQLException, FileNotFoundException, IOException {
		jdbcUltils = new JdbcUltils();
		connection = jdbcUltils.connect();
	}

	static List<User> users = new ArrayList<User>();
	static List<Project> projects = new ArrayList<Project>();

//	viet funtion de user nhap vao id project sau do in ra cac employee va manager trong project
//	e moi lam duoc phan login thoi phan nay van bi loi.
	
	public static void showallproject() throws SQLException {
		projects = new ArrayList<Project>();
		Statement statement = connection.createStatement();

		String querry = "SELECT * FROM Project";
		ResultSet resultSet = statement.executeQuery(querry);
		while (resultSet.next()) {
			projects.add(new Project(resultSet.getInt("ProjectId"), resultSet.getInt("Teamsize"),
					resultSet.getInt("idManager"), resultSet.getInt("idEmployees")));
		for (Project project : projects) {
			System.out.println(project);
		
		}
	}
	}
	public static void printemployeeandmanager(int a) throws SQLException {
		
	
	}



	public boolean checkemail(String email) {
		boolean checkinemail = false;
		for (int i = 0; i < email.length(); i++) {
			if (email.charAt(i) == '@') {
				checkinemail = true;
			}
		}
		if (email.length() >= 2 && checkinemail) {
			return true;

		} else {
			return false;
		}
	}

	public static void showAllUsers() throws SQLException {
		users = new ArrayList<User>();
		Statement statement = connection.createStatement();

		String querry = "SELECT * FROM User";
		ResultSet resultSet = statement.executeQuery(querry);
		while (resultSet.next()) {
			if (resultSet.getString("Role").equals("Manager")) {
				users.add(new Manager(
						resultSet.getInt("UserId"), 
						resultSet.getString("FirstName"), 
						resultSet.getString("LastName"),
						resultSet.getString("Email"), 
						resultSet.getString("Password"), 
						resultSet.getInt("ExpInYear")));
			} else { 
		
	
				users.add(new Employee(
						resultSet.getInt("UserId"),resultSet.getString("FirstName"),resultSet.getString("LastName"),
						resultSet.getString("Email"), resultSet.getString("Password"), resultSet.getString("ProSkill"),
						resultSet.getString("ProjectName")));
			}
		}

		for (User user : users) {
			if (user instanceof User) {
				System.out.println(user);
			} else if (user instanceof Employee) {
				Employee employee2 = (Employee) user;
				System.out.println(employee2.toString());
			} else if (user instanceof Manager) {
				Manager manager = (Manager) user;
				System.out.println(manager.toString());
			}

		}
	}

	public boolean checkpassword(String password) {
		boolean checkinpassword = false;
		for (int i = 0; i < password.length(); i++) {
			if (password.charAt(i) >= 'A' && password.charAt(i) <= 'Z') {
				checkinpassword = true;
			}
		}
		if (password.length() >= 6 && password.length() <= 12 && checkinpassword) {
			return true;

		} else {
			return false;
		}
	}

	public void login() throws SQLException {
		Scanner scanner = new Scanner(System.in);
		String email = "";
		while (true) {
			System.out.println("Moi ban nhap email");
			email = scanner.nextLine();
			if (checkemail(email)) {
				break;
			}
		}
		String password = "";
		while (true) {
			System.out.println("Moi ban nhap password");
			password = scanner.nextLine();
			if (checkpassword(password)) {
				break;
			}
		}
		showAllUsers();
		for (User user : users) {
			if (user.getEmail().equals(email) && user.getPassword().equals(password)) {
				System.out.println("dang nhap thanh cong");
				return;

			}

		}
		System.out.println("dang nhap khong thanh cong");

	}
}
