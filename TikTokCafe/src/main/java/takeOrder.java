
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class takeOrder
 */
@WebServlet("/takeOrder")
public class takeOrder extends HttpServlet {
	private static final long serialVersionUID = 1L;

	database db = new database();

	private String dburl = "jdbc:mysql://localhost:3306/Cdac";
	private String dbname = "root";
	private String dbpassword = "Cdac@123";
	private String dbdriver = "com.mysql.cj.jdbc.Driver";

	Connection cn = null;
	java.sql.Statement st = null;

	final DateFormat df = new SimpleDateFormat("MM/dd/yyyy");
	final Calendar c = Calendar.getInstance();

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
		final DateFormat df = new SimpleDateFormat("MM/dd/yyyy");
		final Calendar c = Calendar.getInstance();
		String event = request.getParameter("add");

		try

		{
			if (event.equals("Add")) {

				String currentDate = c.get(Calendar.DAY_OF_MONTH) + "/" + (c.get(Calendar.MONTH) + 1) + "/"
						+ c.get(Calendar.YEAR);
				String currentTime = c.get(Calendar.HOUR_OF_DAY) + ":" + c.get(Calendar.MINUTE) + ":"
						+ c.get(Calendar.SECOND);

				db.connectdb();

				String staffId = request.getParameter("staffId");
				String tableNo = request.getParameter("tableno");
				String items = request.getParameter("items");
				String quantity = request.getParameter("quantity");
				String halfFull = request.getParameter("halfFull");
				String username = request.getParameter("username");
				String status = "In Process";

				HttpSession sessioForUser = request.getSession();

				sessioForUser.setAttribute("username", username);
				sessioForUser.setAttribute("tableNo", tableNo);
				sessioForUser.setAttribute("staffId", staffId);

				String insert = db.Insert(
						"insert into takeOrder(staffId,tableNumber,item,quantity,halfFull,userName,date,time,status) values('"
								+ staffId.toString() + "','" + tableNo.toString() + "','" + items.toString() + "','"
								+ quantity.toString() + "','" + halfFull.toString() + "','" + username.toString()
								+ "', '" + currentDate.toString() + "','" + currentTime.toString() + "','" + status
								+ "')");

				db.Insert(insert);

				response.setContentType("text/html");
				out.println("<script type=\"text/javascript\">");
				out.println("alert('Item Added Successfully');");
				out.println("location='./views/TakeOrder.jsp';");
				out.println("</script>");
			} 
			if(event.equals("Confirm And Generate Bill")){
				response.setContentType("text/html");
				out.println("<script type=\"text/javascript\">");
				out.println("location='./views/GenerateBills.jsp';");
				out.println("</script>");
			}

		} catch (Exception e) {
			System.out.println(e);
		}
//
	}

}
