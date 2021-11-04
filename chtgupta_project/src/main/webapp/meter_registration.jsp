<html>




<body>

<%@ page import="java.sql.*,java.util.*" %>

<%! 
	Connection con;
	ResultSet rs,rs1;
	Statement st,st1;
%>
<%
Class.forName("com.mysql.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/chtgupta","root","1234");
		
	String cname = request.getParameter("cname").trim();
	String dname = request.getParameter("dname").trim();
	String mno = request.getParameter("mno");
	String mcname = request.getParameter("mcname");
	st=con.createStatement();

	if(cname.equals(null) || dname.equals(null) || mno.equals(null) || mcname.equals(null))
	{
		request.setAttribute("msg", "Process Add New Meter Failed. Please check the fields ! Some fields are empty.");
		request.getRequestDispatcher("meter.jsp").forward(request, response);
	}
	else
	{

rs=st.executeQuery("select * from meter where mno="+mno+"");
			
	if(!rs.next())
		{	
int i = st.executeUpdate("insert into meter values('"+cname+"','"+dname+"',"+mno+",'"+mcname+"')");

//out.println("<font color=blue size=4><b><center><b><h1>Meter Added");
//	out.println("<p><h1><font color=blue><b><center><b><center>Thanks</p>");
if(i == 1)
	response.sendRedirect("meter.jsp");
%>
  
    
<%
		}
		else
		{
			request.setAttribute("msg", "Process Add New Meter Failed. Please Check Meter ID. The ID you entered already exists in system.");
			request.getRequestDispatcher("meter.jsp").forward(request, response);
		}
	}%>