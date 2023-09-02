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
				<li class="nav-item active"><a class="nav-link"
					href="addEmployee.jsp">Add Employee</a></li>
				<li class="nav-item "><a class="nav-link"
					href="Employeelist.jsp">Employees</a></li>
				<li class="nav-item "><a class="nav-link"
					href="GenerateSalaries.jsp">Salaries</a></li>
				<li class="nav-item "><a class="nav-link" href="Reports.jsp">Reports</a></li>
				<li class="nav-item "><a class="nav-link" href="feedbackView.jsp">FeedBacks
				</a></li>
				<li class="nav-item "><a class="nav-link" href="MainMaster.jsp">Log
						Out </a></li>
			</ul>
		</div>
	</nav>
	<hr>

	<div class="container ">
		<div class="AddEmployeeContainer">
			<h3>
				<center>Add Employee</center>
			</h3>
			<hr>
			<form action="../addEmployee" method="post">
				<div class="row">
					<div class="col-md-2"></div>
					<div class="col-md-4">
						<div class="mb-2">
							<label for="ename" class="form-label">Employee Name</label> <input
								type="text" class="form-control addEmployeeTextbox" id="name"
								name="ename" aria-describedby="emailHelp" required>
						</div>
					</div>
					
					
					 <script>
						 function validatePhoneNumber(input_str) {
							    var re = /^[\+]?[(]?[0-9]{3}[)]?[\s\.]?[0-9]{3}[\s\.]?[0-9]{4,6}$/im;

							    return re.test(input_str);
							}

							function validateForm(event) {
							    var phone = document.getElementById('mobile').value;
							    if (!validatePhoneNumber(phone)) {
							    	 alert("Please Enter Valid Mobile Number");
							    } else {
							        document.getElementById('phone_error').classList.add('hidden');
														    }
							    event.preventDefault();
							}

							document.getElementById('mobile').addEventListener('submit', validateForm);
             </script>
					<div class="col-md-4">
						<div class="mb-2">
							<label for="emobile" class="form-label ">Mobile</label> <input
								type="text" class="form-control addEmployeeTextbox" id="mobile"
								name="emobile" onkeypress="return onlyNumberKey(event)"  pattern="[0-9]{3}[0-9]{3}[0-9]{4}"required>
			
      
						</div>
					</div>
					<div class="col-md-2"></div>
				</div>
				<div class="row">
					<div class="col-md-2"></div>
					<div class="col-md-4">
						<div class="mb-2">
							<label for="tableNumber" class="form-label ">Email Id</label> <input
								type="email" class="form-control addEmployeeTextbox" id="Email"
								name="Eemail" required>
						</div>
					</div>
					<div class="col-md-4">
						<div class="mb-2">
							<label for="address" class="form-label ">Address</label>
							<textarea class="form-control addEmployeeTextbox" rows="2"
								cols="" placeholder="Address" name="eaddress" required></textarea>
						</div>
					</div>
					<div class="col-md-2"></div>

				</div>

				<div class="row">
					<div class="col-md-2"></div>
					<div class="col-md-4">
						<div class="mb-2">
							<label for="jdate" class="form-label ">Joined Date</label> <input
								type="date" class="form-control addEmployeeTextbox" id="date"
								name="jdate" required>
						</div>
					</div>
					<div class="col-md-4">
						<div class="mb-2">
							<label for="tableNumber" class="form-label ">Id Proof</label> <input
								type="file" class="form-control addEmployeeTextbox" id="idproof"
								name="idproof">
						</div>
					</div>
					<div class="col-md-2"></div>
				</div>
				<div class="row">
					<div class="col-md-2"></div>
					<div class="col-md-4">
						<div class="mb-2">
							<label for="profile" class="form-label ">Employee Profile</label>
							<select class="form-control addEmployeeTextbox" name="profile"
								id="profile" required>

								<option value="Manager">Manager</option>
								<option value="Chief">Chief</option>
								<option value="Waiter">Waiter</option>
							</select>
						</div>
					</div>
					<div class="col-md-4">
						<div class="mb-2">
							<label for="salary" class="form-label ">Salary</label> <input
								type="text" class="form-control addEmployeeTextbox" id="salary"
								name="salary" required>
						</div>
					</div>
					<div class="col-md-2"></div>
				</div>
				<div class="row">
					<div class="col-md-2"></div>
					<div class="col-md-4">
						<div class="mb-2">
							<label for="password" class="form-label ">password</label>
							<input type="password" class="form-control addEmployeeTextbox" name="password"
								id="password" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" title="Must contain at least one number and one uppercase and lowercase letter, and at least 8 or more characters"required>
						</div>
					</div>
					<div class="col-md-4">
						
					</div>
					<div class="col-md-2"></div>
				</div>
				<div class="row">
					<div class="col-md-4"></div>
					<div class="col-md-4">
						<div class="mb-2">
							<center>
								<input type="submit" class="btn btn-primary" value="Add">
							</center>
						</div>
					</div>
					<div class="col-md-4"></div>
				</div>

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
</body>
</html>