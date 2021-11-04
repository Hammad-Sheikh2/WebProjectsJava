<!DOCTYPE html>
<html>
<head>
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
	<style>
		.center-page{
            flex-wrap: wrap;
            display: flex;
  			justify-content: center;
  			align-items: center;
        }
	</style>
</head>
<body class="center-page">
	<div class="container mt-5">
		<div class="card">
			<div class="card-body">
				<h3 class="card-title">Customer Executive Account.</h3>
			</div>
		</div>
		<%if(request.getAttribute("msg")!=null){%>
		<div class="mt-3 alert alert-success alert-dismissible fade show" role="alert">
			<%=(String)request.getAttribute("msg")%>
			<button type="button" class="close" data-dismiss="alert" aria-label="Close">
				<span aria-hidden="true">&times;</span>
			</button>
		</div>
		<%}%>
		<%if(request.getAttribute("errmsg")!=null){%>
		<div class="mt-3 alert alert-danger alert-dismissible fade show" role="alert">
			<%=(String)request.getAttribute("errmsg")%>
			<button type="button" class="close" data-dismiss="alert" aria-label="Close">
				<span aria-hidden="true">&times;</span>
			</button>
		</div>
		<%}%>
		<div class="card mt-3">
			<div class="card-header">
				<b>Add New Customer</b>
			</div>
			<div class="card-body">
				<form action="add-customer" method="post">
					<label class="mt-3">Customer SSN ID</label>
					<input type="number" class="form-control" name="id">
					<label class="mt-3">Customer Name</label>
					<input type="text" class="form-control" name="name">
					<label class="mt-3">Age</label>
					<input type="number" class="form-control" name="age">
					<label class="mt-3">Address Line 1</label>
					<input type="text" class="form-control" name="add_1">
					<label class="mt-3">Address Line 2</label>
					<input type="text" class="form-control" name="add_2">
					<label class="mt-3">City</label>
					<input type="text" class="form-control" name="city">
					<label class="mt-3">State</label>
					<input type="text" class="form-control" name="state">
					<div class="d-flex justify-content-end">
						<input type="submit" class="my-3 btn btn-primary" value="Add Customer">
					</div>
				</form>
			</div>
		</div>
	</div>
</body>
</html>