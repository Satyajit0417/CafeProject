
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class GenerateBill
 */
@WebServlet("/GenerateBill")
public class GenerateBill extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public GenerateBill() {
		super();
		// TODO Auto-generated constructor stub
	}

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
		// TODO Auto-generated method stub
		Connection con = null;
		Statement st = null;
		PrintWriter out = response.getWriter();

		String dburl = "jdbc:mysql://localhost:3306/Cdac";
		String dbname = "root";
		String dbpassword = "Cdac@123";
		String dbdriver = "com.mysql.cj.jdbc.Driver";

		database db = new database();

		String bill = request.getParameter("totalBill");
		String event = request.getParameter("finalbill");
		HttpSession sessioForUser = request.getSession();
		if (event.equals("Generate")) {
			try {
				db.connectdb();

				String uname = (String) sessioForUser.getAttribute("username");
				String staffId = (String) sessioForUser.getAttribute("staffId");
				String tableNo = (String) sessioForUser.getAttribute("tableNo");

				String sql = db.Insert("insert into bills(staffId,tableNo,username,totalBill) values('"
						+ staffId.toString() + "'" + ",'" + tableNo.toString() + "','" + uname.toString() + "','"
						+ bill.toString() + "')");

				db.Insert(sql);

				response.setContentType("text/html");
				out.println("<script type=\"text/javascript\">");
				out.println("alert('Order Confirmed');");
				out.println("location='./views/TakeOrder.jsp';");
				out.println("</script>");

				sessioForUser.removeAttribute("username");
				sessioForUser.removeAttribute("tableNo");
				sessioForUser.removeAttribute("staffId");

			}

			catch (Exception e) {
				out.println(e);
			}
		}
	}

}
