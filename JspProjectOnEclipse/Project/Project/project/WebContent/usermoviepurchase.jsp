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
		<jsp:include page="usermenu.jsp"></jsp:include>
		<div id="page">
			<h1>
				<%
					User u = (User) session.getAttribute("user");
				%>
				<%=u.getUsername()%>
				<br />
				Select The Movie
			</h1>
			
			<br />
			
		
			<br/>
			<br/>
			  <div>
			<form action="" method="get">
			   <table width="100%" align="left">
					<tr>
					    <td>
					    
					    </td>
						<td>
							<input type="text" name="searchTerm" placeholder="Search here" />
						</td>
						<td>
					    
					    </td>
				     	</tr>
				</table>
		     </form> 
			</div>
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
				</tr>
			
			
				<%
				    String query=request.getParameter("searchTerm");
					Connection con = ResourceHelper.getConnection();
					Statement st = con.createStatement();
					String sql="select * from video";
					if(query!=null){
						sql="select * from video where name like '%"+query+"%'";
					}else{
						sql="select * from video";
					}
					ResultSet rs = st.executeQuery(sql);
					while (rs.next()) {
				%>
				<tr align="center">
					<td>
						<a
							href="useremoviepurchaseselect.jsp?name=<%=rs.getString(2)%>&vcd=<%=rs.getInt(7)%>&dvd=<%=rs.getInt(8)%>">
							<%=rs.getString(2)%></a>
					</td>
					<td>
						<%=rs.getString(3)%>
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
						Rs.<%=rs.getInt(7)%>/-
					</td>
					<td>
						Rs.<%=rs.getInt(8)%>/-
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
