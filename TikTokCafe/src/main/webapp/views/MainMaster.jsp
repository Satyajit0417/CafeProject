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
<title>Tik Tok Cafe</title>

	
	</script>
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
				<li class="nav-item active"><a class="nav-link" href="#">Home
						<span class="sr-only">(current)</span>
				</a></li>

				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
					role="button" data-toggle="dropdown" aria-haspopup="true"
					aria-expanded="false"> User </a>
					<div class="dropdown-menu" aria-labelledby="navbarDropdown">
						<a class="dropdown-item" data-toggle="modal"
							data-target="#exampleModal1" href="#">Login</a> <a
							class="dropdown-item" data-toggle="modal"
							data-target="#exampleModal" href="#">Register</a>

					</div></li>

				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
					role="button" data-toggle="dropdown" aria-haspopup="true"
					aria-expanded="false"> Admin </a>
					<div class="dropdown-menu" aria-labelledby="navbarDropdown">
						<a class="dropdown-item" data-toggle="modal"
							data-target="#exampleModalowner">Owner</a> 
						<a 	class="dropdown-item" data-toggle="modal"
							data-target="#exampleModalstaff">Staff</a>
					</div></li>

			</ul>

		</div>
	</nav>


	<!--Slider -->
	<div id="carouselExampleControls" class="carousel slide"
		data-ride="carousel">
		<div class="carousel-inner">
		
			<div class="carousel-item active">
				<img class="d-block w-100 banner" src="../projectimg/image.jpg"
					alt="First slide">
			</div>
			<div class="carousel-item">
				<img class="d-block w-100 banner" src="../projectimg/image1.jpg"
					alt="Second slide">
			</div>
			<div class="carousel-item">
				<img class="d-block w-100 banner" src="../projectimg/image2.jpg"
					alt="Third slide">
			</div>
			<div class="carousel-item">
				<img class="d-block w-100 banner" src="../projectimg/image3.jpg"
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

	<!-- user Registration modal  -->

	<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Wel Come !
						Register Here</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<form action="../Register" method="post">
					<div class="modal-body">

						<div class="form-group">
							<label for="name" class="col-form-label">Name:</label> <input
								type="text" class="form-control" placeholder="Name" name="name" required>
						</div>
						<div class="form-group">
							<label for="email" class="col-form-label">Email:</label> <input
								type="email" class="form-control" placeholder="Email Id"
								name="email" required>
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
						<div class="form-group">
							<label for="mobile" class="col-form-label">Mobile:</label> <input
								type="text" class="form-control" placeholder="Mobile"
								name="mobile" onkeypress="return onlyNumberKey(event)"  pattern="[0-9]{3}[0-9]{3}[0-9]{4}"
								       required >
								       </div>
								 
								
								
						<div class="form-group">
							<label for="pass" class="col-form-label">Password:</label> <input
								name="password" type="password" class="form-control"
								placeholder="Password" id="pass" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" title="Must contain at least one number and one uppercase and lowercase letter, and at least 8 or more characters" required>
								
								
						</div>
						
						
						<button type="button" class="btn btn-secondary"
							data-dismiss="modal">Close</button>
						<input type="submit" class="btn btn-primary" value="Register">
				</form>
			</div>
			

		</div>
	</div>
	</div>


	<!-- User Login Modal -->
	<div class="modal fade" id="exampleModal1" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">User Login</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<form action="../userLogin" method="post">
					<div class="modal-body">

						<div class="form-group">
							<label for="email" class="col-form-label">Email:</label> <input
								type="email" class="form-control" placeholder="Email Id"
								name="email">
						</div>
						<div class="form-group">
							<label for="pass" class="col-form-label">Password:</label> 
							<input
								type="password" class="form-control" placeholder="Password" name="password">
								
						</div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary"
							data-dismiss="modal">Close</button>
						<input type="submit" class="btn btn-primary" value="Login">
					</div>
				</form>
			</div>
		</div>
	</div>


	<!-- Owner Modal -->

	<div class="modal fade" id="exampleModalowner" tabindex="-1"
		role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Owner Login</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<form action="../adminLogin" method="post">
					<div class="modal-body">

						<div class="form-group">
							<label for="email" class="col-form-label">Email:</label> <input
								type="email" class="form-control" placeholder="Email Id"
								id="email" name="email">
						</div>
						<div class="form-group">
							<label for="pass" class="col-form-label">Password:</label> <input
								type="password" class="form-control" name="password" placeholder="Password">
						</div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary"
							data-dismiss="modal">Close</button>
						<input type="submit" class="btn btn-primary" value="Login">
					</div>
				</form>
			</div>
		</div>
	</div>



	<!-- Staff Modal -->


	<div class="modal fade" id="exampleModalstaff" tabindex="-1"
		role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Staff Login</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<form action="../stafflogin" method="post">
					<div class="modal-body">

						<div class="form-group">
							<label for="email" class="col-form-label">Email:</label> <input
								type="email" class="form-control" placeholder="Email Id" name="staffemail"
								id="email">
						</div>
						<div class="form-group">
							<label for="pass" class="col-form-label">Password:</label> <input
								type="password" class="form-control" placeholder="Password" name="staffPassword">
						</div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary"
							data-dismiss="modal">Close</button>
						<input type="submit" class="btn btn-primary" value="Login">
					</div>
				</form>
			</div>
		</div>
	</div>


	<!-- Kitchen Modal -->

	<div class="modal fade" id="exampleModalkitchen" tabindex="-1"
		role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Kitchen Login</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<form action="../kitchenLogin" method="post">
					<div class="modal-body">
						<div class="form-group">
							<label for="email" class="col-form-label">Email:</label> <input
								type="email" class="form-control" placeholder="Email Id" name = "email"
								id="email">
						</div>
						<div class="form-group">
							<label for="pass" class="col-form-label">Password:</label> <input
								type="password" class="form-control" placeholder="Password" name="password">
						</div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary"
							data-dismiss="modal">Close</button>
						<input type="submit" class="btn btn-primary">
					</div>
				</form>
			</div>
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