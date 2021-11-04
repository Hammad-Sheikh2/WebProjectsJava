<%@ page import="java.util.ArrayList" %>
<%@ page import="Modals.Account" %>
<%@ page import="Modals.User" %>
<%@ page import="java.util.Date" %>
<%@ page import="Modals.Currency" %>
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
        <h1 class="display-4"><i class="far fa-frown-open"></i> Error!</h1>
        <p class="lead">${message}</p>
    </div>
</div>
<%}
else {
    User user = (User) request.getAttribute("user");
%>
<div class="container">
    <h4 class="mt-3 text-danger">Available Accounts</h4>
    <div class="row">
    <%
        ArrayList<Account> accounts = (ArrayList<Account>) request.getAttribute("accounts");
        ArrayList<Currency> currencies= (ArrayList<Currency>) request.getAttribute("currencies");
        if(currencies.size()==0){%>
          <div class="text-danger">No new currency available to open new account.</div>
        <%}
        else {
            for (int j = 0; j < accounts.size(); j++) {
                for (int i = 0; i < currencies.size(); i++) {
                    if(accounts.get(j).currency.curr_name.equals(currencies.get(i).curr_name)){
                        currencies.remove(i);
                        i--;
                    }
                }
            }
            for (int i = 0; i < currencies.size(); i++) {
        %>
        <div class="col-md-4 my-3">
            <div class="card">
                <div class="card-body">
                    <h5 class="card-title"><%=currencies.get(i).curr_annotation%></h5>
                    <p class="card-text">This account is available in <%=currencies.get(i).curr_name%> currency.</p>
                    <button class="btn mt-3 btn-outline-warning" onclick="Open_New_Account_Request('<%=currencies.get(i).id%>')">Open Account</button>
                </div>
            </div>
        </div>
        <%}
        }
        %>

    </div>
    <h4 class="mt-3 text-danger"><%=user.user_name%>'s Accounts</h4>
    <div class="table-responsive">
        <table class="table">
            <thead>
                <tr>
                    <th scope="col">Account Number</th>
                    <th scope="col">Holder Name</th>
                    <th scope="col">Balance</th>
                    <th scope="col">Currency</th>
                </tr>
            </thead>
            <tbody>
            <%
                for (int i = 0; i < accounts.size(); i++) {%>
            <tr>
                <td><%=accounts.get(i).id%></td>
                <td><%=accounts.get(i).user.user_name%></td>
                <td><%=accounts.get(i).balance%> <%=accounts.get(i).currency.curr_annotation%></td>
                <td><%=accounts.get(i).currency.curr_name%></td>
            </tr>
            <%}
            }
            }
            %>
            </tbody>
        </table>
    </div>
</div>

<script>
    function Open_New_Account_Request(curr_id){
        $.ajax({
            url:"./Accounts",
            method:"POST",
            data:{
                curr_id:curr_id
            },
            success:(data)=>{
                location.href="./Accounts"
            },
            failure:(error)=>{
                console.log(error)
            }
        })
    }
</script>
</body>
</html>
