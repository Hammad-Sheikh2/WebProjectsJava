<%@page import= "java.text.*" %>
<%@page import ="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">
	<style>
		.center-page{
            flex-wrap: wrap;
            display: flex;
  			justify-content: center;
  			align-items: center;
        }
        .primary-font{
        	font-family:'Segio';
        }
	</style>
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-light bg-light">
  <a class="navbar-brand primary-font" href="admin_home.jsp"><b><i class="fas fa-home"></i> Home</b></a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item">
        <a class="nav-link primary-font" href="circle.jsp"><i class="far fa-circle"></i> Circle</a>
      </li>
      <li class="nav-item">
        <a class="nav-link primary-font" href="division.jsp"><i class="fab fa-artstation"></i> Division</a>
      </li>
      <li class="nav-item">
        <a class="nav-link primary-font" href="meter.jsp"><i class="fas fa-tachometer-alt"></i> Meter</a>
      </li>
      <li class="nav-item">
        <a class="nav-link primary-font" href="consumer.jsp"><i class="far fa-user"></i> Consumer</a>
      </li>
      <li class="nav-item">
        <a class="nav-link primary-font" href="query.jsp"><i class="far fa-question-circle"></i> View Query</a>
      </li>
      <li class="nav-item">
        <a class="nav-link primary-font" href="billing.jsp"><i class="fas fa-file-invoice-dollar"></i> Billing</a>
      </li>
    </ul>
    <form class="form-inline my-2 my-lg-0" action="index.jsp">
      <button class="btn btn-outline-danger my-2 my-sm-0 primary-font" type="submit">Logout</button>
    </form>
  </div>
</nav>

<div class="container my-5">
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
	<div class="row">
		<div class="col-md-6 mt-3">
			<div class="card text-white bg-success">
			  <div class="card-header">
			    Create Consumer
			  </div>
			  <div class="card-body">
			    <h5 class="card-title">Add New Consumer To The System.</h5>
			    <div class="d-flex justify-content-end">
			    	<a href="select_meter12.jsp" class="btn btn-light" style="color:black;"><b>Add</b></a>
			    </div>
			  </div>
			</div>
		</div>
		<div class="col-md-6 mt-3">
			<div class="card text-white bg-warning">
			  <div class="card-header">
			    View Consumer
			  </div>
			  <div class="card-body">
			    <h5 class="card-title">View Consumer From The System.</h5>
			    <div class="d-flex justify-content-end">
			    	<a href="select_consumer1.jsp" class="btn btn-light" style="color:black;"><b>View</b></a>
			    </div>
			  </div>
			</div>
		</div>
		<div class="col-md-6 mt-3">
			<div class="card text-white bg-dark">
			  <div class="card-header">
			    Update Consumer
			  </div>
			  <div class="card-body">
			    <h5 class="card-title">Update Consumer Details To The System.</h5>
			    <div class="d-flex justify-content-end">
			    	<a href="select_consumer.jsp" class="btn btn-light" style="color:black;"><b>Update</b></a>
			    </div>
			  </div>
			</div>
		</div>
		<div class="col-md-6 mt-3">
			<div class="card text-white bg-danger">
			  <div class="card-header">
			    Delete Consumer
			  </div>
			  <div class="card-body">
			    <h5 class="card-title">Delete Consumer From The System.</h5>
			    <div class="d-flex justify-content-end">
			    	<a href="select_consumer2.jsp" class="btn btn-light" style="color:black;"><b>Delete</b></a>
			    </div>
			  </div>
			</div>
		</div>
	</div>
</div>

<footer class="bg-dark text-light py-5">
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
				<div class="container">
					<div class="d-flex justify-content-center">
						<div class="d-flex flex-column">
						  <div class="display-4">Contact-US</div>
						  <div class="p-2 mt-5">Email    : <span>admin@admin.com</span></div>
						  <div class="p-2">Contact  : <span>+192 9929929</span></div>
						  <div class="p-2">Facebook : <span>facebook/CPDCIL</span></div>
						  <div class="p-2">Twitter  : <span>twitter/CPDCIL</span></div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<hr class="bg-light">
		<div class="d-flex justify-content-center">@ Copyright 2021 - CPDCIL - All Rights Reserved</div>
	</div>
</footer>
</body>
</html>