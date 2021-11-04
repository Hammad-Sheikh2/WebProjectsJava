<%@ page import="java.util.ArrayList" %>
<%@ page import="Modals.Account" %>
<%@ page import="Modals.User" %>
<%@ page import="java.util.Date" %>
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
        User user = (User) request.getAttribute("user");
%>
<div class="container mt-3">
    <div class="card mt-3">
        <h5 class="card-header">Hello! Good to see you.</h5>
        <div class="card-body">
            <h5 class="card-title text-warning"><%=user.user_name%></h5>
            <p class="card-text">Welcome <%=user.user_name%>, without you, we wouldn't be us.</p>
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
            <h5 class="card-title text-warning"><%=user.user_name%></h5>
            <p class="card-text">Welcome <%=user.user_name%>, without you, we wouldn't be us.</p>
        </div>
        <div class="card-footer text-muted">
            <%=new Date().toString()%>
        </div>
    </div>
    <h4 class="mt-3 text-danger">Balances</h4>
    <div class="row">

<%
        ArrayList<Account> accounts = (ArrayList<Account>) request.getAttribute("accounts");
        for (int i = 0; i < accounts.size(); i++) {%>
        <div class="col-sm-4 mt-3">
            <div class="card">
                <div class="card-body">
                    <h5 class="card-title"><%=String.format("%.2f",accounts.get(i).balance)%> <%=accounts.get(i).currency.curr_annotation%></h5>
                    <p class="card-text">This account have currency <strong><%=accounts.get(i).currency.curr_name%></strong>.</p>
                    <button class="btn btn-warning"
                            onclick="loadDataToModal('<%=accounts.get(i).id%>','<%=user.user_name%>','<%=accounts.get(i).balance%>','<%=accounts.get(i).currency.curr_name%>','<%=accounts.get(i).currency.curr_annotation%>')"
                            data-toggle="modal" data-target="#exampleModal">Details</button>
                </div>
            </div>
        </div>
        <%}
    }
}
%>
    </div>
</div>
<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Account Details</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <table class="table table-striped">
                    <tr>
                        <td>Account Number</td>
                        <td id="acc_num"></td>
                    </tr>
                    <tr>
                        <td>Holder Name</td>
                        <td id="acc_holder"></td>
                    </tr>
                    <tr>
                        <td>Balance</td>
                        <td id="acc_balance"></td>
                    </tr>
                    <tr>
                        <td>Currency Name</td>
                        <td id="curr_name"></td>
                    </tr>
                    <tr>
                        <td>Currency Annotation</td>
                        <td id="curr_ann"></td>
                    </tr>
                </table>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
            </div>
        </div>
    </div>
</div>
<footer class=" bg-dark text-light fixed-bottom">
    <div class="center-page">
        <div><i class="fas fa-copyright"></i> Copyright 2021, Banking System Wallet.</div>
    </div>
</footer>
<script>
    function loadDataToModal(acc_id,acc_holder,acc_balance,curr_name,curr_ann){
        document.getElementById("acc_num").innerText=acc_id
        document.getElementById("acc_holder").innerText=acc_holder
        document.getElementById("acc_balance").innerText=acc_balance+" "+curr_ann
        document.getElementById("curr_name").innerText=curr_name
        document.getElementById("curr_ann").innerText=curr_ann
    }
</script>
</body>
</html>
