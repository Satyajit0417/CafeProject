<%@page import="java.util.ArrayList"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<!doctype html>
<html lang="en">
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
<link rel="stylesheet" href="../css/Main.css">
<link rel="stylesheet" href="../css/admin.css">
<title>Tik Tok Cafe | Dashboard</title>
</head>
<body>
	<nav class="navbar navbar-expand-lg navbar-light ">
		<a class="navbar-brand demo" href="#">TikTok Cafe</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>

		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav mr-auto">
				<li class="nav-item active"><a class="nav-link"
					href="MenuCard.jsp">Dashboard</a></li>
				<li class="nav-item "><a class="nav-link"
					href="addEmployee.jsp">Add Employee</a></li>
				<li class="nav-item "><a class="nav-link"
					href="Employeelist.jsp">Employees</a></li>
				<li class="nav-item "><a class="nav-link"
					href="GenerateSalaries.jsp">Salaries</a></li>
				<li class="nav-item "><a class="nav-link" href="Reports.jsp">Reports</a></li>
				<li class="nav-item "><a class="nav-link"
					href="feedbackView.jsp">FeedBacks </a></li>
				<li class="nav-item "><a class="nav-link" href="MainMaster.jsp">Log
						Out </a></li>
			</ul>
		</div>
	</nav>
	<hr>
	<%
	Connection con = null;
	Statement userst = null;
	Statement empst = null;
	Statement orderemp = null;
	String dburl = "jdbc:mysql://localhost:3306/Cdac";
	String dbname = "root";
	String dbpassword = "Cdac@123";
	String dbdriver = "com.mysql.cj.jdbc.Driver";
	try {
		Class.forName(dbdriver);
		con = DriverManager.getConnection(dburl, dbname, dbpassword);
		userst = con.createStatement();
		String usersql = "select * from user";
		ResultSet userRs = userst.executeQuery(usersql);

		int userCount = 0;
		while (userRs.next()) {
			userCount += 1;
		}

		String empsql = "select * from employee";
		ResultSet empRs = userst.executeQuery(empsql);
		int empCount = 0;
		while (empRs.next()) {
			empCount += 1;
		}

		String ordersql = "select * from takeOrder";
		ResultSet orderRs = userst.executeQuery(ordersql);
		int orderCount = 0;
		while (orderRs.next()) {
			orderCount += 1;
		}
	%>


	<div class="container dashboard-top">
		<div class="row">
			<div class="col-sm-4">
				<div class="DashboardCountCards">
					<h6 class="mt-3">Total Users</h6>
					<h4 class="text-warning mt-2"><%=userCount%></h4>
				</div>
			</div>
			<div class="col-sm-4">
				<div class="DashboardCountCards">
					<h6 class="mt-3">Total Orders</h6>
					<h4 class="text-warning mt-2"><%=orderCount%></h4>
				</div>
			</div>
			<div class="col-sm-4">
				<div class="DashboardCountCards">
					<h6 class="mt-3">Total Employees</h6>
					<h4 class="text-warning mt-2"><%=empCount%></h4>
				</div>
			</div>

		</div>
		<hr>
	</div>
	<%
	} catch (Exception ex) {
	out.println(ex);
	}
	%>
	<div class="container DashboardTodaysOrders" style="overflow-x: auto;">
		<h3>
			<center>Todays Orders</center>
		</h3>



		<table class="table" >
			<thead>
				<tr class="table-warning">
					<th scope="col">Order Id</th>
					<th scope="col">Customer</th>
					<th scope="col">Order</th>
					<th scope="col">Status</th>
				</tr>
			</thead>
			<tbody>
				<%
				ArrayList<String> items = new ArrayList();

				DateFormat df = new SimpleDateFormat("d/M/yyyy");
				Date dateobj = new Date();
				String current_date = df.format(dateobj);
				String ordersql = "select * from takeOrder where date='" + current_date.toString() + "'";
				ResultSet orderRs = userst.executeQuery(ordersql);
				String previous_user = "";
				try {
					while (orderRs.next()) {

						String id = orderRs.getString("orderId");
						String name = orderRs.getString("userName");

						String order = orderRs.getString("item");
						String status = orderRs.getString("status");
						
						previous_user = name;
				%>
				<tr>
					<th scope="row"><%=id%></th>
					<td><%=name%></td>
					<td><%=order%></td>
					<td><%=status%></td>
				</tr>

				<%
				
				}
				} catch (Exception e) {
				out.println(e);
				}
				%>
			</tbody>
		</table>

		<hr>
	</div>

	<!-- Optional JavaScript -->
	<!-- jQuery first, then Popper.js, then Bootstrap JS -->
	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
		integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js"
		integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js"
		integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
		crossorigin="anonymous"></script>
</body>
</html>