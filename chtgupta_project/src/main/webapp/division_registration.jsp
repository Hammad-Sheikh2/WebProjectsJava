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
		
	String nid = request.getParameter("idno");
	String cname = request.getParameter("cname");
	String dname = request.getParameter("dname");
	st=con.createStatement();

rs=st.executeQuery("select * from division where didno="+nid+"");
			
	if(!rs.next())
		{	
int i =st.executeUpdate("insert into division values("+nid+",'"+cname+"','"+dname+"')");

//out.println("<font color=blue size=4><b><center><b><h1>Division Added");
//	out.println("<p><h1><font color=blue><b><center><b><center>Thanks</p>");

if(i==1)
	response.sendRedirect("division.jsp");
%>
  
    
<%
		}
		else
		{
			request.setAttribute("msg", "Process Add New Division Failed. Please check Division ID. The ID you entered already exists in system.");
			request.getRequestDispatcher("division.jsp").forward(request, response);
		}
	%>