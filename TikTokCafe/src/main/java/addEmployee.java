
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class addEmployee
 */
@WebServlet("/addEmployee")
public class addEmployee extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		PrintWriter out = response.getWriter();
		

		String name = request.getParameter("ename");
		String email = request.getParameter("Eemail");
		String mobile = request.getParameter("emobile");
		String address = request.getParameter("eaddress");
		String jdate = request.getParameter("jdate");
		String idproof = request.getParameter("idproof");
		String profile = request.getParameter("profile");
		String salary = request.getParameter("salary");
		String password = request.getParameter("password");
		
		try {
			database db = new database();
			String result = db.connectdb();

			String insert = db.Insert(
					"insert into employee(ename,Eemail,emobile,eaddress,joinedDate,IdProof,eprofile,password,salary) "
							+ "values('" + name.toString() + "','" + email.toString() + "','" + mobile.toString()
							+ "','" + address.toString() + "','" + jdate.toString() + "','" + idproof.toString() + "','"
							+ profile.toString() + "','" + password.toString() + "','" + salary.toString() + "')");
			response.setContentType("text/html");
			out.println("<script type=\"text/javascript\">");
			out.println("alert('Employee Added Successfully');");
			out.println("location='./views/addEmployee.jsp';");
			out.println("</script>");

		} catch (Exception e) {
			System.out.println(e);
		}

		out.close();

	}

}
