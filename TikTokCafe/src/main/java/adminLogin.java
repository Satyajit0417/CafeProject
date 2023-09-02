
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class adminLogin
 */
@WebServlet("/adminLogin")
public class adminLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private String dburl = "jdbc:mysql://localhost:3306/Cdac";
	private String dbname = "root";
	private String dbpassword = "Cdac@123";
	private String dbdriver = "com.mysql.cj.jdbc.Driver";

	Connection cn = null;
	java.sql.Statement st = null;

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		try {
			String email = request.getParameter("email");
			String password = request.getParameter("password");

			PrintWriter out = response.getWriter();

			Class.forName(dbdriver);
			cn = DriverManager.getConnection(dburl, dbname, dbpassword);
			Statement st = cn.createStatement();
			String sql = "select * from employee where Eemail = '" + email.toString() + "' and password = '"
					+ password.toString() + "'";
			ResultSet rs = st.executeQuery(sql);
			if (rs.next()) {
				response.setContentType("text/html");
				out.println("<script type=\"text/javascript\">");
				out.println("alert('Have A Nice Day Admin ! ');");
				out.println("location='./views/AdminDashboard.jsp';");
				out.println("</script>");
			} else {
				response.setContentType("text/html");
				out.println("<script type=\"text/javascript\">");
				out.println("alert('Please Enter Valid Credentials');");
				out.println("location='./views/MainMaster.jsp';");
				out.println("</script>");
			}
			out.close();
		} catch (Exception ex) {
			ex.printStackTrace();
		}

	}

}
