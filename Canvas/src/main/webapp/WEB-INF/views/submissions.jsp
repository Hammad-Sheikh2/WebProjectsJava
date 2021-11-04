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
            <li class="breadcrumb-item"><a href="../"><c:out value="${title}" /></a></li>
            <li class="breadcrumb-item"><a href="../DisplayAssignments/?id=<c:out value="${courseId}"/>"><c:out value="${courseName}" /></a></li>
            <li class="breadcrumb-item"><a href="../DisplaySubmissions/?id=<c:out value="${courseId}"/>&aId=<c:out value="${assignmentId}"/>"><c:out value="${assignmentName}" /></a></li>
            <li class="breadcrumb-item active" aria-current="page">Submissions</li>
        </ol>
    </nav>
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
            <c:set var="counter" value="${0}" scope="page" />
            <c:forEach var="item" items="${submissions}">
                <tr>
                    <td><c:out value="${item.studentName}"/></td>
                    <td><c:out value="${item.studentAnswer}"/></td>
                    <td><c:out value="${item.date}"/></td>
                </tr>
                <c:set var="counter" value="${counter+1}" />
            </c:forEach>
            </tbody>
        </table>
    </div>
    <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal">
        Create Submission
    </button>

    <!-- Modal -->
    <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Create Submission</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <form action="../CreateSubmission/" method="get" class="mt-5">
                        <input style="display: none" type="number" name="id" value="<c:out value="${courseId}"/>" required>
                        <input style="display: none" type="number" name="aId" value="<c:out value="${assignmentId}"/>" required>
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
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
