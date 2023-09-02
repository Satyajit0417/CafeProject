
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
<title>Tik Tok Cafe |Mark Presenty</title>
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
					
					<li class="nav-item active"><a class="nav-link"
					href="yourOrders.jsp">Yours Orders</a></li>
					<li class="nav-item active"><a class="nav-link"
					href="bookTableList.jsp">BookDetails</a></li>
				<li class="nav-item "><a class="nav-link" href="MainMaster.jsp">Log
						Out </a></li>
			</ul>
		</div>
	</nav>
	<hr>

	<div class="container" style="overflow-x: auto;">
		<table class="table">
			<thead>
				<tr class="table-warning">
					<th scope="col">Order Id</th>
					<th scope="col">Table Number</th>
					<th scope="col">Order</th>
					<th scope="col">Taken By</th>
					<th scope="col">Order Status</th>

				</tr>
			</thead>
			<tbody>
				<%

			Connection con = null;
			Statement st = null;
			

			String dburl = "jdbc:mysql://localhost:3306/Cdac";
			String dbname = "root";
			String dbpassword = "Cdac@123";
			String dbdriver = "com.mysql.cj.jdbc.Driver";
		
			try {
				
				DateFormat df = new SimpleDateFormat("d/M/yyyy");
				Date dateobj = new Date();
				String current_date = df.format(dateobj);
				
				Class.forName(dbdriver);
				con = DriverManager.getConnection(dburl, dbname, dbpassword);
				st = con.createStatement();
				
				
				String sql = "select * from takeOrder where  date='"+current_date+"'  order by  orderId desc";//and  staffId='"+session.getAttribute("id")+"' ";
				ResultSet rs = st.executeQuery(sql);
			
				

				while (rs.next()) {
					System.out.println("hell");
					

					String id = rs.getString("orderId");
					String tableNumber = rs.getString("tableNumber");

					String order = rs.getString("item");
					String staffId = rs.getString("staffId");
					String status = rs.getString("status");
					
					
					

				%>


				<tr>
					<th scope="row"><%=id %></th>
					<td><%=tableNumber %></td>
					<td><%=order %></td>
					<td>${name }</td>
					<form action ="../status" method="post">
					
					
					<td><button type="submit" class="btn btn-danger" name="status"   ><%=status %></button></td>
				</form>
				</tr>
		
				
					
				<%
				
				}
				} catch (Exception e) {
				out.println(e);
				}
				%>
			
				
			
			</tbody>
		</table>
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