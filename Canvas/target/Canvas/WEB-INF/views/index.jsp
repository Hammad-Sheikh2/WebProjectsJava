<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page isELIgnored = "false" %>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <script src="https://kit.fontawesome.com/4f3bcb92fc.js" crossorigin="anonymous"></script>
    <title><c:out value="${title}" /></title>
</head>
<body>
<div class="container mt-3">
    <nav aria-label="breadcrumb">
        <ol class="breadcrumb">
            <li class="breadcrumb-item active" aria-current="page"><c:out value="${title}" /></li>
        </ol>
    </nav>
    <table class="table table-striped">
        <thead>
            <tr>
                <th scope="col">Course</th>
                <th scope="col">Assignments</th>
            </tr>
        </thead>
        <tbody>
        <c:set var="counter" value="${0}" scope="page" />
        <c:forEach var="item" items="${courses}">
            <tr>
                <td><a class="text-info" href="./DisplayAssignments/?id=<c:out value="${counter}"/>"><c:out value="${item.name}"/></a></td>
                <td><c:out value="${item.myAssignments.size()}"/></td>
            </tr>
            <c:set var="counter" value="${counter+1}" />
        </c:forEach>
        </tbody>
    </table>
</div>
</body>
</html>
