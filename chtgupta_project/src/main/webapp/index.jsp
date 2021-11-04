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
<body class="center-page p-5">
	<div class="container mt-5">
		<div class="row">
			<div class="col-lg-6">
				<h3 class="text-warning">Central Power Distribution Company Of India Limited</h3>
				<p class="mt-5">
				Our project basically deals with developing an application EBS (Energy Billing System).
				</p>
				<p>
				The Energy Billing System is an Executive Information System that could be used for entering, calculating and monitoring the Billing details of the Electricity Consumers.
				</p>
				<p>
				It provides environment to maintain the consumer details starting from getting new connection, receiving bill, payments etc., and performance information to the management.
				</p>
			</div>
			<div class="col-lg-6">
				<div class="card py-3">
					 <div class="card-body">
					    <h5 class="card-title">Login</h5>
					    <h6 class="card-subtitle mb-2 text-muted">Save Power Save India</h6>
					    <form action="validate_user.jsp">
					    
					    <label for="uname" class="card-text mt-2">Username</label>
					    <input class="form-control" type="text" name="uname" id="uname" required>
					    
					    <label for="password" class="card-text mt-3">Password</label>
					    <input class="form-control" type="password" name="password" required>
					    
					    <%if(request.getAttribute("msg")!=null){%>
	                        <div class="mt-3 alert alert-danger alert-dismissible fade show" role="alert">
			                	 <%=(String)request.getAttribute("msg")%>
			                    	<button type="button" class="close" data-dismiss="alert" aria-label="Close">
			                        	<span aria-hidden="true">&times;</span>
			                        </button>
			                 </div>
	                    <%}%>
					    <input class="btn btn-dark mt-3" type="submit">
					    </form>
					 </div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>