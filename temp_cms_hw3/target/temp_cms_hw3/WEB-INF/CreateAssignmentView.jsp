<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
    <title>Create Assignment</title>
    <c:if test="${user!=null}">
        <c:if test="${!user.getRole().equals('TEACHER')}">
            <script>
                window.location="./DisplayCourses"
            </script>
        </c:if>
    </c:if>
</head>
<body>
<div class="container mt-3">
    <div class="card">
        <h3 class="card-header">Create Assignment</h3>
        <div class="card-body">
            <form action="./CreateAssignment?id=${courseId}" method="post" class="mt-5">
                <div class="input-group mt-3">
                    <div class="input-group-prepend">
                        <span class="input-group-text" id="forName"><i class="fas fa-signature"></i></span>
                    </div>
                    <input type="text" name="assignName" class="form-control" placeholder="Assignment Name" aria-describedby="forName" required>
                </div>
                <input class="btn btn-success mt-3" type="submit" value="Create">
            </form>
        </div>
    </div>
</div>
</body>
</html>
