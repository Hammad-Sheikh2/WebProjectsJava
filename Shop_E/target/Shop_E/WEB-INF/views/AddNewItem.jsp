<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <script src="https://kit.fontawesome.com/4f3bcb92fc.js" crossorigin="anonymous"></script>
    <title>Shop-E Add-New-Item</title>
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
<body>
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
            <li class="nav-item active px-3" style="cursor: pointer">
                <a style="border-bottom: none;" class="nav-link" style="cursor: pointer"><i class="fas fa-plus"></i> New Item</a>
            </li>
            <li class="nav-item px-3" style="cursor: pointer">
                <a href="http://localhost:8080/Shop_E_war/App/My-Items" style="border-bottom: none;" class="nav-link" style="cursor: pointer"><i class="fas fa-stream"></i> My Items</a>
            </li>
        </ul>
    </div>
</nav>
<!--Page Data-->
<div class="Center-In-Page my-5">
    <div style="text-align: left">
        <!--<form method="post" action="http://localhost:8080/Shop_E_war/App/Add-New-Item" enctype="multipart/form-data">-->
            <div class="card">
                <div class="card-body">
                    <h2 class="card-title">Item Details</h2>
                    <label class="mt-3" for="itemName">Item Name</label>
                    <input name="itemName" id="itemName" type="text" class="form-control" required>
                    <label class="mt-3" for="itemImage">Item Thumbnail</label>
                    <div class="custom-file">
                        <input type="file" class="custom-file-input" id="itemImage" required>
                        <label class="custom-file-label" for="itemImage"><i class="fas fa-upload"></i> Upload File...</label>
                    </div>
                    <label class="mt-3" for="itemDescription">Item Description</label>
                    <textarea required name="itemDescription" id="itemDescription" rows="3" class="form-control"></textarea>
                    <label class="mt-3" for="itemQuantity">Item Quantity</label>
                    <input name="itemQuantity" id="itemQuantity" type="number" class="form-control" required>
                    <div id="MessageBox"></div>
                    <button class="btn btn-outline-warning mt-3" onclick="AddItem()" ><i class="fas fa-plus-circle"></i> Add Item</button>
                </div>
            </div>
       <!--</form>-->

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
    function AddItem(){
        if(document.getElementById("itemName").value==""||document.getElementById("itemImage").value==""||document.getElementById("itemDescription").value==""||document.getElementById("itemQuantity").value==""){
            let div=document.createElement("DIV");
            div.innerHTML="<div class='mt-3 alert alert-warning alert-dismissible fade show' role='alert'><strong>Warning!</strong> Enter Complete Details.<button type='button' class='close' data-dismiss='alert' aria-label='Close'> <span aria-hidden='true'>&times;</span></button></div>"
            document.getElementById("MessageBox").innerHTML=div.innerHTML;
            return;
        }
        let fd = new FormData();
        fd.append("itemName",document.getElementById("itemName").value);
        fd.append("itemDescription",document.getElementById("itemDescription").value);
        fd.append("itemImage",document.getElementById("itemImage").files[0]);
        fd.append("itemQuantity",document.getElementById("itemQuantity").value);
        $.ajax({
            url:"http://localhost:8080/Shop_E_war/App/Add-New-Item",
            method:"POST",
            data:fd,
            processData: false,
            contentType: false,
            success:(data)=>{
                let div=document.createElement("DIV");
                if(data.status){
                    div.innerHTML="<div class='mt-3 alert alert-success alert-dismissible fade show' role='alert'><strong>Information!</strong> Item Published Successfully.<button type='button' class='close' data-dismiss='alert' aria-label='Close'> <span aria-hidden='true'>&times;</span></button></div>"
                    document.getElementById("itemName").value=""
                    document.getElementById("itemImage").value=""
                    document.getElementById("itemDescription").value=""
                    document.getElementById("itemQuantity").value=""
                }else {
                    div.innerHTML="<div class='mt-3 alert alert-danger alert-dismissible fade show' role='alert'><strong>Error!</strong> Item Not Publish.<button type='button' class='close' data-dismiss='alert' aria-label='Close'> <span aria-hidden='true'>&times;</span></button></div>"
                    console.log(data.message);
                }
                document.getElementById("MessageBox").innerHTML=div.innerHTML;
            },
            failure:(error)=>{
                console.log(error)
            }
        });
    }
</script>
</body>
</html>
