
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

	st=con.createStatement();
	st1 = con.createStatement();

rs=st.executeQuery("select * from consumer where mno="+mno+"");
			
	if(!rs.next())
		{	
			

		st.executeUpdate("insert into consumer values('"+cname+"','"+dname+"',"+mno+",'"+mcname+"','"+name+"','"+age+"','"+sex+"','"+cno+"','"+address+"','"+type+"','"+uname+"','"+pass+"')");
	
		request.setAttribute("msg", "Consumer Added. Thanks!");
		request.getRequestDispatcher("consumer.jsp").forward(request, response);
%>
  
    
<%
		}
		else
		{
			request.setAttribute("errmsg", "Please Check Meter No");
			request.getRequestDispatcher("consumer.jsp").forward(request, response);
		}
	%>