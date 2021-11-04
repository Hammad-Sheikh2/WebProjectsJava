<!DOCTYPE html>
<html lang="zxx">

<head>
    <meta charset="UTF-8">
    <meta name="description" content="Lai Xio Lai ">
    <meta name="keywords" content="Lai Xio Lai, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Lai Xio Lai | </title>

    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css2?family=Cairo:wght@200;300;400;600;900&display=swap" rel="stylesheet">

    <!-- Css Styles -->
    <link rel="stylesheet" href="css/bootstrap.min.css" type="text/css">
    <link rel="stylesheet" href="css/font-awesome.min.css" type="text/css">
    <link rel="stylesheet" href="css/elegant-icons.css" type="text/css">
    <link rel="stylesheet" href="css/nice-select.css" type="text/css">
    <link rel="stylesheet" href="css/jquery-ui.min.css" type="text/css">
    <link rel="stylesheet" href="css/owl.carousel.min.css" type="text/css">
    <link rel="stylesheet" href="css/slicknav.min.css" type="text/css">
    <link rel="stylesheet" href="css/style.css" type="text/css">
    <link rel="stylesheet" href="css/regstyle.css" type="text/css">
</head>

<body>
    <!-- Page Preloder -->
    <div id="preloder">
        <div class="loader"></div>
    </div>

   <!-- Header Section Begin -->
    <header class="header">
        <div class="header__top">
            <div class="container">
                <div class="row">
                    <div class="col-lg-6 col-md-6">
                        <div class="header__top__left">
                            <ul>
                                <%if(request.getSession().getAttribute("email")!=null){%>
                                <li><i class="fa fa-envelope"></i> <%=request.getSession().getAttribute("email")%></li>
                                <%}%>
                            </ul>
                        </div>
                    </div>
                    <div class="col-lg-6 col-md-6">
                        <div class="header__top__right">
                            <div class="header__top__right__auth">
                                <%if(request.getSession().getAttribute("id")==null){%>
                                <a href="./login"><i class="fa fa-user"></i> Login</a>
                                <%}else{%>
                                <a href="./logout"><i class="fa fa-user"></i> Logout</a>
                                <%}%>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="container">
            <div class="row">
                <div class="col-lg-3">
                    <div class="header__logo">

                    </div>
                </div>
                <div class="col-lg-6">
                    <nav class="header__menu">
                        <ul>
                            <li class="active"><a href="./">Home</a></li>
                            <li><a href="./edit_product">Edit product</a></li>
                            <li><a href="./create_product">Add product</a></li>
                            <li><a href="./create_department">Add Department</a></li>
                            <li><a href="./users">View User Information</a></li>
                        </ul>
                    </nav>
                </div>
                <div class="col-lg-3">
                    <div class="header__cart">
                        <ul>
                            
                            <li><a href="./cart"><i class="fa fa-shopping-bag"></i> <span><%=request.getAttribute("cart")%></span></a></li>
                        </ul>
                        
                    </div>
                </div>
            </div>
            <div class="humberger__open">
                <i class="fa fa-bars"></i>
            </div>
        </div>
    </header>
    <!-- Header Section End -->

