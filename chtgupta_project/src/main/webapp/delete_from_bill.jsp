<%@ page import="java.sql.*,java.util.*" %>

<%! 
	Connection con;
	ResultSet rs,rs1;
	Statement st,st1;
%>
<%
	Class.forName("com.mysql.jdbc.Driver");
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/chtgupta","root","1234");
	String mno = request.getParameter("mno");
	String pid = request.getParameter("pid");
	st=con.createStatement();
	String jy = "delete from billing where mno="+mno;
	st.executeUpdate(jy);
	if(pid.equals("Com"))
		response.sendRedirect("commercial_bill.jsp");
	else
		response.sendRedirect("residential_bill.jsp");
%>
