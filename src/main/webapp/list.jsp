<%--
  Created by IntelliJ IDEA.
  User: starr
  Date: 2018/9/25
  Time: 22:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title></title>
    <%-- Latest Bootstrap min CSS --%>
    <link rel="stylesheet" href="assets/css/bootstrap.min.css" type="text/css">
    <%-- Dropdownhover CSS --%>
    <link rel="stylesheet" href="assets/css/bootstrap-dropdownhover.min.css" type="text/css">
    <%-- latest fonts awesome --%>
    <link rel="stylesheet" href="assets/font/css/font-awesome.min.css" type="text/css">
    <%-- simple line fonts awesome --%>
    <link rel="stylesheet" href="assets/simple-line-icon/css/simple-line-icons.css" type="text/css">
    <%-- stroke-gap-icons --%>
    <link rel="stylesheet" href="assets/stroke-gap-icons/stroke-gap-icons.css" type="text/css">
    <%-- Animate CSS --%>
    <link rel="stylesheet" href="assets/css/animate.min.css" type="text/css">
    <%-- Style CSS --%>
    <link rel="stylesheet" href="assets/css/style.css" type="text/css">
    <%-- Style CSS --%>
    <link rel="stylesheet" href="assets/css/slider.css" type="text/css">
    <%--  baguetteBox --%>
    <link rel="stylesheet" href="assets/css/baguetteBox.css">
    <%-- Owl Carousel Assets --%>
    <link href="assets/owl-carousel/owl.carousel.css" rel="stylesheet">
    <link href="assets/owl-carousel/owl.theme.css" rel="stylesheet">
    <%-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries --%>
    <%-- WARNING: Respond.js doesn't work if you view the page via file:// --%>
    <%--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]--%>
</head>

<body>
<%--  Preloader  --%>
<div id="preloader">
    <div id="loading"> </div>
