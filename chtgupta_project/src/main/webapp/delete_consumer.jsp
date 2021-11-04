<%@ page import="java.sql.*,java.util.*" %>

<%! 
	Connection con;
	ResultSet rs,rs1;
	Statement st,st1;
%>

<%
Class.forName("com.mysql.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/chtgupta","root","1234");
	String cid = request.getParameter("no");
	st=con.createStatement();

	String jy = "delete from consumer where mno="+cid;

	st.executeUpdate(jy);
	request.setAttribute("msg", "Consumer(ID='"+cid+"') Deleted!");
	request.getRequestDispatcher("consumer.jsp").forward(request, response);
%>