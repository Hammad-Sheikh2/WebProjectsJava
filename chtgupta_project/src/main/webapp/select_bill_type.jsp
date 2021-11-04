

<%
String type = request.getParameter("type");
out.println(type);

if (type.equals("Commercial"))
{
	response.sendRedirect("commercial_bill.jsp");
}
else
if(type.equals("Residential"))
{
	response.sendRedirect("residential_bill.jsp");
}
%>