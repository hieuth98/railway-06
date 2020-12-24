package frontend;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.sql.SQLException;

import com.vti.Utils.JdbcUltils;

import backend.datalayer.UserRespository;

public class run {

	public static void main(String[] args) throws FileNotFoundException, ClassNotFoundException, IOException, SQLException {
		// TODO Auto-generated method stub
		UserRespository abc = new UserRespository();
		abc.login();

	}

}
