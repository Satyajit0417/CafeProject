<%@page import="java.io.PrintWriter"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
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
<title>Tik Tok Cafe | BookTable List</title>
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
				<li class="nav-item "><a class="nav-link"
					href="markPresenty.jsp">mark Presenty</a></li>
				<li class="nav-item "><a class="nav-link"
					href="TakeOrder.jsp">Take Order</a></li>
				<li class="nav-item active"><a class="nav-link"
					href="BookTableList.jsp">BookTable List</a></li>
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
					<th scope="col">BookId</th>
					<th scope="col">Name</th>
					<th scope="col">Mobile</th>
					<th scope="col">Table Number</th>
					<th scope="col">Date</th>
					<th scope="col">IsBooked</th>
					

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
					try{
						Class.forName(dbdriver);
						con = DriverManager.getConnection(dburl, dbname, dbpassword);
						st = con.createStatement();
						String usersql = "select * from Booktable";
						ResultSet rs = st.executeQuery(usersql);	
						int userCount = 0;
						while(rs.next()){
							String id=rs.getString("bookingId");
							String name=rs.getString("name");
							String mobile=rs.getString("mobile");
							String tablen=rs.getString("tableNumber");
							String date=rs.getString("date");
						    String book =rs.getString("IsBooked");
							
							
							
							
							
					%>
				<tr>
					<th scope="row"><%=id %></th>
					<td><%=name %></td>
					<td><%=mobile %></td>
					<td><%=tablen %></td>
	     			<td><%=date %></td>
	     			<td><%=book %></td>
					
					
					</tr>
					<%	}	
					}catch(Exception e) {
						out.println(e); 
						} %>
			</tbody>
		</table>
	</div>
	<hr>
	<div class="bookTableContainer">
	<h3>Release Table</h3>
			<form action="../bookTables1" method="post">
			<div class="mb-3">
					<label for="tableNumber" class="form-label">Table Numbers</label>
					 <input
						type="number" class="form-control" id="tableNumber"
						name="tableNumber">
				</div>
		              <input type="submit" class="btn btn-primary" value="ReleaseTable" name="tableNumber">
			</form>

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