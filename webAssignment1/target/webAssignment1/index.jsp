<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <!-- jQuery library -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

        <!-- Popper JS -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
        <title>Assignmnet</title>
    </head>
    <body onload="AllData()">
        <div class="form-group" style="text-align: center">
            <h1>ADD</h1>
            Country Name <input id="country" class="form-control" type="text">
            Country Rank <input id="rank" class="form-control" type="number">
            <button class="btn btn-primary mt-2" onclick="Add()">Add</button>
            <div id="alert" class="mt-2"></div>
        </div>
        <div>
            <fieldset style="border: 10px solid fuchsia;border-radius: 20px;text-align: center">
                <legend style="border: 10px solid fuchsia;border-radius: 20px;text-align: center">Ranking</legend>
                <table class="table">
                    <thead>
                    <tr>
                        <th>Country</th>
                        <th colspan="3">Rank</th>
                    </tr>
                    </thead>
                    <tbody id="countryRanking">
                    </tbody>
                </table>
            </fieldset>
        </div>
        <div class="modal" id="myModal">
            <div class="modal-dialog">
                <div class="modal-content">

                    <!-- Modal Header -->
                    <div class="modal-header">
                        <h4 class="modal-title" id="country-name"></h4>
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                    </div>

                    <!-- Modal body -->
                    <div class="modal-body">
                        New Rank <input id="new-rank" type="number">
                        <button class="btn-primary btn" onclick="Update()">Update</button>
                    </div>
                </div>
            </div>
        </div>
        <script>
            function Add() {
                let country= $("#country").val();
                let rank= $("#rank").val();
                if(country==""||rank=="")
                {
                    console.log("Incomplete Info");
                    document.getElementById("alert").innerHTML='<div class="alert alert-danger alert-dismissible fade show"><button type="button" class="close" data-dismiss="alert">&times;</button><strong>INFORMATION!</strong> is Incomplete.</div>'
                }
                else {
                    $.ajax({
                        url: "./dbHandler",
                        type: "POST",
                        data: {
                            action: "Add",
                            country: country,
                            rank: rank
                        },
                        success:(data)=>{
                            if (data.status){
                                console.log(data);
                                document.getElementById("alert").innerHTML = '<div class="alert alert-success alert-dismissible fade show"><button type="button" class="close" data-dismiss="alert">&times;</button><strong>ADDED!</strong> Menu Item to Menu.</div>'
                                AllData();
                            }
                            else {
                                document.getElementById("alert").innerHTML = '<div class="alert alert-danger alert-dismissible fade show"><button type="button" class="close" data-dismiss="alert">&times;</button><strong>SOMETHING!</strong> went wrong. Information is not added.</div>'
                            }
                        },
                        failure:(error)=>{
                            document.getElementById("alert").innerHTML = '<div class="alert alert-danger alert-dismissible fade show"><button type="button" class="close" data-dismiss="alert">&times;</button><strong>SOMETHING!</strong> went wrong. Information is not added.</div>'
                        }
                    })
                }

            }
            function Delete(name){
                $.ajax({
                    url:"./dbHandler",
                    type:"POST",
                    data:{
                        action:"Delete",
                        country:name
                    },
                    success:(data)=>{
                        console.log(data);
                        AllData();
                    },
                    failure:(error)=>{
                        console.log("Error on getting all Data",error);
                    }
                })
            }
            function Update(){
                let name=document.getElementById("country-name").innerText;
                let newRank=document.getElementById("new-rank").value;
                $.ajax({
                    url:"./dbHandler",
                    type:"POST",
                    data:{
                        action:"Update",
                        country:name,
                        rank:newRank
                    },
                    success:(data)=>{
                        console.log(data);
                        AllData();
                    },
                    failure:(error)=>{
                        console.log("Error on getting all Data",error);
                    }
                })
            }
            function AllData(){
                $.ajax({
                    url:"./dbHandler",
                    type:"POST",
                    data:{
                        action:"View",
                    },
                    success:(data)=>{
                        let isFirst=true;
                        for(let i=0;i<data.result.length;i++)
                        {
                            const row=document.createElement("TR");
                            const td=document.createElement("TD");
                            const text=document.createTextNode(data.result[i].country);
                            td.appendChild(text);
                            row.appendChild(td);
                            const td1=document.createElement("TD");
                            const text1=document.createTextNode(data.result[i].rank);
                            td1.appendChild(text1);
                            row.appendChild(td1);
                            const td3=document.createElement("TD");
                            const button1=document.createElement("BUTTON");
                            button1.className="btn btn-primary";
                            button1.onclick=()=>{
                                setModalValues(data.result[i].country,data.result[i].rank);
                            }
                            button1.setAttribute("data-toggle","modal");
                            button1.setAttribute("data-target","#myModal");
                            button1.innerHTML="Update";
                            td3.appendChild(button1);
                            row.appendChild(td3);
                            const td2=document.createElement("TD");
                            const button=document.createElement("BUTTON");
                            button.className="btn btn-danger";
                            button.onclick=()=>{
                                Delete(data.result[i].country);
                            }
                            button.innerHTML="Delete";
                            td2.appendChild(button);
                            row.appendChild(td2);

                            if(isFirst)
                            {
                                $("#countryRanking").empty();
                                document.getElementById("countryRanking").appendChild(row);
                                isFirst=false;

                            }
                            else
                            {
                                document.getElementById("countryRanking").appendChild(row);
                            }
                        }
                        data.result.map((item)=>{

                        })
                    },
                    failure:(error)=>{
                        console.log("Error on getting all Data",error);
                    }
                })
            }
            function setModalValues(country,rank){
                document.getElementById("country-name").innerText=country;
                document.getElementById("new-rank").value=rank;
            }
        </script>
    </body>
</html>
