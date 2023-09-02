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
<title>Tik Tok Cafe | Add Employee</title>
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
					href="AdminDashboard.jsp">Dashboard</a></li>
				<li class="nav-item "><a class="nav-link"
					href="addEmployee.jsp">Add Employee</a></li>
				<li class="nav-item active"><a class="nav-link"
					href="Employeelist.jsp">Employees</a></li>
				<li class="nav-item "><a class="nav-link"
					href="GenerateSalaries.jsp">Salaries</a></li>
				<li class="nav-item "><a class="nav-link" href="Reports.jsp">Reports</a></li>
				<li class="nav-item "><a class="nav-link" href="feedbackView.jsp">Feedbacks
				</a></li>
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
					<th scope="col">Id</th>
					<th scope="col">Name</th>
					<th scope="col">Email</th>
					<th scope="col">Mobile</th>
					<th scope="col">Address</th>
					<th scope="col">Profile</th>
					<th scope="col">Joined Date</th>
					<th scope="col">Salary</th>

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
						String usersql = "select * from employee";
						ResultSet rs = st.executeQuery(usersql);	
						int userCount = 0;
						while(rs.next()){
							String id=rs.getString("employeeId");
							String name=rs.getString("ename");
							String email=rs.getString("Eemail");
							String mobile=rs.getString("emobile");
							String address=rs.getString("eaddress");
							String profile = rs.getString("eprofile");
							String salary=rs.getString("salary");
							String jdate=rs.getString("joinedDate");
							
					%>
				<tr>
					<th scope="row"><%=id %></th>
					<td><%=name %></td>
					<td><%=email %></td>
					<td><%=mobile %></td>
					<td><%=address %></td>
					<td><%=profile %></td>
					<td><%=jdate %></td>
					<td><%=salary %></td>
					</tr>
					<%	}	
					}catch(Exception e) {
						out.println(e); 
						} %>
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