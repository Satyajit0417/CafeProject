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
				<li class="nav-item "><a class="nav-link" href="TakeOrder.jsp">Take
						Orders</a></li>
				<li class="nav-item active"><a class="nav-link"
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
		<form action="../markPresenty" method="post">
			<center>
				<h3>Mark Presenty</h3>
			</center>
			<div class="row">
				<div class="col-md-2"></div>
				<div class="col-md-4">
					<div class="mb-2">
						<label for="empid" class="form-label ">Id</label> <input
							type="text" class="form-control addEmployeeTextbox" name="empid"
							value="${id}" id="empid">
					</div>
				</div>
				<div class="col-md-4">
					<div class="mb-2">
						<label for="empname" class="form-label ">Name</label> <input
							type="text" class="form-control addEmployeeTextbox"
							name="empname" id="empname" value="${name}">
					</div>
				</div>
				<div class="col-md-2"></div>
			</div>

			<div class="row">
				<div class="col-md-2"></div>
				<div class="col-md-4">
					<div class="mb-2">
						<label for="date" class="form-label ">Date</label> <input
							type="text" class="form-control addEmployeeTextbox" name="date"
							 id="date">
					</div>
				</div>
				<div class="col-md-4">
					<div class="mb-2">
						<label for="presenty">Present / Absent :</label> <input onclick  ="halfDay()"
							list="presentAbsent" class="form-control" name="presenty"
							 id="presenty">
						<datalist id="presentAbsent">
							<option value="present">Present</option>
							<option value="absent">Absent</option>
						</datalist>
					</div>
				</div>
				<div class="col-md-2"></div>
			</div>
			
			<div class="row">
				<div class="col-md-4"></div>
				<div class="col-md-4">
				<div class="mb-2">
						<label for="currenttime">Current Time :</label> <input
							list="text" class="form-control" name="currenttime"
							 id="currenttime">
					</div>
				</div>
				<div class="col-md-2"></div>
				<div class="col-md-2"></div>
			</div>

			<div class="row">
				<div class="col-md-4"></div>
				<div class="col-md-4">
					<div class="mb-2">
						<center>
							<input onclick="addItem()" type="submit" class="btn btn-primary" name="addbtn"
								value="Mark Presenty">
						</center>
					</div>
				</div>
				<div class="col-md-4"></div>
			</div>

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


	<script>
	function CurrentDate(){
		var currentdate = new Date();
		
		var time= currentdate.getHours() + ":"
		+ currentdate.getMinutes() + ":" + currentdate.getSeconds();
		
		document.getElementById("date").value = currentdate.getUTCDate() + "/"
		+ (currentdate.getUTCMonth()+1) + "/" + currentdate.getUTCFullYear();
		
		document.getElementById("currenttime").value = time;
		
		
	}
	
	function halfDay(){
		var currentHour = new Date();
		
		var txtBox = document.getElementById("presenty");
		hour = currentHour.getHours();
		if(hour >= 11){
			txtBox.value = "Half Day"
				document.getElementById('currenttime').readOnly
                = true;
			document.getElementById('date').readOnly
            = true;
				document.getElementById('presenty').readOnly
                = true;
		}else{
			txtBox.value = "Present"
		}
	}
		
				
	</script>
</body>
</html>