<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
        <title>Add Item In Menu</title>
    </head>
    <body>
        <h3>Add Item In Menu</h3>
        <p>Item Name </p>
        <input id="itemName" type="text">
        <p>Item Price </p>
        <input id="itemPrice" type="number">
        <button onclick="Add()">Add</button>
        <h3>Menu</h3>
        <table>
            <thead>
            <tr>
                <th>Name</th>
                <th colspan="3">Price</th>
            </tr>
            </thead>
            <tbody id="menu">
            </tbody>
        </table>
        <script>
            function Add() {
                let itemName= $("#itemName").val();
                let itemPrice= $("#itemPrice").val();
                if(itemName==""||itemPrice=="")
                {
                    alert("Incomplete Info");
                }
                else {
                    $.ajax({
                        url: "./requestHandler",
                        type: "POST",
                        data: {
                            action: "Add",
                            itemName: itemName,
                            itemPrice: itemPrice
                        },
                        success:(data)=>{
                            alert(data.msg);
                            GetAllData();
                        },
                        failure:(error)=>{
                            alert(error);
                        }
                    })
                }
            }
            function Delete(name){
                console.log(name);
                $.ajax({
                    url:"./requestHandler",
                    type:"POST",
                    data:{
                        action:"Delete",
                        item:name
                    },
                    success:(data)=>{
                        console.log(data);
                        GetAllData();
                    },
                    failure:(error)=>{
                        console.log("Error on getting all Data",error);
                    }
                })
            }
            function GetAllData(){
                $.ajax({
                    url:"./requestHandler",
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
                            const input=document.createElement("INPUT");
                            input.setAttribute("type","text");
                            input.setAttribute("readOnly","true");
                            input.value=data.result[i].item;
                            td.appendChild(input);
                            row.appendChild(td);
                            const td1=document.createElement("TD");
                            const input1=document.createElement("INPUT");
                            input1.id=data.result[i].item;
                            input1.setAttribute("type","number");
                            input1.onblur=(e)=>{
                                console.log(e.target.value);
                                Update(data.result[i].item,e.target.value);
                            }
                            input1.value=data.result[i].price;
                            td1.appendChild(input1);
                            row.appendChild(td1);
                            const td2=document.createElement("TD");
                            const button=document.createElement("BUTTON");
                            button.onclick=()=>{
                                Delete(data.result[i].item);
                            }
                            button.innerHTML="Delete";
                            td2.appendChild(button);
                            row.appendChild(td2);

                            if(isFirst)
                            {
                                $("#menu").empty();
                                document.getElementById("menu").appendChild(row);
                                isFirst=false;

                            }
                            else
                            {
                                document.getElementById("menu").appendChild(row);
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
            function Update(name,newPrice){
                $.ajax({
                    url:"./requestHandler",
                    type:"POST",
                    data:{
                        action:"Update",
                        name:name,
                        price:newPrice
                    },
                    success:(data)=>{
                        alert(data.msg);
                        GetAllData();
                    },
                    failure:(error)=>{
                        console.log("Error on getting all Data",error);
                    }
                })
            }
            window.onload=GetAllData;
        </script>
    </body>
</html>
