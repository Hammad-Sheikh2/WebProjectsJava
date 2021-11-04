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
    <title>Submissions</title>
</head>
<body>
<div class="container mt-3">
    <nav aria-label="breadcrumb">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="./DisplayCourses"><c:out value="${title}" /></a></li>
            <li class="breadcrumb-item"><a href="./DisplayAssignments?id=<c:out value="${courseId}"/>"><c:out value="${courseName}" /></a></li>
            <li class="breadcrumb-item"><a href="./DisplaySubmissions?id=<c:out value="${courseId}"/>&aId=<c:out value="${assignmentId}"/>"><c:out value="${assignmentName}" /></a></li>
            <li class="breadcrumb-item active" aria-current="page">Submissions</li>
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
    <div class="table-responsive">
        <table class="table table-striped">
            <thead>
            <tr>
                <th scope="col">Student</th>
                <th scope="col">Answer</th>
                <th scope="col">Submitted Date</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="item" items="${submissions}">
                <tr>
                    <td><c:out value="${item.getStudentName()}"/></td>
                    <td><c:out value="${item.getStudentAnswer()}"/></td>
                    <td><c:out value="${item.getDate()}"/></td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>

    <c:if test="${user!=null}">
        <c:if test="${user.getRole().equals('STUDENT')}">
            <a href="./CreateSubmission?id=${courseId}&aId=${assignmentId}" class="btn btn-primary">Create Submission</a>
        </c:if>
    </c:if>
</div>
</body>
</html>
