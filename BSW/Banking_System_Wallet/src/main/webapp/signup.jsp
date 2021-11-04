<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <script src="https://kit.fontawesome.com/4f3bcb92fc.js" crossorigin="anonymous"></script>
    <title>Banking Wallet SignUp</title>
    <style>
        .center-page{
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            align-items: center;
        }
        .gradiant-color{
            background-image: radial-gradient( circle farthest-corner at 10% 20%,  rgba(147,67,67,1) 0%, rgba(111,27,27,1) 90% );
        }
    </style>
</head>
<body class="center-page gradiant-color">
<div class="card" style="width: 50rem">
    <div class="card-body">
        <h3 class="card-title">
            <i class="fas fa-user-plus"></i> Sign Up
        </h3>
        <div>
            <form method="post" action="./SignUp">
                <div class="input-group mt-3">
                    <div class="input-group-prepend">
                        <span class="input-group-text" id="forUsername"><i class="fas fa-signature"></i></span>
                    </div>
                    <input type="text" name="username" class="form-control" id="username" placeholder="Username" aria-describedby="forUsername" required>
                </div>
                <div class="input-group mt-3">
                    <div class="input-group-prepend">
                        <span class="input-group-text" id="forEmail"><i class="fas fa-at"></i></span>
                    </div>
                    <input type="text" name="email" class="form-control" id="email" placeholder="Email" aria-describedby="forEmail" required>
                </div>
                <div class="input-group  mt-3">
                    <div class="input-group-prepend">
                        <span class="input-group-text" id="forNationalId"><i class="fas fa-id-card"></i></span>
                    </div>
                    <input type="text" name="nationalId" class="form-control" id="nationalId" placeholder="National ID" aria-describedby="forNationalId" required>
                </div>
                <div class="input-group mt-3">
                    <div class="input-group-prepend">
                        <span class="input-group-text" id="forContact"><i class="fas fa-phone-alt"></i></span>
                    </div>
                    <input type="text" name="contact" class="form-control" id="contact" placeholder="Contact Number" aria-describedby="forContact" required>
                </div>
                <div class="input-group mt-3">
                    <div class="input-group-prepend">
                        <span class="input-group-text" id="forPassword"><i class="fas fa-unlock-alt"></i></span>
                    </div>
                    <input type="password" name="password" class="form-control" id="password" placeholder="Password" aria-describedby="forPassword" required>
                </div>
                <div class="input-group mt-3">
                    <div class="input-group-prepend">
                        <span class="input-group-text" id="forAddress"><i class="fas fa-map-marker-alt"></i></span>
                    </div>
                    <textarea rows="3" name="address" class="form-control" id="address" placeholder="Address" aria-describedby="forAddress" required></textarea>
                </div>
                <%if(request.getAttribute("status")!=null){%>
                <%if(!((boolean) request.getAttribute("status"))){%>
                <div class="mt-3 alert alert-danger alert-dismissible fade show" role="alert">
                    <i class="fas fa-exclamation-circle"></i> <%=(String)request.getAttribute("message")%>
                    <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <%}
                else{%>
                <div class="mt-3 alert alert-success alert-dismissible fade show" role="alert">
                    <i class="fas fa-exclamation-circle"></i> <%=(String)request.getAttribute("message")%>
                    <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <%}%>
                <%}%>
                <p class="card-text"><strong>Provide correct information!</strong> Register yourself and enjoy our services.</p>
                <button class="btn btn-outline-success mt-3" type="submit">Sign Up <i class="fas fa-arrow-right"></i></button>
            </form>
        </div>
    </div>
</div>
</body>
</html>
