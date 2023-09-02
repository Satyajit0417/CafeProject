
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class GenerateSalary
 */
@WebServlet("/GenerateSalary")
public class GenerateSalary extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public GenerateSalary() {
		super();
		// TODO Auto-generated constructor stub
	}

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

		String name = request.getParameter("empname");
		String profile = request.getParameter("empprofile");
		String saldate = request.getParameter("saldate");
		String presentday = request.getParameter("presentdays");
		String absday = request.getParameter("absdays");
		String halfday = request.getParameter("halfday");
		String totalsal = request.getParameter("totalsal");
		String salPaid = request.getParameter("saltopay");

		try {
			database db = new database();
			db.connectdb();

			String insert = db.Insert(
					"insert into salarypaid(empName,empProfile,saldate,presentDays,absentDays,halfDay,totalSal,salaryPaid)"
							+ " values('" + name.toString() + "','" + profile.toString() + "','" + saldate.toString()
							+ "','" + presentday.toString() + "', " + " '" + absday.toString() + "','"
							+ halfday.toString() + "','" + totalsal.toString() + "','" + salPaid + "')");

			response.setContentType("text/html");
			out.println("<script type=\"text/javascript\">");
			out.println("alert('Salary Generated Successfully');");
			out.println("location='./views/GenerateSalaries.jsp';");
			out.println("</script>");

		} catch (Exception e) {
			System.out.println();
		}

	}

}
