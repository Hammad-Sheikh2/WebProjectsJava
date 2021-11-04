<%@page import="com.video.service.MemberService"%>
<%@ page language="java"
	import="java.util.*,com.video.model.*,com.video.util.*,java.sql.*"
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
				<br />
				These are the User registered with the System
			</h1>
			<br />
			<table width="100%" align="left">
				<tr>
					<th>
						User Name
					</th>
					<th>
						Account Number
					</th>
					<th>
						First Name
					</th>
					<th>
						Last Name
					</th>
					<th>
						Address
					</th>
					<th>
						City
					</th>
					<th>
						Phone
					</th>
					<th>
						E-mail
					</th>
					<th>
						delete
					</th>
					
				</tr>
				<%
					Connection con = ResourceHelper.getConnection();
					Statement st = con.createStatement();
					MemberService ms=new MemberService();
					ResultSet rs = st.executeQuery("select * from user");
					while (rs.next()) {
				%>
				<tr align="center">
					<td>
						<%=rs.getString(1)%>
					</td>
					<td>
						<%=rs.getInt(3)%>
					</td>

					<td>
						<%=rs.getString(4)%>
					</td>
					<td>
						<%=rs.getString(5)%>
					</td>
					<td>
						<%=rs.getString(6)%>
					</td>
					<td>
						<%=rs.getString(7)%>
					</td>
					<td>
						<%=rs.getLong(8)%>
					</td>
					<td>
						<%=rs.getString(9)%>
					</td>
					<td>
						 <form action="DeleteUser" method="post"
				           name="deleteuser">
						    <input type="hidden" name="ID" value="<%=rs.getInt("ID")%>"/>
						    <input type="submit" value="DELETE"/>
					  </form>
					</td>
				</tr>
				<%
					}
				%>
			</table>
			<%
				rs.close();
				st.close();
				con.close();
			%>
			<br />
			<br />
			<br />
			<br />
			<br />
			<br />
			<br />
			<br />
			<br />
			<br />
		</div>
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
history.go(1);
</script>
	</body>
</html>
