
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
String age = request.getParameter("age").trim();
String sex = request.getParameter("sex").trim();
String cno = request.getParameter("cno").trim();
String address = request.getParameter("address").trim();
String type = request.getParameter("type").trim();
String uname = request.getParameter("uname");
String pass = request.getParameter("pass");
	
		
		st1=con.createStatement();



int i = st1.executeUpdate("update consumer set cname='"+cname+"',dname='"+dname+"',mno="+mno+",mcname='"+mcname+"' ,name='"+name+"',age="+age+",sex='"+sex+"',cno="+cno+",address='"+address+"',type='"+type+"',uname='"+uname+"',pass='"+pass+"' where mno ="+mno+"");


if(i==1)
	{
	request.setAttribute("msg", "Consumer Updated. Thanks!");
	request.getRequestDispatcher("edit_consumer1.jsp").forward(request, response);
	}




		}
		catch (Exception e)
		{
			out.println(e);
			request.setAttribute("errmsg", "Updation Failed! Something went wrong. For more information see server logs.");
			request.getRequestDispatcher("edit_consumer1.jsp").forward(request, response);
		}
	%>	