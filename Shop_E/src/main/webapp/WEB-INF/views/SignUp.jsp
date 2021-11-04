<%@ page import="org.modal.User" %>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <title>Shop-E SignUp</title>
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
    <div class="card bg-white pt-4 px-3 pb-5">
        <div class="card-body">
            <h3><b>Create New Account!</b></h3>
            <label class="mt-3" for="tbUsername">Username</label>
            <input name="username" id="tbUsername" type="text" class="form-control">
            <label class="mt-2" for="tbEmail">Email</label>
            <input name="email" id="tbEmail" type="email" class="form-control">
            <label class="mt-2" for="tbPhn">Phone</label>
            <input name="phn" id="tbPhn" type="text" class="form-control">
            <label class="mt-2" for="tbPass">Password</label>
            <input name="password" id="tbPass" type="password" class="form-control">
            <label class="mt-2" for="tbRePass">Confirm Password</label>
            <input id="tbRePass" type="password" class="form-control">
            <div id="alertMessage"></div>
            <%
                String Message="";
                if(request.getAttribute("Message")!=null){
                    Message=(String) request.getAttribute("Message");
                }
            %>
            <%=Message%>
            <button onclick="RegisterUser()" class="btn btn-primary px-3 mt-3">SignUp</button>
        </div>
    </div>
</div>
<script>
    function RegisterUser(){
        if(document.getElementById("tbUsername").value==""||document.getElementById("tbEmail").value==""||document.getElementById("tbPhn").value==""||document.getElementById("tbPass").value==""){
            let div = document.createElement("DIV")
            div.innerHTML="<div class='mt-3 alert alert-warning alert-dismissible fade show' role='alert'><strong>Warning!</strong> Fill all fields with information.<button type='button' class='close' data-dismiss='alert' aria-label='Close'> <span aria-hidden='true'>&times;</span></button></div>"
            document.getElementById("alertMessage").innerHTML=div.innerHTML
            return;
        }
        else if(document.getElementById("tbPass").value!=document.getElementById("tbRePass").value){
            let div = document.createElement("DIV")
            div.innerHTML="<div class='mt-3 alert alert-warning alert-dismissible fade show' role='alert'><strong>Warning!</strong> Password not matched.<button type='button' class='close' data-dismiss='alert' aria-label='Close'> <span aria-hidden='true'>&times;</span></button></div>"
            document.getElementById("alertMessage").innerHTML=div.innerHTML
            return;
        }
        $.ajax({
            url:"http://localhost:8080/Shop_E_war/RegisterUser",
            method:"POST",
            data:{
                username:document.getElementById("tbUsername").value,
                password:document.getElementById("tbPass").value,
                phn:document.getElementById("tbPhn").value,
                email:document.getElementById("tbEmail").value
            },
            success:(data)=>{
                let div = document.createElement("DIV")
                if(data.isError){
                    div.innerHTML="<div class='mt-3 alert alert-danger alert-dismissible fade show' role='alert'>User Not Added.<button type='button' class='close' data-dismiss='alert' aria-label='Close'> <span aria-hidden='true'>&times;</span></button></div>"
                }else {
                    div.innerHTML="<div class='mt-3 alert alert-success alert-dismissible fade show' role='alert'>User Account Registered Successfully.<button type='button' class='close' data-dismiss='alert' aria-label='Close'> <span aria-hidden='true'>&times;</span></button></div>"
                    document.getElementById("tbUsername").value=""
                    document.getElementById("tbEmail").value=""
                    document.getElementById("tbPhn").value=""
                    document.getElementById("tbPass").value=""
                    document.getElementById("tbRePass").value=""
                }
                document.getElementById("alertMessage").innerHTML=div.innerHTML
            },
            failure:(error)=>{
                console.log(error)
            }
        });
    }
</script>
</body>
</html>
