
<%@ page import="java.sql.*,java.util.*" %>

<%! 
	Connection con;
	ResultSet rs,rs1;
	Statement st,st1;
%>
<%
try 
{
	Class.forName("com.mysql.jdbc.Driver");
	   Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/chtgupta","root","1234");
		
String cname = request.getParameter("cname").trim();
String dname = request.getParameter("dname").trim();
String mno = request.getParameter("mno").trim();
String mcname = request.getParameter("mcname").trim();
String name = request.getParameter("name").trim();
String age = request.getParameter("query").trim();

st1=con.createStatement();



int i = st1.executeUpdate("insert into query values('"+cname+"','"+dname+"',"+mno+", '"+mcname+"','"+name+"','"+age+"')");

if(i==1)
	{
	request.setAttribute("msg", "Query Added. Thanks!");
	request.getRequestDispatcher("post_query.jsp").forward(request, response);
	}




		}
		catch (Exception e)
		{
			out.println(e);
			request.setAttribute("errmsg", "You already posted a query.");
			request.getRequestDispatcher("post_query.jsp").forward(request, response);
		}
	%>	