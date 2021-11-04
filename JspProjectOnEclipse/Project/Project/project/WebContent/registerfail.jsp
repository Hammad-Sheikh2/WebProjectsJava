<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<base href="<%=basePath%>">
		<title>Movie Rental</title>
		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
		<link rel="stylesheet" type="text/css" href="default.css">
		<script language="JavaScript" src="gen_validatorv31.js"
			type="text/javascript">
</script>
	</head>
	<body>
		<jsp:include page="menu.jsp"></jsp:include>
		<div id="page" align="center">
			<h1>
				Register
			</h1>
			<br />
			Register Fail,
			<br />
			<br />
			<br />
			<br />
			<br />
			<form action="RegisterServlet" method="post"
				name="registerform">
				<table>
					<tr>
						<td>
							User Name
						</td>
						<td>
							<input type="text" name="username">
						</td>
					</tr>
					<tr>
						<td>
							Password
						</td>
						<td>
							<input type="password" name="password">
						</td>
					</tr>
					<tr>
						<td>
							Account Number
						</td>
						<td>
							<input type="text" name="accno">
						</td>
					</tr>
					<tr>
						<td>
							First Name
						</td>
						<td>
							<input type="text" name="firstname">
						</td>
					</tr>
					<tr>
						<td>
							Last Name
						</td>
						<td>
							<input type="text" name="lastname">
						</td>
					</tr>
					<tr>
						<td>
							Address
						</td>
						<td>
							<textarea rows="5" cols="20" name="address"></textarea>
						</td>
					</tr>
					<tr>
						<td>
							City
						</td>
						<td>
							<input type="text" name="city">
						</td>
					</tr>
					<tr>
						<td>
							Phone
						</td>
						<td>
							<input type="text" name="phone">
						</td>
					</tr>
					<tr>
						<td>
							E-Mail
						</td>
						<td>
							<input type="text" name="email">
						</td>
					</tr>
					<tr>
						<td>
							<input type="submit" value="Register">
						</td>
						<td>
							<input type="reset" name="Reset">
						</td>
					</tr>
				</table>
			</form>
		</div>
		<br />
		<br />
		<br />
		<br />
		<br />
		<br />
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
				&copy;2018 Movie Rental. All Rights Reserved. | Designed by SLIIT
			</p>
		</div>
		<div
			style="font-size: 0.8em; text-align: center; margin-top: 1.0em; margin-bottom: 1.0em;">
			Design downloaded from Krest Technologies your source for web
			designing
		</div>
		<script language="JavaScript" type="text/javascript">
//You should create the validator only after the definition of the HTML form
var frmvalidator = new Validator("registerform");
frmvalidator.addValidation("username", "req", "Please enter the UserName");
frmvalidator.addValidation("username", "maxlen=15",
		"Max length for UserName is 15");
frmvalidator.addValidation("username", "alpha", "Alphabetic chars only");

frmvalidator.addValidation("password", "req", "Please enter the Password");
frmvalidator.addValidation("password", "maxlen=15",
		"Max length for Password is 15");

frmvalidator.addValidation("firstname", "req", "Please enter the FirstName");
frmvalidator.addValidation("firstname", "maxlen=10",
		"Max length for UserName is 10");
frmvalidator.addValidation("firstname", "alpha", "Alphabetic chars only");

frmvalidator.addValidation("lastname", "req", "Please enter the lastName");
frmvalidator.addValidation("lastname", "maxlen=10",
		"Max length for LastName is 10");
frmvalidator.addValidation("lastname", "alpha", "Alphabetic chars only");

frmvalidator.addValidation("address", "req", "Please enter the Address");
frmvalidator.addValidation("address", "maxlen=25",
		"Max length for Address is 10");

frmvalidator.addValidation("city", "req", "Please enter the City");
frmvalidator.addValidation("city", "maxlen=10", "Max length for City is 10");
frmvalidator.addValidation("city", "alpha", "Alphabetic chars only");

frmvalidator.addValidation("email", "req", "Please enter the Email");
frmvalidator.addValidation("email", "email", "Invalid Email");

frmvalidator.addValidation("phone", "req", "Please enter the Phone");
frmvalidator.addValidation("phone", "numeric", "PhoneNumber should be digit");
frmvalidator.addValidation("phone", "maxlen=10", "Max length for Phone is 10");
frmvalidator.addValidation("phone", "minlen=10", "Max length for Phone is 10");

frmvalidator.addValidation("accno", "req", "Please enter the Account Number");
frmvalidator.addValidation("accno", "numeric", "AccountNumber should be digit");
frmvalidator.addValidation("accountnumber", "maxlen=8",
		"AccoutNumber shold be 8 digits");

history.go(1);
</script>
	</body>
</html>