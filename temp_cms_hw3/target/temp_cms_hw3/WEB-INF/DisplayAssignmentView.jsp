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
    <title><c:out value="${courseName}" /></title>
</head>
<body>
<div class="container mt-3">
    <nav aria-label="breadcrumb">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="./DisplayCourses"><c:out value="${title}" /></a></li>
            <li class="breadcrumb-item"><a href="./DisplayAssignments?id=<c:out value="${courseId}"/>"><c:out value="${courseName}" /></a></li>
            <li class="breadcrumb-item active" aria-current="page">Assignments</li>
        </ol>
    </nav>
    <c:if test="${user!=null}">
        <div class="card mt-3">
            <div class="card-header">
                <div class="d-flex">
                    <div>Welcome, <c:out value="${user.getUsername()}"/></div>
                    <a href="./Logout" class="btn btn-danger ml-auto">Logout</a>
                </div>
            </div>
            <div class="card-body">
                <h5 class="card-title">Role</h5>
                <p class="card-text"><c:out value="${user.getRole()}"/></p>
            </div>
        </div>
    </c:if>
    <table class="table table-striped">
        <thead>
        <tr>
            <th scope="col">Assignment</th>
            <th scope="col">Submissions</th>
            <th scope="col">Latest Submission</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="item" items="${assignments}">
            <tr>
                <td><a class="text-info" href="./DisplaySubmissions?id=<c:out value="${item.getCourse_id()}"/>&aId=<c:out value="${item.getId()}"/>"><c:out value="${item.getName()}"/></a></td>
                <td><c:out value="${item.getMySubmissions().size()}"/></td>
                <td><c:choose>
                    <c:when test="${item.getMySubmissions().size()!=0}">
                        <c:out value="${item.getMaxDateString()}"/>
                    </c:when>
                </c:choose></td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
    <c:if test="${user!=null}">
        <c:if test="${user.getRole().equals('TEACHER')}">
            <a href="./CreateAssignment?id=${courseId}" class="btn btn-primary">Create</a>
        </c:if>
    </c:if>

</div>
</body>
</html>
