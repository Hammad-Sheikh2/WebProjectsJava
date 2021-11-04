<%--
  Created by IntelliJ IDEA.
  User: Hammad
  Date: 11/02/2021
  Time: 1:20 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="icon" type="image/png" href="../icon.ico"/>
    <link rel="stylesheet" type="text/css" href="student.css">
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
            <h5 class="navbar-brand" >
                <img src="student.png" style="border-radius: 50%;width: 50px;height: 50px">
                Welcome, <span class="heading text-success">Student <i class="fas fa-user-graduate"></i></span>
            </h5>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#collapsibleNavbar">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse ml-4" id="collapsibleNavbar">
                <ul class="navbar-nav">
                    <li class="nav-item" >
                        <span class="nav-link" ><i class="fas fa-columns"></i> Dashboard</span>
                    </li>
                    <li class="nav-item" onclick="Projects()">
                        <span class="nav-link"><i class="fas fa-project-diagram"></i> Projects</span>
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
        let isClick=false;
        let objectivesList=[];
        let successCriteria=[];
        let equipmwntsList=[];
        let requirementsList=[];
        let isProjectViewDetailsPanelOpen=[];
        let oldProjectsList=[
            {
                title:"Project Approval System",
                statement:"Automate Project Approval Department.",
                date:"Febuary 15,2021",
                problem:"Boht Zaleel Hote Bachy. Department k 100 100 chkr lgwaty.",
                objectives:["Bacho ko Sakoon Bakshna.","Department ko khata system se bacaha."],
                success:["Pta nai"],
                equipmwnts:["IntelliJ","mySQL","Tomcat"],
                requirements:["HTML","CSS","JavaScript","JAVA","mySQL Query Language"],
                approvedPercentage:0,
                internalGuideComment:"",
                internalGuideFeedback:"",
                projectInchargeComment:"",
                projectInchargeFeedback:"",
                HODComment:"",
                HODFeedback:""
            },
            {
                title:"Gym Management System",
                statement:"Automate Gym Management System.",
                date:"Febuary 20,2019",
                problem:"Impossible to manage manually.",
                objectives:["Register New Customer.","Manage their shedules."],
                success:["Pta nai"],
                equipmwnts:["Visual Studio","MSSQL"],
                requirements:["C#","Window Forms","MSSQL Query Language"],
                approvedPercentage:33,
                internalGuideComment:"Excellent",
                internalGuideFeedback:"There would be a messaging module.",
                projectInchargeComment:"",
                projectInchargeFeedback:"",
                HODComment:"",
                HODFeedback:""
            },
            {
                title:"Project Approval System",
                statement:"Automate Project Approval Department.",
                date:"Febuary 15,2021",
                problem:"Boht Zaleel Hote Bachy. Department k 100 100 chkr lgwaty.",
                objectives:["Bacho ko Sakoon Bakshna.","Department ko khata system se bacaha."],
                success:["Pta nai"],
                equipmwnts:["IntelliJ","mySQL","Tomcat"],
                requirements:["HTML","CSS","JavaScript","JAVA","mySQLQueryLanguage"],
                approvedPercentage:66,
                internalGuideComment:"Excellent",
                internalGuideFeedback:"There would be a messaging module.",
                projectInchargeComment:"Perfect",
                projectInchargeFeedback:"UI is Best.",
                HODComment:"",
                HODFeedback:""
            },
            {
                title:"Project Approval System",
                statement:"Automate Project Approval Department.",
                date:"Febuary 15,2021",
                problem:"Boht Zaleel Hote Bachy. Department k 100 100 chkr lgwaty.",
                objectives:["Bacho ko Sakoon Bakshna.","Department ko khata system se bacaha."],
                success:["Pta nai"],
                equipmwnts:["IntelliJ","mySQL","Tomcat"],
                requirements:["HTML","CSS","JavaScript","JAVA","mySQLQueryLanguage"],
                approvedPercentage:99,
                internalGuideComment:"Excellent",
                internalGuideFeedback:"There would be a messaging module.",
                projectInchargeComment:"Perfect",
                projectInchargeFeedback:"UI is Best.",
                HODComment:"Approved",
                HODFeedback:"Best of Luck."
            }
        ];
        function checkIsUserAccessPageByLogin(){
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
        function Profile(){
            let divPanel  = document.createElement("DIV");
            divPanel.innerHTML= "<div class='container my-4 jumbotron' style='border-radius:40px'>" +
                "<div class='d-flex row'>" +
                "<div class='mr-auto col-md-10'>" +
                "<h1 class='display-md-2 mt-2 heading text-warning'>"+userData.fullName+"</h1>" +
                "</div>" +
                "<div class='ml-auto col-md-2'>" +
                "<img src='student.png' style='border-radius:50%;width:100px;height:100px'>" +
                "<button class='mx-3 mt-3 btn btn-dark'>Upload</button>" +
                "</div>" +
                "</div>" +
                "</div>" +
                "<div class='container my-4 jumbotron' style='border-radius:40px'>" +
                "<fieldset style='border:2px solid #FF68C9;border-radius:50px;padding:5px'>" +
                "<legend class='heading' style='border:2px solid #FFC809;border-radius:50px'>Student Information</legend>" +
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
        function logout(){
            location.href="../index.jsp";
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
        function Projects(){
            let divPanel=document.createElement("DIV");
            divPanel.innerHTML="<div style='border-radius:30px;background:#E9ECEF' class='container my-3'>" +
                "<div class='d-flex mb-3' style='border-bottom: 1px solid #D3D3D3' >" +
                "<h4 class='my-2 heading'>Send New Project Proposal</h4>" +
                "<button class='btn ml-auto my-2' onclick='newProjectInputUI()' ><i class='fas fa-chevron-down'></i></button>" +
                "</div>" +
                "<div id='new-project-input' class='py-3'></div>" +
                "</div>" +
                "<div id='old-projects' class='py-3'></div>";
            document.getElementById("uc-panel").innerHTML=divPanel.innerHTML;
            oldProjectsUI();
        }
        function newProjectInputUI(){
            if(!isClick)
            {
                let divPanel=document.createElement("DIV");
                divPanel.innerHTML="<div class='container my-3'>" +
                    "<div class='form-group mb-3'>" +
                    "<label>Project Title</label>" +
                    "<input type='text' class='form-control'>" +
                    "</div>" +

                    "<div class='form-group mb-3'>" +
                    "<label>Purpose Statement</label>" +
                    "<input type='text' class='form-control'>" +
                    "</div>" +

                    "<div class='form-group mb-3'>" +
                    "<label>Date</label>" +
                    "<input type='date' class='form-control'>" +
                    "</div>" +

                    "<div class='form-group mb-3'>" +
                    "<label>Problem</label>" +
                    "<textarea class='form-control' rows='6'></textarea>" +
                    "</div>" +

                    "<div class='mb-3'>" +
                    "<p>Objectives</p>" +
                    "<ul class='list-group' id='projectObjectives' >" +
                    "</ul>" +
                    "<label>Add Objectives One by One.</label>" +
                    "<input id='addObjectiveListItem' type='text' class='form-control'>" +
                    "<button class='btn' onclick='addlistItem(\"projectObjectives\",\"addObjectiveListItem\",\"objectives\")'><i class='fas fa-plus'></i></button>" +
                    "</div>" +

                    "<div class='mb-3'>" +
                    "<p>Success Criteria</p>" +
                    "<ul class='list-group' id='successCriteria' >" +
                    "</ul>" +
                    "<label>Add Success Criteria One by One.</label>" +
                    "<input id='addSuccessCriteriaListItem' type='text' class='form-control'>" +
                    "<button class='btn' onclick='addlistItem(\"successCriteria\",\"addSuccessCriteriaListItem\",\"successCriteria\")'><i class='fas fa-plus'></i></button>" +
                    "</div>" +

                    "<div class='mb-3'>" +
                    "<p>Equipments</p>" +
                    "<ul class='list-group' id='equipmwntsList' >" +
                    "</ul>" +
                    "<label>Add Equipments One by One.</label>" +
                    "<input id='addEquipmentsListListItem' type='text' class='form-control'>" +
                    "<button class='btn' onclick='addlistItem(\"equipmwntsList\",\"addEquipmentsListListItem\",\"equipmwntsList\")'><i class='fas fa-plus'></i></button>" +
                    "</div>" +

                    "<div class='mb-3'>" +
                    "<p>Requirements</p>" +
                    "<ul class='list-group' id='requirementsList' >" +
                    "</ul>" +
                    "<label>Add Requirements One by One.</label>" +
                    "<input id='addRequirementsListListItem' type='text' class='form-control'>" +
                    "<button class='btn' onclick='addlistItem(\"requirementsList\",\"addRequirementsListListItem\",\"requirementsList\")'><i class='fas fa-plus'></i></button>" +
                    "</div>" +

                    "<div class='mb-3'>" +
                    "<button style='border-radius:30px' class='px-4 btn btn-success'>Submit</button>" +
                    "</div>" +
                    "</div>";
                document.getElementById("new-project-input").innerHTML=divPanel.innerHTML;
                isClick=true;
            }
            else {
                document.getElementById("new-project-input").innerHTML="";
                isClick=false;
            }
        }
        function oldProjectsUI(){
            let divPanel=document.createElement("DIV");
            let i=0;
            oldProjectsList.map((item)=>{
                let borColor;
                if(item.approvedPercentage==0) {
                    borColor="#DC3545";
                }
                else if(item.approvedPercentage<=33) {
                    borColor="#FFC108";
                }
                else if(item.approvedPercentage<=66) {
                    borColor="#2CAABE";
                }
                else {
                    borColor="#28A745";
                }
                let divProject=document.createElement("DIV");
                divProject.className="card mt-3";
                divProject.style.background="#E9ECEF";
                divProject.style.border="1px solid"+borColor;
                divProject.style.borderRadius="30px";
                divProject.innerHTML="<div class='card-header'>" +
                    "<div class='row'>" +
                    "<h5 class='col-md-6'>"+item.title+"</h5>" +
                    "<p class='col-md-6' style='text-align: right'>"+item.date+"</p>" +
                    "</div>" +
                    "</div>" +
                    "<div class='card-body'>" +
                    "<div class='container' style='border-bottom:1px solid #D3D3D3'>" +
                    "<h6 class='card-title'>"+item.statement+"</h6>" +
                    "<p>"+item.problem+"</p>" +
                    "<button class='btn ml-auto btn-secondary my-3 px-3' onclick='OpenViewDetailsPanel(\"projectDetail"+i+"\","+i+")'>View Details <i class='fas fa-info-circle'></i></button>" +
                    "</div>" +
                    "<div id='projectDetail"+i+"'></div>" +
                    "</div>"
                divPanel.appendChild(divProject);
                isProjectViewDetailsPanelOpen.push(false);
                i++;
            });
            document.getElementById("old-projects").innerHTML=divPanel.innerHTML;
        }
        function OpenViewDetailsPanel(resultDivId,indexPanelOCStatus){
            if(isProjectViewDetailsPanelOpen[indexPanelOCStatus]){
                document.getElementById(resultDivId).innerHTML="";
                isProjectViewDetailsPanelOpen[indexPanelOCStatus]=false;
            }
            else {
                let divPanel=document.createElement("DIV");
                divPanel.innerHTML="<div class='container' >" +
                    "<div id='"+resultDivId+"Div1'></div>" +
                    "<div id='"+resultDivId+"Div2'></div>" +
                    "<div id='"+resultDivId+"Div3'></div>" +
                    "<div id='"+resultDivId+"Div4'></div>" +
                    "<div id='"+resultDivId+"CAndF'></div>" +
                    "</div>";
                document.getElementById(resultDivId).innerHTML=divPanel.innerHTML;
                isProjectViewDetailsPanelOpen[indexPanelOCStatus]=true;
                makeList(resultDivId+"Div1",oldProjectsList[indexPanelOCStatus].objectives,"Objectives");
                makeList(resultDivId+"Div2",oldProjectsList[indexPanelOCStatus].success,"Success Criteria");
                makeList(resultDivId+"Div3",oldProjectsList[indexPanelOCStatus].equipmwnts,"Equipments");
                makeList(resultDivId+"Div4",oldProjectsList[indexPanelOCStatus].requirements,"Requirements");
                CommentsAndFeedbackUI(oldProjectsList[indexPanelOCStatus].internalGuideComment,oldProjectsList[indexPanelOCStatus].internalGuideFeedback,resultDivId+"CAndF","#FFC108","Internal Guide");
                CommentsAndFeedbackUI(oldProjectsList[indexPanelOCStatus].projectInchargeComment,oldProjectsList[indexPanelOCStatus].projectInchargeFeedback,resultDivId+"CAndF","#2CAABE","Project In-Charge");
                CommentsAndFeedbackUI(oldProjectsList[indexPanelOCStatus].HODComment,oldProjectsList[indexPanelOCStatus].HODFeedback,resultDivId+"CAndF","#28A745","Head Of Department");
            }
        }
        function CommentsAndFeedbackUI(c,f,resultDivId,color,name)
        {
            if(c==""||f=="")
            {

            }
            else {
                let divPanel=document.createElement("DIV");
                divPanel.innerHTML="<div class='card text-white mt-3' style='background:"+color+"'>" +
                    "<div class='card-header'>"+name+"</div>" +
                    "<div class='card-body'>" +
                    "<h5 class='card-title'>"+c+"</h5>" +
                    "<p class='card-text'>"+f+"</p>" +
                    "</div>" +
                    "</div>";
                document.getElementById(resultDivId).appendChild(divPanel);
            }
        }
        function makeList(divID,list,listName){
            let listItems="";
            list.map((item)=>{
                listItems+="<li class='list-group-item'>"+item+"</li>";
            })
            let divPanel=document.createElement("DIV");
            divPanel.innerHTML="<div class='my-2'>" +
                "<div class='card mt-3'>" +
                "<div class='card-header'>"+listName+"</div>" +
                "<div class='card-body'>" +
                "<ul class='list-group'>"+
                listItems +
                "</ul>" +
                "</div>" +
                "</div>" +
                "</div>"
            document.getElementById(divID).innerHTML=divPanel.innerHTML;
        }
        function listItemUI(innerText){
            let listItem=document.createElement("LI");
            listItem.className="list-group-item";
            listItem.style.background="#E9ECEF";
            listItem.innerText=innerText;
            return listItem;
        }
        function addlistItem(idUl,idInpB,list){
            let innerText=document.getElementById(idInpB).value;
            if(innerText=="")
            {
                document.getElementById(idInpB).className="form-control is-invalid"
            }
            else {
                document.getElementById(idUl).appendChild(listItemUI(innerText));
                if(list=="objectives"){
                    objectivesList.push(innerText);
                }
                else if(list=="successCriteria"){
                    successCriteria.push(innerText);
                }
                else if(list=="equipmwntsList"){
                    equipmwntsList.push(innerText);
                }
                else if(list=="requirementsList"){
                    requirementsList.push(innerText);
                }
                document.getElementById(idInpB).className="form-control is-valid";
            }
        }
    </script>
</body>
</html>
