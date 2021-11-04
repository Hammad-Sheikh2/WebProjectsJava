<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix = "fn" uri = "http://java.sun.com/jsp/jstl/functions" %>
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
    <title>Create Submission</title>
</head>
<body>
<div class="container mt-3">
    <div class="card">
        <h3 class="card-header">Create Submission</h3>
        <div class="card-body">
            <form action="./CreateSubmission?id=${courseId}&aId=${assignmentId}" method="post" class="mt-5">
                <div class="input-group mt-3">
                    <div class="input-group-prepend">
                        <span class="input-group-text" id="forName"><i class="fas fa-signature"></i></span>
                    </div>
                    <input type="text" name="studentName" class="form-control" placeholder="Student Name" aria-describedby="forName" required>
                </div>
                <div class="input-group mt-3">
                    <div class="input-group-prepend">
                        <span class="input-group-text" id="forAnswer"><i class="fas fa-at"></i></span>
                    </div>
                    <textarea rows="3" name="comment" class="form-control" placeholder="Answer" aria-describedby="forAnswer" required></textarea>
                </div>
                <input class="btn btn-success mt-3" type="submit" value="Create">
            </form>
        </div>
    </div>
</div>
</body>
</html>