</div>
<header class="header2">
    <%--  top-header  --%>
    <div class="top-header">
        <div class="container">
            <div class="col-md-6">
                <div class="top-header-left">
                    <ul>
                        <li>
                            <div class="dropdown">
                                <a href="#" class="btn btn-default dropdown-toggle" data-toggle="dropdown" data-hover="dropdown"> <img src="assets/images/eng-flg.jpg" alt="eng-flg" /> English <i class="fa fa-angle-down" aria-hidden="true"></i> </a>
                                <ul class="dropdown-menu">
                                    <li><a href="#">Action</a></li>
                                    <li><a href="#">Another action</a></li>
                                    <li> <a href="#">One more dropdown</a> </li>
                                    <li><a href="#">Something else here</a></li>
                                    <li><a href="#">Separated link</a></li>
                                </ul>
                            </div>
                        </li>
                        <li>
                            <div class="dropdown"> <a href="#" class="btn btn-default dropdown-toggle" data-toggle="dropdown" data-hover="dropdown">
                                USD <i class="fa fa-angle-down" aria-hidden="true"></i>
                            </a>
                                <ul class="dropdown-menu">
                                    <li><a href="#">Action</a></li>
                                    <li><a href="#">Another action</a></li>
                                    <li> <a href="#">One more dropdown</a> </li>
                                </ul>
                            </div>
                        </li>
                        <li> <span>Hello Custumer - Login or Registe!</span> </li>
                    </ul>
                </div>
            </div>
            <div class="col-md-6">
                <div class="top-header-right">
                    <ul>
                        <li><i class="icon-location-pin icons" aria-hidden="true"></i> Store Location</li>
                        <li><i class="icon-note icons" aria-hidden="true"></i> Track Your Order</li>
                        <li>
                            <div class="dropdown">
                                <a href="#" class="btn btn-default dropdown-toggle" data-toggle="dropdown" data-hover="dropdown"> <i class="icon-settings icons" aria-hidden="true"></i> Setting </a>
                                <ul class="dropdown-menu">
                                    <li><a href="#">Action</a></li>
                                    <li><a href="#">Another action</a></li>
                                    <li> <a href="#">One more dropdown</a> </li>
                                </ul>
                            </div>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
        <%--  /top-header  --%>
    </div>
    <section class="top-md-menu">
        <div class="container">
            <div class="col-sm-3">
                <div class="logo">
                    <h6><img src="assets/images/logo.png" alt="logo" /></h6>
                </div>
            </div>
            <div class="col-sm-6">
                <%-- Search box Start --%>
                <form>
                    <div class="well carousel-search hidden-phone">
                        <div class="btn-group">
                            <a class="btn dropdown-toggle btn-select" data-toggle="dropdown" href="#">All Categories <span class="caret"></span></a>
                            <ul class="dropdown-menu">
                                <li><a href="#">Item I</a></li>
                                <li><a href="#">Item II</a></li>
                                <li><a href="#">Item III</a></li>
                                <li class="divider"></li>
                                <li><a href="#">Other</a></li>
                            </ul>
                        </div>
                        <div class="search">
                            <input type="text" placeholder="Where prodect" />
                        </div>
                        <div class="btn-group">
                            <button type="button" id="btnSearch" class="btn btn-primary"><i class="fa fa-search" aria-hidden="true"></i></button>
                        </div>
                    </div>
                </form>
                <%-- Search box End --%>
            </div>
            <div class="col-sm-3">
                <%-- cart-menu --%>
                <div class="cart-menu">
                    <ul>
                        <li><a href="#"><i class="icon-heart icons" aria-hidden="true"></i></a><span class="subno">1</span><strong>Your Wishlist</strong></li>
                        <li class="dropdown"> <a href="#" data-toggle="dropdown" data-hover="dropdown"><i class="icon-basket-loaded icons" aria-hidden="true"></i></a><span class="subno">2</span><strong>Your Cart</strong>
                            <div class="dropdown-menu  cart-outer">
                                <div class="cart-content">
                                    <div class="col-sm-4 col-md-4"><img src="assets/images/elec-img4.jpg" alt="13"></div>
                                    <div class="col-sm-8 col-md-8">
                                        <div class="pro-text"> <a href="#">Apple Macbook Retina 23’’ </a>
                                            <div class="close">x</div> <strong>1 × $290.00</strong> </div>
                                    </div>
                                </div>
                                <div class="cart-content">
                                    <div class="col-sm-4 col-md-4"><img src="assets/images/elec-img3.jpg" alt="13"></div>
                                    <div class="col-sm-8 col-md-8">
                                        <div class="pro-text"> <a href="#">Apple Macbook Retina 23’’ </a>
                                            <div class="close">x</div> <strong>1 × $290.00</strong> </div>
                                    </div>
                                </div>
                                <div class="total">
                                    <div class="col-md-6 text-left"> <span>Shipping :</span> <strong>Total :</strong> </div>
                                    <div class="col-md-6 text-right"> <strong>$0.00</strong> <strong>$160.00</strong> </div>
                                </div> <a href="shopping-cart.jsp" class="cart-btn">VIEW CART </a> <a href="checkout.jsp" class="cart-btn">CHECKOUT</a> </div>
                        </li>
                    </ul>
                </div>
                <%-- cart-menu End --%>
            </div>
            <div class="main-menu">
                <%--  nav  --%>
                <nav class="navbar navbar-inverse navbar-default">
                    <%-- Brand and toggle get grouped for better mobile display --%>
                    <div class="navbar-header">
                        <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"> <span class="sr-only">Toggle navigation</span> <span class="icon-bar"></span> <span class="icon-bar"></span> <span class="icon-bar"></span> </button>
                    </div>
                    <%-- Collect the nav links, forms, and other content for toggling --%>
                    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1" data-hover="dropdown" data-animations=" fadeInLeft fadeInUp fadeInRight">
                        <ul class="nav navbar-nav">
                            <li class="all-departments dropdown"> <a href="index.jsp" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false"><span> Shop By Department</span> <i class="fa fa-bars" aria-hidden="true"></i> </a>
                                <ul class="dropdown-menu dropdownhover-bottom" role="menu">
                                    <li class="dropdown">
                                        <a href="index.jsp"><img src="assets/images/menu-icon1.png" alt="menu-icon1" /> Electronic & Digital <i class="fa fa-angle-right" aria-hidden="true"></i></a>
                                        <ul class="dropdown-menu right">
                                            <li><a href="grid.jsp">Electronic 01</a></li>
                                            <li><a href="list.jsp">Electronic 02</a></li>
                                        </ul>
                                    </li>
                                    <li class="dropdown">
                                        <a href="#"><img src="assets/images/menu-icon2.png" alt="menu-icon2" /> Phones & Accessories <i class="fa fa-angle-right" aria-hidden="true"></i></a>
                                        <ul class="dropdown-menu right">
                                            <li><a href="grid.jsp">Iphone 05</a></li>
                                            <li><a href="list.jsp">Iphone 06</a></li>
                                            <li><a href="grid.jsp">Iphone 07</a></li>
                                            <li><a href="list.jsp">Handfree</a></li>
                                            <li><a href="grid.jsp">Bettery</a></li>
                                        </ul>
                                    </li>
                                    <li>
                                        <a href="#"><img src="assets/images/menu-icon3.png" alt="menu-icon3" /> PHome & Kitchen <sup class="bg-red">hot!</sup></a>
                                    </li>
                                    <li class="dropdown">
                                        <a href="#"><img src="assets/images/menu-icon4.png" alt="menu-icon4" /> Fashion & Clothing <i class="fa fa-angle-right" aria-hidden="true"></i></a>
                                        <div class="dropdown-menu dropdownhover-bottom mega-menu" role="menu">

                                            <div class="col-sm-8 col-md-8">
                                                <ul>
                                                    <li><strong>Women’s Fashion</strong></li>
                                                    <li><a href="#">Flip-Flops</a></li>
                                                    <li><a href="#">Fashion Scarves</a></li>
                                                    <li><a href="#">Wallets</a></li>
                                                    <li><a href="#">Evening Handbags</a></li>
                                                    <li><a href="#">Wrist Watches</a></li>
                                                </ul>
                                                <ul>
                                                    <li><strong>Women’s Accessories</strong></li>
                                                    <li><a href="#">Flip-Flops</a></li>
                                                    <li><a href="#">Fashion Scarves</a></li>
                                                    <li><a href="#">Wallets</a></li>
                                                    <li><a href="#">Evening Handbags</a></li>
                                                    <li><a href="#">Wrist Watches</a></li>
                                                </ul>
                                                <ul>
                                                    <li><strong>Men’s Fashion</strong></li>
                                                    <li><a href="#">Flip-Flops</a></li>
                                                    <li><a href="#">Fashion Scarves</a></li>
                                                    <li><a href="#">Wallets</a></li>
                                                    <li><a href="#">Evening Handbags</a></li>
                                                    <li><a href="#">Wrist Watches</a></li>
                                                </ul>
                                                <ul>
                                                    <li><strong>Men’s Accessories</strong></li>
                                                    <li><a href="#">Flip-Flops</a></li>
                                                    <li><a href="#">Fashion Scarves</a></li>
                                                    <li><a href="#">Wallets</a></li>
                                                    <li><a href="#">Evening Handbags</a></li>
                                                    <li><a href="#">Wrist Watches</a></li>
                                                </ul>
                                            </div>

                                        </div>
                                    </li>
                                    <li class="dropdown">
                                        <a href="#"><img src="assets/images/menu-icon5.png" alt="menu-icon2" /> Sport & Outdoors <i class="fa fa-angle-right" aria-hidden="true"></i></a>
                                        <ul class="dropdown-menu right">
                                            <li><a href="grid.jsp">Sport 05</a></li>
                                            <li><a href="list.jsp">Sport 06</a></li>
                                            <li><a href="list.jsp">Outdoors 02</a></li>
                                            <li><a href="grid.jsp">Outdoors 01</a></li>
                                        </ul>
                                    </li>
                                    <li class="dropdown">
                                        <a href="#"><img src="assets/images/menu-icon6.png" alt="menu-icon2" /> Jewelry & Watches <i class="fa fa-angle-right" aria-hidden="true"></i></a>
                                        <ul class="dropdown-menu right">
                                            <li><a href="grid.jsp">Jewelry 05</a></li>
                                            <li><a href="grid.jsp">Watches 07</a></li>
                                            <li><a href="list.jsp">Watches 02</a></li>
                                        </ul>
                                    </li>
                                    <li>
                                        <a href="#"><img src="assets/images/menu-icon7.png" alt="menu-icon2" /> Health & Beauty <sup class="bg-blue">NEW</sup></a>
                                    </li>
                                    <li class="dropdown">
                                        <a href="#"><img src="assets/images/menu-icon8.png" alt="menu-icon2" /> Toys & Hobbies <i class="fa fa-angle-right" aria-hidden="true"></i></a>
                                        <ul class="dropdown-menu right">
                                            <li><a href="grid.jsp">Toys 05</a></li>
                                            <li><a href="list.jsp">Hobbies 02</a></li>
                                            <li><a href="grid.jsp">Toys 01</a></li>
                                        </ul>
                                    </li>
                                    <li class="dropdown">
                                        <a href="#"><img src="assets/images/menu-icon9.png" alt="menu-icon2" /> Book & Office <i class="fa fa-angle-right" aria-hidden="true"></i></a>
                                        <ul class="dropdown-menu right">
                                            <li><a href="grid.jsp">Book 05</a></li>
                                            <li><a href="list.jsp">Book 06</a></li>
                                            <li><a href="list.jsp">Office 02</a></li>
                                            <li><a href="grid.jsp">Office 01</a></li>
                                        </ul>
                                    </li>
                                    <li>
                                        <a href="#"><img src="assets/images/menu-icon10.png" alt="menu-icon2" /> Cameras & Camcorders</a>
                                    </li>
                                    <li>
                                        <a href="#"><img src="assets/images/menu-icon11.png" alt="menu-icon2" />All Categories</a>
                                    </li>
                                </ul>
                            </li>
                            <li><a href="index.jsp">Home</a></li>
                            <li><a href="list.jsp">List</a></li>
                            <li><a href="grid.jsp">Grid</a></li>
                            <li><a href="shop-detail.jsp">Shop-detail</a></li>
                            <li><a href="contact.jsp">Contact</a></li>
                            <li><a href="shopping-cart.jsp">Shopping-cart</a></li>
                            <li><a href="checkout.jsp">Checkout</a></li>
                        </ul>
                        <%-- /.navbar-collapse --%>
                    </div>
                </nav>
                <%-- /nav end --%>
            </div>
        </div>
    </section>
