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
<title>Tik Tok Cafe | FeedBack</title>
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
				<li class="nav-item "><a class="nav-link" href="MenuCard.jsp">Menu
						Card </a></li>
				<li class="nav-item"><a class="nav-link" href="bookTable.jsp">Book
						Table </a></li>
				<li class="nav-item active"><a class="nav-link"
					href="feedback.jsp">FeedBack </a></li>
				<li class="nav-item "><a class="nav-link" href="MainMaster.jsp">Log
						Out </a></li>
			</ul>
		</div>
	</nav>

	<div class="feedbackcontainer container ">
		<div class="bookTableContainer">
			<h3 class="text-center mt-3">Your Feedback</h3>
			<form action="../AddFeedback" method="post">
				<div class="row">
					<div class="col-md-3"></div>
					<div class="col-md-6">
						<div class="mb-3">
							<label for="name" class="form-label">Name</label> <input
								type="text" class="form-control" id="name" name="name" value="${name}" 
								aria-describedby="emailHelp">
						</div>
					</div>
					<div class="col-md-3"></div>
				</div>
				<div class="row">
					<div class="col-md-3"></div>
					<div class="col-md-6">

						<div class="mb-3">
							<label for="message" class="form-label">How was the food ?
							</label>
							<textarea row=10 col=10 class="form-control" id="description"
								name="message"></textarea>
						</div>
					</div>
					<div class="col-md-3"></div>
				</div>

				<div class="row">
					<div class="col-md-5"></div>
					<div class="col-md-2">
						<input type="submit" class="btn btn-primary" value="Save">
					</div>
					<div class="col-md-5"></div>
				</div> 	
			</form>
		</div>
	</div>


	<div class="container mt-5 text-center text-warning">
		<h4>Thank You ${name}  <br>Visit again</h4>
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