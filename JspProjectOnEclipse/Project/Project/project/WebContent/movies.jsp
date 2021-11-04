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
				Movies
			</h1>
			<table width="100%" height="100%" align="center">
				<tr align="center">
					<td align="left">
						<table>
							<tr>
								<td width="100" height="100">
									<img alt="3idiots" src="movieimages/3 Idiots.jpg" width="250"
										height="250">
								</td>
								<td>
									<table>
										<tr>
											<td>
												Name:3 IDIOTS
												<br />
												Staring: Aamir Khan,
												<br />
												Kareena Kapoor, Madhavan,
												<br />
												Sharman Joshi, Boman Irani
												<br />
												Language:Hindi
												<br />
												Director:Rajkumar Hirani
												<br />
												Producer:Vidhu Vinod Chopra
												<br />
												Vcd:Rs.99/-
												<br />
												DVD:Rs.150/-
												<br />
												Rent:Rs.25/-
											</td>
										</tr>
									</table>
								</td>
							</tr>
						</table>
					</td>
					<td>
						<table>
							<tr>
								<td width="100" height="100">
									<img alt="actionreply" src="movieimages/actionreply.jpg"
										width="250" height="250">
								</td>
								<td>
									<table>
										<tr>
											<td>
												Name:Action Replay
												<br />
												Staring:Akshay Kumar and Aishwarya Rai
												<br />
												Language:Hindi
												<br />
												Director: Vipul Shah
												<br />
												Producer: Vipul Shah
												<br />
												Vcd:Rs.89/-
												<br />
												DVD:Rs.120/-
												<br />
												Rent:Rs.25/-
											</td>
										</tr>
									</table>
								</td>
							</tr>
						</table>
					</td>
				</tr>
				<tr align="center">
					<td align="left">
						<table>
							<tr>
								<td width="100" height="100">
									<img alt="3idiots" src="movieimages/chekdeindia.jpg"
										width="250" height="250">
								</td>
								<td>
									<table>
										<tr>
											<td>
												Name:Chakde
												<br />
												Staring: Shahrukh Khan
												<br />
												Language:Hindi
												<br />
												Director: Shimit Amin
												<br />
												Producer:Aditya Chopra Yash Chopra
												<br />
												Vcd:Rs.120/-
												<br />
												DVD:Rs.250/-
												<br />
												Rent:Rs.25/-
											</td>
										</tr>
									</table>
								</td>
							</tr>
						</table>
					</td>
					<td>
						<table>
							<tr>
								<td width="100" height="100">
									<img alt="actionreply" src="movieimages/delhi6.JPG" width="250"
										height="250">
								</td>
								<td>
									<table>
										<tr>
											<td>
												Name:Delhi-6
												<br />
												Staring:Abhishek Bachchan,Sonam Kapoor
												<br />
												Language:Hindi
												<br />
												Director: Rakeysh Omprakash Mehra
												<br />
												Producer: Rakeysh Omprakash Mehra, Ronnie Screwvala
												<br />
												Vcd:Rs.80/-
												<br />
												DVD:Rs.90/-
												<br />
												Rent:Rs.25/-
											</td>
										</tr>
									</table>
								</td>
							</tr>
						</table>
					</td>
				</tr>
				<tr align="center">
					<td align="left">
						<table>
							<tr>
								<td width="100" height="100">
									<img alt="3idiots" src="movieimages/khaleja.jpg" width="250"
										height="250">
								</td>
								<td>
									<table>
										<tr>
											<td>
												Name:Khaleja
												<br />
												Staring: Mahesh Babu, Anushka Setti
												<br />
												Language:Telugu
												<br />
												Director:Trivikram
												<br />
												Producer:Ramesh Babu
												<br />
												Vcd:Rs.100/-
												<br />
												DVD:Rs.250/-
												<br />
												Rent:Rs.25/-
											</td>
										</tr>
									</table>
								</td>
							</tr>
						</table>
					</td>
					<td>
						<table>
							<tr>
								<td width="100" height="100">
									<img alt="actionreply"
										src="movieimages/lagaan_cassette_sleeve_art.jpg" width="250"
										height="250">
								</td>
								<td>
									<table>
										<tr>
											<td>
												Name:Lagaan
												<br />
												Staring:Aamir Khan, Gracy Singh
												<br />
												Language:Hindi
												<br />
												Director: Ashutosh Gowariker
												<br />
												Producer: Aamir Khan
												<br />
												Vcd:Rs.125/-
												<br />
												DVD:Rs.200/-
												<br />
												Rent:Rs.25/-
											</td>
										</tr>
									</table>
								</td>
							</tr>
						</table>
					</td>
				</tr>
				<tr align="center">
					<td align="left">
						<table>
							<tr>
								<td width="100" height="100">
									<img alt="3idiots"
										src="movieimages/nuvvostanante-nenoddantana-wallpaperww.jpg"
										width="250" height="250">
								</td>
								<td>
									<table>
										<tr>
											<td>
												Name:Nuvvostanante Nenodantana
												<br />
												Staring: Sidhardh, Trisha, Srihari
												<br />
												Language:Telugu
												<br />
												Director:Prabhudeva
												<br />
												Producer:M.S. Raju
												<br />
												Vcd:Rs.110/-
												<br />
												DVD:Rs.220/-
												<br />
												Rent:Rs.25/-
											</td>
										</tr>
									</table>
								</td>
							</tr>
						</table>
					</td>
					<td>
						<table>
							<tr>
								<td width="100" height="100">
									<img alt="actionreply"
										src="movieimages/teen-maar-movie-wallpapers-banners-posters-18.JPG"
										width="250" height="250">
								</td>
								<td>
									<table>
										<tr>
											<td>
												Name:Teenmaar
												<br />
												Staring:Pawan Kalyan, Trisha
												<br />
												Language:Telugu
												<br />
												Director: Jayathsi Paranji
												<br />
												Producer: Ganesh babu
												<br />
												Vcd:Rs.155/-
												<br />
												DVD:Rs.230/-
												<br />
												Rent:Rs.25/-
											</td>
										</tr>
									</table>
								</td>
							</tr>
						</table>
					</td>
				</tr>
				<tr align="center">
					<td align="left">
						<table>
							<tr>
								<td width="100" height="100">
									<img alt="3idiots" src="movieimages/motherindia.jpg"
										width="240px" height="271px">
								</td>
								<td>
									<table>
										<tr>
											<td>
												Name:Mother India
												<br />
												Staring: Nargis,Sunil Dutt
												<br />
												Language:Hindi
												<br />
												Director: Mehboob Khan
												<br />
												Producer:Mehboob Khan
												<br />
												Vcd:Rs.123/-
												<br />
												DVD:Rs.222/-
												<br />
												Rent:Rs.25/-
											</td>
										</tr>
									</table>
								</td>
							</tr>
						</table>
					</td>
					<td>
						<table>
							<tr>
								<td width="100" height="100">
									<img alt="actionreply" src="movieimages/prasdhanam.jpg"
										width="240px" height="281px">
								</td>
								<td>
									<table>
										<tr>
											<td>
												Name:Prasthanam
												<br />
												Staring:Sai Kumar, Sharwanand
												<br />
												Language:Telugu
												<br />
												Director: Deva Katta
												<br />
												Producer: Ravi Vallabhaneni
												<br />
												Vcd:Rs.105/-
												<br />
												DVD:Rs.220/-
												<br />
												Rent:Rs.25/-
											</td>
										</tr>
									</table>
								</td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
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