</header>
<%-- newsletter --%>
<section class="grid-shop">
    <%-- .grid-shop --%>
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="#">Home</a></li>
                    <li class="breadcrumb-item active">Library</li>
                </ol>
            </div>
            <div class="col-sm-3 col-md-3">
                <div class="weight">
                    <div class="title">
                        <h2>Categories</h2>
                    </div>
                    <div class="product-categories">
                        <ul>
                            <li><a href="#">Laptop & Computer  <span><i class="fa fa-angle-right" aria-hidden="true"></i></span></a></li>
                            <li><a href="#">Accessories   <span><i class="fa fa-angle-right" aria-hidden="true"></i></span></a></li>
                            <li><a href="#">Gaming  <span><i class="fa fa-angle-right" aria-hidden="true"></i></span></a></li>
                            <li><a href="#">Mac Computers  <span><i class="fa fa-angle-right" aria-hidden="true"></i></span></a></li>
                            <li><a href="#">Ultrabooks <span><i class="fa fa-angle-right" aria-hidden="true"></i></span></a></li>
                            <li><a href="#">Printers & Ink  <span><i class="fa fa-angle-right" aria-hidden="true"></i></span></a></li>
                        </ul>
                    </div>
                </div>
                <div class="weight">
                    <div class="title">
                        <h2>filter by price</h2>
                    </div>
                    <div class="filter-outer">
                        <h3>Price</h3>
                        <%-- Bootstrap Pricing Slider by ZsharE --%>
                        <div class="button-slider">
                            <div class="btn-group">
                                <div class="btn btn-default">
                                    <p>Range: <strong>$<span id="sliderValue">100.0</span></strong> - <strong>$<span id="sliderValue2">1.700.00</span></strong> </p>
                                    <input id="bootstrap-slider" data-slider-min="1" data-slider-max="1700" data-slider-step="1" data-slider-value="100" type="text">
                                    <div class="valueLabelblck">Filter</div>
                                </div>
                            </div>
                        </div>
                        <%-- End of Bootstrap Pricing Slider by ZsharE --%>
                        <div class="brands">
                            <h3>Brands</h3>
                            <ul>
                                <li><a href="#">Black  <span>(10)</span></a></li>
                                <li><a href="#">White   <span>(13)</span></a></li>
                                <li><a href="#">Blue  <span>(05)</span></a></li>
                                <li><a href="#">Red  <span>(87)</span></a></li>
                                <li><a href="#">Screen <span>(40)</span></a></li>
                            </ul>
                        </div>
                        <div class="color">
                            <h3>Color</h3>
                            <ul>
                                <li><a href="#" class="color-1"><span ></span></a></li>
                                <li><a href="#" class="color-2"><span ></span></a></li>
                                <li><a href="#" class="color-3"><span ></span></a></li>
                                <li><a href="#" class="color-4"><span ></span></a></li>
                                <li><a href="#" class="color-5"><span ></span></a></li>
                                <li><a href="#" class="color-6"><span ></span></a></li>
                                <li><a href="#" class="color-7"><span ></span></a></li>
                            </ul>
                        </div>
                        <div class="size">
                            <h3>Size</h3>
                            <ul>
                                <li><a href="#">L </a></li>
                                <li><a href="#">M </a></li>
                                <li><a href="#">S </a></li>
                                <li><a href="#">XL</a></li>
                                <li><a href="#">XXL</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="weight">
                    <div class="title">
                        <h2>Compare products</h2>
                    </div>
                    <div class="ads-lft">
                        <p>You have no item to compare. </p> <img src="assets/images/add-banner2.jpg" alt="add banner"> </div>
                </div>
                <div class="weight">
                    <div class="title">
                        <h2>BEST PRODUCTS</h2>
                    </div>
                    <div class="toprating-box">
                        <ul>
                            <li>
                                <div class="e-product">
                                    <div class="pro-img"> <img src="assets/images/products/digital/5.jpg" alt="2"> </div>
                                    <div class="pro-text-outer"> <span>Macbook, Laptop</span>
                                        <a href="#">
                                            <h4> Apple Macbook Retina 23’ </h4>
                                        </a>
                                        <p class="wk-price">$290.00 </p>
                                    </div>
                                </div>
                            </li>
                            <li>
                                <div class="e-product">
                                    <div class="pro-img"> <img src="assets/images/products/digital/9.jpg" alt="2"> </div>
                                    <div class="pro-text-outer"> <span>Macbook, Laptop</span>
                                        <a href="#">
                                            <h4> Apple Macbook Retina 23’ </h4>
                                        </a>
                                        <p class="wk-price">$290.00 </p>
                                    </div>
                                </div>
                            </li>
                            <li>
                                <div class="e-product">
                                    <div class="pro-img"> <img src="assets/images/products/digital/12.jpg" alt="2"> </div>
                                    <div class="pro-text-outer"> <span>Macbook, Laptop</span>
                                        <a href="#">
                                            <h4> Apple Macbook Retina 23’ </h4>
                                        </a>
                                        <p class="wk-price">$290.00 </p>
                                    </div>
                                </div>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="col-sm-9 col-md-9">
                <div class="col-md-12 grid-banner"> <img src="assets/images/Grid-banner.png" alt="Grid-banner" /> </div>
                <div class="grid-spr">
                    <div class="col-sm-6 col-md-6"> <a href="#" class="grid-view-icon"><i class="fa fa-th-large" aria-hidden="true"></i></a> <a href="#" class="list-view-icon"><i class="fa fa-list" aria-hidden="true"></i></a>
                        <div class="select-option">
                            <a class="btn btn-default btn-select options2">
                                <input type="hidden" class="btn-select-input" id="1" name="1" value="" />
                                <span class="btn-select-value">Select an Item</span>
                                <span class="btn-select-arrow fa fa-angle-down"></span>
                                <ul>
                                    <li class="selected">Default Sorting</li>
                                    <li>Option 1</li>
                                    <li>Option 2</li>
                                    <li>Option 3</li>
                                    <li>Option 4</li>
                                </ul>
                            </a>
                        </div>
                    </div>
                    <div class="col-sm-6 col-md-6 text-right"> <strong>Showing 1-12 <span>of 30 relults</span></strong> </div>
                </div>
                <div class="col-xs-12 col-sm-12 col-md-12">
                    <%-- .pro-text --%>
                    <div class="pro-text">
                        <div class="col-xs-12 col-sm-5 col-md-5">
                            <%-- .pro-img --%>
                            <div class="pro-img"> <img src="assets/images/products/digital/20.jpg" alt="2">
                                <sup class="sale-tag">sale!</sup>
                                <%-- .hover-icon --%>
                                <div class="hover-icon"> <a href="#"><span class="icon icon-Heart"></span></a> <a href="#"><span class="icon icon-Search"></span></a> <a href="#"><span class="icon icon-Restart"></span></a> </div>
                                <%-- /.hover-icon --%>
                            </div>
                            <%-- /.pro-img --%>
                        </div>
                        <div class="col-xs-12 col-sm-7 col-md-7">
                            <div class="pro-text-outer list-pro-text">
                                <span>Macbook, Laptop</span>
                                <a href="#">
                                    <h4> Apple Macbook Retina 23’ </h4>
                                </a>
                                <div class="star2">
                                    <ul>
                                        <li class="yellow-color"><i class="fa fa-star" aria-hidden="true"></i></li>
                                        <li class="yellow-color"><i class="fa fa-star" aria-hidden="true"></i></li>
                                        <li class="yellow-color"><i class="fa fa-star" aria-hidden="true"></i></li>
                                        <li class="yellow-color"><i class="fa fa-star" aria-hidden="true"></i></li>
                                        <li><i class="fa fa-star" aria-hidden="true"></i></li>
                                        <li><a href="#">10 review(s)</a></li>
                                        <li><a href="#"> Add your review</a></li>
                                    </ul>
                                </div>
                                <p class="wk-price">$290.00 </p>
                                <p>Typi non habent claritatem insitam, est usus legentis in iis qui facit eorum claritatem. Investigationes demonstraverunt lectores legere me lius quod ii legunt saepius. Claritas est etiam processus.</p>
                                <a href="#" class="add-btn">Add to cart</a>
                                <a href="#" class="add-btn2"><span class="icon icon-Heart"></span></a>
                                <a href="#" class="add-btn2"><span class="icon icon-Restart"></span></a>
                            </div>
                        </div>
                    </div>
                    <%-- /.pro-text --%>
                </div>
                <div class="col-xs-12 col-sm-12 col-md-12">
                    <%-- .pro-text --%>
                    <div class="pro-text">
                        <div class="col-xs-12 col-sm-5 col-md-5">
                            <%-- .pro-img --%>
                            <div class="pro-img"> <img src="assets/images/products/digital/2.jpg" alt="2">
                                <sup class="sale-tag">sale!</sup>
                                <%-- .hover-icon --%>
                                <div class="hover-icon"> <a href="#"><span class="icon icon-Heart"></span></a> <a href="#"><span class="icon icon-Search"></span></a> <a href="#"><span class="icon icon-Restart"></span></a> </div>
                                <%-- /.hover-icon --%>
                            </div>
                            <%-- /.pro-img --%>
                        </div>
                        <div class="col-xs-12 col-sm-7 col-md-7">
                            <div class="pro-text-outer list-pro-text">
                                <span>Macbook, Laptop</span>
                                <a href="#">
                                    <h4> Apple Macbook Retina 23’ </h4>
                                </a>
                                <div class="star2">
                                    <ul>
                                        <li class="yellow-color"><i class="fa fa-star" aria-hidden="true"></i></li>
                                        <li class="yellow-color"><i class="fa fa-star" aria-hidden="true"></i></li>
                                        <li class="yellow-color"><i class="fa fa-star" aria-hidden="true"></i></li>
                                        <li class="yellow-color"><i class="fa fa-star" aria-hidden="true"></i></li>
                                        <li><i class="fa fa-star" aria-hidden="true"></i></li>
                                        <li><a href="#">10 review(s)</a></li>
                                        <li><a href="#"> Add your review</a></li>
                                    </ul>
                                </div>
                                <p class="wk-price">$290.00 </p>
                                <p>Typi non habent claritatem insitam, est usus legentis in iis qui facit eorum claritatem. Investigationes demonstraverunt lectores legere me lius quod ii legunt saepius. Claritas est etiam processus.</p>
                                <a href="#" class="add-btn">Add to cart</a>
                                <a href="#" class="add-btn2"><span class="icon icon-Heart"></span></a>
                                <a href="#" class="add-btn2"><span class="icon icon-Restart"></span></a>
                            </div>
                        </div>
                    </div>
                    <%-- /.pro-text --%>
                </div>
                <div class="col-xs-12 col-sm-12 col-md-12">
                    <%-- .pro-text --%>
                    <div class="pro-text">
                        <div class="col-xs-12 col-sm-5 col-md-5">
                            <%-- .pro-img --%>
                            <div class="pro-img"> <img src="assets/images/products/digital/22.jpg" alt="2">
                                <%-- .hover-icon --%>
                                <div class="hover-icon"> <a href="#"><span class="icon icon-Heart"></span></a> <a href="#"><span class="icon icon-Search"></span></a> <a href="#"><span class="icon icon-Restart"></span></a> </div>
                                <%-- /.hover-icon --%>
                            </div>
                            <%-- /.pro-img --%>
                        </div>
                        <div class="col-xs-12 col-sm-7 col-md-7">
                            <div class="pro-text-outer list-pro-text">
                                <span>Macbook, Laptop</span>
                                <a href="#">
                                    <h4> Apple Macbook Retina 23’ </h4>
                                </a>
                                <div class="star2">
                                    <ul>
                                        <li class="yellow-color"><i class="fa fa-star" aria-hidden="true"></i></li>
                                        <li class="yellow-color"><i class="fa fa-star" aria-hidden="true"></i></li>
                                        <li class="yellow-color"><i class="fa fa-star" aria-hidden="true"></i></li>
                                        <li class="yellow-color"><i class="fa fa-star" aria-hidden="true"></i></li>
                                        <li><i class="fa fa-star" aria-hidden="true"></i></li>
                                        <li><a href="#">10 review(s)</a></li>
                                        <li><a href="#"> Add your review</a></li>
                                    </ul>
                                </div>
                                <p class="wk-price">$290.00 </p>
                                <p>Typi non habent claritatem insitam, est usus legentis in iis qui facit eorum claritatem. Investigationes demonstraverunt lectores legere me lius quod ii legunt saepius. Claritas est etiam processus.</p>
                                <a href="#" class="add-btn">Add to cart</a>
                                <a href="#" class="add-btn2"><span class="icon icon-Heart"></span></a>
                                <a href="#" class="add-btn2"><span class="icon icon-Restart"></span></a>
                            </div>
                        </div>
                    </div>
                    <%-- /.pro-text --%>
                </div>
                <div class="col-xs-12 col-sm-12 col-md-12">
                    <%-- .pro-text --%>
                    <div class="pro-text">
                        <div class="col-xs-12 col-sm-5 col-md-5">
                            <%-- .pro-img --%>
                            <div class="pro-img"> <img src="assets/images/products/digital/13.jpg" alt="2">
                                <%-- .hover-icon --%>
                                <div class="hover-icon"> <a href="#"><span class="icon icon-Heart"></span></a> <a href="#"><span class="icon icon-Search"></span></a> <a href="#"><span class="icon icon-Restart"></span></a> </div>
                                <%-- /.hover-icon --%>
                            </div>
                            <%-- /.pro-img --%>
                        </div>
                        <div class="col-xs-12 col-sm-7 col-md-7">
                            <div class="pro-text-outer list-pro-text">
                                <span>Macbook, Laptop</span>
                                <a href="#">
                                    <h4> Apple Macbook Retina 23’ </h4>
                                </a>
                                <div class="star2">
                                    <ul>
                                        <li class="yellow-color"><i class="fa fa-star" aria-hidden="true"></i></li>
                                        <li class="yellow-color"><i class="fa fa-star" aria-hidden="true"></i></li>
                                        <li class="yellow-color"><i class="fa fa-star" aria-hidden="true"></i></li>
                                        <li class="yellow-color"><i class="fa fa-star" aria-hidden="true"></i></li>
                                        <li><i class="fa fa-star" aria-hidden="true"></i></li>
                                        <li><a href="#">10 review(s)</a></li>
                                        <li><a href="#"> Add your review</a></li>
                                    </ul>
                                </div>
                                <p class="wk-price">$290.00 </p>
                                <p>Typi non habent claritatem insitam, est usus legentis in iis qui facit eorum claritatem. Investigationes demonstraverunt lectores legere me lius quod ii legunt saepius. Claritas est etiam processus.</p>
                                <a href="#" class="add-btn">Add to cart</a>
                                <a href="#" class="add-btn2"><span class="icon icon-Heart"></span></a>
                                <a href="#" class="add-btn2"><span class="icon icon-Restart"></span></a>
                            </div>
                        </div>
                    </div>
                    <%-- /.pro-text --%>
                </div>
                <div class="col-xs-12 col-sm-12 col-md-12">
                    <%-- .pro-text --%>
                    <div class="pro-text">
                        <div class="col-xs-12 col-sm-5 col-md-5">
                            <%-- .pro-img --%>
                            <div class="pro-img"> <img src="assets/images/products/digital/17.jpg" alt="2">
                                <sup class="sale-tag">sale!</sup>
                                <%-- .hover-icon --%>
                                <div class="hover-icon"> <a href="#"><span class="icon icon-Heart"></span></a> <a href="#"><span class="icon icon-Search"></span></a> <a href="#"><span class="icon icon-Restart"></span></a> </div>
                                <%-- /.hover-icon --%>
                            </div>
                            <%-- /.pro-img --%>
                        </div>
                        <div class="col-xs-12 col-sm-7 col-md-7">
                            <div class="pro-text-outer list-pro-text">
                                <span>Macbook, Laptop</span>
                                <a href="#">
                                    <h4> Apple Macbook Retina 23’ </h4>
                                </a>
                                <div class="star2">
                                    <ul>
                                        <li class="yellow-color"><i class="fa fa-star" aria-hidden="true"></i></li>
                                        <li class="yellow-color"><i class="fa fa-star" aria-hidden="true"></i></li>
                                        <li class="yellow-color"><i class="fa fa-star" aria-hidden="true"></i></li>
                                        <li class="yellow-color"><i class="fa fa-star" aria-hidden="true"></i></li>
                                        <li><i class="fa fa-star" aria-hidden="true"></i></li>
                                        <li><a href="#">10 review(s)</a></li>
                                        <li><a href="#"> Add your review</a></li>
                                    </ul>
                                </div>
                                <p class="wk-price">$290.00 </p>
                                <p>Typi non habent claritatem insitam, est usus legentis in iis qui facit eorum claritatem. Investigationes demonstraverunt lectores legere me lius quod ii legunt saepius. Claritas est etiam processus.</p>
                                <a href="#" class="add-btn">Add to cart</a>
                                <a href="#" class="add-btn2"><span class="icon icon-Heart"></span></a>
                                <a href="#" class="add-btn2"><span class="icon icon-Restart"></span></a>
                            </div>
                        </div>
                    </div>
                    <%-- /.pro-text --%>
                </div>
                <div class="col-xs-12 col-sm-12 col-md-12">
                    <%-- .pro-text --%>
                    <div class="pro-text">
                        <div class="col-xs-12 col-sm-5 col-md-5">
                            <%-- .pro-img --%>
                            <div class="pro-img"> <img src="assets/images/products/digital/16.jpg" alt="2">
                                <%-- .hover-icon --%>
                                <div class="hover-icon"> <a href="#"><span class="icon icon-Heart"></span></a> <a href="#"><span class="icon icon-Search"></span></a> <a href="#"><span class="icon icon-Restart"></span></a> </div>
                                <%-- /.hover-icon --%>
                            </div>
                            <%-- /.pro-img --%>
                        </div>
                        <div class="col-xs-12 col-sm-7 col-md-7">
                            <div class="pro-text-outer list-pro-text">
                                <span>Macbook, Laptop</span>
                                <a href="#">
                                    <h4> Apple Macbook Retina 23’ </h4>
                                </a>
                                <div class="star2">
                                    <ul>
                                        <li class="yellow-color"><i class="fa fa-star" aria-hidden="true"></i></li>
                                        <li class="yellow-color"><i class="fa fa-star" aria-hidden="true"></i></li>
                                        <li class="yellow-color"><i class="fa fa-star" aria-hidden="true"></i></li>
                                        <li class="yellow-color"><i class="fa fa-star" aria-hidden="true"></i></li>
                                        <li><i class="fa fa-star" aria-hidden="true"></i></li>
                                        <li><a href="#">10 review(s)</a></li>
                                        <li><a href="#"> Add your review</a></li>
                                    </ul>
                                </div>
                                <p class="wk-price">$290.00 </p>
                                <p>Typi non habent claritatem insitam, est usus legentis in iis qui facit eorum claritatem. Investigationes demonstraverunt lectores legere me lius quod ii legunt saepius. Claritas est etiam processus.</p>
                                <a href="#" class="add-btn">Add to cart</a>
                                <a href="#" class="add-btn2"><span class="icon icon-Heart"></span></a>
                                <a href="#" class="add-btn2"><span class="icon icon-Restart"></span></a>
                            </div>
                        </div>
                    </div>
                    <%-- /.pro-text --%>
                </div>
                <div class="col-xs-12 col-sm-12 col-md-12">
                    <%-- .pro-text --%>
                    <div class="pro-text">
                        <div class="col-xs-12 col-sm-5 col-md-5">
                            <%-- .pro-img --%>
                            <div class="pro-img"> <img src="assets/images/products/digital/14.jpg" alt="2">
                                <%-- .hover-icon --%>
                                <div class="hover-icon"> <a href="#"><span class="icon icon-Heart"></span></a> <a href="#"><span class="icon icon-Search"></span></a> <a href="#"><span class="icon icon-Restart"></span></a> </div>
                                <%-- /.hover-icon --%>
                            </div>
                            <%-- /.pro-img --%>
                        </div>
                        <div class="col-xs-12 col-sm-7 col-md-7">
                            <div class="pro-text-outer list-pro-text">
                                <span>Macbook, Laptop</span>
                                <a href="#">
                                    <h4> Apple Macbook Retina 23’ </h4>
                                </a>
                                <div class="star2">
                                    <ul>
                                        <li class="yellow-color"><i class="fa fa-star" aria-hidden="true"></i></li>
                                        <li class="yellow-color"><i class="fa fa-star" aria-hidden="true"></i></li>
                                        <li class="yellow-color"><i class="fa fa-star" aria-hidden="true"></i></li>
                                        <li class="yellow-color"><i class="fa fa-star" aria-hidden="true"></i></li>
                                        <li><i class="fa fa-star" aria-hidden="true"></i></li>
                                        <li><a href="#">10 review(s)</a></li>
                                        <li><a href="#"> Add your review</a></li>
                                    </ul>
                                </div>
                                <p class="wk-price">$290.00 </p>
                                <p>Typi non habent claritatem insitam, est usus legentis in iis qui facit eorum claritatem. Investigationes demonstraverunt lectores legere me lius quod ii legunt saepius. Claritas est etiam processus.</p>
                                <a href="#" class="add-btn">Add to cart</a>
                                <a href="#" class="add-btn2"><span class="icon icon-Heart"></span></a>
                                <a href="#" class="add-btn2"><span class="icon icon-Restart"></span></a>
                            </div>
                        </div>
                    </div>
                    <%-- /.pro-text --%>
                </div>
                <div class="col-xs-12">
                    <div class="grid-spr pag">
                        <%-- .pagetions --%>
                        <div class="col-xs-12 col-sm-6 col-md-6 text-left">
                            <ul class="pagination">
                                <li class="active"><a href="#">1</a></li>
                                <li><a href="#">2</a></li>
                                <li><a href="#">3</a></li>
                                <li><a href="#">&raquo;</a></li>
                            </ul>
                        </div>
                        <%-- /.pagetions --%>
                        <%-- .Showing --%>
                        <div class="col-xs-12 col-sm-6 col-md-6 text-right">
                            <strong>Showing 1-12 <span>of 30 relults</span></strong>
                        </div>
                        <%-- /.Showing --%>
                    </div>
                </div>

            </div>
        </div>
    </div>
    <%-- /.grid-shop --%>
