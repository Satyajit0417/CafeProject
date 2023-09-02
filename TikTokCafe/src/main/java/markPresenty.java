
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class markPresenty
 */
@WebServlet("/markPresenty")
public class markPresenty extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		PrintWriter out = response.getWriter();

		HttpSession session = request.getSession();
		String EmpId = (String) session.getAttribute("id");
		String Empname = (String) session.getAttribute("name");

		request.setAttribute("id", EmpId);
		request.setAttribute("name", Empname);

		RequestDispatcher dispatcher = request.getRequestDispatcher("markPresenty.jsp");
		dispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String staffId = request.getParameter("empid");
		String staffName = request.getParameter("empname");
		String currentDate = request.getParameter("date");
		String presentAbsent = request.getParameter("presenty");
		String currentTime = request.getParameter("currenttime");

		PrintWriter out = response.getWriter();

		String btn = request.getParameter("addbtn");

		if (btn.equals("Mark Presenty")) {
			try {
				database db = new database();
				db.connectdb();

				String insert = db.Insert(
						"insert into presenty(staffId,staffName,presentyDate,presentyTime,absentPresent) values('"
								+ staffId.toString() + "','" + staffName.toString() + "','" + currentDate.toString()
								+ "','" + currentTime.toString() + "','" + presentAbsent.toString() + "')");
				response.setContentType("text/html");
				out.println("<script type=\"text/javascript\">");
				out.println("alert('Presenty Marked Successfully');");
				out.println("location='./views/TakeOrder.jsp';");
				out.println("</script>");

			} catch (Exception e) {
				System.out.println(e);
			}

		}

	}

}
