<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="icon" type="image/png" href="icon.ico"/>
    <link rel="stylesheet" type="text/css" href="Login/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" type="text/css" href="fontawesome-free-5.15.1-web/fontawesome-free-5.15.1-web/css/all.min.css">
    <link rel="stylesheet" type="text/css" href="Login/vendor/animate/animate.css">
    <link rel="stylesheet" type="text/css" href="Login/vendor/css-hamburgers/hamburgers.min.css">
    <link rel="stylesheet" type="text/css" href="Login/vendor/select2/select2.min.css">
    <link rel="stylesheet" type="text/css" href="Login/login.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <title>Project Approval System</title>
</head>
<body onload="resetIsUserLoggedInData()">
    <div class="limiter">
        <div class="container-login100">
            <div class="wrap-login100">
                <div class="login100-pic js-tilt" data-tilt>
                    <img src="Login/images/img-01.png" alt="IMG">
                </div>

                <div class="login100-form validate-form">
                        <span class="login100-form-title">
                            Member Login
                        </span>

                    <div class="wrap-input100 validate-input" data-validate = "Valid email is required: ex@abc.xyz">
                        <input required class="input100" type="text" id="userName" name="email" placeholder="Username">
                        <span class="focus-input100"></span>
                        <span class="symbol-input100">
                                <i class="fas fa-signature"></i>
                        </span>
                    </div>

                    <div class="wrap-input100 validate-input" data-validate = "Password is required">
                        <input required class="input100" type="password" id="password" name="pass" placeholder="Password">
                        <span class="focus-input100"></span>
                        <span class="symbol-input100">
                                <i class="fa fa-lock" aria-hidden="true"></i>
                            </span>
                    </div>

                    <div class="container-login100-form-btn">
                        <button class="login100-form-btn" onclick="VerifyCredentials()">
                            Login
                        </button>
                    </div>

                    <div class="text-center p-t-12 mb-5">
                            <span class="txt1">
                                Forgot
                            </span>
                        <a class="txt2" href="#">
                            Username / Password?
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </div>

<script>
    function VerifyCredentials() {
        let username=document.getElementById("userName").value;
        let password=document.getElementById("password").value;
        $.ajax({
            url: './dbHandler',
            type: "POST",
            data: {
                action: "ValidateUser",
                username: username,
                password: password
            },
            success: (data)=>{
                if(data.status)
                {
                    $.ajax({
                        type:"POST",
                        url: "./dbHandler",
                        data:{
                            action: "SaveLoggedInUserDetail",
                            id:data.result.id,
                            isLoggedIn:1
                        },
                        success:(data1)=>{
                            if (data1.status)
                            {
                                if(data.result.role==="ADMIN")
                                {
                                    location.href='Admin/admin.jsp';
                                }
                                if(data.result.role==="STUDENT")
                                {
                                    location.href='Student/student.jsp';
                                }
                            }
                            else {
                                console.log(data1);
                                alert(data1.result);
                            }
                        },
                        failure:(error)=>{
                            console.log(error);
                        }
                    })
                }
                else
                {
                    console.log(data);
                    alert(data.result);
                }
            },
            failure: (data)=>{
                console.log(data);
                alert(data.result);
            }
        });
    }
    function resetIsUserLoggedInData() {
        $.ajax({
            url:"http://localhost:8080/Project_Manager_App_JSP_AJAX_war/dbHandler",
            type:"POST",
            data:{
                action:"getLoggedInUserData"
            },
            success:(data)=>{
                if(data.result.isLoggedIn==0)
                {
                    if(data.result.userId == 0){
                        alert("ILLEGAL TRY TO ACCESS SYSTEM\n" +
                            "Chup Kr K Beh\n" +
                            "Jini Teri Okaat E Othye Reh\n" +
                            "Tu Mere Level Da Nai E Shoreya\n" +
                            "Titon Patiyan Na La. Bande Da Putr Bn.");
                    }
                }
            }
        });
        $.ajax({
            type:"POST",
            url: "http://localhost:8080/Project_Manager_App_JSP_AJAX_war/dbHandler",
            data:{
                action: "SaveLoggedInUserDetail",
                id:-1,
                isLoggedIn:0
            },
            success:(data)=>{
                console.log(data);
            },
            failure:(error)=>{
                console.log(error);
            }
        });
    }

</script>
    <script src="Login/vendor/jquery/jquery-3.2.1.min.js"></script>
    <script src="Login/vendor/select2/select2.min.js"></script>
    <script src="Login/vendor/tilt/tilt.jquery.min.js"></script>
</body>
</html>
