<%
    String context=request.getContextPath();
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
    <title>Shop-E My-Items</title>
    <style>
        body { font-family: 'Open Sans', sans-serif; font-size: 15px; font-weight: 400; color: #888; line-height: 30px; text-align: center; }

        strong { font-weight: 600; }

        a { color: #856dc0; border-bottom: 1px dashed #856dc0; text-decoration: none; transition: all .3s; }
        a:hover, a:focus { color: #856dc0; border: 0; text-decoration: none; }

        h1, h2 { margin-top: 10px; font-size: 38px; font-weight: 300; color: #555; line-height: 50px; font-style: italic; }
        h3 { font-size: 22px; font-weight: 300; color: #555; line-height: 30px; font-style: italic; }

        img { max-width: 100%; }

        .medium-paragraph { font-size: 17px; line-height: 32px; }

        ::-moz-selection { background: #7762ac; color: #fff; text-shadow: none; }
        ::selection { background: #7762ac; color: #fff; text-shadow: none; }

        .Center-In-Page{
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            align-items: center;
        }

        /***** Footer *****/

        .footer-top { padding: 60px 0; background: #333; text-align: left; color: #aaa; }
        .footer-top h3 { padding-bottom: 10px; color: #fff; }

        .footer-about img.logo-footer { max-width: 74px; margin-top: 0; margin-bottom: 18px; }
        .footer-about p a { color: #aaa; border-bottom: 1px dashed #666; }
        .footer-about p a:hover, .footer-about p a:focus { color: #fff; border-color: #aaa; }

        .footer-contact p { word-wrap: break-word; }
        .footer-contact i { padding-right: 10px; font-size: 18px; color: #666; }
        .footer-contact p a { color: #aaa; border-bottom: 1px dashed #666; }
        .footer-contact p a:hover, .footer-contact p a:focus { color: #fff; border-color: #aaa; }

        .footer-social a { display: inline-block; margin-right: 20px; margin-bottom: 8px; color: #777; border: 0; }
        .footer-social a:hover, .footer-social a:focus { color: #aaa; border: 0; }
        .footer-social i { font-size: 24px; vertical-align: middle; }

        .footer-bottom { padding: 15px 0; background: #444; text-align: left; color: #aaa; }

        .footer-copyright p { margin: 0; padding: 0.5rem 0; }
        .footer-copyright a { color: #fff; border: 0; }
        .footer-copyright a:hover, .footer-copyright a:focus { color: #aaa; border: 0; }

        /* footer navbar */
        .navbar { padding: 0; background: #444; backface-visibility: hidden; }

        .navbar-dark .navbar-nav { font-size: 15px; color: #fff; font-weight: 400; }
        .navbar-dark .navbar-nav .nav-link { color: #fff; border: 0; }
        .navbar-dark .navbar-nav .nav-link:hover { color: #aaa; }
        .navbar-dark .navbar-nav .nav-link:focus { color: #aaa; outline: 0; }

        .navbar-expand-md .navbar-nav .nav-link { padding-left: 1rem; padding-right: 1rem; }
    </style>
</head>
<body onload="GetAllData()">
<nav class="navbar navbar-expand-lg navbar-dark" style="background:rgb(2,0,36);background: linear-gradient(125deg, rgba(2,0,36,1) 9%, rgba(9,9,121,1) 50%, rgba(0,212,255,1) 89%);">
    <a style="border-bottom: none;" class="ml-3 navbar-brand text-warning" href="http://localhost:8080/Shop_E_war/App/">Shop-E</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav mr-auto">
            <li class="nav-item px-3" style="cursor: pointer">
                <a href="http://localhost:8080/Shop_E_war/App/" style="border-bottom: none;" class="nav-link"><i class="fas fa-home"></i> Home<span class="sr-only">(current)</span></a>
            </li>
            <li class="nav-item  px-3" style="cursor: pointer">
                <a href="http://localhost:8080/Shop_E_war/App/Add-New-Item" style="border-bottom: none;" class="nav-link" style="cursor: pointer"><i class="fas fa-plus"></i> New Item</a>
            </li>
            <li class="nav-item active px-3" style="cursor: pointer">
                <a  style="border-bottom: none;" class="nav-link" style="cursor: pointer"><i class="fas fa-stream"></i> My Items</a>
            </li>
        </ul>
        <div class="form-inline mr-3 my-2 my-lg-0">
            <input id="itemNameKey" class="form-control mr-sm-2" type="search" placeholder="Item Name" aria-label="Search">
            <button class="btn btn-outline-warning my-2 my-sm-0" onclick="SearchData()"><i class="fas fa-search"></i> Search</button>
        </div>
    </div>
</nav>
<!--Page Data-->

<div class="container my-5">
    <div id="Page-Data"></div>
</div>
<div class="modal fade bd-example-modal-lg" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header bg-primary text-white">
                <h5 id="modal-title" class="modal-title"></h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <div class="card">
                    <img id="modal-card-image" src="https://picsum.photos/300/200" class="card-img-top" alt="Card image cap">
                    <div class="card-body">
                        <input style="display: none" type="number"  id="modal-card-id"/>
                        <h5 class="card-title"><b>Seller </b><span id="modal-card-title" ></span></h5>
                        <p id="modal-card-text" class="card-text"></p>
                        <p><b>Seller Email   : </b><span id="modal-card-seller-email"></span></p>
                        <p><b>Seller Contact : </b><span id="modal-card-seller-phn"></span></p>
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <button class="btn btn-warning" data-toggle="modal" data-target="#addStockModal" onclick="setAddStockId()">Add Stock</button>
                <button class="btn btn-success" data-toggle="modal" data-target="#sellItemModal" onclick="setSellItemId()">Sell</button>
            </div>
        </div>
    </div>
</div>
<div class="modal fade" id="addStockModal" tabindex="-1" role="dialog" aria-labelledby="addStockModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="addStockModalLabel">Add Stock</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <input id="tbAddStockId" type="number" style="display: none">
                <label for="tbAddStockQuantity">Enter Quantity</label>
                <input id="tbAddStockQuantity" class="form-control" type="number">
                <div id="addStockErrorMessage"></div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-outline-warning" onclick="AddStock()">Add Stock</button>
            </div>
        </div>
    </div>
</div>
<div class="modal fade" id="sellItemModal" tabindex="-1" role="dialog" aria-labelledby="sellItemModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="sellItemModalLabel">Sell Item</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <input id="tbSellItemId" type="number" style="display: none">
                <label for="tbSellItemQuantity">Enter Quantity</label>
                <input id="tbSellItemQuantity" class="form-control" type="number">
                <div id="sellItemErrorMessage"></div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-outline-success" onclick="Sell()">Sell</button>
            </div>
        </div>
    </div>
</div>
<footer>
    <div class="footer-top">
        <div class="container Center-In-Page">
            <div class="row">
                <div class="col-md-4 col-lg-4 footer-about">
                    <h1 class="text-white">Shop-E</h1>
                    <p>
                        We are a young company always looking for new and creative ideas to help you with our products in your everyday work.
                    </p>
                    <p><a>Our Team</a></p>
                </div>
                <div class="col-md-4 col-lg-4 offset-lg-1 footer-contact">
                    <h3>Contact</h3>
                    <p>George, United Kingdom</p>
                    <p><i class="fas fa-phone-alt"></i> Phone: (0024) 333 62 29 347</p>
                    <p><i class="fas fa-envelope"></i> Email: <a href="mailto:george@admin.com">george@admin.com</a></p>
                    <p><i class="fab fa-skype"></i> Skype: you_online</p>
                </div>
            </div>
        </div>
    </div>
    <div class="footer-bottom">
        <div class="container">
            <div class="row">
                <div class="col-md-5 footer-copyright">
                    <p><i class="fas fa-copyright"></i> CopyRight 2021 <a>George</a></p>
                </div>
                <div class="col-md-7 footer-menu">
                    <nav class="navbar navbar-dark navbar-expand-md">
                        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                            <span class="navbar-toggler-icon"></span>
                        </button>
                        <div class="collapse navbar-collapse" id="navbarNav">
                            <p>Follow Up for more Informations.</p>
                        </div>
                    </nav>
                </div>
            </div>
        </div>
    </div>
</footer>
<script>
    function GetAllData(){
        $.ajax({
            url:"http://localhost:8080/Shop_E_war/App/My-Items",
            method:"POST",
            success:(data)=>{
                let div=document.createElement("DIV")
                div.className="row"
                if(data.status){
                    for (let i = 0; i < data.items.length; i++) {
                        let div_Col_MD_4=document.createElement("DIV")
                        div_Col_MD_4.className="col-md-4"
                        let div_Card = document.createElement("DIV")
                        div_Card.className="card m-2"
                        div_Card.style.textAlign="left"
                        let card_img_top =document.createElement("IMG")
                        card_img_top.className="card-img-top"
                        card_img_top.setAttribute("alt",data.items[i].itemName)
                        card_img_top.setAttribute("src",'<%=context%>/Images/'+data.items[i].itemImage)
                        div_Card.appendChild(card_img_top)
                        let div_card_body=document.createElement("DIV")
                        div_card_body.className="card-body"
                        let div_card_title=document.createElement("H5")
                        div_card_title.className="card-title"
                        div_card_title.innerText=data.items[i].itemName
                        let div_card_text=document.createElement("P")
                        div_card_text.className="card-text"
                        div_card_text.innerText=data.items[i].itemDescription
                        let div_card_Details_button=document.createElement("BUTTON")
                        div_card_Details_button.className="btn btn-outline-warning mt-2"
                        div_card_Details_button.innerText="Details"
                        div_card_Details_button.setAttribute("data-toggle","modal")
                        div_card_Details_button.setAttribute("data-target",".bd-example-modal-lg")
                        div_card_Details_button.onclick=()=>{
                            document.getElementById("modal-card-id").value=data.items[i].id
                            document.getElementById("modal-title").innerText=data.items[i].itemName
                            document.getElementById("modal-card-image").setAttribute("src",'<%=context%>/Images/'+data.items[i].itemImage)
                            document.getElementById("modal-card-title").innerText=data.items[i].user.username
                            document.getElementById("modal-card-text").innerText=data.items[i].itemDescription
                            document.getElementById("modal-card-seller-email").innerText=data.items[i].user.email
                            document.getElementById("modal-card-seller-phn").innerText=data.items[i].user.phn
                        }
                        div_card_body.appendChild(div_card_title)
                        div_card_body.appendChild(div_card_text)
                        if(data.items[i].isSold==true){
                            let div_card_sold_label=document.createElement("P")
                            div_card_sold_label.className="card-text text-white bg-success"
                            div_card_sold_label.innerText="SOLD"
                            div_card_body.appendChild(div_card_sold_label)
                        }
                        div_card_body.appendChild(div_card_Details_button)
                        div_Card.appendChild(div_card_body)
                        div_Col_MD_4.appendChild(div_Card)
                        div.appendChild(div_Col_MD_4)
                    }
                    document.getElementById("Page-Data").innerHTML=""
                    document.getElementById("Page-Data").appendChild(div)
                }
                else {
                    let div=document.createElement("DIV")
                    div.innerHTML="<div class=\"jumbotron\"><h1 class=\"display-4\"><i class=\"fas fa-frown\"></i> "+data.message+"!</h1><p class=\"lead\">You have no item to Sell.</p><hr class=\"my-4\"><p>If you want to sell your item, Add it by clicking below button.</p><p class=\"lead\"><a href='http://localhost:8080/Shop_E_war/App/Add-New-Item' class=\"btn btn-warning btn-lg\">Add Item</a></p></div>";
                    document.getElementById("Page-Data").innerHTML=""
                    document.getElementById("Page-Data").appendChild(div)
                }
            },
            failure:(error)=>{
                console.log(error)
            }
        });
    }
    function SearchData(){
        $.ajax({
            url:"http://localhost:8080/Shop_E_war/App/Search-My-Items",
            method:"POST",
            data:{
                key:document.getElementById("itemNameKey").value
            },
            success:(data)=>{
                let div=document.createElement("DIV")
                div.className="row"
                if(data.status){
                    for (let i = 0; i < data.items.length; i++) {
                        let div_Col_MD_4=document.createElement("DIV")
                        div_Col_MD_4.className="col-md-4"
                        let div_Card = document.createElement("DIV")
                        div_Card.className="card m-2"
                        div_Card.style.textAlign="left"
                        let card_img_top =document.createElement("IMG")
                        card_img_top.className="card-img-top"
                        card_img_top.setAttribute("alt",data.items[i].itemName)
                        card_img_top.setAttribute("src",'<%=context%>/Images/'+data.items[i].itemImage)
                        div_Card.appendChild(card_img_top)
                        let div_card_body=document.createElement("DIV")
                        div_card_body.className="card-body"
                        let div_card_title=document.createElement("H5")
                        div_card_title.className="card-title"
                        div_card_title.innerText=data.items[i].itemName
                        let div_card_text=document.createElement("P")
                        div_card_text.className="card-text"
                        div_card_text.innerText=data.items[i].itemDescription
                        let div_card_Details_button=document.createElement("BUTTON")
                        div_card_Details_button.className="btn btn-outline-warning mt-2"
                        div_card_Details_button.innerText="Details"
                        div_card_Details_button.setAttribute("data-toggle","modal")
                        div_card_Details_button.setAttribute("data-target",".bd-example-modal-lg")
                        div_card_Details_button.onclick=()=>{
                            document.getElementById("modal-card-id").value=data.items[i].id
                            document.getElementById("modal-title").innerText=data.items[i].itemName
                            document.getElementById("modal-card-image").setAttribute("src",'<%=context%>/Images/'+data.items[i].itemImage)
                            document.getElementById("modal-card-title").innerText=data.items[i].user.username
                            document.getElementById("modal-card-text").innerText=data.items[i].itemDescription
                            document.getElementById("modal-card-seller-email").innerText=data.items[i].user.email
                            document.getElementById("modal-card-seller-phn").innerText=data.items[i].user.phn
                        }
                        div_card_body.appendChild(div_card_title)
                        div_card_body.appendChild(div_card_text)
                        if(data.items[i].isSold==true){
                            let div_card_sold_label=document.createElement("P")
                            div_card_sold_label.className="card-text text-white bg-success"
                            div_card_sold_label.innerText="SOLD"
                            div_card_body.appendChild(div_card_sold_label)
                        }
                        div_card_body.appendChild(div_card_Details_button)
                        div_Card.appendChild(div_card_body)
                        div_Col_MD_4.appendChild(div_Card)
                        div.appendChild(div_Col_MD_4)
                    }
                    document.getElementById("Page-Data").innerHTML=""
                    document.getElementById("Page-Data").appendChild(div)
                }
                else {
                    let div=document.createElement("DIV")
                    div.innerHTML="<div class=\"jumbotron\"><h1 class=\"display-4\"><i class=\"fas fa-frown\"></i> "+data.message+"!</h1><p class=\"lead\">You have no item to Sell.</p><hr class=\"my-4\"><p>If you want to sell your item, Add it by clicking below button.</p><p class=\"lead\"><a href='http://localhost:8080/Shop_E_war/App/Add-New-Item' class=\"btn btn-warning btn-lg\">Add Item</a></p></div>";
                    document.getElementById("Page-Data").innerHTML=""
                    document.getElementById("Page-Data").appendChild(div)
                }
            },
            failure:(error)=>{
                console.log(error)
            }
        });
    }
    function AddStock(){
        $.ajax({
            url:"http://localhost:8080/Shop_E_war/App/Add-Stock",
            method:"POST",
            data:{
                id:document.getElementById("tbAddStockId").value,
                num:document.getElementById("tbAddStockQuantity").value
            },
            success:(data)=>{
                if(data.status){
                    location.href="http://localhost:8080/Shop_E_war/App/My-Items"
                }
                else {
                    document.getElementById("addStockErrorMessage").innerHTML="<div class='alert alert-warning alert-dismissible fade show' role='alert'>"+data.message+"<button type='button' class='close' data-dismiss='alert' aria-label='Close'><span aria-hidden='true'>&times;</span></button></div>"
                }
            },
            failure:(error)=>{
                console.log(error)
            }
        });
    }
    function Sell(){
        $.ajax({
            url:"http://localhost:8080/Shop_E_war/App/Sell-Item",
            method:"POST",
            data:{
                id:document.getElementById("tbSellItemId").value,
                num:document.getElementById("tbSellItemQuantity").value
            },
            success:(data)=>{
                if(data.status){
                    location.href="http://localhost:8080/Shop_E_war/App/My-Items"
                }
                else {
                    document.getElementById("sellItemErrorMessage").innerHTML="<div class='alert alert-warning alert-dismissible fade show' role='alert'>"+data.message+"<button type='button' class='close' data-dismiss='alert' aria-label='Close'><span aria-hidden='true'>&times;</span></button></div>"
                }
            },
            failure:(error)=>{
                console.log(error)
            }
        });
    }
    function setSellItemId(){
        document.getElementById("tbSellItemId").value=document.getElementById("modal-card-id").value
    }
    function setAddStockId(){
        document.getElementById("tbAddStockId").value=document.getElementById("modal-card-id").value
    }
</script>
</body>
</html>
