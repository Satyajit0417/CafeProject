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
<link rel="stylesheet" href="../css/user.css">
<title>Tik Tok Cafe | Book Table</title>
</head>
<body onload="CurrentDate()">
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
				<li class="nav-item "><a class="nav-link" href="MenuCard.jsp">Menu
						Card </a></li>
				<li class="nav-item active"><a class="nav-link"
					href="bookTable.jsp">Book Table </a></li>
				<li class="nav-item "><a class="nav-link" href="feedback.jsp">FeedBack
				</a></li>
				<li class="nav-item "><a class="nav-link" href="MainMaster.jsp">Log
						Out </a></li>
			</ul>
		</div>
	</nav>
    
	<div class="bookTable container ">
		<div class="avaliableTables">
		
		
			<h3>Avaliable Tables</h3>
			<table class="table-warning table-bordered" >
				<tbody>
				<tr>
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
						String sql = "select * from totaltables where IsBooked='no'";
						ResultSet rs = st.executeQuery(sql);

						while (rs.next())

						{
							String table_number = rs.getString("TableId");
							String totalSeats = rs.getString("Totalseats");	
							
							
							
					%>
					
						<td><%=table_number%></td>

					<%
						}
					}catch(Exception ex){
						ex.printStackTrace();
					}
					%></tr>
					
					
					
				</tbody>	
			</table>
		</div>
		<hr>
		<div class="bookTableContainer">
		
			<h3>Book Table</h3>
			<form action="../bookTables" method="post">
			<!--Slider -->
 <div id="carouselExampleControls" class="carousel slide"
		data-ride="carousel">
		<div class="carousel-inner">
			<div class="carousel-item active">
				<img class="d-block w-100 banner" src="../projectimg/table3.jpg"
					alt="First slide">
			</div>
			<div class="carousel-item">
				<img class="d-block w-100 banner" src="../projectimg/table2.jpg"
					alt="Second slide">
			</div>
			<div class="carousel-item">
				<img class="d-block w-100 banner" src="../projectimg/cafe.jpg"
					alt="Third slide">
			</div>
			<div class="carousel-item">
				<img class="d-block w-100 banner" src="../projectimg/table image.jpg"
					alt="Third slide">
			</div>
		</div>
		<a class="carousel-control-prev" href="#carouselExampleControls"
			role="button" data-slide="prev"> <span
			class="carousel-control-prev-icon" aria-hidden="true"></span> <span
			class="sr-only">Previous</span>
		</a> <a class="carousel-control-next" href="#carouselExampleControls"
			role="button" data-slide="next"> <span
			class="carousel-control-next-icon" aria-hidden="true"></span> <span
			class="sr-only">Next</span>
		</a>
	</div>
				<div class="mb-3">
					<label for="name" class="form-label">Name</label> <input
						type="text" class="form-control" id="name" name="name" value="${name }"
						aria-describedby="emailHelp">
				</div>
				<div class="mb-3">
					<label for="mobile" class="form-label">Mobile</label> <input
						type="text" class="form-control" id="mobile" name="mobile" value="${mobile }">
				</div>
				<div class="mb-3">
					<label for="date" class="form-label">Date</label> <input
						type="text" class="form-control" id="date" name="date">
				</div>

				<div class="mb-3">
					<label for="tableNumber" class="form-label">Table Numbers</label> <input
						type="number" class="form-control" id="tableNumber"
						name="tableNumber">
				</div>

				<input type="submit" class="btn btn-primary" value="Book">
				
			</form>
			
		</div>
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



	<script type="text/javascript">
		function CurrentDate() {
			var currentdate = new Date();

			var time = currentdate.getHours() + ":" + currentdate.getMinutes()
					+ ":" + currentdate.getSeconds();

			document.getElementById("date").value = currentdate.getUTCDate()
					+ "/" + (currentdate.getUTCMonth() + 1) + "/"
					+ currentdate.getUTCFullYear();

		}
	</script>
</body>
</html>