<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <title>Shop-E Login</title>
    <style>
        body{
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            align-items: center;
            background: rgb(2,0,36);
            background: linear-gradient(125deg, rgba(2,0,36,1) 9%, rgba(9,9,121,1) 50%, rgba(0,212,255,1) 89%);
        }
    </style>
</head>
<body>
<div class="container">
    <div class="row">
        <div class="col-sm-6">
            <h1 class="text-warning display-3"><b>Shop-E</b></h1>
            <p class="text-white">Shop-E was an e-commerce portal based in United Kingdom. In July 2016 Internet merged ecommerce site Shop-E. Shop-E starts its operations officially in United Kingdom on 5 July 2017.</p>
        </div>
        <div class="col-sm-6 bg-white card pt-4 px-2 pb-5">
            <div class="card-body">
                <h3 class="card-title">Welcome!</h3>
                <form action="http://localhost:8080/Shop_E_war/validateUser" method="post">
                    <label class="mt-3" for="tbEmail">Email</label>
                    <input name="email" id="tbEmail" type="email" class="form-control" required>
                    <label class="mt-2" for="tbPass">Password</label>
                    <input name="password" id="tbPass" type="password" class="form-control" required>
                    <%
                        String message=(String) request.getAttribute("Message");
                        if(message==null){
                            message="";
                        }
                    %>
                    <%=message%>
                    <p class="mt-3">Didn't have a account <a href="http://localhost:8080/Shop_E_war/SignUp" class="card-link">Sign Up</a> to make new one.</p>
                    <button type="submit" class="btn btn-primary px-3 mt-2">Login</button>
                </form>
            </div>
        </div>
    </div>
</div>
</body>
</html>
