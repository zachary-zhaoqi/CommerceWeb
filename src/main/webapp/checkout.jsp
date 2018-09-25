<%--
  Created by IntelliJ IDEA.
  User: starr
  Date: 2018/9/25
  Time: 22:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%-- 结账台 --%>

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
<section class="shopping-cart">
    <%-- .shopping-cart --%>
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="#">Home</a></li>
                    <li class="breadcrumb-item active">Check Out</li>
                </ol>
            </div>
            <div class="col-md-12">
                <%-- Accordions --%>
                <div class="tabContent" id="tabContent1">
                    <div class="panel-group" id="accordion">
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <h4 class="panel-title">
                                    <a data-toggle="collapse" data-parent="#accordion" href="#collapseOne">01. Create a new account </a>
                                </h4>
                            </div>
                            <div id="collapseOne" class="panel-collapse collapse in">
                                <div class="panel-body">
                                    <div class="col-sm-6 col-md-6">
                                        <div class="shipping-outer">
                                            <h4>Create a new account</h4>
                                            <p>Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore te feugait nulla facilisi. Nam liber tempor cum soluta nobis eleifend option congue.</p>
                                            <div class="row">
                                                <div class="col-md-12 counttry">
                                                    <div class="lable">Email:</div>
                                                    <input name="counttry" placeholder="Mark Stevens" type="text">
                                                </div>
                                                <div class="col-md-12 counttry">
                                                    <div class="lable">Password:</div>
                                                    <input name="counttry" placeholder="Mark Stevens" type="password">
                                                </div>
                                            </div>
                                            <a href="#" class="button2">REgister now</a>
                                            <a href="#" class="button3">Checkout as guest</a>
                                        </div>
                                    </div>
                                    <div class="col-sm-6 col-md-6">
                                        <div class="shipping-outer">
                                            <h4>Login to your account</h4>
                                            <div class="row">
                                                <div class="col-md-12 counttry">
                                                    <div class="lable">Email:</div>
                                                    <input name="counttry" placeholder="Mark Stevens" type="text">
                                                </div>
                                                <div class="col-md-12 counttry">
                                                    <div class="lable">Password:</div>
                                                    <input name="counttry" placeholder="Mark Stevens" type="password">
                                                </div>
                                            </div>
                                            <div class="col-sm-6 col-md-6 text-left">
                                                <input name="counttry" type="checkbox">
                                            </div>
                                            <div class="col-sm-6 col-md-6 text-right">
                                                <a href="#" class="forgot-link">Forgot your password?</a>
                                            </div>
                                            <a href="#" class="login-btn">Forgot your password?</a>
                                            <div class="fbtw">
                                                <a href="#" class="fac-btn"><i class="fa fa-facebook" aria-hidden="true"></i> REgister now</a>
                                                <a href="#" class="twi-btn"><i class="fa fa-twitter" aria-hidden="true"></i> Checkout as guest</a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <h4 class="panel-title">
                                    <a data-toggle="collapse" data-parent="#accordion" href="#collapse2">02 Billing Information</a>
                                </h4>
                            </div>
                            <div id="collapse2" class="panel-collapse collapse">
                                <div class="panel-body">
                                    <div class="shipping-outer">
                                        <div class="col-sm-4 col-md-4">
                                            <div class="row">
                                                <div class="col-md-12 counttry">
                                                    <div class="lable">First Name</div>
                                                    <input name="First Name" placeholder="First Name" type="text">
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-sm-4 col-md-4">
                                            <div class="col-md-12 counttry">
                                                <div class="lable">Last Name</div>
                                                <input name="Last Name" placeholder="Last Name" type="text">
                                            </div>
                                        </div>
                                        <div class="col-sm-4 col-md-4">
                                            <div class="col-md-12 counttry">
                                                <div class="lable">Company</div>
                                                <input name="Company" placeholder="Company" type="text">
                                            </div>
                                        </div>
                                        <div class="col-sm-12 col-md-12">
                                            <div class="lable">Email</div>
                                            <input name="Email" placeholder="Email" type="email">
                                        </div>
                                        <div class="col-sm-12 col-md-12">
                                            <div class="lable">Address</div>
                                            <input name="Address" placeholder="Address" type="text">
                                        </div>
                                        <div class="col-sm-12 col-md-12">
                                            <div class="lable">Street Address 2</div>
                                            <input name="Address2" placeholder="Address2" type="text">
                                        </div>
                                        <div class="col-sm-4 col-md-4">
                                            <div class="lable">Country</div>
                                            <div class="size State">
                                                <div class="select-option">
                                                    <select>
                                                        <option value="AF">Afghanistan</option>
                                                        <option value="AX">Åland Islands</option>
                                                        <option value="AL">Albania</option>
                                                        <option value="DZ">Algeria</option>
                                                        <option value="AS">American Samoa</option>
                                                        <option value="AD">Andorra</option>
                                                        <option value="AO">Angola</option>
                                                        <option value="AI">Anguilla</option>
                                                        <option value="AQ">Antarctica</option>
                                                        <option value="AG">Antigua and Barbuda</option>
                                                        <option value="AR">Argentina</option>
                                                        <option value="AM">Armenia</option>
                                                        <option value="AW">Aruba</option>
                                                        <option value="AU">Australia</option>
                                                        <option value="AT">Austria</option>
                                                        <option value="AZ">Azerbaijan</option>
                                                        <option value="BS">Bahamas</option>
                                                        <option value="BH">Bahrain</option>
                                                        <option value="BD">Bangladesh</option>
                                                        <option value="BB">Barbados</option>
                                                        <option value="BY">Belarus</option>
                                                        <option value="BE">Belgium</option>
                                                        <option value="BZ">Belize</option>
                                                        <option value="BJ">Benin</option>
                                                        <option value="BM">Bermuda</option>
                                                        <option value="BT">Bhutan</option>
                                                        <option value="BO">Bolivia</option>
                                                        <option value="BA">Bosnia and Herzegovina</option>
                                                        <option value="BW">Botswana</option>
                                                        <option value="BV">Bouvet Island</option>
                                                        <option value="BR">Brazil</option>
                                                        <option value="IO">British Indian Ocean Territory</option>
                                                        <option value="VG">British Virgin Islands</option>
                                                        <option value="BN">Brunei</option>
                                                        <option value="BG">Bulgaria</option>
                                                        <option value="BF">Burkina Faso</option>
                                                        <option value="BI">Burundi</option>
                                                        <option value="KH">Cambodia</option>
                                                        <option value="CM">Cameroon</option>
                                                        <option value="CA">Canada</option>
                                                        <option value="CV">Cape Verde</option>
                                                        <option value="KY">Cayman Islands</option>
                                                        <option value="CF">Central African Republic</option>
                                                        <option value="TD">Chad</option>
                                                        <option value="CL">Chile</option>
                                                        <option value="CN">China</option>
                                                        <option value="CX">Christmas Island</option>
                                                        <option value="CC">Cocos (Keeling) Islands</option>
                                                        <option value="CO">Colombia</option>
                                                        <option value="KM">Comoros</option>
                                                        <option value="CG">Congo - Brazzaville</option>
                                                        <option value="CD">Congo - Kinshasa</option>
                                                        <option value="CK">Cook Islands</option>
                                                        <option value="CR">Costa Rica</option>
                                                        <option value="CI">Côte d’Ivoire</option>
                                                        <option value="HR">Croatia</option>
                                                        <option value="CU">Cuba</option>
                                                        <option value="CY">Cyprus</option>
                                                        <option value="CZ">Czech Republic</option>
                                                        <option value="DK">Denmark</option>
                                                        <option value="DJ">Djibouti</option>
                                                        <option value="DM">Dominica</option>
                                                        <option value="DO">Dominican Republic</option>
                                                        <option value="EC">Ecuador</option>
                                                        <option value="EG">Egypt</option>
                                                        <option value="SV">El Salvador</option>
                                                        <option value="GQ">Equatorial Guinea</option>
                                                        <option value="ER">Eritrea</option>
                                                        <option value="EE">Estonia</option>
                                                        <option value="ET">Ethiopia</option>
                                                        <option value="FK">Falkland Islands</option>
                                                        <option value="FO">Faroe Islands</option>
                                                        <option value="FJ">Fiji</option>
                                                        <option value="FI">Finland</option>
                                                        <option value="FR">France</option>
                                                        <option value="GF">French Guiana</option>
                                                        <option value="PF">French Polynesia</option>
                                                        <option value="TF">French Southern Territories</option>
                                                        <option value="GA">Gabon</option>
                                                        <option value="GM">Gambia</option>
                                                        <option value="GE">Georgia</option>
                                                        <option value="DE">Germany</option>
                                                        <option value="GH">Ghana</option>
                                                        <option value="GI">Gibraltar</option>
                                                        <option value="GR">Greece</option>
                                                        <option value="GL">Greenland</option>
                                                        <option value="GD">Grenada</option>
                                                        <option value="GP">Guadeloupe</option>
                                                        <option value="GU">Guam</option>
                                                        <option value="GT">Guatemala</option>
                                                        <option value="GG">Guernsey</option>
                                                        <option value="GN">Guinea</option>
                                                        <option value="GW">Guinea-Bissau</option>
                                                        <option value="GY">Guyana</option>
                                                        <option value="HT">Haiti</option>
                                                        <option value="HM">Heard &amp; McDonald Islands</option>
                                                        <option value="HN">Honduras</option>
                                                        <option value="HK">Hong Kong SAR China</option>
                                                        <option value="HU">Hungary</option>
                                                        <option value="IS">Iceland</option>
                                                        <option value="IN">India</option>
                                                        <option value="ID">Indonesia</option>
                                                        <option value="IR">Iran</option>
                                                        <option value="IQ">Iraq</option>
                                                        <option value="IE">Ireland</option>
                                                        <option value="IM">Isle of Man</option>
                                                        <option value="IL">Israel</option>
                                                        <option value="IT">Italy</option>
                                                        <option value="JM">Jamaica</option>
                                                        <option value="JP">Japan</option>
                                                        <option value="JE">Jersey</option>
                                                        <option value="JO">Jordan</option>
                                                        <option value="KZ">Kazakhstan</option>
                                                        <option value="KE">Kenya</option>
                                                        <option value="KI">Kiribati</option>
                                                        <option value="KW">Kuwait</option>
                                                        <option value="KG">Kyrgyzstan</option>
                                                        <option value="LA">Laos</option>
                                                        <option value="LV">Latvia</option>
                                                        <option value="LB">Lebanon</option>
                                                        <option value="LS">Lesotho</option>
                                                        <option value="LR">Liberia</option>
                                                        <option value="LY">Libya</option>
                                                        <option value="LI">Liechtenstein</option>
                                                        <option value="LT">Lithuania</option>
                                                        <option value="LU">Luxembourg</option>
                                                        <option value="MO">Macau SAR China</option>
                                                        <option value="MK">Macedonia</option>
                                                        <option value="MG">Madagascar</option>
                                                        <option value="MW">Malawi</option>
                                                        <option value="MY">Malaysia</option>
                                                        <option value="MV">Maldives</option>
                                                        <option value="ML">Mali</option>
                                                        <option value="MT">Malta</option>
                                                        <option value="MH">Marshall Islands</option>
                                                        <option value="MQ">Martinique</option>
                                                        <option value="MR">Mauritania</option>
                                                        <option value="MU">Mauritius</option>
                                                        <option value="YT">Mayotte</option>
                                                        <option value="MX">Mexico</option>
                                                        <option value="FM">Micronesia</option>
                                                        <option value="MD">Moldova</option>
                                                        <option value="MC">Monaco</option>
                                                        <option value="MN">Mongolia</option>
                                                        <option value="ME">Montenegro</option>
                                                        <option value="MS">Montserrat</option>
                                                        <option value="MA">Morocco</option>
                                                        <option value="MZ">Mozambique</option>
                                                        <option value="MM">Myanmar (Burma)</option>
                                                        <option value="NA">Namibia</option>
                                                        <option value="NR">Nauru</option>
                                                        <option value="NP">Nepal</option>
                                                        <option value="NL">Netherlands</option>
                                                        <option value="AN">Netherlands Antilles</option>
                                                        <option value="NC">New Caledonia</option>
                                                        <option value="NZ">New Zealand</option>
                                                        <option value="NI">Nicaragua</option>
                                                        <option value="NE">Niger</option>
                                                        <option value="NG">Nigeria</option>
                                                        <option value="NU">Niue</option>
                                                        <option value="NF">Norfolk Island</option>
                                                        <option value="MP">Northern Mariana Islands</option>
                                                        <option value="KP">North Korea</option>
                                                        <option value="NO">Norway</option>
                                                        <option value="OM">Oman</option>
                                                        <option value="PK">Pakistan</option>
                                                        <option value="PW">Palau</option>
                                                        <option value="PS">Palestinian Territories</option>
                                                        <option value="PA">Panama</option>
                                                        <option value="PG">Papua New Guinea</option>
                                                        <option value="PY">Paraguay</option>
                                                        <option value="PE">Peru</option>
                                                        <option value="PH">Philippines</option>
                                                        <option value="PN">Pitcairn Islands</option>
                                                        <option value="PL">Poland</option>
                                                        <option value="PT">Portugal</option>
                                                        <option value="PR">Puerto Rico</option>
                                                        <option value="QA">Qatar</option>
                                                        <option value="RE">Réunion</option>
                                                        <option value="RO">Romania</option>
                                                        <option value="RU">Russia</option>
                                                        <option value="RW">Rwanda</option>
                                                        <option value="BL">Saint Barthélemy</option>
                                                        <option value="SH">Saint Helena</option>
                                                        <option value="KN">Saint Kitts and Nevis</option>
                                                        <option value="LC">Saint Lucia</option>
                                                        <option value="MF">Saint Martin</option>
                                                        <option value="PM">Saint Pierre and Miquelon</option>
                                                        <option value="WS">Samoa</option>
                                                        <option value="SM">San Marino</option>
                                                        <option value="ST">São Tomé and Príncipe</option>
                                                        <option value="SA">Saudi Arabia</option>
                                                        <option value="SN">Senegal</option>
                                                        <option value="RS">Serbia</option>
                                                        <option value="SC">Seychelles</option>
                                                        <option value="SL">Sierra Leone</option>
                                                        <option value="SG">Singapore</option>
                                                        <option value="SK">Slovakia</option>
                                                        <option value="SI">Slovenia</option>
                                                        <option value="SB">Solomon Islands</option>
                                                        <option value="SO">Somalia</option>
                                                        <option value="ZA">South Africa</option>
                                                        <option value="GS">South Georgia &amp; South Sandwich Islands</option>
                                                        <option value="KR">South Korea</option>
                                                        <option value="ES">Spain</option>
                                                        <option value="LK">Sri Lanka</option>
                                                        <option value="VC">St. Vincent &amp; Grenadines</option>
                                                        <option value="SD">Sudan</option>
                                                        <option value="SR">Suriname</option>
                                                        <option value="SJ">Svalbard and Jan Mayen</option>
                                                        <option value="SZ">Swaziland</option>
                                                        <option value="SE">Sweden</option>
                                                        <option value="CH">Switzerland</option>
                                                        <option value="SY">Syria</option>
                                                        <option value="TW">Taiwan</option>
                                                        <option value="TJ">Tajikistan</option>
                                                        <option value="TZ">Tanzania</option>
                                                        <option value="TH">Thailand</option>
                                                        <option value="TL">Timor-Leste</option>
                                                        <option value="TG">Togo</option>
                                                        <option value="TK">Tokelau</option>
                                                        <option value="TO">Tonga</option>
                                                        <option value="TT">Trinidad and Tobago</option>
                                                        <option value="TN">Tunisia</option>
                                                        <option value="TR">Turkey</option>
                                                        <option value="TM">Turkmenistan</option>
                                                        <option value="TC">Turks and Caicos Islands</option>
                                                        <option value="TV">Tuvalu</option>
                                                        <option value="UG">Uganda</option>
                                                        <option value="UA">Ukraine</option>
                                                        <option value="AE">United Arab Emirates</option>
                                                        <option value="GB">United Kingdom</option>
                                                        <option value="US" selected="selected">United States</option>
                                                        <option value="UY">Uruguay</option>
                                                        <option value="UM">U.S. Outlying Islands</option>
                                                        <option value="VI">U.S. Virgin Islands</option>
                                                        <option value="UZ">Uzbekistan</option>
                                                        <option value="VU">Vanuatu</option>
                                                        <option value="VA">Vatican City</option>
                                                        <option value="VE">Venezuela</option>
                                                        <option value="VN">Vietnam</option>
                                                        <option value="WF">Wallis and Futuna</option>
                                                        <option value="EH">Western Sahara</option>
                                                        <option value="YE">Yemen</option>
                                                        <option value="ZM">Zambia</option>
                                                        <option value="ZW">Zimbabwe</option>
                                                    </select>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-sm-4 col-md-4">
                                            <div class="lable">State/Province</div>
                                            <div class="size State">
                                                <div class="select-option">
                                                    <select name="State">
                                                        <option value="">Please select region, state or province</option>
                                                        <option value="1">Alabama</option>
                                                        <option value="2">Alaska</option>
                                                        <option value="3">American Samoa</option>
                                                        <option value="4">Arizona</option>
                                                        <option value="5">Arkansas</option>
                                                        <option value="6">Armed Forces Africa</option>
                                                        <option value="7">Armed Forces Americas</option>
                                                        <option value="8">Armed Forces Canada</option>
                                                        <option value="9">Armed Forces Europe</option>
                                                        <option value="10">Armed Forces Middle East</option>
                                                        <option value="11">Armed Forces Pacific</option>
                                                        <option value="12">California</option>
                                                        <option value="13">Colorado</option>
                                                        <option value="14">Connecticut</option>
                                                        <option value="15">Delaware</option>
                                                        <option value="16">District of Columbia</option>
                                                        <option value="17">Federated States Of Micronesia</option>
                                                        <option value="18">Florida</option>
                                                        <option value="19">Georgia</option>
                                                        <option value="20">Guam</option>
                                                        <option value="21">Hawaii</option>
                                                        <option value="22">Idaho</option>
                                                        <option value="23">Illinois</option>
                                                        <option value="24">Indiana</option>
                                                        <option value="25">Iowa</option>
                                                        <option value="26">Kansas</option>
                                                        <option value="27">Kentucky</option>
                                                        <option value="28">Louisiana</option>
                                                        <option value="29">Maine</option>
                                                        <option value="30">Marshall Islands</option>
                                                        <option value="31">Maryland</option>
                                                        <option value="32">Massachusetts</option>
                                                        <option value="33">Michigan</option>
                                                        <option value="34">Minnesota</option>
                                                        <option value="35">Mississippi</option>
                                                        <option value="36">Missouri</option>
                                                        <option value="37">Montana</option>
                                                        <option value="38">Nebraska</option>
                                                        <option value="39">Nevada</option>
                                                        <option value="40">New Hampshire</option>
                                                        <option value="41">New Jersey</option>
                                                        <option value="42">New Mexico</option>
                                                        <option value="43">New York</option>
                                                        <option value="44">North Carolina</option>
                                                        <option value="45">North Dakota</option>
                                                        <option value="46">Northern Mariana Islands</option>
                                                        <option value="47">Ohio</option>
                                                        <option value="48">Oklahoma</option>
                                                        <option value="49">Oregon</option>
                                                        <option value="50">Palau</option>
                                                        <option value="51">Pennsylvania</option>
                                                        <option value="52">Puerto Rico</option>
                                                        <option value="53">Rhode Island</option>
                                                        <option value="54">South Carolina</option>
                                                        <option value="55">South Dakota</option>
                                                        <option value="56">Tennessee</option>
                                                        <option value="57">Texas</option>
                                                        <option value="58">Utah</option>
                                                        <option value="59">Vermont</option>
                                                        <option value="60">Virgin Islands</option>
                                                        <option value="61">Virginia</option>
                                                        <option value="62">Washington</option>
                                                        <option value="63">West Virginia</option>
                                                        <option value="64">Wisconsin</option>
                                                        <option value="65">Wyoming</option>
                                                    </select>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-sm-4 col-md-4">
                                            <div class="lable">City</div>
                                            <input name="City" placeholder="City" type="text">
                                        </div>
                                        <div class="col-sm-4 col-md-4">
                                            <div class="lable">Telephone</div>
                                            <input name="Telephone" placeholder="Telephone" type="text">
                                        </div>
                                        <div class="col-sm-4 col-md-4">
                                            <div class="lable">Fax</div>
                                            <input name="Fax" placeholder="Fax" type="text">
                                        </div>
                                        <div class="col-sm-4 col-md-4">
                                            <div class="lable">Zip/Postal Code</div>
                                            <input name="Zip" placeholder="Zip/Postal Code" type="text">
                                        </div>
                                        <div class="col-sm-12 col-md-12">
                                            <input name="use_for_shipping" value="" class="radio" type="radio">
                                            <label class="label-radio">Ship to this address</label>
                                            <input name="use_for_shipping" value="" class="radio" type="radio">
                                            <label class="label-radio">Ship to different address</label>
                                        </div>
                                        <div class="col-sm-4 col-md-4">
                                            <a href="#" class="button2">Continue</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h4 class="panel-title">
                                <a data-toggle="collapse" data-parent="#accordion" href="#collapse3">03 Shipping Information</a>
                            </h4>
                        </div>
                        <div id="collapse3" class="panel-collapse collapse">
                            <div class="panel-body">
                                <div class="shipping-outer">
                                    <div class="col-sm-4 col-md-4">
                                        <div class="row">
                                            <div class="col-md-12 counttry">
                                                <div class="lable">First Name</div>
                                                <input name="First Name" placeholder="First Name" type="text">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-sm-4 col-md-4">
                                        <div class="col-md-12 counttry">
                                            <div class="lable">Last Name</div>
                                            <input name="Last Name" placeholder="Last Name" type="text">
                                        </div>
                                    </div>
                                    <div class="col-sm-4 col-md-4">
                                        <div class="col-md-12 counttry">
                                            <div class="lable">Company</div>
                                            <input name="Company" placeholder="Company" type="text">
                                        </div>
                                    </div>
                                    <div class="col-sm-12 col-md-12">
                                        <div class="lable">Email</div>
                                        <input name="Email" placeholder="Email" type="email">
                                    </div>
                                    <div class="col-sm-12 col-md-12">
                                        <div class="lable">Address</div>
                                        <input name="Address" placeholder="Address" type="text">
                                    </div>
                                    <div class="col-sm-12 col-md-12">
                                        <div class="lable">Street Address 2</div>
                                        <input name="Address2" placeholder="Address2" type="text">
                                    </div>
                                    <div class="col-sm-4 col-md-4">
                                        <div class="lable">Country</div>
                                        <div class="size State">
                                            <div class="select-option">
                                                <select>
                                                    <option value="AF">Afghanistan</option>
                                                    <option value="AX">Åland Islands</option>
                                                    <option value="AL">Albania</option>
                                                    <option value="DZ">Algeria</option>
                                                    <option value="AS">American Samoa</option>
                                                    <option value="AD">Andorra</option>
                                                    <option value="AO">Angola</option>
                                                    <option value="AI">Anguilla</option>
                                                    <option value="AQ">Antarctica</option>
                                                    <option value="AG">Antigua and Barbuda</option>
                                                    <option value="AR">Argentina</option>
                                                    <option value="AM">Armenia</option>
                                                    <option value="AW">Aruba</option>
                                                    <option value="AU">Australia</option>
                                                    <option value="AT">Austria</option>
                                                    <option value="AZ">Azerbaijan</option>
                                                    <option value="BS">Bahamas</option>
                                                    <option value="BH">Bahrain</option>
                                                    <option value="BD">Bangladesh</option>
                                                    <option value="BB">Barbados</option>
                                                    <option value="BY">Belarus</option>
                                                    <option value="BE">Belgium</option>
                                                    <option value="BZ">Belize</option>
                                                    <option value="BJ">Benin</option>
                                                    <option value="BM">Bermuda</option>
                                                    <option value="BT">Bhutan</option>
                                                    <option value="BO">Bolivia</option>
                                                    <option value="BA">Bosnia and Herzegovina</option>
                                                    <option value="BW">Botswana</option>
                                                    <option value="BV">Bouvet Island</option>
                                                    <option value="BR">Brazil</option>
                                                    <option value="IO">British Indian Ocean Territory</option>
                                                    <option value="VG">British Virgin Islands</option>
                                                    <option value="BN">Brunei</option>
                                                    <option value="BG">Bulgaria</option>
                                                    <option value="BF">Burkina Faso</option>
                                                    <option value="BI">Burundi</option>
                                                    <option value="KH">Cambodia</option>
                                                    <option value="CM">Cameroon</option>
                                                    <option value="CA">Canada</option>
                                                    <option value="CV">Cape Verde</option>
                                                    <option value="KY">Cayman Islands</option>
                                                    <option value="CF">Central African Republic</option>
                                                    <option value="TD">Chad</option>
                                                    <option value="CL">Chile</option>
                                                    <option value="CN">China</option>
                                                    <option value="CX">Christmas Island</option>
                                                    <option value="CC">Cocos (Keeling) Islands</option>
                                                    <option value="CO">Colombia</option>
                                                    <option value="KM">Comoros</option>
                                                    <option value="CG">Congo - Brazzaville</option>
                                                    <option value="CD">Congo - Kinshasa</option>
                                                    <option value="CK">Cook Islands</option>
                                                    <option value="CR">Costa Rica</option>
                                                    <option value="CI">Côte d’Ivoire</option>
                                                    <option value="HR">Croatia</option>
                                                    <option value="CU">Cuba</option>
                                                    <option value="CY">Cyprus</option>
                                                    <option value="CZ">Czech Republic</option>
                                                    <option value="DK">Denmark</option>
                                                    <option value="DJ">Djibouti</option>
                                                    <option value="DM">Dominica</option>
                                                    <option value="DO">Dominican Republic</option>
                                                    <option value="EC">Ecuador</option>
                                                    <option value="EG">Egypt</option>
                                                    <option value="SV">El Salvador</option>
                                                    <option value="GQ">Equatorial Guinea</option>
                                                    <option value="ER">Eritrea</option>
                                                    <option value="EE">Estonia</option>
                                                    <option value="ET">Ethiopia</option>
                                                    <option value="FK">Falkland Islands</option>
                                                    <option value="FO">Faroe Islands</option>
                                                    <option value="FJ">Fiji</option>
                                                    <option value="FI">Finland</option>
                                                    <option value="FR">France</option>
                                                    <option value="GF">French Guiana</option>
                                                    <option value="PF">French Polynesia</option>
                                                    <option value="TF">French Southern Territories</option>
                                                    <option value="GA">Gabon</option>
                                                    <option value="GM">Gambia</option>
                                                    <option value="GE">Georgia</option>
                                                    <option value="DE">Germany</option>
                                                    <option value="GH">Ghana</option>
                                                    <option value="GI">Gibraltar</option>
                                                    <option value="GR">Greece</option>
                                                    <option value="GL">Greenland</option>
                                                    <option value="GD">Grenada</option>
                                                    <option value="GP">Guadeloupe</option>
                                                    <option value="GU">Guam</option>
                                                    <option value="GT">Guatemala</option>
                                                    <option value="GG">Guernsey</option>
                                                    <option value="GN">Guinea</option>
                                                    <option value="GW">Guinea-Bissau</option>
                                                    <option value="GY">Guyana</option>
                                                    <option value="HT">Haiti</option>
                                                    <option value="HM">Heard &amp; McDonald Islands</option>
                                                    <option value="HN">Honduras</option>
                                                    <option value="HK">Hong Kong SAR China</option>
                                                    <option value="HU">Hungary</option>
                                                    <option value="IS">Iceland</option>
                                                    <option value="IN">India</option>
                                                    <option value="ID">Indonesia</option>
                                                    <option value="IR">Iran</option>
                                                    <option value="IQ">Iraq</option>
                                                    <option value="IE">Ireland</option>
                                                    <option value="IM">Isle of Man</option>
                                                    <option value="IL">Israel</option>
                                                    <option value="IT">Italy</option>
                                                    <option value="JM">Jamaica</option>
                                                    <option value="JP">Japan</option>
                                                    <option value="JE">Jersey</option>
                                                    <option value="JO">Jordan</option>
                                                    <option value="KZ">Kazakhstan</option>
                                                    <option value="KE">Kenya</option>
                                                    <option value="KI">Kiribati</option>
                                                    <option value="KW">Kuwait</option>
                                                    <option value="KG">Kyrgyzstan</option>
                                                    <option value="LA">Laos</option>
                                                    <option value="LV">Latvia</option>
                                                    <option value="LB">Lebanon</option>
                                                    <option value="LS">Lesotho</option>
                                                    <option value="LR">Liberia</option>
                                                    <option value="LY">Libya</option>
                                                    <option value="LI">Liechtenstein</option>
                                                    <option value="LT">Lithuania</option>
                                                    <option value="LU">Luxembourg</option>
                                                    <option value="MO">Macau SAR China</option>
                                                    <option value="MK">Macedonia</option>
                                                    <option value="MG">Madagascar</option>
                                                    <option value="MW">Malawi</option>
                                                    <option value="MY">Malaysia</option>
                                                    <option value="MV">Maldives</option>
                                                    <option value="ML">Mali</option>
                                                    <option value="MT">Malta</option>
                                                    <option value="MH">Marshall Islands</option>
                                                    <option value="MQ">Martinique</option>
                                                    <option value="MR">Mauritania</option>
                                                    <option value="MU">Mauritius</option>
                                                    <option value="YT">Mayotte</option>
                                                    <option value="MX">Mexico</option>
                                                    <option value="FM">Micronesia</option>
                                                    <option value="MD">Moldova</option>
                                                    <option value="MC">Monaco</option>
                                                    <option value="MN">Mongolia</option>
                                                    <option value="ME">Montenegro</option>
                                                    <option value="MS">Montserrat</option>
                                                    <option value="MA">Morocco</option>
                                                    <option value="MZ">Mozambique</option>
                                                    <option value="MM">Myanmar (Burma)</option>
                                                    <option value="NA">Namibia</option>
                                                    <option value="NR">Nauru</option>
                                                    <option value="NP">Nepal</option>
                                                    <option value="NL">Netherlands</option>
                                                    <option value="AN">Netherlands Antilles</option>
                                                    <option value="NC">New Caledonia</option>
                                                    <option value="NZ">New Zealand</option>
                                                    <option value="NI">Nicaragua</option>
                                                    <option value="NE">Niger</option>
                                                    <option value="NG">Nigeria</option>
                                                    <option value="NU">Niue</option>
                                                    <option value="NF">Norfolk Island</option>
                                                    <option value="MP">Northern Mariana Islands</option>
                                                    <option value="KP">North Korea</option>
                                                    <option value="NO">Norway</option>
                                                    <option value="OM">Oman</option>
                                                    <option value="PK">Pakistan</option>
                                                    <option value="PW">Palau</option>
                                                    <option value="PS">Palestinian Territories</option>
                                                    <option value="PA">Panama</option>
                                                    <option value="PG">Papua New Guinea</option>
                                                    <option value="PY">Paraguay</option>
                                                    <option value="PE">Peru</option>
                                                    <option value="PH">Philippines</option>
                                                    <option value="PN">Pitcairn Islands</option>
                                                    <option value="PL">Poland</option>
                                                    <option value="PT">Portugal</option>
                                                    <option value="PR">Puerto Rico</option>
                                                    <option value="QA">Qatar</option>
                                                    <option value="RE">Réunion</option>
                                                    <option value="RO">Romania</option>
                                                    <option value="RU">Russia</option>
                                                    <option value="RW">Rwanda</option>
                                                    <option value="BL">Saint Barthélemy</option>
                                                    <option value="SH">Saint Helena</option>
                                                    <option value="KN">Saint Kitts and Nevis</option>
                                                    <option value="LC">Saint Lucia</option>
                                                    <option value="MF">Saint Martin</option>
                                                    <option value="PM">Saint Pierre and Miquelon</option>
                                                    <option value="WS">Samoa</option>
                                                    <option value="SM">San Marino</option>
                                                    <option value="ST">São Tomé and Príncipe</option>
                                                    <option value="SA">Saudi Arabia</option>
                                                    <option value="SN">Senegal</option>
                                                    <option value="RS">Serbia</option>
                                                    <option value="SC">Seychelles</option>
                                                    <option value="SL">Sierra Leone</option>
                                                    <option value="SG">Singapore</option>
                                                    <option value="SK">Slovakia</option>
                                                    <option value="SI">Slovenia</option>
                                                    <option value="SB">Solomon Islands</option>
                                                    <option value="SO">Somalia</option>
                                                    <option value="ZA">South Africa</option>
                                                    <option value="GS">South Georgia &amp; South Sandwich Islands</option>
                                                    <option value="KR">South Korea</option>
                                                    <option value="ES">Spain</option>
                                                    <option value="LK">Sri Lanka</option>
                                                    <option value="VC">St. Vincent &amp; Grenadines</option>
                                                    <option value="SD">Sudan</option>
                                                    <option value="SR">Suriname</option>
                                                    <option value="SJ">Svalbard and Jan Mayen</option>
                                                    <option value="SZ">Swaziland</option>
                                                    <option value="SE">Sweden</option>
                                                    <option value="CH">Switzerland</option>
                                                    <option value="SY">Syria</option>
                                                    <option value="TW">Taiwan</option>
                                                    <option value="TJ">Tajikistan</option>
                                                    <option value="TZ">Tanzania</option>
                                                    <option value="TH">Thailand</option>
                                                    <option value="TL">Timor-Leste</option>
                                                    <option value="TG">Togo</option>
                                                    <option value="TK">Tokelau</option>
                                                    <option value="TO">Tonga</option>
                                                    <option value="TT">Trinidad and Tobago</option>
                                                    <option value="TN">Tunisia</option>
                                                    <option value="TR">Turkey</option>
                                                    <option value="TM">Turkmenistan</option>
                                                    <option value="TC">Turks and Caicos Islands</option>
                                                    <option value="TV">Tuvalu</option>
                                                    <option value="UG">Uganda</option>
                                                    <option value="UA">Ukraine</option>
                                                    <option value="AE">United Arab Emirates</option>
                                                    <option value="GB">United Kingdom</option>
                                                    <option value="US" selected="selected">United States</option>
                                                    <option value="UY">Uruguay</option>
                                                    <option value="UM">U.S. Outlying Islands</option>
                                                    <option value="VI">U.S. Virgin Islands</option>
                                                    <option value="UZ">Uzbekistan</option>
                                                    <option value="VU">Vanuatu</option>
                                                    <option value="VA">Vatican City</option>
                                                    <option value="VE">Venezuela</option>
                                                    <option value="VN">Vietnam</option>
                                                    <option value="WF">Wallis and Futuna</option>
                                                    <option value="EH">Western Sahara</option>
                                                    <option value="YE">Yemen</option>
                                                    <option value="ZM">Zambia</option>
                                                    <option value="ZW">Zimbabwe</option>
                                                </select>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-sm-4 col-md-4">
                                        <div class="lable">State/Province</div>
                                        <div class="size State">
                                            <div class="select-option">
                                                <select name="State">
                                                    <option value="">Please select region, state or province</option>
                                                    <option value="1">Alabama</option>
                                                    <option value="2">Alaska</option>
                                                    <option value="3">American Samoa</option>
                                                    <option value="4">Arizona</option>
                                                    <option value="5">Arkansas</option>
                                                    <option value="6">Armed Forces Africa</option>
                                                    <option value="7">Armed Forces Americas</option>
                                                    <option value="8">Armed Forces Canada</option>
                                                    <option value="9">Armed Forces Europe</option>
                                                    <option value="10">Armed Forces Middle East</option>
                                                    <option value="11">Armed Forces Pacific</option>
                                                    <option value="12">California</option>
                                                    <option value="13">Colorado</option>
                                                    <option value="14">Connecticut</option>
                                                    <option value="15">Delaware</option>
                                                    <option value="16">District of Columbia</option>
                                                    <option value="17">Federated States Of Micronesia</option>
                                                    <option value="18">Florida</option>
                                                    <option value="19">Georgia</option>
                                                    <option value="20">Guam</option>
                                                    <option value="21">Hawaii</option>
                                                    <option value="22">Idaho</option>
                                                    <option value="23">Illinois</option>
                                                    <option value="24">Indiana</option>
                                                    <option value="25">Iowa</option>
                                                    <option value="26">Kansas</option>
                                                    <option value="27">Kentucky</option>
                                                    <option value="28">Louisiana</option>
                                                    <option value="29">Maine</option>
                                                    <option value="30">Marshall Islands</option>
                                                    <option value="31">Maryland</option>
                                                    <option value="32">Massachusetts</option>
                                                    <option value="33">Michigan</option>
                                                    <option value="34">Minnesota</option>
                                                    <option value="35">Mississippi</option>
                                                    <option value="36">Missouri</option>
                                                    <option value="37">Montana</option>
                                                    <option value="38">Nebraska</option>
                                                    <option value="39">Nevada</option>
                                                    <option value="40">New Hampshire</option>
                                                    <option value="41">New Jersey</option>
                                                    <option value="42">New Mexico</option>
                                                    <option value="43">New York</option>
                                                    <option value="44">North Carolina</option>
                                                    <option value="45">North Dakota</option>
                                                    <option value="46">Northern Mariana Islands</option>
                                                    <option value="47">Ohio</option>
                                                    <option value="48">Oklahoma</option>
                                                    <option value="49">Oregon</option>
                                                    <option value="50">Palau</option>
                                                    <option value="51">Pennsylvania</option>
                                                    <option value="52">Puerto Rico</option>
                                                    <option value="53">Rhode Island</option>
                                                    <option value="54">South Carolina</option>
                                                    <option value="55">South Dakota</option>
                                                    <option value="56">Tennessee</option>
                                                    <option value="57">Texas</option>
                                                    <option value="58">Utah</option>
                                                    <option value="59">Vermont</option>
                                                    <option value="60">Virgin Islands</option>
                                                    <option value="61">Virginia</option>
                                                    <option value="62">Washington</option>
                                                    <option value="63">West Virginia</option>
                                                    <option value="64">Wisconsin</option>
                                                    <option value="65">Wyoming</option>
                                                </select>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-sm-4 col-md-4">
                                        <div class="lable">City</div>
                                        <input name="City" placeholder="City" type="text">
                                    </div>
                                    <div class="col-sm-4 col-md-4">
                                        <div class="lable">Telephone</div>
                                        <input name="Telephone" placeholder="Telephone" type="text">
                                    </div>
                                    <div class="col-sm-4 col-md-4">
                                        <div class="lable">Fax</div>
                                        <input name="Fax" placeholder="Fax" type="text">
                                    </div>
                                    <div class="col-sm-4 col-md-4">
                                        <div class="lable">Zip/Postal Code</div>
                                        <input name="Zip" placeholder="Zip/Postal Code" type="text">
                                    </div>
                                    <div class="col-sm-12 col-md-12">
                                        <input name="use_for_shipping" value="" class="radio" type="radio">
                                        <label class="label-radio">Ship to this address</label>
                                        <input name="use_for_shipping" value="" class="radio" type="radio">
                                        <label class="label-radio">Ship to different address</label>
                                    </div>
                                    <div class="col-sm-4 col-md-4">
                                        <a href="#" class="button2">Continue</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h4 class="panel-title">
                            <a data-toggle="collapse" data-parent="#accordion" href="#collapse4">04 Shipping Method</a>
                        </h4>
                    </div>
                    <div id="collapse4" class="panel-collapse collapse">
                        <div class="panel-body">
                            <p>Fixed <span>$5.00</span></p>
                        </div>
                    </div>
                </div>
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h4 class="panel-title">
                            <a data-toggle="collapse" data-parent="#accordion" href="#collapse5">05 Payment Information</a>
                        </h4>
                    </div>
                    <div id="collapse5" class="panel-collapse collapse">
                        <div class="panel-body">
                            <div class="shipping-outer">
                                <div class="col-sm-12 col-md-12">
                                    <input name="use_for_shipping" value="" class="radio" type="radio">
                                    <label class="label-radio">Credit Card (saved) </label>
                                </div>
                                <div class="col-sm-12 col-md-12">
                                    <input name="use_for_shipping" value="" class="radio" type="radio">
                                    <label class="label-radio">Check / Money order </label>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h4 class="panel-title">
                            <a data-toggle="collapse" data-parent="#accordion" href="#collapse6">06 Order Review</a>
                        </h4>
                    </div>
                    <div id="collapse6" class="panel-collapse collapse">
                        <div class="panel-body">
                            <div id="checkout-step-review" class="step a-item" style="">
                                <div class="order-review" id="checkout-review-load">
                                    <div id="checkout-review-table-wrapper">
                                        <table class="data-table linearize-table checkout-review-table" id="checkout-review-table">
                                            <thead>
                                            <tr class="first last">
                                                <th rowspan="1">Product</th>
                                                <th colspan="1" class="a-center">Price</th>
                                                <th rowspan="1" class="a-center">Qty</th>
                                                <th colspan="1" class="a-center">Subtotal</th>
                                            </tr>
                                            </thead>
                                            <tbody><tr class="first">
                                                <td style="" class="a-right" colspan="3">
                                                    Subtotal
                                                </td>
                                                <td style="" class="a-right last">
                                                    <span class="price">$989.00</span>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="" class="a-right" colspan="3">
                                                    Shipping &amp; Handling (Flat Rate - Fixed)
                                                </td>
                                                <td style="" class="a-right last">
                                                    <span class="price">$5.00</span>
                                                </td>
                                            </tr>
                                            <tr class="last">
                                                <td style="" class="a-right" colspan="3">
                                                    <strong>Grand Total</strong>
                                                </td>
                                                <td style="" class="a-right last">
                                                    <strong><span class="price">$994.00</span></strong>
                                                </td>
                                            </tr>
                                            <tr class="first last odd">
                                                <td>
                                                    <h3 class="product-name">Outsunny 9-Piece Outdoor PE Rattan Wicker </h3>
                                                    <dl class="item-options">
                                                        <dt>Color</dt>
                                                        <dd>black</dd>
                                                        <dt>Size</dt>
                                                        <dd>47L x 104W x 33.5H</dd>
                                                        <dt>Bounce</dt>
                                                        <dd>Water &amp; UV Resistant</dd>
                                                        <dt>Material</dt>
                                                        <dd>Rattan</dd>
                                                    </dl>
                                                </td>
                                                <td class="a-right" data-rwd-label="Price">
                                             <span class="cart-price">
                                             <span class="price">$989.00</span>
                                             </span>
                                                </td>
                                                <td class="a-center" data-rwd-label="Qty">1</td>
                                                <%-- sub total starts here --%>
                                                <td class="a-right last" data-rwd-label="Subtotal">
                                             <span class="cart-price">
                                             <span class="price">$989.00</span>
                                             </span>
                                                </td>
                                            </tr>
                                            </tbody></table>
                                    </div>
                                    <div id="checkout-review-submit">
                                        <div class="buttons-set" id="review-buttons-container">
                                            <button type="submit" title="Place Order" class="button btn-checkout">Place Order</button>
                                            <p class="f-left">Forgot an Item? <a href="#">Edit Your Cart</a></p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </div>
    <%-- /.shopping-cart --%>
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

