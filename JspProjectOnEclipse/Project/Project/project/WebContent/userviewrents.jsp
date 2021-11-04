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
				    int availableCopies=0;
				%>
				<%=u.getUsername()%>
				<br />
				Select The Movie
			</h1>
			<br />
			<br />
			<table width="100%" align="left">
				<tr>
					<th>
						Movie Name
					</th>
					<th>
						Purchase/Rent
					</th>
					<th>
						CD/DVD
					</th>
					<th>
						No. of Day *(If Rent)
					</th>
					<th>
						No. of CD/DVD's Purchased *(If Purchase)
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
						.prepareStatement("select * from rent where username=?");
				     ps.setString(1, u.getUsername());
				     ResultSet rs = ps.executeQuery();
					while (rs.next()) {
				%>
				<tr align="center">
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
						<%=rs.getString(7)%>
					</td>
					<td>
						Rs.<%=rs.getInt(8)%>/-
					</td>
					<td>
						<%=rs.getInt(11)%>
					</td>
					<td>
						<%Connection con1 = ResourceHelper.getConnection();
						ArrayList<Video> videos=new ArrayList<Video>(); 
						Video video1=null;
						if(rs.getString(4).equalsIgnoreCase("Rent")){
							
							PreparedStatement ps1 = con1
									.prepareStatement("SELECT * FROM video WHERE name='"+rs.getString("moviename")+"'");
							ResultSet rs1 = ps1.executeQuery();
							 
						    while(rs1.next()){
						    	video1=new Video();
						    	video1.setName(rs.getString("moviename"));
						    	video1.setAvailabelCopies(rs1.getInt("availableCopies"));
						    	videos.add(video1);
						    
						   // for(int i=0;i<videos.size();i++){
						    //	if(videos.get(i).getName().equalsIgnoreCase(rs.getString("moviename"))){
						    
												    
						%>
						 <form action="ReturnMovie" method="post"
				           name="returnmovie">
				            <input type="hidden" name="ID" value="<%=rs.getString(1)%>"/>
						    <input type="hidden" name="rentedCopies" value="<%=rs.getInt(11)%>"/>
						    <input type="hidden" name="name" value="<%=rs.getString(2)%>"/>
						    <input type="hidden" name="availableCopies" value="<%=rs1.getInt("availableCopies")%>"/>
						    <input type="submit" value="RETURN"/>
					  </form>
						<%
						    } 	
							
						  //  }
						  //  }
						    %>
					</td>
				</tr>
				<%
						}
					}
				%>
			</table>
			<%
				rs.close();
				ps.close();
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
