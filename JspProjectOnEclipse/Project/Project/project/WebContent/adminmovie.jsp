<%@ page language="java" import="java.util.*,com.video.model.*"
	pageEncoding="ISO-8859-1"%>
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
		<jsp:include page="adminmenu.jsp"></jsp:include>
		<div id="page">
			<h1>
				Admin
			</h1>
			<br />
			<form action="AdminMovieController" name="addmovieform"
				method="post">
				<table>
					<tr>
						<td>
							Movie Name
						</td>
						<td>
							<input type="text" name="moviename">
						</td>
					</tr>
					<tr>
						<td>
							Staring
						</td>
						<td>
							<input type="text" name="staring">
						</td>
					</tr>
					<tr>
						<td>
							Language
						</td>
						<td>
							<input type="radio" value="telugu" checked="checked"
								name="language">
							TAMIL
							<input type="radio" value="hindi" name="language">
							SINHALA
							<input type="radio" value="english" name="language">
							ENGLISH
						</td>
					</tr>
					<tr>
						<td>
							Director
						</td>
						<td>
							<input type="text" name="director">
						</td>
					</tr>
					<tr>
						<td>
							Producer
						</td>
						<td>
							<input type="text" name="producer">
						</td>
					</tr>
					<tr>
						<td>
							VCD
						</td>
						<td>
							<input type="text" name="vcd">
						</td>
					</tr>
					<tr>
						<td>
							DVD
						</td>
						<td>
							<input type="text" name="dvd">
						</td>
					</tr>
					<tr>
						<td>
							Rent
						</td>
						<td>
							<input type="text" name="rent">
						</td>
					</tr>
					<tr>
						<td>
							Copies
						</td>
						<td>
							<input type="text" name="copy">
						</td>
					</tr>
					<tr>
						<td>
							<input type="submit" name="ADD">
						</td>
						<td>
							<input type="reset" name="Reset">
						</td>
					</tr>
				</table>
			</form>
			<blockquote>
			</blockquote>
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
				&copy;2018 Movie Rental. All Rights Reserved. | Designed by SLIIT
			</p>
		</div>
		
		<script language="JavaScript" type="text/javascript">
//You should create the validator only after the definition of the HTML form
var frmvalidator = new Validator("addmovieform");

frmvalidator.addValidation("moviename", "req", "Please enter the Movie Name");
frmvalidator.addValidation("staring", "req", "Please enter the Staring");
frmvalidator.addValidation("director", "req", "Please enter the Director Name");
frmvalidator.addValidation("producer", "req", "Please enter the Producer Name");
frmvalidator.addValidation("vcd", "req", "Please enter Amount of VCD");
frmvalidator.addValidation("dvd", "req", "Please enter Amount of DVD");
frmvalidator.addValidation("rent", "req", "Please enter the Rent of the Movie");

frmvalidator.addValidation("vcd", "numeric", "Vcd should be digit");
frmvalidator.addValidation("dvd", "numeric", "Dvd should be digit");
frmvalidator.addValidation("rent", "numeric", "Rent should be digit");

history.go(1);
</script>
	</body>
</html>