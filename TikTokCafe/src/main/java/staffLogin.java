
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class adminLogin
 */
@WebServlet("/stafflogin")
public class staffLogin extends HttpServlet {
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
			PrintWriter out = response.getWriter();

			String email = request.getParameter("staffemail");
			String password = request.getParameter("staffPassword");
			Class.forName(dbdriver);
			cn = DriverManager.getConnection(dburl, dbname, dbpassword);
			Statement st = cn.createStatement();
			String sql = "select * from employee where Eemail = '" + email.toString() + "' and password = '"
					+ password.toString() + "'";
			ResultSet rs = st.executeQuery(sql);
			if (rs.next()) {
				String empId = rs.getString("employeeId");
				String empname = rs.getString("ename");
				String empmobile = rs.getString("emobile");
				String empemail = rs.getString("Eemail");
				String empaddress = rs.getString("eaddress");
				String empjoinedDate = rs.getString("joinedDate");
				String empProfile = rs.getString("eprofile");
				String empSalary = rs.getString("salary");

				Date date = new Date();

				HttpSession session = request.getSession();
				session.setAttribute("id", empId);
				session.setAttribute("name", empname);
				session.setAttribute("mobile", empmobile);
				session.setAttribute("email", empemail);
				session.setAttribute("address", empaddress);
				session.setAttribute("jdate", empjoinedDate);
				session.setAttribute("profile", empProfile);
				session.setAttribute("salary", empSalary);
				session.setAttribute("cur_date", date);

//				out.println(date);

				response.setContentType("text/html");
				out.println("<script type=\"text/javascript\">");
				out.println("alert('WelCome Staff ! ');");
				out.println("location='./views/markPresenty.jsp';");
				out.println("</script>");
			} else {
				response.setContentType("text/html");
				out.println("<script type=\"text/javascript\">");
				out.println("alert('Please Enter Valid Credentials');");
				out.println("location='./views/MainMaster.jsp';");
				out.println("</script>");
			}
			out.close();
		} catch (Exception e) {
			System.out.println(e);

		}

	}

}
