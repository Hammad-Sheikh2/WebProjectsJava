<html>
<base target="_self">

<body bgcolor=#FFFFFF>
<%@ page import="java.sql.*"%>
<%
 
try
{
   Class.forName("com.mysql.jdbc.Driver");
   Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/chtgupta","root","1234");
%>
<% 
	String uname=request.getParameter("uname");
    String s2=request.getParameter("password");
   
  session.setAttribute("uname",uname);

   Statement st=con.createStatement();
   Statement st1=con.createStatement();
   
   ResultSet rs=st.executeQuery("select * from logindetails where UNAME='"+uname+"' and PASSWORD='"+s2+"'");

   if(rs.next())
	{
	   String s3= rs.getString(3);
	   
		if(s3.equals("admin"))
		  {
			response.sendRedirect("admin_home.jsp");
		  }
	}
ResultSet rs1=st1.executeQuery("select * from consumer where UNAME='"+uname+"' and PASS='"+s2+"'");
if(rs1.next())
	{
		response.sendRedirect("consumer_home.jsp");
	}
	else 
   {
		request.setAttribute("msg", "Incorrect credentials.");
		request.getRequestDispatcher("index.jsp").forward(request, response);
   }
}
catch(Exception e)
{
System.out.println(e);
}
%>
</body>
                                                                                        </html>