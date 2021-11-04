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
		<div id="page">
			<h1>
				Welcome
			</h1>
			<br />
			<br />
			<p align="justify">
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Movie Rental
				Entertainment is your one-stop shop for Indian films. You can rent or purchase 
				any time any where
			</p>
			<h2>
				Services
			</h2>
			<blockquote>
				<p>
					&#8220;We provide the CD'S and DVD'S for rental and purchase
					&#8221;
				</p>
				<ul>
					<li>
						For available of this service you have to register.
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
