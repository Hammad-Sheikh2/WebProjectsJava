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
		<font face="Monotype Corsiva">Residential Billing Details</font>
	</div>
	<%if(request.getAttribute("msg")!=null){%>
	<div class="mt-3 alert alert-danger alert-dismissible fade show" role="alert">
		<%=(String)request.getAttribute("msg")%>
		<button type="button" class="close" data-dismiss="alert" aria-label="Close">
			<span aria-hidden="true">&times;</span>
		</button>
	</div>
	<%}%>
	<div class="card mt-3">
	  <div class="card-header">
	    <b>Add Bill against Meter</b>
	  </div>
	  <div class="card-body">
	    <p class="card-text">Click this button to add a bill against a registered meter in the system.</p>
	    <div class="d-flex justify-content-end">
	    	<button class="btn btn-outline-primary" data-toggle="modal" data-target="#exampleModal">Add Bill</button>
	    </div>
	  </div>
	</div>
	<%! 
	Connection con,con1;
	ResultSet rs,rs1;
	Statement st,st1;
	String cname,dname,mno,mcname;
	%>
	<%
	try 
	{
		Class.forName("com.mysql.jdbc.Driver");
		Connection x=DriverManager.getConnection("jdbc:mysql://localhost:3306/chtgupta","root","1234");

		Statement s = x.createStatement();
		String emp = "residential";
		String jy1="select * from billing where type='"+emp+"'";
		
		ResultSet r = s.executeQuery(jy1);
		%>
	<div class="table-responsive">
	<table class="table table-striped table-hover mt-3">
	<tr class="bg-dark text-light">
	<td><b>Meter #</b></td>
	<td><b>Consumer Name</b></td>
	<td><b>Connection Type</b></td>
	<td><b>Units Used</b></td>
	<td><b>Amount</b></td>
	<td><b>Status</b></td>
	<td><b>Delete</b></td>
	</tr>
	<%
		while(r.next())
		{
	%>
	<tr>
		<td> <%out.println(r.getString(4));%></td>
		<td> <%out.println(r.getString(6));%></td>
		<td> <%out.println(r.getString(7));%></td>
		<td> <%out.println(r.getString(8));%></td>
		<td> <%out.println(r.getString(9));%></td>
		<td> <%out.println(r.getString(11));%></td>
		<td><a class="btn btn-danger" href="delete_from_bill.jsp?mno=<%=r.getString(4)%>&pid=Res"> Yes </a></td>
	</tr>
	
	<%
		}
		}
		catch (Exception e)
		{
			out.println(e);
		}
		%>
	</table>
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
<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Add Bill</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
      	<p>Select Meter Number</p>
        <form action="bill1.jsp">
        	<%

			Class.forName("com.mysql.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/chtgupta","root","1234");
			
			String empid = "residential";
			st=con.createStatement();
			String jy="select * from consumer where type='"+empid+"'";
			
			%>
			<select class="mt-2 form-control" name="mno">
			<%
			rs=st.executeQuery(jy);
			while(rs.next())
			{
			%>
			<option> <% out.println(rs.getString(3));%></option>
			<%
			}
			%>
			</select>
			<div class="d-flex justify-content-end">
				<input class="btn btn-primary mt-3" type="submit">
			</div>
        </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>
</body>
</html>