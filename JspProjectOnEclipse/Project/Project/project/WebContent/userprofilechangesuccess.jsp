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
			Profile has successfully changed.
			<table width="100%" align="left">
				<tr>
					<td width="40%">
						UserName
					</td>
					<td width="60%">
						<%=u.getUsername()%>
					</td>
				</tr>

				<tr>

					<td width="40%">
						Password
					</td>
					<td width="60%">
						<form action="" method="post">
							********
							<a href="userchangepassword.jsp">Change Password</a>
						</form>
					</td>

				</tr>
				<tr>
					<td width="40%">
						Account Number
					</td>
					<td width="60%">
						<%=u.getAccno()%>
					</td>
				</tr>
				<tr>
					<td>
					</td>
					<td>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<a href="">Update Profile</a>
					</td>

				</tr>
				<tr>
					<td width="40%">
						FirstName
					</td>
					<td width="60%">
						<%=u.getFirstname()%>
					</td>
				</tr>
				<tr>
					<td width="40%">
						LastName
					</td>
					<td width="60%">
						<%=u.getLastname()%>
					</td>
				</tr>
				<tr>
					<td width="40%">
						Address
					</td>
					<td width="60%">
						<%=u.getAddress()%>
					</td>
				</tr>
				<tr>
					<td width="40%">
						City
					</td>
					<td width="60%">
						<%=u.getCity()%>
					</td>
				</tr>
				<tr>
					<td width="40%">
						Phone
					</td>
					<td width="60%">
						<%=u.getPhone()%>
					</td>
				</tr>
				<tr>
					<td width="40%">
						E-Mail
					</td>
					<td width="60%">
						<%=u.getEmail()%>
					</td>
				</tr>
			</table>
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
history.go(1);
</script>
	</body>
</html>
