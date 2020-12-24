package entity;

public class Manager extends User {
	@Override
	public String toString() {
		return "Manager [Expinyear=" + Expinyear + ", toString()=" + super.toString() + "]";
	}

	private int Expinyear;

	public Manager(int id, String firstname, String lastname, String email, String password, int expinyear) {
		super(id, firstname, lastname, email, password);
		Expinyear = expinyear;
	}

	

	public int getExpinyear() {
		return Expinyear;
	}

	public void setExpinyear(int expinyear) {
		Expinyear = expinyear;
	}

}