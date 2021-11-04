<%--
  Created by IntelliJ IDEA.
  User: Hammad
  Date: 10/02/2021
  Time: 1:31 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="icon" type="image/png" href="../icon.ico"/>
    <link rel="stylesheet" type="text/css" href="admin.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="../fontawesome-free-5.15.1-web/fontawesome-free-5.15.1-web/css/all.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <title>Project Approval System</title>
</head>
<body onload="checkIsUserAccessPageByLogin()">
    <div class="container main-panel">
        <nav class="navbar navbar-expand-md navbar-light nav-menu">
            <h5 class="navbar-brand" >Welcome, <span class="heading text-danger">Admin <i class="fas fa-user-shield"></i></span></h5>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#collapsibleNavbar">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="">

            </div>
            <div class="collapse navbar-collapse ml-4" id="collapsibleNavbar">
                <ul class="navbar-nav">
                    <li class="nav-item" onclick="dashboard()">
                        <span class="nav-link" ><i class="fas fa-chart-line"></i> Dashboard</span>
                    </li>
                    <li class="nav-item" onclick="Notification()">
                        <span class="nav-link"><i class="fas fa-bell"></i> Notification</span>
                    </li>
                    <li class="nav-item" onclick="Members()">
                        <span class="nav-link"><i class="fas fa-users"></i> Members</span>
                    </li>
                    <li class="nav-item" onclick="Profile()">
                        <span class="nav-link"><i class="fas fa-user-circle"></i> Profile</span>
                    </li>
                    <li class="nav-item" onclick="logout()">
                        <span class="nav-link"><i class="fas fa-power-off"></i> Logout</span>
                    </li>
                </ul>
            </div>
        </nav>
        <div id="uc-panel">

        </div>
    </div>
    <script>
        let userData;
        function makeNewUser(){
            let fullName=document.getElementById("userFullName").value;
            let email=document.getElementById("userEmail").value;
            let username=document.getElementById("userUserName").value;
            let password=document.getElementById("userPassword").value;
            let role=document.getElementById("userRole").value;
            $.ajax({
                url:"http://localhost:8080/Project_Manager_App_JSP_AJAX_war/dbHandler",
                type:"POST",
                data:{
                    action:"makeNewUser",
                    fullName:fullName,
                    email:email,
                    username:username,
                    password:password,
                    role:role
                },
                success:(data)=>{
                    console.log(data);
                    alert(data.msg);
                },
                failure:(error)=>{
                    console.log(error);
                    alert(error.msg);
                }
            })
        }
        function checkIsUserAccessPageByLogin() {
            $.ajax({
                url:"http://localhost:8080/Project_Manager_App_JSP_AJAX_war/dbHandler",
                type:"POST",
                data:{
                    action:"getLoggedInUserData"
                },
                success:(data)=>{
                    if(data.result.isLoggedIn==0)
                    {
                        resetIsUserLoggedInData();
                        location.href="../index.jsp";
                    }
                    else {
                        $.ajax({
                            url:"http://localhost:8080/Project_Manager_App_JSP_AJAX_war/dbHandler",
                            type:"POST",
                            data:{
                                action:"GetUserData",
                                id:data.result.userId
                            },
                            success:(data1)=>{
                                userData=data1.result;
                            },
                            failure:(error)=>{
                                location.href="../index.jsp";
                            }
                        })
                    }
                },
                failure:(error)=>{
                    location.href="../index.jsp";
                }
            })
        }
        function resetIsUserLoggedInData(){
            $.ajax({
                type:"POST",
                url: "http://localhost:8080/Project_Manager_App_JSP_AJAX_war/dbHandler",
                data:{
                    action: "SaveLoggedInUserDetail",
                    id:0,
                    isLoggedIn:0
                }
            });
        }
        function dashboard() {
            document.getElementById("uc-panel").innerHTML="<h1>DashBoard</h1>";
        }
        function Notification(){
            document.getElementById("uc-panel").innerHTML="";
        }
        function Members() {
            let divPanel=document.createElement("DIV");
            //--------------ADD-USER-BLOCK------------------
            let divAddMember=document.createElement("DIV");
            divAddMember.className="col-md-6 row";
            //--------------ADD-USER-UI---------------------
            let addMemberTitle=document.createElement("H2");
            addMemberTitle.className="heading mb-3 col-12";
            addMemberTitle.innerText="Add New Member";
            divAddMember.appendChild(addMemberTitle);
            //===============================================
            let divAddMemberFullName=document.createElement("DIV");
            divAddMemberFullName.className="form col-12"
            let addMemberFullNameLabel=document.createElement("P");
            addMemberFullNameLabel.innerText="Full Name";
            let addMemberFullNameInputBox=document.createElement("INPUT");
            addMemberFullNameInputBox.setAttribute("type","text");
            addMemberFullNameInputBox.id="userFullName";
            addMemberFullNameInputBox.className="form-control"
            divAddMemberFullName.appendChild(addMemberFullNameLabel);
            divAddMemberFullName.appendChild(addMemberFullNameInputBox);
            //==================================================
            let divAddMemberEmail=document.createElement("DIV");
            divAddMemberEmail.className="form mt-3 col-12"
            let addMemberEmailLabel=document.createElement("P");
            addMemberEmailLabel.innerText="Email";
            let addMemberEmailInputBox=document.createElement("INPUT");
            addMemberEmailInputBox.setAttribute("type","email");
            addMemberEmailInputBox.id="userEmail";
            addMemberEmailInputBox.className="form-control"
            divAddMemberEmail.appendChild(addMemberEmailLabel);
            divAddMemberEmail.appendChild(addMemberEmailInputBox);
            //===================================================
            let divAddMemberUserName=document.createElement("DIV");
            divAddMemberUserName.className="form mt-3 col-12"
            let addMemberUserNameLabel=document.createElement("P");
            addMemberUserNameLabel.innerText="Username";
            let addMemberUserNameInputBox=document.createElement("INPUT");
            addMemberUserNameInputBox.setAttribute("type","text");
            addMemberUserNameInputBox.id="userUserName";
            addMemberUserNameInputBox.className="form-control"
            divAddMemberUserName.appendChild(addMemberUserNameLabel);
            divAddMemberUserName.appendChild(addMemberUserNameInputBox);
            //===================================================
            let divAddMemberPassword=document.createElement("DIV");
            divAddMemberPassword.className="form mt-3 col-12"
            let addMemberPasswordLabel=document.createElement("P");
            addMemberPasswordLabel.innerText="Password";
            let addMemberPasswordInputBox=document.createElement("INPUT");
            addMemberPasswordInputBox.setAttribute("type","password");
            addMemberPasswordInputBox.id="userPassword";
            addMemberPasswordInputBox.className="form-control"
            divAddMemberPassword.appendChild(addMemberPasswordLabel);
            divAddMemberPassword.appendChild(addMemberPasswordInputBox);
            //===================================================
            let divAddMemberRole=document.createElement("DIV");
            divAddMemberRole.className="form-group mt-3 col-12"
            let addMemberRoleLabel=document.createElement("P");
            addMemberRoleLabel.innerText="Role";
            let addMemberRoleSelectBox=document.createElement("SELECT");
            addMemberRoleSelectBox.className="form-control";
            addMemberRoleSelectBox.id="userRole";
            let addMemberRoleSelectBoxOption1=document.createElement("OPTION");
            addMemberRoleSelectBoxOption1.setAttribute("value","HeadOfDepartment");
            addMemberRoleSelectBoxOption1.innerText="Head Of Department";
            let addMemberRoleSelectBoxOption2=document.createElement("OPTION");
            addMemberRoleSelectBoxOption2.setAttribute("value","ProjectInCharge");
            addMemberRoleSelectBoxOption2.innerText="Project In-Charge";
            let addMemberRoleSelectBoxOption3=document.createElement("OPTION");
            addMemberRoleSelectBoxOption3.setAttribute("value","InternalGuide");
            addMemberRoleSelectBoxOption3.innerText="Internal Guide";
            let addMemberRoleSelectBoxOption4=document.createElement("OPTION");
            addMemberRoleSelectBoxOption4.setAttribute("value","Student");
            addMemberRoleSelectBoxOption4.innerText="Student";
            addMemberRoleSelectBox.appendChild(addMemberRoleSelectBoxOption1);
            addMemberRoleSelectBox.appendChild(addMemberRoleSelectBoxOption2);
            addMemberRoleSelectBox.appendChild(addMemberRoleSelectBoxOption3);
            addMemberRoleSelectBox.appendChild(addMemberRoleSelectBoxOption4);
            divAddMemberRole.appendChild(addMemberRoleLabel);
            divAddMemberRole.appendChild(addMemberRoleSelectBox);
            //=======================================================
            let divAddMemberSubmit=document.createElement("DIV");
            divAddMemberSubmit.className="my-3 col-12";
            divAddMemberSubmit.innerHTML="<button class='btn btn-success px-5' style='border-radius:30px' onclick='makeNewUser()'>Submit</button>"

            divAddMember.appendChild(divAddMemberFullName);
            divAddMember.appendChild(divAddMemberEmail);
            divAddMember.appendChild(divAddMemberUserName);
            divAddMember.appendChild(divAddMemberPassword);
            divAddMember.appendChild(divAddMemberRole);
            divAddMember.appendChild(divAddMemberSubmit);
            divPanel.appendChild(divAddMember);



            //-----------------------------------------------
            let divMembersStatics=document.createElement("DIV");
            divMembersStatics.className="col-md-6";
            divMembersStatics.innerHTML="<div>" +
                "<fieldset style='border:1px solid gray;border-radius:30px;padding:15px'>" +
                "<legend style='text-align:center;border:1px solid gray;border-radius:30px'><h1 class='heading'>Members Statistics</h1></legend>" +
                "<table style='border: none' class='table stats-table'>" +
                "<tr>" +
                "<td><h5>Head Of Departments :</h5></td>" +
                "<td id='HOD'>5</td>" +
                "</tr>" +
                "<tr>" +
                "<td><h5>Project In-Charge :</h5></td>" +
                "<td id='ProjectInCharge'>20</td>" +
                "</tr>" +
                "<tr>" +
                "<td><h5>Internal Guide :</h5></td>" +
                "<td id='InternalGuide'>13</td>" +
                "</tr>" +
                "<tr>" +
                "<td><h5>Students :</h5></td>" +
                "<td id='Student'>90</td>" +
                "</tr>" +
                "</table>" +
                "</fieldset>" +
                "</div>";

            divPanel.appendChild(divMembersStatics);
            document.getElementById("uc-panel").innerHTML=divPanel.innerHTML;
            document.getElementById("uc-panel").className="container mb-3 row uc-panel";
        }
        function logout(){
            location.href="../index.jsp";
        }
        function Profile(){
            let divPanel  = document.createElement("DIV");
            divPanel.innerHTML= "<div class='container my-4 jumbotron' style='border-radius:40px'>" +
                "<div class='d-flex row'>" +
                "<div class='mr-auto col-md-10'>" +
                "<h1 class='display-md-2 mt-2 heading text-warning'>"+userData.fullName+"</h1>" +
                "</div>" +
                "<div class='ml-auto col-md-2'>" +
                "<img src='admin.png' style='border-radius:50%;width:100px;height:100px'>" +
                "<button class='mx-3 mt-3 btn btn-dark'>Upload</button>" +
                "</div>" +
                "</div>" +
                "</div>" +
                "<div class='container my-4 jumbotron' style='border-radius:40px'>" +
                "<fieldset style='border:2px solid #1B9A28;border-radius:50px;padding:5px'>" +
                "<legend class='heading' style='border:2px solid #649996;border-radius:50px'>Profile Information</legend>" +
                "<div class='table-responsive-sm'>" +
                "<table class='table'>" +
                "<tr>" +
                "<td><b>Name</b></td>" +
                "<td>"+userData.fullName+"</td>" +
                "<tr>" +
                "<tr>" +
                "<td><b>Email</b></td>" +
                "<td>"+userData.email+"</td>" +
                "<tr>" +
                "<tr>" +
                "<td><b>Username</b></td>" +
                "<td>"+userData.username+"</td>" +
                "<tr>" +
                "</table>" +
                "</div>" +
                "</fieldset>" +
                "</div>" +
                "<div class='container my-4 jumbotron' style='border-radius:40px'>" +
                "<div class='card'>" +
                "<div class='card-header'><div class='heading'>Change Password</div></div>" +
                "<div class='card-body'>" +
                "<div class='table-responsive-sm'>" +
                "<table class='table'>" +
                "<tr>" +
                "<td><b>Old Password</b></td>" +
                "<td>" +
                "<div class='form-group'>" +
                "<input type='text' id='oldPassword' onblur='checkOldPassword()' class='form-control'></td>" +
                "</div>" +
                "<tr>" +
                "<tr>" +
                "<td><b>New Password</b></td>" +
                "<td>" +
                "<div class='form-group'>" +
                "<input type='text' id='newPassword' class='form-control'></td>" +
                "</div>" +
                "<tr>" +
                "<tr>" +
                "<td><b>Confirm Password</b></td>" +
                "<td>" +
                "<div class='form-group'>" +
                "<input type='text' id='confirmPassword' class='form-control'></td>" +
                "</div>" +
                "<tr>" +
                "</table>" +
                "<div id='alert'></div>" +
                "<button class='btn btn-dark' onclick='changeUserPassword()'>Change Password</button>" +
                "</div>" +
                "</div>" +
                "</div>";
            document.getElementById("uc-panel").innerHTML=divPanel.innerHTML;
        }
        function changeUserPassword(){
            let oldPass=document.getElementById("oldPassword").value;
            let newPass=document.getElementById("newPassword").value;
            let conPass=document.getElementById("confirmPassword").value;
            if(oldPass!=userData.password)
            {
                let alertOldPasswordIncorrect=document.createElement("DIV");
                alertOldPasswordIncorrect.innerHTML= "<div class='alert alert-danger alert-dismissible fade show'><button type='button' class='close' data-dismiss='alert'>&times;</button><strong>Old Password!</strong> is incorrect.</div>"
                document.getElementById("alert").appendChild(alertOldPasswordIncorrect);
            }
            else {
                if(newPass===conPass)
                {
                    $.ajax({
                        url:"http://localhost:8080/Project_Manager_App_JSP_AJAX_war/dbHandler",
                        type:"POST",
                        data:{
                            action:"changeUserPassword",
                            password:newPass,
                            id:userData.id
                        },
                        success:(data)=>{
                            if(data.status){
                                let alertOldPasswordIncorrect=document.createElement("DIV");
                                alertOldPasswordIncorrect.innerHTML= "<div class='alert alert-success alert-dismissible fade show'><button type='button' class='close' data-dismiss='alert'>&times;</button><strong>Password!</strong> changed successfully.</div>"
                                document.getElementById("alert").appendChild(alertOldPasswordIncorrect);
                                document.getElementById("oldPassword").value="";
                                document.getElementById("newPassword").value="";
                                document.getElementById("confirmPassword").value="";
                            }
                            else {
                                let alertOldPasswordIncorrect=document.createElement("DIV");
                                alertOldPasswordIncorrect.innerHTML= "<div class='alert alert-danger alert-dismissible fade show'><button type='button' class='close' data-dismiss='alert'>&times;</button><strong>Something!</strong> went wrong.</div>"
                                document.getElementById("alert").appendChild(alertOldPasswordIncorrect);
                            }
                        },
                        failure:(error)=>{
                            let alertOldPasswordIncorrect=document.createElement("DIV");
                            alertOldPasswordIncorrect.innerHTML= "<div class='alert alert-danger alert-dismissible fade show'><button type='button' class='close' data-dismiss='alert'>&times;</button><strong>Something!</strong> went wrong.</div>"
                            document.getElementById("alert").appendChild(alertOldPasswordIncorrect);
                        }
                    })

                }
                else {
                    let alertOldPasswordIncorrect=document.createElement("DIV");
                    alertOldPasswordIncorrect.innerHTML= "<div class='alert alert-danger alert-dismissible fade show'><button type='button' class='close' data-dismiss='alert'>&times;</button><strong>Kindly!</strong> make sure you enter same password in CONFIRM PASSWORD BOX as in NEW PASSWORD BOX.</div>"
                    document.getElementById("alert").appendChild(alertOldPasswordIncorrect);
                }
            }
        }
        function checkOldPassword(){
            let oldPassword=document.getElementById("oldPassword").value;
            if(oldPassword!=userData.password)
            {
                let alertOldPasswordIncorrect=document.createElement("DIV");
                alertOldPasswordIncorrect.innerHTML= "<div class='alert alert-danger alert-dismissible fade show'><button type='button' class='close' data-dismiss='alert'>&times;</button><strong>Old Password!</strong> is incorrect.</div>"
                document.getElementById("alert").appendChild(alertOldPasswordIncorrect);
            }
        }

    </script>
</body>
</html>
