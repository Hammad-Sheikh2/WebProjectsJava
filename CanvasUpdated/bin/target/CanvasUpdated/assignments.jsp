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
    <table class="table table-striped">
        <thead>
        <tr>
            <th scope="col">Assignment</th>
            <th scope="col">Submissions</th>
            <th scope="col">Latest Submission</th>
        </tr>
        </thead>
        <tbody>
        <c:set var="counter" value="${0}" scope="page" />
        <c:forEach var="item" items="${assignments}">
            <tr>
                <td><a class="text-info" href="./DisplaySubmissions?id=<c:out value="${courseId}"/>&aId=<c:out value="${counter}"/>"><c:out value="${item.name}"/></a></td>
                <td><c:out value="${item.mySubmissions.size()}"/></td>
                <td><c:choose>
                    <c:when test="${item.mySubmissions.size()!=0}">
                        <c:out value="${item.getMaxDateString()}"/>
                    </c:when>
                </c:choose></td>
            </tr>
            <c:set var="counter" value="${counter+1}" />
        </c:forEach>
        </tbody>
    </table>
    <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal">
        Create Assignment
    </button>

    <!-- Modal -->
    <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Create Assignment</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <form action="./CreateAssignment" method="get" class="mt-5">
                        <input style="display: none" type="number" name="id" value="<c:out value="${courseId}"/>" required>
                        <div class="input-group mt-3">
                            <div class="input-group-prepend">
                                <span class="input-group-text" id="forName"><i class="fas fa-signature"></i></span>
                            </div>
                            <input type="text" name="assignName" class="form-control" placeholder="Assignment Name" aria-describedby="forName" required>
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
