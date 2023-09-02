
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
@WebServlet("/bookTables1")
public class bookTables1 extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public bookTables1() {
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

		
		String tableNumber = request.getParameter("tableNumber");
		String IsBooked = "no";

		try {
			database db = new database();
			String result = db.connectdb();

			String update = db
					.Update("update totaltables set IsBooked = 'no' where TableId='" + tableNumber.toString() + "' ");

			out.println(update);
			
			

			response.setContentType("text/html");
			out.println("<script type=\"text/javascript\">");
			out.println("alert('Table Release');");
			out.println("location='./views/bookTableList.jsp';");
			out.println("</script>");
		} catch (Exception e) {
			System.out.println(e);
		}

		out.close();

	}

}
