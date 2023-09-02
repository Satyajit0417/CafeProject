<%@page import="java.util.ArrayList"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%--@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"--%>

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
<title>Tik Tok Cafe |Generate Bill</title>
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
				<li class="nav-item "><a class="nav-link" href="TakeOrder.jsp">Take
						Orders</a></li>
				<li class="nav-item "><a class="nav-link"
					href="markPresenty.jsp">Mark Presenty</a></li>

				<li class="nav-item "><a class="nav-link" href="yourOrders.jsp">Your
						Orders</a></li>
				<li class="nav-item "><a class="nav-link" href="MainMaster.jsp">Log
						Out </a></li>
			</ul>
		</div>
	</nav>
	<hr>

	<div class="container salariesMainDiv">

		<center>
			<h3>Generate Bill</h3>
		</center>


		<div class="container">
			<table class="table">


				<thead>
					<tr class="table-warning">

						<th scope="col">Staff Id</th>
						<th scope="col">Quantity</th>
						<th scope="col">Item</th>
						<th scope="col">Table No</th>
						<th scope="col">Item Price</th>
						<th scope="col">Size</th>
						<th scope="col">Total Bill</th>


					</tr>
				</thead>


				<tbody>

					<%
					Connection con = null;
					Statement st = null;
					Statement st1 = null;

					String dburl = "jdbc:mysql://localhost:3306/Cdac";
					String dbname = "root";
					String dbpassword = "Cdac@123";
					String dbdriver = "com.mysql.cj.jdbc.Driver";
					System.out.print("hello");
					
					DateFormat df = new SimpleDateFormat("dd/M/yyyy");
					Date dateobj = new Date();
					String current_date = df.format(dateobj);

					String uname = (String) session.getAttribute("username");
					String tableNO = (String) session.getAttribute("tableNo");
					String staffId = (String) session.getAttribute("staffId");
					int finalBill = 0;
					 
					
					try {
						Class.forName(dbdriver);
						con = DriverManager.getConnection(dburl, dbname, dbpassword);
						st = con.createStatement();
						String sql = "select * from takeOrder where  userName = '" + uname.toString() + "'and tableNumber = '"
						+ tableNO.toString() + "'and staffId = '" + staffId.toString()
						+ "' ";
						
						ResultSet rs = st.executeQuery(sql);
					
						
						st1 = con.createStatement();
						String sql1 = "select * from menuitems ";
						ResultSet rs1 = st1.executeQuery(sql1);
						int total = 0;
						

						while (rs.next()) {
							String id = rs.getString("staffId");
							String tableNo = rs.getString("tableNumber");
							String item = rs.getString("item");
							String qty = rs.getString("quantity");
							String size = rs.getString("halfFull");
							String date = rs.getString("date");
						
							while (rs1.next()) {
						if (item.equals(rs.getString("item"))) {

							total = Integer.parseInt(rs1.getString("price")) * Integer.parseInt(qty);
							finalBill = finalBill + total;
						}
						
					%>
					<tr>

						<td><%=id%></td>
						<td><%=qty%></td>
						<td><%=item%></td>
						<td><%=tableNo%></td>
						<td><%=rs1.getString("price")%></td>
						<td><%=size%></td>
						<td><%=total%></td>
					</tr>

					<%
					break;
					}
					
						

					} 
					}catch (Exception ex) {
					out.println();
					}
					%>
				</tbody>
			</table>
		</div>

		<form action="../GenerateBill" method="post">
			<div class="row">

				<div class="col-md-5"></div>
				<div class="col-md-2">
					<div class="mb-1">
						<label><b>Final Bill</b></label>
					</div>
				</div>
				<div class="col-md-2">
					<div class="mb-2">
						<input type="text" value="<%=finalBill %>" name="totalBill"
							id="bill" class="form-control">
					</div>
				</div>
				<div class="col-md-3">
					<input type="submit" class="btn btn-primary" value="Generate"
						name="finalbill">
				</div>
			</div>
		</form>

	</div>


	<!-- Copyright -->
	</footer>

	<script>
		function showList() {
			var orderListBox = document.getElementById("orderList");
			if (orderListBox.style.display === "none") {
				orderListBox.style.display = "block";
			} else {
				orderListBox.style.display = "none";
			}
		}
	</script>


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