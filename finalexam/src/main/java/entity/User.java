package entity;

public class User extends Project {
	private int id;
	private String Firstname;
	private String Lastname;
	public User(int id, String firstname, String lastname, String email, String password) {
		super();
		this.id = id;
		Firstname = firstname;
		Lastname = lastname;
		Email = email;
		Password = password;
	}
	private String Email;
	private String Password;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	
	public String getPassword() {
		return Password;
	}
	public void setPassword(String password) {
		Password = password;
	}
	
	public String getFirstname() {
		return Firstname;
	}
	@Override
	public String toString() {
		return "User [id=" + id + ", Firstname=" + Firstname + ", Lastname=" + Lastname + ", Email=" + Email
				+ ", Password=" + Password + ", projectId=" + projectId + ", teamSize=" + teamSize + ", idManager="
				+ idManager + ", idEmployees=" + idEmployees + "]";
	}
	public void setFirstname(String firstname) {
		Firstname = firstname;
	}
	public String getLastname() {
		return Lastname;
	}
	public void setLastname(String lastname) {
		Lastname = lastname;
	}
	
	
	public User() {
		super();
	}
	public String getEmail() {
		return Email;
	}
	public void setEmail(String email) {
		Email = email;
	}
	
}
