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
	</head>
	<body>
		<!-- start header -->
		<div id="header">
			<div id="logo">
				<h1>
					Movie Rental
				</h1>
				<h2>
					Purchase And Rent
				</h2>
			</div>
			<div id="menu">
				<ul>
					<li class="active">
						<a href="userhome.jsp">home</a>
					</li>
					<li>
						<a href="userprofile.jsp">Profile</a>
					</li>
					<li>
						<a href="userpurchase.jsp">Purchase</a>
					</li>
					<li>
						<a href="logout.jsp">Logout</a>
					</li>
				</ul>
			</div>
		</div>
		<!-- end header -->
		<!-- start page -->
	</body>
</html>
