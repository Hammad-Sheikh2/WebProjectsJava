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
		<jsp:include page="usermenu.jsp"></jsp:include>
		<div id="page">
			<h1>
				<%
					User u = (User) session.getAttribute("user");
				%>
				<%=u.getUsername()%>
			</h1>
			<br />
			<form action="VideoPurchase" method="post"
				name="usermoiepurchaseform">
				<table width="100%" align="left">
					<tr>
						<td>
							Type
						</td>
						<td>
							<input type="radio" name="type" value="CD" checked="checked">
							CD
							<input type="radio" name="type" value="DVD">
							DVD
						</td>
					</tr>
					<tr>
						<td>
							Number of Cd's/Dvd's
						</td>
						<td>
							<input type="text" name="no">
						</td>
					</tr>
					<tr>
						<td>
							Card Holder name
						</td>
						<td>
							<input type="text" name="cname">
						</td>
					</tr>
					<tr>
						<td>
							Card No
						</td>
						<td>
							<input type="text" name="cno">
						</td>
					</tr>
					<tr>
						<td align="center">
							<input type="submit" value="BUY">
						</td>
						<td align="left">
							<input type="reset" value="Reset">
							<input type="hidden" name="movie"
								value="<%=request.getParameter("name")%>">
							<input type="hidden" name="vcd"
								value="<%=request.getParameter("vcd")%>">
							<input type="hidden" name="dvd"
								value="<%=request.getParameter("dvd")%>">
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
				&copy;2018 Movie Rental. All Rights Reserved. | Designed by SLIIT
			</p>
		</div>
		
		<script language="JavaScript" type="text/javascript">
//You should create the validator only after the definition of the HTML form
var frmvalidator = new Validator("usermoiepurchaseform");

frmvalidator.addValidation("no", "req",
		"Please enter the Number of CD's/DVD's Required");
frmvalidator.addValidation("no", "numeric", "Number should be digit");
frmvalidator.addValidation("no", "maxlen=2",
		"You can purchase more that 99 Cd's/Dvd's");
		
frmvalidator.addValidation("text", "req",
"Please enter the Card Holder Name");
frmvalidator.addValidation("text","alpha", "Alphabetic chars only");

frmvalidator.addVallidation("no","numeric", "card Number should be digit")
history.go(1);
</script>
	</body>
</html>