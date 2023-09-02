
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
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class userLogin
 */
@WebServlet("/userLogin")
public class userLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	private String dburl = "jdbc:mysql://localhost:3306/Cdac";
	private String dbname = "root";
	private String dbpassword = "Cdac@123";
	private String dbdriver = "com.mysql.cj.jdbc.Driver";

	Connection cn = null;
	java.sql.Statement st = null;

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		try {
			String email = request.getParameter("email");
			String password = request.getParameter("password");
			PrintWriter out = response.getWriter();
			Class.forName(dbdriver);
			cn = DriverManager.getConnection(dburl, dbname, dbpassword);
			Statement st = cn.createStatement();
			String sql = "select * from user where email = '" + email.toString() + "' and password = '"
					+ password.toString() + "'";
			ResultSet rs = st.executeQuery(sql);

			if (rs.next()) {
				session.setAttribute("id", rs.getString("user_id"));
				session.setAttribute("name", rs.getString("name"));
				session.setAttribute("email", rs.getString("email"));
				session.setAttribute("mobile", rs.getString("mobile"));

				response.setContentType("text/html");
				out.println("<script type=\"text/javascript\">");
				out.println("alert('Welcome to Tik Tok Cafe !');");
				out.println("location='./views/MenuCard.jsp';");
				out.println("</script>");
			}

		} catch (Exception ex) {
			ex.printStackTrace();
		}

	}

}
