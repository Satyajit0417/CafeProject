import java.sql.Connection;
import java.sql.DriverManager;

public class database {
	private String dburl = "jdbc:mysql://localhost:3306/Cdac";
	private String dbname = "root";
	private String dbpassword = "Cdac@123";
	private String dbdriver = "com.mysql.cj.jdbc.Driver";

	Connection cn = null;
	java.sql.Statement st = null;

//	function to connect to database
	public String connectdb() {
		try {
			Class.forName(dbdriver);
			cn = DriverManager.getConnection(dburl, dbname, dbpassword);
			return ("database connected");

		} catch (Exception ex) {
			return (ex.toString());
		}
	}

//	function to insert the records into database
	public String Insert(String sql) {

		try {
			st = cn.createStatement();
			st.executeUpdate(sql);
			return ("record inserted");
		} catch (Exception ex) {
			return (ex.toString());
		}
	}

//	function to update the records from the database
	public String Update(String sql) {
		try {
			st = cn.createStatement();
			st.executeUpdate(sql);
			return ("record updated");
		} catch (Exception ex) {
			return (ex.toString());
		}
	}

//	function to delete the records from the database
	public String Delete(String sql) {
		try {
			st = cn.createStatement();
			st.executeUpdate(sql);
			return ("record deleted");
		} catch (Exception ex) {
			return (ex.toString());
		}
	}

}
