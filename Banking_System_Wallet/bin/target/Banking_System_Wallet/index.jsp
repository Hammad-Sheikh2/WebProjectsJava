<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <script src="https://kit.fontawesome.com/4f3bcb92fc.js" crossorigin="anonymous"></script>
    <title>Banking Wallet Login</title>
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
    <div class="card" style="width: 30rem">
        <div class="card-body">
            <h3 class="card-title">
                <i class="fas fa-lock"></i> Login
            </h3>
            <div>
                <form method="post" action="./Login">
                    <label class="mt-3" for="username">Username</label>
                    <input id="username" name="username" class="form-control" type="text" required>
                    <label class="mt-3" for="password">Password</label>
                    <input id="password" name="password" class="form-control" type="password" required>
                    <%if(request.getAttribute("status")!=null){%>
                        <%if(!((boolean) request.getAttribute("status"))){%>
                            <div class="mt-3 alert alert-danger alert-dismissible fade show" role="alert">
                                <i class="fas fa-exclamation-circle"></i> <%=(String)request.getAttribute("message")%>
                                <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                        <%}%>
                    <%}%>
                    <p class="card-text">Didn't have account. <a class="text-success" href="./SignUp">Register</a> yourself and enjoy our services.</p>
                    <button class="btn btn-outline-dark mt-3" type="submit"><i class="fas fa-unlock-alt"></i> Login</button>
                </form>
            </div>
        </div>
    </div>
</body>
</html>
