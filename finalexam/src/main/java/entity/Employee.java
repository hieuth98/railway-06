package entity;

public class Employee extends User {
	private String projectname;
	
	public Employee(int id, String firstname, String lastname, String email, String password, String projectname,
			String proskill) {
		super(id, firstname, lastname, email, password);
		this.projectname = projectname;
		this.proskill = proskill;
	}
	public Employee() {
		// TODO Auto-generated constructor stub
	}
	private String proskill;
	@Override
	public String toString() {
		return "Employee [projectname=" + projectname + ", proskill=" + proskill + ", toString()=" + super.toString()
				+ "]";
	}
	public String getProjectname() {
		return projectname;
	}
	public void setProjectname(String projectname) {
		this.projectname = projectname;
	}
	public String getProskill() {
		return proskill;
	}
	public void setProskill(String proskill) {
		this.proskill = proskill;
	}
}