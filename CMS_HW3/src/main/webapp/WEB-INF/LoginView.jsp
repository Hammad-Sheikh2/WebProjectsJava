<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <script src="https://kit.fontawesome.com/4f3bcb92fc.js" crossorigin="anonymous"></script>
    <title>Login</title>
</head>
<body>
<div class="container mt-3">
    <div class="card">
        <h3 class="card-header">Login</h3>
        <div class="card-body">
            <form method="post" action="./Login">
                <label for="username">Username</label>
                <input class="form-control" type="text" name="username" id="username"><br><br>
                <label for="password">Password</label>
                <input class="form-control" type="password" name="password" id="password"><br><br>
                <input class="btn btn-primary" type="submit" value="Login">
            </form>
        </div>
    </div>
</div>
</body>
</html>