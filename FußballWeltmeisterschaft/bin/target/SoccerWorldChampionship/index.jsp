<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <title>Soccer World Championship</title>
    <style>
        body{
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            align-items: center;
            padding: 15px;
            background-color: #4158D0;
            background-image: linear-gradient(43deg, #4158D0 0%, #C850C0 46%, #FFCC70 100%);

        }
        .gamePlanMenu{
            color: gray;
            border-bottom: 3px solid white;
        }
        .gamePlanMenu:hover{
            border-bottom: 3px solid gray;
        }
        .gamePlanMenu:focus{
            color: black;
            border-bottom: 3px solid black;
        }

        .btn-grad {background-image: linear-gradient(to right, #1F1C2C 0%, #928DAB  51%, #1F1C2C  100%)}
        .btn-grad {
            margin: 10px;
            padding: 15px 45px;
            text-align: center;
            text-transform: uppercase;
            transition: 0.5s;
            background-size: 200% auto;
            color: white;
            box-shadow: 0 0 20px #eee;
            border-radius: 10px;
            display: block;
        }

        .btn-grad:hover {
            background-position: right center; /* change the direction of the change here */
            color: #fff;
            text-decoration: none;
        }

    </style>
</head>
<body>
    <div class="container">
        <div id="TeamsNamePortion" class="card" style="border: none">
            <div class="card-header text-white" style="background: #380038;">
                Soccer World Championship
            </div>
            <div class="card-body">
                <h5 class="card-title">Qualification Group</h5>
                <div class="card mt-3">
                    <div class="card-header">
                        Team 1
                    </div>
                    <div class="card-body d-flex flex-column justify-content-center align-item-center">
                        <img class="mx-auto" src="Images/team1.png" style="width: 100px;height: 100px">
                        <input id="TBNameTeam1" class="mx-auto mt-2" type="text" class="form-control col-md-8" value="Team 1"></input>
                    </div>
                </div>
                <div class="card mt-3">
                    <div class="card-header">
                        Team 2
                    </div>
                    <div class="card-body d-flex flex-column justify-content-center align-item-center">
                        <img class="mx-auto" src="Images/team2.png" style="width: 100px;height: 100px">
                        <input id="TBNameTeam2" class="mx-auto mt-2" type="text" class="form-control col-md-8 mt-2" value="Team 2"></input>
                    </div>
                </div>
                <div class="card mt-3">
                    <div class="card-header">
                        Team 3
                    </div>
                    <div class="card-body d-flex flex-column justify-content-center align-item-center">
                        <img class="mx-auto" src="Images/team3.png" style="width: 100px;height: 100px">
                        <input id="TBNameTeam3"  class="mx-auto mt-2" type="text" class="form-control col-md-8 mt-2" value="Team 3"></input>
                    </div>
                </div>
                <div class="card mt-3">
                    <div class="card-header">
                        Team 4
                    </div>
                    <div class="card-body d-flex flex-column justify-content-center align-item-center">
                        <img class="mx-auto" src="Images/team4.png" style="width: 100px;height: 100px">
                        <input id="TBNameTeam4" class="mx-auto mt-2" type="text" class="form-control col-md-8 mt-2" value="Team 4"></input>
                    </div>
                </div>
                <div class="card mt-3">
                    <div class="card-header">
                        Team 5
                    </div>
                    <div class="card-body d-flex flex-column justify-content-center align-item-center">
                        <img class="mx-auto" src="Images/team5.png" style="width: 100px;height: 100px">
                        <input id="TBNameTeam5" class="mx-auto mt-2" type="text" class="form-control col-md-8 mt-2" value="Team 5"></input>
                    </div>
                </div>
                <div class="card mt-3">
                    <div class="card-header">
                        Team 6
                    </div>
                    <div class="card-body d-flex flex-column justify-content-center align-item-center">
                        <img class="mx-auto" src="Images/team6.png" style="width: 100px;height: 100px">
                        <input id="TBNameTeam6" class="mx-auto mt-2" type="text" class="form-control col-md-8 mt-2" value="Team 6"></input>
                    </div>
                </div>
                <p class="card-text">Edit Team Names.</p>
                <button onclick="SubmitNamesAndGoToGamePlan()" class="btn-grad">Go To Game Plan</button>
            </div>
        </div>
        <div style="display: none;border: none" id="GamesPlanPortion" class="card">
            <h5 class="card-header text-white" style="background: #380038;">Soccer World Championship</h5>
            <div class="card-body">
                <div class="row">
                    <button onclick="btnMatchesClicked()" class="gamePlanMenu btn col-6" style="box-shadow: none">Matches</button>
                    <button onclick="btnStandingsClicked()" class="gamePlanMenu btn col-6" style="box-shadow: none">Standings</button>
                </div>
                <div onload="btnMatchesClicked" id="GamePlanPortionBody"></div>
            </div>
        </div>
    </div>
    <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Match No</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <label id="resultTeam1GoalsLbl" ></label>
                    <input id="resultTeam1Goals" class="form-control" type="number">
                    <label id="resultTeam2GoalsLbl" class="mt-2" ></label>
                    <input id="resultTeam2Goals" class="form-control" type="number">
                    <input id="resultIndex" style="display: none" type="number">
                    <input id="resultMatch" style="display: none" type="text">
                </div>
                <div class="modal-footer">
                    <button id="btnAddOrEditMatchResult" type="button" class="btn btn-primary" data-dismiss="modal">Save changes</button>
                </div>
            </div>
        </div>
    </div>
</body>
</html>

<script>
    let listOfTeams;
    let listOfMatches;
    let SemiFinals;
    let Final;
    function SubmitNamesAndGoToGamePlan(){
        $.ajax({
            type:"POST",
            url: "./requestHandler",
            data:{
                action: "SaveNames",
                team1:document.getElementById("TBNameTeam1").value,
                team2:document.getElementById("TBNameTeam2").value,
                team3:document.getElementById("TBNameTeam3").value,
                team4:document.getElementById("TBNameTeam4").value,
                team5:document.getElementById("TBNameTeam5").value,
                team6:document.getElementById("TBNameTeam6").value
            },
            success:(data)=>{
                console.log(data)
                listOfTeams=data.listOfTeams
                listOfMatches=data.listOfMatches
                SemiFinals=data.listOfSemiFinals
                Final=data.finalMatch
                document.getElementById("TeamsNamePortion").style.display='none'
                document.getElementById("GamesPlanPortion").style.display='block'
            },
            failure:(error)=>{
                console.log(error);
            }
        });
    }
    function editMatchResultClicked(){
        let index=document.getElementById('resultIndex').value
        let team1Goals=document.getElementById('resultTeam1Goals').value
        let team2Goals=document.getElementById('resultTeam2Goals').value
        let match= document.getElementById('resultMatch').value
        $.ajax({
            type:"POST",
            url: "./requestHandler",
            data:{
                action: "EditMatchResult",
                team1Goals:team1Goals,
                team2Goals:team2Goals,
                index:index,
                match:match
            },
            success:(data)=>{
                console.log(data)
                listOfTeams=data.listOfTeams
                listOfMatches=data.listOfMatches
                SemiFinals=data.listOfSemiFinals
                Final=data.finalMatch
                btnMatchesClicked()
            },
            failure:(error)=>{
                console.log(error);
            }
        });
    }
    function addMatchResultClicked(){
        let index=document.getElementById('resultIndex').value
        let team1Goals=document.getElementById('resultTeam1Goals').value
        let team2Goals=document.getElementById('resultTeam2Goals').value
        let match= document.getElementById('resultMatch').value
        $.ajax({
            type:"POST",
            url: "./requestHandler",
            data:{
                action: "AddMatchResult",
                team1Goals:team1Goals,
                team2Goals:team2Goals,
                index:index,
                match:match
            },
            success:(data)=>{
                console.log(data)
                listOfTeams=data.listOfTeams
                listOfMatches=data.listOfMatches
                SemiFinals=data.listOfSemiFinals
                Final=data.finalMatch
                btnMatchesClicked()
            },
            failure:(error)=>{
                console.log(error);
            }
        });
    }
    function MatchResultUI(match,index,matchInfo,action){
        if(matchInfo==="match"){
            document.getElementById("exampleModalLabel").innerText="Match " + (index+1)
        }
        else if(matchInfo==="semiFinals"){
            document.getElementById("exampleModalLabel").innerText="Semi Final " + (index+1)
        }
        else {
            document.getElementById("exampleModalLabel").innerText="Final Match"
        }
        document.getElementById("resultTeam1GoalsLbl").innerText=match.team1.name+" Goals"
        document.getElementById("resultTeam2GoalsLbl").innerText=match.team2.name+" Goals"
        document.getElementById("resultTeam1Goals").value=match.team1Goals
        document.getElementById("resultTeam2Goals").value=match.team2Goals
        document.getElementById("resultIndex").value=index
        document.getElementById("resultMatch").value=matchInfo
        if(action=="add"){
            document.getElementById("btnAddOrEditMatchResult").onclick=()=>{addMatchResultClicked()}
        }
        else {
            document.getElementById("btnAddOrEditMatchResult").onclick=()=>{editMatchResultClicked()}
        }
    }
    function btnMatchesClicked(){
        let GamePlanPortionBody=document.getElementById("GamePlanPortionBody");
        GamePlanPortionBody.innerHTML= "<div>" +
            "<div class='card mt-3' id='GamePlanPreliminaryRounds' style='background: #F7F7F5'>" +
            "<div class='card-header'>Preliminary Rounds</div>" +
            "</div>" +
            (SemiFinals==false?"":
            "<div class='card  mt-3' id='GamePlanSemiFinals' style='background: #F7F7F5'>" +
            "<div class='card-header'>Semi Final Rounds</div>" +
            "</div>") +
            (Final==false?"":
            "<div class='card mt-3' id='GamePlanFinal' style='background: #F7F7F5'>" +
            "<div class='card-header'>Final</div>" +
            "</div>" +
            "</div>")
        for (let i = 0; i < listOfMatches.length; i++) {
            let div=document.createElement("DIV");
            div.className="my-3 mx-auto card bg-white"
            div.style.width="80%"
            if(listOfMatches[i].isMatchPlayed==true){
                div.innerHTML="<div class='card-text my-3 mx-3 d-flex'>" +
                    "<div class='mr-auto'>Match "+(i+1)+"</div>" +
                    "<div class='ml-auto' >" +
                    "<button id='btnResult"+i+"' type='button' class='btn btn-primary' data-toggle='modal' data-target='#exampleModal'>Result </button>" +
                    "</div>" +
                    "</div>" +
                    "<div class='d-sm-flex flex-sm-column'>" +
                    "<div class='align-self-start d-sm-flex ml-2'>" +
                    "<img src='"+listOfMatches[i].team1.img+"' style='width: 50px;height: 50px'>" +
                    "<h5 class='ml-3 my-auto'>"+listOfMatches[i].team1.name+"</h5>" +
                    "</div>" +
                    "<div class='align-self-center'>" +
                    "<div class='text-danger text-center' style='border-bottom: 2px solid indianred' > VS</div>" +
                    "<div>"+listOfMatches[i].team1Goals+" - "+listOfMatches[i].team2Goals+"</div>" +
                    "</div>" +
                    "<div class='align-self-end d-sm-flex mr-2 mb-3'>" +
                    "<h5 class='mr-2 my-auto ml-auto'>"+listOfMatches[i].team2.name+"</h5>" +
                    "<img src='"+listOfMatches[i].team2.img+"' style='width: 50px;height: 50px'>" +
                    "</div>" +
                    "</div>"
            }
            else {
                div.innerHTML="<div class='card-text my-3 mx-3 d-flex'>" +
                    "<div class='mr-auto'>Match "+(i+1)+"</div>" +
                    "<div class='ml-auto' >" +
                    "<button id='btnResult"+i+"' type='button' class='btn btn-primary' data-toggle='modal' data-target='#exampleModal'>Result</button>" +
                    "</div>" +
                    "</div>" +
                    "<div class='d-sm-flex flex-sm-column'>" +
                    "<div class='align-self-start d-sm-flex ml-2'>" +
                    "<img src='"+listOfMatches[i].team1.img+"' style='width: 50px;height: 50px'>" +
                    "<h5 class='ml-2 my-auto'>"+listOfMatches[i].team1.name+"</h5>" +
                    "</div>" +
                    "<div class='align-self-center text-center'>" +
                    "<div class='text-danger'> VS</div>" +
                    "<div>Not Played Yet</div>" +
                    "</div>" +
                    "<div class='align-self-end d-sm-flex mr-2 mb-3'>" +
                    "<h5 class='mr-2 my-auto ml-auto'>"+listOfMatches[i].team2.name+"</h5>" +
                    "<img src='"+listOfMatches[i].team2.img+"' style='width: 50px;height: 50px'>" +
                    "</div>" +
                    "</div>"
            }
            document.getElementById("GamePlanPreliminaryRounds").appendChild(div)
            if(listOfMatches[i].isMatchPlayed==true){
                document.getElementById("btnResult"+i).onclick=()=>MatchResultUI(listOfMatches[i],i,"match","edit")
            }
            else {
                document.getElementById("btnResult"+i).onclick=()=>MatchResultUI(listOfMatches[i],i,"match","add")
            }

        }
        if(SemiFinals!=false){
            for (let i = 0; i < SemiFinals.length; i++) {
                let div=document.createElement("DIV");
                div.className="my-3 mx-auto card bg-white"
                div.style.width="80%"
                if(SemiFinals[i].isMatchPlayed==true){
                    div.innerHTML="<div class='card-text my-3 mx-3 d-flex'>" +
                        "<div class='mr-auto text-warning'>Semi Final "+(i+1)+"</div>" +
                        "<div class='ml-auto' >" +
                        "<button id='btnResult"+(i+6)+"' type='button' class='btn btn-primary' data-toggle='modal' data-target='#exampleModal'>Result </button>" +
                        "</div>" +
                        "</div>" +
                        "<div class='d-sm-flex flex-sm-column'>" +
                        "<div class='align-self-start d-sm-flex ml-2'>" +
                        "<img src='"+SemiFinals[i].team1.img+"' style='width: 50px;height: 50px'>" +
                        "<h5 class='ml-3 my-auto'>"+SemiFinals[i].team1.name+"</h5>" +
                        "</div>" +
                        "<div class='align-self-center'>" +
                        "<div class='text-danger text-center' style='border-bottom: 2px solid indianred' > VS</div>" +
                        "<div>"+SemiFinals[i].team1Goals+" - "+SemiFinals[i].team2Goals+"</div>" +
                        "</div>" +
                        "<div class='align-self-end d-sm-flex mr-2 mb-3'>" +
                        "<h5 class='mr-2 my-auto ml-auto'>"+SemiFinals[i].team2.name+"</h5>" +
                        "<img src='"+SemiFinals[i].team2.img+"' style='width: 50px;height: 50px'>" +
                        "</div>" +
                        "</div>"
                }
                else {
                    div.innerHTML="<div class='card-text my-3 mx-3 d-flex'>" +
                        "<div class='mr-auto text-warning'>Semi Final "+(i+1)+"</div>" +
                        "<div class='ml-auto' >" +
                        "<button id='btnResult"+(i+6)+"' type='button' class='btn btn-primary' data-toggle='modal' data-target='#exampleModal'>Result</button>" +
                        "</div>" +
                        "</div>" +
                        "<div class='d-sm-flex flex-sm-column'>" +
                        "<div class='align-self-start d-sm-flex ml-2'>" +
                        "<img src='"+SemiFinals[i].team1.img+"' style='width: 50px;height: 50px'>" +
                        "<h5 class='ml-2 my-auto'>"+SemiFinals[i].team1.name+"</h5>" +
                        "</div>" +
                        "<div class='align-self-center text-center'>" +
                        "<div class='text-danger'> VS</div>" +
                        "<div>Not Played Yet</div>" +
                        "</div>" +
                        "<div class='align-self-end d-sm-flex mr-2 mb-3'>" +
                        "<h5 class='mr-2 my-auto ml-auto'>"+SemiFinals[i].team2.name+"</h5>" +
                        "<img src='"+SemiFinals[i].team2.img+"' style='width: 50px;height: 50px'>" +
                        "</div>" +
                        "</div>"
                }
                document.getElementById("GamePlanSemiFinals").appendChild(div)
                if(SemiFinals[i].isMatchPlayed==true){
                    document.getElementById("btnResult"+(i+6)).onclick=()=>MatchResultUI(SemiFinals[i],i,"semiFinals","edit")
                }
                else {
                    document.getElementById("btnResult"+(i+6)).onclick=()=>MatchResultUI(SemiFinals[i],i,"semiFinals","add")
                }
            }
        }
        if(Final!=false){
            let div=document.createElement("DIV");
            div.className="my-3 mx-auto card bg-white"
            div.style.width="80%"
            if(Final.isMatchPlayed==true){
                div.innerHTML="<div class='card-text my-3 mx-3 d-flex'>" +
                    "<div class='mr-auto text-success'>Final Match</div>" +
                    "<div class='ml-auto' >" +
                    "<button id='btnResultFinal' type='button' class='btn btn-primary' data-toggle='modal' data-target='#exampleModal'>Result </button>" +
                    "</div>" +
                    "</div>" +
                    "<div class='d-sm-flex flex-sm-column'>" +
                    "<div class='align-self-start d-sm-flex ml-2'>" +
                    "<img src='"+Final.team1.img+"' style='width: 50px;height: 50px'>" +
                    "<h5 class='ml-3 my-auto'>"+Final.team1.name+"</h5>" +
                    "</div>" +
                    "<div class='align-self-center'>" +
                    "<div class='text-danger text-center' style='border-bottom: 2px solid indianred' > VS</div>" +
                    "<div>"+Final.team1Goals+" - "+Final.team2Goals+"</div>" +
                    "</div>" +
                    "<div class='align-self-end d-sm-flex mr-2 mb-3'>" +
                    "<h5 class='mr-2 my-auto ml-auto'>"+Final.team2.name+"</h5>" +
                    "<img src='"+Final.team2.img+"' style='width: 50px;height: 50px'>" +
                    "</div>" +
                    "</div>"
            }
            else {
                div.innerHTML="<div class='card-text my-3 mx-3 d-flex'>" +
                    "<div class='mr-auto text-success'>Final Match</div>" +
                    "<div class='ml-auto' >" +
                    "<button id='btnResultFinal' type='button' class='btn btn-primary' data-toggle='modal' data-target='#exampleModal'>Result</button>" +
                    "</div>" +
                    "</div>" +
                    "<div class='d-sm-flex flex-sm-column'>" +
                    "<div class='align-self-start d-sm-flex ml-2'>" +
                    "<img src='"+Final.team1.img+"' style='width: 50px;height: 50px'>" +
                    "<h5 class='ml-2 my-auto'>"+Final.team1.name+"</h5>" +
                    "</div>" +
                    "<div class='align-self-center text-center'>" +
                    "<div class='text-danger'> VS</div>" +
                    "<div>Not Played Yet</div>" +
                    "</div>" +
                    "<div class='align-self-end d-sm-flex mr-2 mb-3'>" +
                    "<h5 class='mr-2 my-auto ml-auto'>"+Final.team2.name+"</h5>" +
                    "<img src='"+Final.team2.img+"' style='width: 50px;height: 50px'>" +
                    "</div>" +
                    "</div>"
            }
            document.getElementById("GamePlanFinal").appendChild(div)
            if(Final.isMatchPlayed==true){
                document.getElementById("btnResultFinal").onclick=()=>MatchResultUI(Final,0,"final","edit")
            }
            else {
                document.getElementById("btnResultFinal").onclick=()=>MatchResultUI(Final,0,"final","add")
            }
        }
    }
    function btnStandingsClicked(){
        let GamePlanPortionBody=document.getElementById("GamePlanPortionBody");
        let div=document.createElement("DIV");
        div.innerHTML="<div class='table-responsive'><table class='table'>" +
            "<thead>" +
            "<tr>" +
            "<th></th>" +
            "<th></th>" +
            "<th>MP</th>" +"<th>W</th>" +"<th>D</th>" +"<th>L</th>" +"<th>PTS</th>" +
            "</tr>" +
            "</thead><tbody id ='MatchPointsTableBody'></tbody></table></div>"
        GamePlanPortionBody.innerHTML=div.innerHTML
        for (let i = 0; i < listOfTeams.length; i++) {
            let div1=document.createElement("TR")
            div1.innerHTML= "<th>"+(i+1)+"</th>" +
                "<td>"+listOfTeams[i].name+"</td>" +
                "<td>"+listOfTeams[i].mp+"</td>" +"<td>"+listOfTeams[i].win+"</td>" +"<td>"+listOfTeams[i].draw+
                "</td>" +"<td>"+listOfTeams[i].lost+"</td>" +"<td>"+listOfTeams[i].pts+"</td>"
            document.getElementById("MatchPointsTableBody").appendChild(div1);
        }
    }
</script>