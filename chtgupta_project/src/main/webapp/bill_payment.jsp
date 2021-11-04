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

String mno = request.getParameter("mno");
String due = request.getParameter("due");
String cno = request.getParameter("cno").trim();



st1=con.createStatement();

int a = cno.length();
if(a == 16)
	{
	due = "paid";

int i = st1.executeUpdate("update billing set cno='"+cno+"' , due='"+due+"' where mno="+mno+"");

if(i==1)
	{
	request.setAttribute("msg", "Bill Paid.");
	request.getRequestDispatcher("view_bill.jsp").forward(request, response);
	}
		}

	else
	{
		
		request.setAttribute("errmsg", "Please check your Card No.");
		request.getRequestDispatcher("view_bill.jsp").forward(request, response);
	}
}
catch(Exception e)
{
	out.println(e);
	request.setAttribute("errmsg", e.getMessage());
	request.getRequestDispatcher("view_bill.jsp").forward(request, response);
}

%>