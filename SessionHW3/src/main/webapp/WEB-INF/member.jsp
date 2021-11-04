<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page isELIgnored = "false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Member</title>
</head>
<body>
	<c:if test = "${user == null}">
         <script>
         window.location="./Login"
         </script>
    </c:if>
    <h1>Hi, <c:out value="${user.getUsername()}" />. Welcome to the Member's Area. </h1>
    <a href="./Logout">Logout</a>
</body>
</html>