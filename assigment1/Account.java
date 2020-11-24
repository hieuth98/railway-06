package assigment1;

import java.time.LocalDate;
import java.util.Arrays;

public class Account {
	int Id;
	String email;
	String username;
	String fullname;
	Department department;
	Position Position;
	LocalDate CreateDate;
	Group[] Groups;
	@Override
	public String toString() {
		return "Account [Id=" + Id + ", email=" + email + ", username=" + username + ", fullname=" + fullname
				+ ", department=" + department + ", CreateDate=" + CreateDate + "]";
	
	
	}
	
	public boolean equals (Account account2) {
		if(Id == account2.Id
				&& fullname == account2.fullname) {
		
		return true;
	}else {
		return false;
	}
	}
	
}
