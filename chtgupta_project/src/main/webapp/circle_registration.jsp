<html>




<body >
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
	String nname = request.getParameter("name");

	st=con.createStatement();

	rs=st.executeQuery("select * from circle where idno="+nid+"");
			
	if(!rs.next())
		{	
			int i = st.executeUpdate("insert into circle values("+nid+",'"+nname+"')");


			if(i==1)
				response.sendRedirect("circle.jsp");

%>
  
    
<%
		}
		else
		{
			request.setAttribute("msg", "Process Add New Circle Failed. Please check Circle ID. The ID you entered already exists in system.");
			request.getRequestDispatcher("circle.jsp").forward(request, response);
		}
	%>