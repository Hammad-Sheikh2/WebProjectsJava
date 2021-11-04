<%@ page language="java" import="java.util.*,com.video.model.*"
	pageEncoding="ISO-8859-1"%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		
		<title>Movie Rental</title>
		
		<link rel="stylesheet" type="text/css" href="default.css">
		<script language="JavaScript" src="gen_validatorv31.js"
			type="text/javascript">
</script>
	</head>
	<body>
		<jsp:include page="usermenu.jsp"></jsp:include>
		<div id="page">
			<h1>
				<%
					User u = (User) session.getAttribute("user");
				%>
				<%=(u.getUsername())%>
			</h1>
			<br />
			<form action="ChangePassword" method="post"
				name="passwordchangeform">
				<table align="left">
					<tr>
						<td>
							Old Password
						</td>
						<td>
							<input type="password" name="oldpassword">
						</td>
					</tr>
					<tr>
						<td>
							New Password
						</td>
						<td>
							<input type="password" name="newpassword">
						</td>
					</tr>
					<tr>
						<td>
							Re Enter NewPassword
						</td>
						<td>
							<input type="password" name="renewpassword">
						</td>
					</tr>
					<tr>
						<td>
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<input type="submit" value="Change">
						</td>
						<td>
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<input type="reset" value="Reset">
						</td>
					</tr>
				</table>
			</form>
			<br />
		</div>
		<!-- end latest-post -->
		<!-- start recent-posts -->
		<!-- end recent-posts -->
		<!-- end content -->
		<!-- start sidebar -->
		<div id="sidebar">
		</div>
		<!-- end sidebar -->
		<!-- end page -->
		<div id="footer">
			<p id="legal">
				&copy;2018 Movie Rental. All Rights Reserved.| Designed by SLIIT
			</p>
		</div>
		
		<script language="JavaScript" type="text/javascript">
var frmvalidator = new Validator("passwordchangeform");
frmvalidator
		.addValidation("oldpassword", "req", "Please enter the OldPassword");
frmvalidator.addValidation("oldpassword", "maxlen=15",
		"Max length for Password is 15");

frmvalidator
		.addValidation("newpassword", "req", "Please enter the NewPassword");

frmvalidator.addValidation("renewpassword", "req",
		"Please enter the NewPassword");


history.go(1);
</script>
	</body>
</html>
