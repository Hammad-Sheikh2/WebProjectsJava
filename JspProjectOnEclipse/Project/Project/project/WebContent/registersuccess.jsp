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
				Login
			</h1>
			<br />
			Registration Success
			<br />
			<br />
			<br />
			<br />
			<br />
			<form action="MemberLogin" method="post" name="loginform">
				<table>
					<tr>
						<td>
							User Name
						</td>
						<td>
							<input type="text" name="username" />
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
							<input type="submit" value="Login">
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
		
		<script language="JavaScript" type="text/javascript">
//You should create the validator only after the definition of the HTML form
var frmvalidator = new Validator("loginform");
frmvalidator.addValidation("username", "req", "Please enter the UserName");
frmvalidator.addValidation("username", "maxlen=15",
		"Max length for UserName is 15");
frmvalidator.addValidation("username", "alpha", "Alphabetic chars only");

frmvalidator.addValidation("password", "req", "Please enter the Password");
frmvalidator.addValidation("password", "maxlen=15",
		"Max length for Password is 15");
history.go(1);
</script>
	</body>
</html>