<%@page import="java.util.*,com.video.model.*,com.video.util.*,java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
 <%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
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
				<%
					User u = (User) session.getAttribute("user");
				%>
				<br />
				</h1>
		   		<br />
			<table width="100%" align="left">
				<tr>
					<th>
						Movie Name
					</th>
					
					<th>
						CD/DVD
					</th>
					<th>
						No. of Day *(If Rent)
					</th>
					
					<th>
						Cost
					</th>
					<th>
						Rented Copies
					</th>
				</tr>
				<%
					Connection con = ResourceHelper.getConnection();
					PreparedStatement ps = con
							.prepareStatement("select moviename,cdtype,noofdays,cost,rentedCopies from rent where type='Rent'");
					ResultSet rs = ps.executeQuery();
					while (rs.next()) {
				%>
				<tr align="center">
					<td>
						<%=rs.getString("moviename")%>
					</td>
					<td>
						<%=rs.getString("cdtype")%>
					</td>

					<td>
						<%=rs.getInt("noofdays")%>
					</td>
					<td>
						Rs.<%=rs.getInt("cost")%>/-
					</td>
					<td>
						<%=rs.getString("rentedCopies")%>
					</td>
										
					</tr>
				<%
					}
				%>
				</table>
				
				
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