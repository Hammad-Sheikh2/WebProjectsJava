<%@ page import="Modals.User" %>
<%@ page import="java.util.Date" %>
<%@ page import="Modals.Account" %>
<%@ page import="java.util.ArrayList" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%
    if(request.getSession().getAttribute("user_id")==null){
        request.setAttribute("status",false);
        request.setAttribute("message","Don't be over-smart, we handle all authentication. First Register yourself " +
                "with system and Login to use our services.");
        request.getRequestDispatcher("index.jsp").forward(request,response);
    }
%>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <script src="https://kit.fontawesome.com/4f3bcb92fc.js" crossorigin="anonymous"></script>
    <title>Banking Wallet System</title>
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
<body>
<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <a class="navbar-brand" href="./Home">Banking System</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav mr-auto">
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="#" id="ActionsDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    Activity
                </a>
                <div class="dropdown-menu" aria-labelledby="ActionsDropdown">
                    <h6 class="dropdown-header">Make a Transaction.</h6>
                    <a class="dropdown-item" href="./Deposit">Deposit</a>
                    <a class="dropdown-item" href="./Withdraw">Withdraw</a>
                    <div class="dropdown-divider"></div>
                </div>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="./Accounts">Accounts</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="./Statements">Statements</a>
            </li>
        </ul>
    </div>
</nav>
<%if(request.getAttribute("status")!=null){
    if(!((boolean) request.getAttribute("status"))){
%>
<div class="container mt-3">
    <div class="card mt-3">
        <h5 class="card-header">Hello! Good to see you.</h5>
        <div class="card-body">
            <h5 class="card-title text-warning">Withdraw Service</h5>
            <p class="card-text">Here you can <strong>Withdraw</strong> your selected account balance amount to external account.</p>
        </div>
        <div class="card-footer text-muted">
            <%=new Date().toString()%>
        </div>
    </div>
    <div class="jumbotron bg-dark text-white mt-3">
        <h1 class="display-4"><i class="far fa-frown-open"></i> No Account Registered!</h1>
        <p class="lead">${message}</p>
        <hr class="my-4">
        <p>To Open New Account, Click Below Button</p>
        <p class="lead">
            <a class="btn btn-warning btn-lg" href="./Accounts" role="button">Open New Account</a>
        </p>
    </div>
</div>
<%}
else {
    User user = (User) request.getAttribute("user");
%>
<div class="container">
    <div class="card mt-3">
        <h5 class="card-header">Hello! Good to see you.</h5>
        <div class="card-body">
            <h5 class="card-title text-warning">Withdraw Service</h5>
            <p class="card-text">Here you can <strong>Withdraw</strong> your selected account balance amount to external account.</p>
        </div>
        <div class="card-footer text-muted">
            <%=new Date().toString()%>
        </div>
    </div>
    <h4 class="mt-3 text-danger">Enter Account Details</h4>
    <div class="my-3">
        <div class="card">
            <div class="card-body">
                <h5 class="card-title mt-3">External account details</h5>
                <div class="input-group">
                    <div class="input-group-prepend">
                        <span class="input-group-text" id="forAccNumber"><i class="fas fa-user-circle"></i></span>
                    </div>
                    <input type="text" name="accNumber" class="form-control" id="accNumber" placeholder="Account Number" aria-describedby="forAccNumber" required>
                </div>
                <div class="input-group mt-3">
                    <div class="input-group-prepend">
                        <span class="input-group-text" id="forAccHolder"><i class="fas fa-hands"></i></span>
                    </div>
                    <input type="text" name="accHolder" class="form-control" id="accHolder" placeholder="Account Holder Name" aria-describedby="forAccHolder" required>
                </div>
                <div class="input-group mt-3">
                    <div class="input-group-prepend">
                        <span class="input-group-text" id="forBankName"><i class="fas fa-university"></i></span>
                    </div>
                    <input type="text" name="bankName" class="form-control" id="bankName" placeholder="Bank Name" aria-describedby="forBankName" required>
                </div>
                <h5 class="card-title mt-2">Select account and amount to withdraw</h5>
                <select class="custom-select" id="acc_id">
                    <%
                        ArrayList<Account> accounts = (ArrayList<Account>) request.getAttribute("accounts");
                        for (int i = 0; i < accounts.size(); i++) {%>
                    <option value="<%=accounts.get(i).id%>"><%=accounts.get(i).currency.curr_annotation%></option>
                        <%}
                    %>
                </select>
                <div class="input-group mt-3">
                    <div class="input-group-prepend">
                        <span class="input-group-text" id="forAmount"><i class="fas fa-money-bill"></i></span>
                    </div>
                    <input type="number" name="amount" class="form-control" id="amount" placeholder="Amount To Withdraw" aria-describedby="forAmount" required>
                </div>
                <div id="errorMsg"></div>
                <button onclick="Amount_Withdraw_Request()" class="mt-3 btn btn-info">Withdraw</button>
            </div>
        </div>
    </div>
    <%
    }
    }
    %>
</div>
<footer class=" bg-dark text-light">
    <div class="center-page">
        <div><i class="fas fa-copyright"></i> Copyright 2021, Banking System Wallet.</div>
    </div>
</footer>
<script>
    function Amount_Withdraw_Request(){
        if((document.getElementById("accNumber").value=="")||(document.getElementById("accHolder").value=="")||(document.getElementById("bankName").value=="")||(document.getElementById("amount").value=="")){
            let div=document.createElement("DIV")
            div.innerHTML='<div class="alert mt-3 alert-warning alert-dismissible fade show" role="alert"><i class="fas fa-exclamation-circle"></i> Provide complete information.<button type="button" class="close" data-dismiss="alert" aria-label="Close"> <span aria-hidden="true">&times;</span> </button> </div>'
            document.getElementById("errorMsg").innerHTML=div.innerHTML;
            return
        }
        $.ajax({
            url:"./Withdraw",
            method:"POST",
            data:{
                acc_id:document.getElementById("acc_id").value,
                amount:document.getElementById("amount").value,
                accNumber:document.getElementById("accNumber").value,
                accHolder:document.getElementById("accHolder").value,
                bankName:document.getElementById("bankName").value
            },
            success:(data)=>{
                if(data.status){
                    let div=document.createElement("DIV")
                    div.innerHTML='<div class="alert mt-3 alert-success alert-dismissible fade show" role="alert"><i class="fas fa-exclamation-circle"></i> '+data.message+'<button type="button" class="close" data-dismiss="alert" aria-label="Close"> <span aria-hidden="true">&times;</span> </button> </div>'
                    document.getElementById("errorMsg").innerHTML=div.innerHTML;
                    document.getElementById("amount").value=""
                    document.getElementById("accNumber").value=""
                    document.getElementById("accHolder").value=""
                    document.getElementById("bankName").value=""
                    return
                }
                else {
                    let div=document.createElement("DIV")
                    div.innerHTML='<div class="alert mt-3 alert-danger alert-dismissible fade show" role="alert"><i class="fas fa-exclamation-circle"></i> '+data.message+'<button type="button" class="close" data-dismiss="alert" aria-label="Close"> <span aria-hidden="true">&times;</span> </button> </div>'
                    document.getElementById("errorMsg").innerHTML=div.innerHTML;
                    return
                }
            },
            failure:(error)=>{
                console.log(error)
            }
        })
    }
</script>
</body>
</html>