<div class="form_wrapper">
  <div class="form_container">
    <div class="title_container">
      <h2>Product Form</h2>
    </div>
    <div class="row clearfix">
      <div class="">
        <form action="create_product" method="post" enctype = "multipart/form-data">
            <% if(request.getAttribute("error")!=null) { %>
            <p><%=request.getAttribute("error")%></p>
            <% } %>

            <div class="input_field"> <span><i aria-hidden="true" class="fa fa-user"></i></span>
                 <input type="text" name="descText" placeholder="Desc In text" required />
           </div>
           <div class="input_field"> <span><i aria-hidden="true" class="fa fa-user"></i></span>
                <input type="text" name="descHtml" placeholder="Desc In html" required />
           </div> 
          <div class="input_field"> <span><i aria-hidden="true" class="fa fa-user"></i></span>
                <input type="text" name="code" placeholder="Product Code" required required pattern="[0-9.]+" />
           </div>
            <div class="input_field"> <span><i aria-hidden="true" class="fa fa-user"></i></span>
                <input type="text" name="name" placeholder="Name" required />
           </div>
            <div class="input_field"> <span><i aria-hidden="true" class="fa fa-user"></i></span>
                <input type="text" name="scale" placeholder="Scale" required required pattern="[0-9.]+" />
           </div>
            <div class="input_field"> <span><i aria-hidden="true" class="fa fa-user"></i></span>
                <input type="text" name="vendor" placeholder="Vendor" required />
           </div>
            <div class="input_field"> <span><i aria-hidden="true" class="fa fa-user"></i></span>
                <input type="text" name="PdtDescription" placeholder="Product Description" required />
           </div>
            <div class="input_field"> <span><i aria-hidden="true" class="fa fa-user"></i></span>
                <input type="text" name="qtyInStock" placeholder="Qty In Stock" required required pattern="[0-9.]+" />
           </div>
            <div class="input_field"> <span><i aria-hidden="true" class="fa fa-user"></i></span>
                <input type="text" name="buyPrice" placeholder="Buy Price" required required pattern="[0-9.]+" />
           </div>
           <div class="input_field"> <span><i aria-hidden="true" class="fa fa-user"></i></span>
                <input type="text" name="msrp" placeholder="MSRP" required />
           </div>
           <div class="input_field"> <span><i aria-hidden="true" class="fa fa-user"></i></span>
                <input type="text" name="category" placeholder="Category ID" required required pattern="[0-9.]+" />
           </div>
           <div class="input_field"> <span><i aria-hidden="true" class="fa fa-user"></i></span>
                <input type="file" name="image" placeholder="Product Image"  />
           </div>
          <input class="button" type="submit" value="Save" />
        </form>
      </div>
    </div>
  </div>
</div>

<!-- Footer Section Begin -->
    <footer class="footer spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-3 col-md-6 col-sm-6">
                    <div class="footer__about">
                        <div class="footer__about__logo">
    
                        </div>
                        <ul>
                            <li>Address: 12-34 Road 123456 Singapore</li>
                            <li>Phone: +65 9999 9999</li>
                            <li>Email: laixiolai@gmail.com</li>
                        </ul>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6 col-sm-6 offset-lg-1">
                    <div class="footer__widget">
                        <h6>Useful Links</h6>
                        <ul>
                            <li><a href="#">About Us</a></li>
                            <li><a href="#">About Our Shop</a></li>
                            <li><a href="#">Secure Shopping</a></li>
                            <li><a href="#">Delivery infomation</a></li>
                            <li><a href="#">Privacy Policy</a></li>
                            <li><a href="#">Our Sitemap</a></li>
                        </ul>
                        <ul>
                            <li><a href="#">Who We Are</a></li>
                            <li><a href="#">Our Services</a></li>
                            <li><a href="#">Projects</a></li>
                            <li><a href="#">Contact</a></li>
                            <li><a href="#">Innovation</a></li>
                            <li><a href="#">Testimonials</a></li>
                        </ul>
                    </div>
                </div>
                <div class="col-lg-4 col-md-12">
                    <div class="footer__widget">
                        <h6>Join Our Newsletter Now</h6>
                        <p>Get E-mail updates about our latest shop and special offers.</p>
                        <form action="#">
                            <input type="text" placeholder="Enter your mail">
                            <button type="submit" class="site-btn">Subscribe</button>
                        </form>
                        <div class="footer__widget__social">
                            <a href="#"><i class="fa fa-facebook"></i></a>
                            <a href="#"><i class="fa fa-instagram"></i></a>
                            <a href="#"><i class="fa fa-twitter"></i></a>
                            <a href="#"><i class="fa fa-pinterest"></i></a>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                        <div class="footer__copyright__payment"><img src="img/payment-item.png" alt=""></div>
            </div>
        </div>
    </footer>
    <!-- Footer Section End -->

    <!-- Js Plugins -->
    <script src="js/jquery-3.3.1.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/jquery.nice-select.min.js"></script>
    <script src="js/jquery-ui.min.js"></script>
    <script src="js/jquery.slicknav.js"></script>
    <script src="js/mixitup.min.js"></script>
    <script src="js/owl.carousel.min.js"></script>
    <script src="js/main.js"></script>