</section>
<%-- newsletter --%>
<section class="newsletter">
    <div class="container">
        <div class="row">
            <div class="col-xs-12 col-sm-6 col-md-6">
                <h6 class="sing-up-text">sign up to
                    <strong>newsletter</strong> &
                    <strong>free shipping</strong> for first shopping</h6>
            </div>
            <div class="col-xs-12 col-sm-6 col-md-6">
                <div class="sing-up-input">
                    <input name="singup" type="text" placeholder="Your email address...">
                    <input name="submit" type="button" value="Submit" /> </div>
            </div>
        </div>
    </div>
</section>
<%-- /newsletter --%>
<footer>
    <div class="container">
        <div class="row">
            <div class="col-xs-12 col-sm-4 col-md-4">
                <%-- f-weghit --%>
                <div class="f-weghit"> <img src="assets/images/logo.png" alt="logo" />
                    <p><strong>Complex</strong> is a premium Templates theme with advanced admin module. It’s extremely customizable, easy to use and fully responsive and retina ready.</p>
                    <ul>
                        <li><i class="icon-location-pin icons" aria-hidden="true"></i> <strong>Add:</strong> 1234 Heaven Stress, Beverly Hill, Melbourne, USA.</li>
                        <li><i class="icon-envelope-letter icons"></i> <strong>Email:</strong> Contact@erentheme.com</li>
                        <li><i class="icon-call-in icons"></i> <strong>Phone Number:</strong> (800) 123 456 789</li>
                    </ul>
                </div>
                <%-- /f-weghit --%>
            </div>
            <div class="col-xs-12 col-sm-4 col-md-4">
                <%-- f-weghit2 --%>
                <div class="f-weghit2">
                    <h4>INFORMATION</h4>
                    <ul>
                        <li><a href="#">About Us</a></li>
                        <li><a href="#">Contact Us</a></li>
                        <li><a href="#">All Collection</a></li>
                        <li><a href="#">Privacy policy</a></li>
                        <li><a href="#">Terms & conditio</a></li>
                    </ul>
                </div>
                <%-- /f-weghit2 --%>
                <%-- f-weghit2 --%>
                <div class="f-weghit2">
                    <h4>CATEGORIES</h4>
                    <ul>
                        <li><a href="#">Fashion</a></li>
                        <li><a href="#">Electronics</a></li>
                        <li><a href="#">Furnitured & Decor</a></li>
                        <li><a href="#">Jewelry & Watches</a></li>
                        <li><a href="#">Health & Beauty</a></li>
                    </ul>
                </div>
                <%-- /f-weghit2 --%>
            </div>
            <div class="col-xs-12 col-sm-4 col-md-4">
                <%-- f-weghit --%>
                <div class="f-weghit">
                    <h4>On-Sale Products</h4>
                    <%-- e-product --%>
                    <div class="e-product">
                        <div class="pro-img"> <img src="assets/images/on-seal-img1.jpg" alt="2"> </div>
                        <div class="pro-text-outer"> <span>Macbook, Laptop</span>
                            <a href="#">
                                <h4> Apple Macbook Retina 23’ </h4>
                            </a>
                            <p class="wk-price">$290.00 </p>
                        </div>
                    </div>
                    <%-- e-product --%>
                    <%-- e-product --%>
                    <div class="e-product">
                        <div class="pro-img"> <img src="assets/images/on-seal-img2.jpg" alt="2"> </div>
                        <div class="pro-text-outer"> <span>Macbook, Laptop</span>
                            <a href="#">
                                <h4> Apple Macbook Retina 23’ </h4>
                            </a>
                            <p class="wk-price">$290.00 </p>
                        </div>
                    </div>
                    <%-- e-product --%>
                </div>
                <%-- /f-weghit --%>
            </div>
            <%-- copayright --%>
            <div class="copayright">
                <div class="row">
                    <div class="col-xs-12 col-sm-6 col-md-6">Copyright &copy; 2017.Company name All rights reserved.</div>
                    <div class="text-right col-xs-12 col-sm-6 col-md-6"> <img src="assets/images/payment-img.jpg" alt="payment-img" /> </div>
                </div>
            </div>
            <%-- /copayright --%>
        </div>
    </div>
