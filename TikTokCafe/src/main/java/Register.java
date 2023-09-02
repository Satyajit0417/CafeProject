import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Register extends HttpServlet {
	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		response.setContentType("text/html");
		PrintWriter out = response.getWriter();

		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String mobile = request.getParameter("mobile");
		String password = request.getParameter("password");

		try {
			database db = new database();
			db.connectdb();

			String insert = db.Insert("insert into user(name,email,mobile,password) values('" + name.toString() + "','"
					+ email.toString() + "','" + mobile.toString() + "','" + password.toString() + "')");
			response.setContentType("text/html");
			out.println("<script type=\"text/javascript\">");
			out.println("alert('Welcome to Tik Tok Cafe ! Now You Can Login Using Email And Password');");
			out.println("location='./views/MainMaster.jsp';");
			out.println("</script>");

		} catch (Exception e) {
			System.out.println(e);
		}

		out.close();
	}

}