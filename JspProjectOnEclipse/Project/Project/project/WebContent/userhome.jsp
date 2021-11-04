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
			<img src="movieimages/movie-reel.jpg" alt="movie reel" width="50%"
				height="50%" align="middle" />
			<br />
			<p align="justify">
			</p>
			<h2>
				Services for you
			</h2>
			<blockquote>
				<p>
					&#8220;Purchase and rent the CDS and DVDS &#8221;
				</p>
				<ul>
					<li>
						View/ Modify your profile
					</li>
					<li>
						Purchase / Rent / Your movie rentals.
					</li>
				</ul>
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
history.go(1);
</script>
	</body>
</html>