</footer>
<%-- sticky-socia --%>
<aside id="sticky-social">
    <ul>
        <li><a href="#" class="fa fa-facebook" target="_blank"><span><i class="fa fa-facebook" aria-hidden="true"></i> Facebook</span></a></li>
        <li><a href="#" class="fa fa-twitter" target="_blank"><span><i class="fa fa-twitter" aria-hidden="true"></i> Twitter</span></a></li>
        <li><a href="#" class="fa fa-rss" target="_blank"><span><i class="fa fa-rss" aria-hidden="true"></i> RSS</span></a></li>
        <li><a href="#" class="fa fa-pinterest-p" target="_blank"><span><i class="fa fa-pinterest-p" aria-hidden="true"></i> Pinterest</span></a></li>
        <li><a href="#" class="fa fa-share-alt" target="_blank"><span><i class="fa fa-share-alt" aria-hidden="true"></i> Flickr</span></a></li>
    </ul>
</aside>
<%-- /sticky-socia --%>
<p id="back-top"> <a href="#top"><i class="fa fa-chevron-up" aria-hidden="true"></i></a> </p>
<script src="assets/js/jquery.js"></script>
<%-- Bootstrap Core JavaScript --%>
<script src="assets/js/bootstrap.min.js"></script>
<script src="assets/js/bootstrap-dropdownhover.min.js"></script>
<%-- Plugin JavaScript --%>
<script src="assets/js/jquery.easing.min.js"></script>
<script src="assets/js/wow.min.js"></script>
<%-- owl carousel --%>
<script src="assets/owl-carousel/owl.carousel.js"></script>
<%--  Custom Theme JavaScript  --%>
<script src="assets/js/filter-price.js"></script>
<script src="assets/js/custom.js"></script>
</body>

</html>
