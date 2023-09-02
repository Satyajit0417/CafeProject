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
<title>Tik Tok Cafe |Take Orders</title>
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
					href="TakeOrder.jsp">Take Orders</a></li>
				<li class="nav-item "><a class="nav-link"
					href="markPresenty.jsp">Mark Presenty</a></li>
				<li class="nav-item "><a class="nav-link" href="yourOrders.jsp">Your
						Orders</a></li>
				<li class="nav-item active"><a class="nav-link"
					href="bookTableList.jsp">BookDetails</a></li>
				<li class="nav-item "><a class="nav-link" href="MainMaster.jsp">Log
						Out </a></li>
			</ul>
		</div>
	</nav>
	<hr>

	<div class="container salariesMainDiv">
		<form action="../takeOrder" method="post">
			<center>
				<h3>Take Order</h3>
			</center>

			<div class="row">
				<div class="col-md-2"></div>
				<div class="col-md-4">
					<div class="mb-2">
						<label for="menu">Staff Id</label> <input type="text"
							class="form-control" name="staffId" id="staffId" value="${id}">
					</div>
				</div>
				<div class="col-md-4">
					<div class="mb-2">
						<label for="username" class="form-label ">Name of User</label><input
							type="text" class="form-control addEmployeeTextbox"
							name="username" id="username">
					</div>
				</div>
				<div class="col-md-2"></div>
			</div>


			<div class="row">
				<div class="col-md-2"></div>
				<div class="col-md-4">
					<div class="mb-2">
						<label for="menu">Choose the menu :</label> <input list="menu"
							class="form-control" name="items" id="items">
						<datalist id="menu">
							<option value="Plain Veg Sandwich">Plain Veg Sandwich</option>
							<option value="Grill Veg Sandwich">Grill Veg Sandwich</option>
							<option value="Grill Pahadi Veg Sandwich">Grill Pahadi
								Veg Sandwich</option>
							<option value="Grill Garlic Veg Sandwich">Grill Garlic
								Veg Sandwich</option>
							<option value="Grill Chocolate Sandwich">Grill Chocolate
								Sandwich</option>
							<option value="Grill Veg Corn Sandwich">Grill Veg Corn
								Sandwich</option>
							<option value="Bombay Grill Veg Sandwich">Bombay Grill
								Veg Sandwich</option>
							<option value="Grill Chicken Sandwich">Grill Chicken
								Sandwich</option>
							<option value="Chicken Tandoori Sandwich">Chicken
								Tandoori Sandwich</option>
							<option value="Chicken Barbique Sandwich">Chicken
								Barbique Sandwich</option>

							<option value="Veg Burger" id="veg  burger">Veg Burger</option>
							<option value="Veg Garlic Burger">Veg Garlic Burger</option>
							<option value="Veg Spinach Corn Burger">Veg Spinach Corn
								Burger</option>
							<option value="Veg Tandoor Burger">Veg Tandoor Burger</option>
							<option value="Veg Barbique Burger">Veg Barbique Burger</option>
							<option value="Veg Punjabi Burger">Veg Punjabi Burger</option>
							<option value="Veg Paneer Burger">Veg Paneer Burger</option>
							<option value="Chicken Burger">Chicken Burger</option>
							<option value="Chicken Tandoori Burger">Chicken Tandoori
								Burger</option>
							<option value="Chicken Barbique Burger">Chicken Barbique
								Burger</option>
							<option value="Chicken Super Burger">Chicken Super
								Burger</option>
							<option value="Chicken Super Tandoor Burger">Chicken
								Super Tandoor Burger</option>
							<option value="Chicken Super Barbique Burge">Chicken
								Super Barbique Burger</option>

							<option value="Plain Cheese Pizza">Plain Cheese Pizza</option>
							<option value="Mix Veg Pizza">Mix Veg Pizza</option>
							<option value="Veg Corn Pizza">Veg Corn Pizza</option>
							<option value="Veg Paneer Cheese Pizza">Veg Paneer
								Cheese Pizza</option>
							<option value="Tik Tok Special Pizza">Tik Tok Special
								Pizza</option>
							<option value="Pizza With Extra Cheese">Pizza With Extra
								Cheese</option>
							<option value="Chicken Pizza">Chicken Pizza</option>
							<option value="Chicken Barbique Pizza">Chicken Barbique
								Pizza</option>
							<option value="Chicken Tandoor Pizza">Chicken Tandoor
								Pizza</option>

							<option value="Thik Cold Coffee">Thik Cold Coffee</option>
							<option value="Thik Cold Coffee with Crush">Thik Cold
								Coffee with Crush</option>
							<option value="Thik Cold Coffee with Ice-Cream">Thik
								Cold Coffee with Ice-Cream</option>

							<option value="Hot Coffee">Hot Coffee</option>
							<option value="Black Coffee">Black Coffee</option>
							<option value="Green Tea">Green Tea</option>
							<option value="Special Hot Coffee">Special Hot Coffee</option>

							<option value="Vanilla Shake">Vanilla Shake</option>
							<option value="Strawberry Shake">Strawberry Shake</option>
							<option value="Pista Shake">Pista Shake</option>
							<option value="ButterScotch Shake">ButterScotch Shake</option>
							<option value="Chocolate Shake">Chocolate Shake</option>
							<option value="Kit Kat Shake">Kit Kat Shake</option>

							<option value="Vanilla Icecream">Vanilla Icecream</option>
							<option value="ButterScotch Shake">ButterScotch Shake</option>

							<option value="French Fries">French Fries</option>
							<option value="Chicken Popcorn">Chicken Popcorn</option>
							<option value="Chicken Wings">Chicken Wings</option>
							<option value="Fish Fingers">Fish Fingers</option>
							<option value="Crabclaw">Crabclaw</option>


							<option value="Veg Roll">Veg Roll</option>
							<option value="Veg Tandoor Roll">Veg Tandoor Roll</option>
							<option value="Veg Spicy Roll">Veg Spicy Roll</option>
							<option value="Chicken Roll">Chicken Roll</option>
							<option value="Chicken Spicy Roll">Chicken Spicy Roll</option>
							<option value="Chicken Tandoor Roll">Chicken Tandoor
								Roll</option>

							<option value="Plain Maggi">Plain Maggi</option>
							<option value="Shejwan Maggi">Shejwan Maggi</option>
							<option value="Pasta">Pasta</option>

							<option value="Combo (Burger + Coffe + Fries)">Combo
								(Burger + Coffe + Fries)</option>
							<option value="Combo (Sandwich + Coffe + Fries)">Combo
								(Sandwich + Coffe + Fries)</option>
							<option value="Combo (Mix Veg Pizza + Coffe + Fries)">Combo
								(Mix Veg Pizza + Coffe + Fries)</option>
						</datalist>
					</div>
				</div>
				<div class="col-md-4">
					<div class="mb-2">
						<label for="quantity" class="form-label ">Quantity</label> <input
							type="text" class="form-control addEmployeeTextbox"
							name="quantity" id="quantity">
					</div>
				</div>
				<div class="col-md-2"></div>
			</div>

			<div class="row">
				<div class="col-md-2"></div>
				<div class="col-md-4">
					<div class="mb-2">
						<label for="tableno" class="form-label ">Table No</label><input
							type="text" class="form-control addEmployeeTextbox"
							name="tableno" id="tableno">
					</div>
				</div>
				<div class="col-md-4">
					<div class="mb-2">
						<label for="halfFull">Full / Half</label> <select
							class="form-control" name="halfFull">
							<option>Half</option>
							<option>Full</option>
						</select>
					</div>
				</div>
				<div class="col-md-2"></div>
			</div>

			<div class="row">
				<div class="col-md-5"></div>
				<div class="col-md-1">
					<div class="mb-2">
						<center>
							<input type="submit" class="btn btn-primary" value="Add"
								id="addItem" name="add">
						</center>
					</div>

				</div>

				<div class="col-sm-2">
					<div class="mb-2">
						<center>
							<a href="GenerateBills.jsp"> <input type="submit"
								href="GenerateSalaries.jsp" class="btn btn-primary" name="add"
								value="Confirm And Generate Bill" id="addItem">
							</a>
						</center>
					</div>
				</div>
				<div class="col-md-4"></div>
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