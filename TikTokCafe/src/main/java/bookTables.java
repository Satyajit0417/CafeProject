
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class bookTables
 */
@WebServlet("/bookTables")
public class bookTables extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public bookTables() {
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

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		PrintWriter out = response.getWriter();

		String name = request.getParameter("name");
		String mobile = request.getParameter("mobile");
		String date = request.getParameter("date");
		String tableNumber = request.getParameter("tableNumber");
		String isbooked = "yes";

		try {
			database db = new database();
			String result = db.connectdb();

			String insert = db.Insert("insert into booktable(name,mobile,date,TableNumber,IsBooked) " + "values('"
					+ name.toString() + "','" + mobile.toString() + "','" + date.toString() + "','"
					+ tableNumber.toString() + "','" + isbooked.toString() + "')");

			String update = db
					.Update("update totaltables set IsBooked = 'yes' where TableId='" + tableNumber.toString() + "' ");

			out.println(update);
			
			

			response.setContentType("text/html");
			out.println("<script type=\"text/javascript\">");
			out.println("alert('Table Booked');");
			out.println("location='./views/bookTable.jsp';");
			out.println("</script>");
		} catch (Exception e) {
			System.out.println(e);
		}

		out.close();

	}

}
