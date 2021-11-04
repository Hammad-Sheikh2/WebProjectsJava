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
			
			<br/>
			<br/>
			<br/>
			<table width="100%" align="left">
				<tr>
					<th>
						Movie Name
					</th>
					<th>
						Staring
					</th>
					<th>
						Language
					</th>
					<th>
						Director
					</th>
					<th>
						Producer
					</th>
					<th>
						VCD
					</th>
					<th>
						DVD
					</th>
					<th>
					rent
					</th>
					<th>
					availableCopies
					</th>
				</tr>
			
			
				<%
				    String query=request.getParameter("searchTerm");
					Connection con = ResourceHelper.getConnection();
					Statement st = con.createStatement();
					String sql="select * from video";
					ResultSet rs = st.executeQuery(sql);
					while (rs.next()) {
				%>
				<tr align="center">
					
					<td>
						<%=rs.getString("name")%>
					</td>
					<td>
						<%=rs.getString("staring")%>
					</td>
					<td>
						<%=rs.getString("language")%>
					</td>
					<td>
						<%=rs.getString("director")%>
					</td>
					<td>
						<%=rs.getString("producer")%>
					</td>
					<td>
						Rs.<%=rs.getInt("vcd")%>/-
					</td>
					<td>
						Rs.<%=rs.getInt("dvd")%>/-
					</td>
					<td>
						<%=rs.getInt("rent")%>
					</td>
					<td>
						<%=rs.getInt("availableCopies")%>
					</td>
					<td>
						 <form action="DeleteMovie" method="post"
				           name="deletemovie">
						    <input type="hidden" name="ID" value="<%=rs.getInt("ID")%>"/>
						    <input type="submit" value="DELETE"/>
					  </form>
					</td>
				</tr>
				<%
					}
				%>
				
			<%
				rs.close();
				st.close();
				con.close();
			%>
			
				
			
			</table>
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
