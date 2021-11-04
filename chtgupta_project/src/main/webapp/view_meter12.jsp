<%@page import= "java.text.*" %>
<%@page import ="java.util.*" %>
<%@ page import="java.sql.*" %>
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
        	font-family:'Segio'
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
	<div class="display-4 text-warning d-flex justify-content-center" >
		<font face="Monotype Corsiva">Register A New Consumer</font>
	</div>
	<form action="consumer_registration.jsp">
	<div class="card ">
	  <div class="card-header">
	    <b>Meter Details</b>
	  </div>
	  <div class="card-body">
	  	<%! 
	  	Connection con;
		ResultSet rs,rs1;
		Statement st,st1;
		String cname,dname,mno,mcname;
		%>
		<%
		try 
		{
			Class.forName("com.mysql.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/chtgupta","root","1234");
			String empid = request.getParameter("no");
			st=con.createStatement();
			String jy="select * from meter where mno="+empid+"";
			rs=st.executeQuery(jy);
		%>
	    <%
		
			if(rs.next())
			{%>
			<label class="mt-3">Circle Name</label>
	    	<input class="form-control" type="text" name="cname" value="<%out.println(rs.getString(1));%>" readonly>
	    	
	    	<label class="mt-3">Division Name</label>
	    	<input class="form-control" type="text" name="dname" value="<%out.println(rs.getString(2));%>" readonly>
	    	
	    	<label class="mt-3">Meter #</label>
	    	<input class="form-control" type="text" name="mno" value="<%out.println(rs.getString(3));%>" readonly>
	    	
	    	<label class="mt-3">Company Name</label>
	    	<input class="form-control mb-4" type="text" name="mcname" value="<%out.println(rs.getString(4));%>" readonly>
	    	
			<%}}
				catch(Exception e)
			{
					out.println(e);
			}
		%>
	  </div>
	</div>
	<div class="card mt-3">
	  <div class="card-header">
	    <b>Personal Details</b>
	  </div>
	  <div class="card-body">
			<label class="mt-3">Name</label>
	    	<input class="form-control" type="text" name="name" required>
	    	
	    	<label class="mt-3">Age</label>
	    	<input class="form-control" type="text" name="age" required>
	    	
	    	<label class="mt-3">Sex</label>
	    	<div class="d-md-flex">
	    	<div class="custom-control custom-radio">
			  <input type="radio" id="customRadio1" name="sex" class="custom-control-input">
			  <label class="custom-control-label" for="customRadio1" value="male">Male</label>
			</div>
			<div class="custom-control ml-md-3 custom-radio">
			  <input type="radio" id="customRadio2" name="sex" class="custom-control-input">
			  <label class="custom-control-label" for="customRadio2" value="female">Female</label>
			</div>
	    	</div>
	    	<label class="mt-3">Contact No</label>
	    	<input class="form-control" type="text" name="cno" required>
	    	
	    	<label class="mt-3">Address</label>
	    	<textarea class="form-control" type="text" name="address" rows="4" required></textarea>
	    	
	    	<label class="mt-3">Connection Type</label>
	    	<select class="form-control" name="type" required>
	    	<option>commercial</option>
			<option>residential</option>
	    	</select>
	    	
	    	<label class="mt-3">Username</label>
	    	<input class="form-control" type="text" name="uname" required>
	    	
	    	<label class="mt-3">Password</label>
	    	<input class="form-control" type="password" name="pass" required>
	    	
	    	<div class="d-flex justify-content-end">
	    		<input type="submit" class="btn btn-success my-3">
	    	</div>
	  </div>
	</div>
	</form>
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