<%@ page import="entity.Members" %>
<%@ page import="java.util.List" %>
<%@ page import="dao.mall.ClassificationDAO" %>
<%@ page import="entity.Classification" %>
<%@ page import="javax.swing.plaf.synth.SynthOptionPaneUI" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zh">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>瞎买瞎卖</title>
    <%-- Latest Bootstrap min CSS --%>
    <%--引导程序.小.CSS--%>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/mall/assets/css/bootstrap.min.css" type="text/css">
    <%-- Dropdownhover CSS --%>
    <%--下拉悬停CSS--%>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/mall/assets/css/bootstrap-dropdownhover.min.css" type="text/css">
    <%-- latest fonts awesome --%>
    <%--最新的字体--%>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/mall/assets/font/css/font-awesome.min.css" type="text/css">
    <%-- simple line fonts awesome --%>
    <%--简单的线条字体--%>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/mall/assets/simple-line-icon/css/simple-line-icons.css" type="text/css">
    <%-- stroke-gap-icons --%>
    <%--敲击图标--%>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/mall/assets/stroke-gap-icons/stroke-gap-icons.css" type="text/css">
    <%-- Animate CSS --%>
    <%--动画CSS--%>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/mall/assets/css/animate.min.css" type="text/css">
    <%-- Style CSS --%>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/mall/assets/css/style.css" type="text/css">
    <%--  baguetteBox --%>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/mall/assets/css/baguetteBox.css">
    <%-- Owl Carousel Assets --%>
    <link href="${pageContext.request.contextPath}/mall/assets/owl-carousel/owl.carousel.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/mall/assets/owl-carousel/owl.theme.css" rel="stylesheet">
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
    <div id="loading">

    </div>
</div>
<header>
    <%--  top-header  --%>
    <%--顶部栏--%>
    <div class="top-header">
        <div class="container">

            <div class="col-md-6">
                <div class="top-header-left">
                    <ul>
                        <li>
                            <span>
                                <%
                                    Members members;
                                    String name;
                                    String href;
                                    if (request.getSession().getAttribute("Members")!=null){
                                        members= (Members) request.getSession().getAttribute("Members");
                                        name=members.getEmail();
                                        href=request.getContextPath()+"/mall/home.jsp";
                                        out.println("你好!"+
                                                "<a href=\""+href+"\">"+name+"</a>");
                                    }else {
                                        out.println("你好!请-" +
                                                "<a href=\""+request.getContextPath()+"/mall/login.jsp\">登陆</a>" +
                                                "or" +
                                                "<a href=\""+request.getContextPath()+"/mall/registe.jsp\">注册</a>");
                                    }
                                %>
                            </span>
                        </li>
                    </ul>
                </div>
            </div>
            <div class="col-md-6">
                <div class="top-header-right">
                    <ul>
                        <li><a href="#">我的账户</a></li>
                        <li><i class="icon-note icons" aria-hidden="true"></i><a href="#">我的订单</a></li>
                        <li>
                            <div class="dropdown">
                                <a href="#" class="btn btn-default dropdown-toggle" data-toggle="dropdown" data-hover="dropdown">
                                    <i class="icon-settings icons" aria-hidden="true"></i> 设置
                                </a>
                                <ul class="dropdown-menu">
                                    <li><a href="#">修改密码</a></li>
                                    <li><a href="#">管理我的地址</a></li>
                                </ul>
                            </div>
                        </li>
                        <li><i class="icon-location-pin icons" aria-hidden="true"></i><a href="#">联络我们</a></li>
                    </ul>
                </div>
            </div>
        </div>
        <%--  /top-header  --%>
    </div>
    <%--顶部菜单--%>
    <section class="top-md-menu">
        <div class="container">
            <%--商标、搜索栏、购物车--%>
            <div class="col-sm-3">
                <div class="logo">
                    <h6><img src="${pageContext.request.contextPath}/mall/assets/images/logo.png" alt="logo"/></h6>
                </div>
            </div>
            <div class="col-sm-6">
                <%--查询栏开始--%>
                <form>
                    <div class="well carousel-search hidden-phone">
                        <div class="btn-group">
                            <a class="btn dropdown-toggle btn-select" data-toggle="dropdown" href="#">所有类别
                                <span class="caret"></span></a>
                            <ul class="dropdown-menu">
                                <%
                                    ClassificationDAO classificationDAO =new ClassificationDAO();
                                    List<Classification> primaryclassifications = classificationDAO.getPrimaryClassification();
                                    List<Classification> secondaryClassifications;
                                    for (int i = 0; i < primaryclassifications.size(); i++) {
                                        out.println("<li><a href=\"#\">");
                                        out.println(primaryclassifications.get(i).getClassificationname());
                                        out.println("</a></li>");
                                    }
                                %>
                                <li class="divider"></li>
                                <li><a href="#" hidden="all">全部</a></li>
                            </ul>
                        </div>
                        <div class="search">
                            <input type="text" placeholder="物品名称"/>
                        </div>
                        <div class="btn-group">
                            <button type="button" id="btnSearch" class="btn btn-primary"><i class="fa fa-search"
                                                                                            aria-hidden="true"></i>
                            </button>
                        </div>
                    </div>
                </form>
                <%--查询栏结束--%>
            </div>
            <div class="col-sm-3">
                <%-- 愿望清单与购物车 --%>
                <div class="cart-menu">
                    <ul>
                        <li>
                            <a href="#"><i class="icon-heart icons" aria-hidden="true"></i></a>
                            <span class="subno">1</span>
                            <strong>愿望清单</strong>
                        </li>
                        <li class="dropdown">
                            <a href="#" data-toggle="dropdown" data-hover="dropdown"><i class="icon-basket-loaded icons" aria-hidden="true"></i></a>
                            <span class="subno">2</span><strong>购物车</strong>
                            <div class="dropdown-menu  cart-outer">
                                <%--todo：jsp自适应显示购物车--%>
                                <div class="cart-content">
                                    <div class="col-sm-4 col-md-4"><img src="${pageContext.request.contextPath}/mall/assets/images/elec-img4.jpg" alt="13">
                                    </div>
                                    <div class="col-sm-8 col-md-8">
                                        <div class="pro-text">
                                            <a href="#">Apple Macbook Retina 23’’ </a>
                                            <div class="close">x</div>
                                            <strong>1 × $290.00</strong>
                                        </div>
                                    </div>
                                </div>
                                <div class="cart-content">
                                    <div class="col-sm-4 col-md-4"><img src="${pageContext.request.contextPath}/mall/assets/images/elec-img3.jpg" alt="13">
                                    </div>
                                    <div class="col-sm-8 col-md-8">
                                        <div class="pro-text">
                                            <a href="#">Apple Macbook Retina 23’’ </a>
                                            <div class="close">x</div>
                                            <strong>1 × $290.00</strong>
                                        </div>
                                    </div>
                                </div>
                                <div class="total">
                                    <div class="col-md-6 text-left">
                                        <span>运费 :</span>
                                        <strong>总额 :</strong>
                                    </div>
                                    <div class="col-md-6 text-right">
                                        <strong>$0.00</strong>
                                        <strong>$160.00</strong>
                                    </div>
                                </div>
                                <a href="shopping-cart.jsp" class="cart-btn">查看购物车详情 </a>
                                <a href="checkout.jsp" class="cart-btn">购买</a>
                            </div>
                        </li>
                    </ul>
                </div>
                <%-- 愿望清单与购物车 End --%>
            </div>
            <%--菜单导航栏--%>
            <div class="main-menu">
                <%--  导航  --%>
                <nav class="navbar navbar-inverse navbar-default">
                    <%-- Brand and toggle get grouped for better mobile display --%>
                    <%--品牌和切换被分组以获得更好的移动显示--%>
                    <div class="navbar-header">
                        <button type="button" class="navbar-toggle collapsed" data-toggle="collapse"
                                data-target="#bs-example-navbar-collapse-1">
                            <span class="sr-only">切换导航</span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                        </button>
                    </div>
                    <%-- Collect the nav links, forms, and other content for toggling --%>
                    <%--收集导航链接、表单和其他内容--%>
                    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1" data-hover="dropdown" data-animations=" fadeInLeft fadeInUp fadeInRight">
                        <ul class="nav navbar-nav">
                            <li class="all-departments dropdown">
                                <a href="index.jsp" class="dropdown-toggle" data-toggle="dropdown" role="button"
                                   aria-expanded="false"><span> 商品分类 </span> <i class="fa fa-bars" aria-hidden="true"></i>
                                </a>
                                <ul class="dropdown-menu dropdownhover-bottom all-open" role="menu">
                                    <%--通过数据库查询有哪些类别显示--%>
                                    <%
                                        for (int i = 0; i < primaryclassifications.size(); i++) {
                                            String primaryclassification_grade = primaryclassifications.get(i).getClassificationgrade();
                                            String primaryclassification_name = primaryclassifications.get(i).getClassificationname();
                                            String primaryclassification_src=primaryclassifications.get(i).getClassificationsrc();
                                            String primaryclassification_href;
                                            out.println("<li class=\"dropdown\">\n" +
                                                            "<a href=\"index.jsp\"><img src=\""+request.getContextPath()+"/"+ primaryclassification_src +"\"alt=\"menu-icon"+ primaryclassification_grade +"\"/>\n" + primaryclassification_name
                                            );
                                            if (primaryclassification_grade.equals("10")){
                                                System.out.println("aaa");
                                            }
                                            secondaryClassifications = classificationDAO.getsecondaryClassification(Classification.getSecondaryClassificationmapping(primaryclassification_grade));
                                            if (secondaryClassifications.size()>0){
                                                out.println("<i class=\"fa fa-angle-right\" aria-hidden=\"true\"></i>\n" +
                                                        "</a>");
                                                out.println("<ul class=\"dropdown-menu right\">");
                                                for (int j = 0; j < secondaryClassifications.size(); j++) {
                                                    String secondaryClassification_href="#";
                                                    String secondaryClassification_name=secondaryClassifications.get(j).getClassificationname();
                                                    out.println("<li><a href=\""+secondaryClassification_href+"\">"+secondaryClassification_name+"</a></li>");
                                                }
                                                out.println("</ul>");
                                            }else {
                                                out.println("</a>");
                                            }
                                            out.println("</li>");
                                        }
                                    %>
                                </ul>
                            </li>
                            <li><a href="index.jsp">主页</a></li>
                            <li><a href="list.jsp">列表展示</a></li>
                            <li><a href="grid.jsp">网格展示</a></li>
                            <li><a href="shop-detail.jsp">商品详情</a></li>
                            <li><a href="contact.jsp">联系方式</a></li>
                            <li><a href="shopping-cart.jsp">购物车</a></li>
                            <li><a href="checkout.jsp">付款台</a></li>
                        </ul>
                        <%-- /.navbar-collapse --%>
                    </div>
                </nav>
                <%-- /导航 end --%>
            </div>
        </div>
    </section>
    <%-- header-outer --%>
    <section class="header-outer">
        <%-- header-slider --%>
        <div class="header-slider">
            <div id="home-slider" class="carousel slide carousel-fade" data-ride="carousel">
                <%-- .home-slider --%>
                <div class="carousel-inner">
                    <div class="item active"
                         style="background-image: url(${pageContext.request.contextPath}/mall/assets/images/home-header1.jpg);
                         background-repeat: no-repeat;
                         background-position: top;">
                        <div class="container">
                            <div class="caption">
                                <div class="caption-outer">
                                    <div class="col-xs-12 col-sm-12 col-md-4">
                                    </div>
                                    <div class="col-xs-12 col-sm-6 col-md-6">
                                        <h3>samsung galaxy ON NXT</h3>
                                        <h2 class="animated wow slideInUp" data-wow-delay="0ms"
                                            data-wow-duration="1500ms">New Arrivals</h2>
                                        <h4>Only from $520 </h4>
                                        <p class="animated wow fadeInRight">iPhone 7 dramatically improves the most
                                            important aspects of the iPhone experience.</p>
                                        <a data-scroll class="btn get-start animated fadeInUp" data-wow-delay="0ms"
                                           data-wow-duration="1500ms" href="#">BUY NOW</a>
                                    </div>
                                    <div class="col-xs-12 col-sm-6 col-md-2">
                                        <div class="save-price animated wow slideInUp" data-wow-delay="0ms"
                                             data-wow-duration="1500ms">
                                            <span class="save-text">From</span>
                                            <span class="saveprice-no"><sup>$</sup>520</span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>
                    <div class="item"
                         style="background-image: url(${pageContext.request.contextPath}/mall/assets/images/home-header2.jpg);  background-repeat: no-repeat; background-position: top;">
                        <div class="container">
                            <div class="caption">
                                <div class="caption-outer">
                                    <div class="col-xs-12 col-sm-12 col-md-4">
                                    </div>
                                    <div class="col-xs-12 col-sm-6 col-md-6">
                                        <h3>new collection</h3>
                                        <h2 class="animated wow slideInUp" data-wow-delay="0ms"
                                            data-wow-duration="1500ms">Phantom</h2>
                                        <h4>Only from $920 </h4>
                                        <p class="animated wow fadeInRight">iPhone 7 dramatically improves the most
                                            important aspects of the iPhone experience.</p>
                                        <a data-scroll class="btn get-start animated fadeInUp" data-wow-delay="0ms"
                                           data-wow-duration="1500ms" href="#">BUY NOW</a>
                                    </div>
                                    <div class="col-xs-12 col-sm-6 col-md-2">
                                        <div class="save-price animated wow slideInUp" data-wow-delay="0ms"
                                             data-wow-duration="1500ms">
                                            <span class="save-text">From</span>
                                            <span class="saveprice-no"><sup>$</sup>520</span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="item"
                         style="background-image: url(${pageContext.request.contextPath}/mall/assets/images/home-header3.jpg);  background-repeat: no-repeat; background-position: top;">
                        <div class="container">
                            <div class="caption">
                                <div class="caption-outer">
                                    <div class="col-xs-12 col-sm-12 col-md-4">
                                    </div>
                                    <div class="col-xs-12 col-sm-6 col-md-6">
                                        <h3>Divoom brands</h3>
                                        <h2 class="animated wow slideInUp" data-wow-delay="0ms"
                                            data-wow-duration="1500ms">Voombox 2.0</h2>
                                        <h4>Only from $69 </h4>
                                        <p class="animated wow fadeInRight">iPhone 7 dramatically improves the most
                                            important aspects of the iPhone experience.</p>
                                        <a data-scroll class="btn get-start animated fadeInUp" data-wow-delay="0ms"
                                           data-wow-duration="1500ms" href="#">BUY NOW</a>
                                    </div>
                                    <div class="col-xs-12 col-sm-6 col-md-2">
                                        <div class="save-price animated wow slideInUp" data-wow-delay="0ms"
                                             data-wow-duration="1500ms">
                                            <span class="save-text">From</span>
                                            <span class="saveprice-no"><sup>$</sup>520</span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <%-- indicators --%>
                <ol class="carousel-indicators">
                    <li data-target="#home-slider" data-slide-to="0" class="active"></li>
                    <li data-target="#home-slider" data-slide-to="1"></li>
                    <li data-target="#home-slider" data-slide-to="2"></li>
                </ol>
                <%-- /indicators --%>
                <%-- /.home-slider --%>
            </div>
        </div>
        <%-- /header-slider end --%>
    </section>
    <%-- /header-outer --%>
</header>
<%-- banner --%>
<section class="banner">
    <div class="container">
        <div class="row">
            <div class="col-xs-12 col-sm-4 col-md-4">
                <%-- banner-img --%>
                <a href="#" class="banner-img">
                    <%-- banner-text --%>
                    <div class="banner-text">
                        <h3>Samsung</h3>
                        <h2>Tablet mini 3</h2>
                        <span class="price">Price: $720</span>
                    </div>
                    <%-- /banner-text --%>
                </a>
                <%-- /banner-img --%>
            </div>
            <div class="col-xs-12 col-sm-4 col-md-4">
                <%-- banner-img --%>
                <a href="#" class="banner-img banner-img2">
                    <%-- banner-text --%>
                    <div class="banner-text">
                        <h3>sony brand</h3>
                        <h2>Smartwatch</h2>
                        <span class="price">Price: $220</span>
                    </div>
                    <%-- /banner-text --%>
                </a>
                <%-- /banner-img --%>
            </div>
            <div class="col-xs-12 col-sm-4 col-md-4">
                <%-- banner-img --%>
                <a href="#" class="banner-img banner-img3">
                    <%-- banner-text --%>
                    <div class="banner-text">
                        <h3>beat brand</h3>
                        <h2>Headphone</h2>
                        <span class="price">Price: $150</span>
                    </div>
                    <%-- /banner-text --%>
                </a>
                <%-- /banner-img --%>
            </div>
        </div>
    </div>
</section>
<%-- /banner --%>
<%-- deal-outer --%>
<section class="deal-section">
    <div class="container">
        <div class="row">
            <div class="col-sm-4">
                <div class="deal-week">
                    <div class="title">
                        <h2>Deals Of The Week</h2>
                    </div>
                    <div class="owl-demo-outer">
                        <%-- #owl-demo --%>
                        <div id="owl-demo" class="deals-wk">
                            <div class="item">
                                <div class="col-md-12">
                                    <%-- .pro-text --%>
                                    <div class="pro-text text-center">
                                        <%-- .pro-img --%>
                                        <div class="pro-img">
                                            <img src="${pageContext.request.contextPath}/mall/assets/images/wk-deal-img.jpg" alt="2"/>
                                        </div>
                                        <%-- /.pro-img --%>
                                        <div class="text-text">
                                            <span>Macbook, Laptop</span>
                                            <h4> Apple Macbook Retina 23’’ </h4>
                                            <p>Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse
                                                molestie consequat, vel illum dolore eu feugiat nulla facilisis.</p>
                                            <p class="wk-price">$290.00 <span>$290.00</span></p>
                                            <p class="availalbe">Availalbe: <span>In Stock</span></p>
                                            <a href="#" class="add-btn">Add to cart</a>
                                        </div>
                                        <%-- clockdiv --%>
                                        <div id="clockdiv">
                                            <h4>Hurry Up! Offer ends in:</h4>
                                            <div>
                                                <span class="days">14</span>
                                                <div class="smalltext">Days</div>
                                            </div>
                                            <div>
                                                <span class="hours">23</span>
                                                <div class="smalltext">Hours</div>
                                            </div>
                                            <div>
                                                <span class="minutes">59</span>
                                                <div class="smalltext">Minutes</div>
                                            </div>
                                            <div>
                                                <span class="seconds">47</span>
                                                <div class="smalltext">Seconds</div>
                                            </div>
                                        </div>
                                        <%-- /clockdiv --%>
                                    </div>
                                    <%-- /.pro-text --%>
                                </div>
                            </div>
                            <div class="item">
                                <div class="col-md-12">
                                    <%-- .pro-text --%>
                                    <div class="pro-text text-center">
                                        <%-- .pro-img --%>
                                        <div class="pro-img">
                                            <img src="${pageContext.request.contextPath}/mall/assets/images/wk-deal-img.jpg" alt="2"/>
                                        </div>
                                        <%-- /.pro-img --%>
                                        <div class="text-text">
                                            <span>Macbook, Laptop</span>
                                            <h4> Apple Macbook Retina 23’’ </h4>
                                            <p>Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse
                                                molestie consequat, vel illum dolore eu feugiat nulla facilisis.</p>
                                            <p class="wk-price">$290.00 <span>$290.00</span></p>
                                            <p class="availalbe">Availalbe: <span>In Stock</span></p>
                                            <a href="#" class="add-btn">Add to cart</a>
                                        </div>
                                    </div>
                                    <%-- /.pro-text --%>
                                </div>
                            </div>
                            <div class="item">
                                <div class="col-md-12">
                                    <%-- .pro-text --%>
                                    <div class="pro-text text-center">
                                        <%-- .pro-img --%>
                                        <div class="pro-img">
                                            <img src="${pageContext.request.contextPath}/mall/assets/images/wk-deal-img.jpg" alt="2"/>
                                        </div>
                                        <%-- /.pro-img --%>
                                        <div class="text-text">
                                            <span>Macbook, Laptop</span>
                                            <h4> Apple Macbook Retina 23’’ </h4>
                                            <p>Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse
                                                molestie consequat, vel illum dolore eu feugiat nulla facilisis.</p>
                                            <p class="wk-price">$290.00 <span>$290.00</span></p>
                                            <p class="availalbe">Availalbe: <span>In Stock</span></p>
                                            <a href="#" class="add-btn">Add to cart</a>
                                        </div>
                                    </div>
                                    <%-- /.pro-text --%>
                                </div>
                            </div>
                            <div class="item">
                                <div class="col-md-12">
                                    <%-- .pro-text --%>
                                    <div class="pro-text text-center">
                                        <%-- .pro-img --%>
                                        <div class="pro-img">
                                            <img src="${pageContext.request.contextPath}/mall/assets/images/wk-deal-img.jpg" alt="2"/>
                                        </div>
                                        <%-- /.pro-img --%>
                                        <div class="text-text">
                                            <span>Macbook, Laptop</span>
                                            <h4> Apple Macbook Retina 23’’ </h4>
                                            <p>Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse
                                                molestie consequat, vel illum dolore eu feugiat nulla facilisis.</p>
                                            <p class="wk-price">$290.00 <span>$290.00</span></p>
                                            <p class="availalbe">Availalbe: <span>In Stock</span></p>
                                            <a href="#" class="add-btn">Add to cart</a>
                                        </div>
                                    </div>
                                    <%-- /.pro-text --%>
                                </div>
                            </div>
                            <%-- /#owl-demo --%>
                        </div>
                    </div>

                </div>
            </div>


            <div class="col-sm-8">
                <%-- new-arrivals --%>
                <div class="new-arrivals">
                    <ul class="nav nav-tabs">
                        <li class="active"><a data-toggle="tab" href="#home">new arrivals</a></li>
                        <li><a data-toggle="tab" href="#menu1">featured</a></li>
                        <li><a data-toggle="tab" href="#menu2">special</a></li>
                    </ul>

                    <div class="tab-content">
                        <div id="home" class="tab-pane fade in active">
                            <div class="owl-demo-outer">
                                <%-- #owl-demo --%>
                                <div id="owl-demo8" class="deals-wk2">
                                    <div class="item">
                                        <div class="col-xs-12 col-sm-6 col-md-4">
                                            <%-- .pro-text --%>
                                            <div class="pro-text text-center">
                                                <%-- .pro-img --%>
                                                <div class="pro-img">
                                                    <img src="${pageContext.request.contextPath}/mall/assets/images/new-arrivals-img.jpg" alt="2"/>
                                                </div>
                                                <%-- /.pro-img --%>
                                                <div class="pro-text-outer">
                                                    <span>Macbook, Laptop</span>
                                                    <a href="shop-detail.jsp">
                                                        <h4> Apple Macbook Retina 23’ </h4>
                                                    </a>
                                                    <p class="wk-price">$290.00 </p>
                                                    <a href="#" class="add-btn">Add to cart</a>
                                                </div>
                                            </div>
                                            <%-- /.pro-text --%>
                                        </div>
                                        <div class="col-xs-12 col-sm-6 col-md-4">
                                            <%-- .pro-text --%>
                                            <div class="pro-text text-center">
                                                <%-- .pro-img --%>
                                                <div class="pro-img">
                                                    <img src="${pageContext.request.contextPath}/mall/assets/images/new-arrivals-img2.jpg" alt="2"/>
                                                </div>
                                                <%-- /.pro-img --%>
                                                <div class="pro-text-outer">
                                                    <span>Macbook, Laptop</span>
                                                    <a href="shop-detail.jsp">
                                                        <h4> Apple Macbook Retina 23’ </h4>
                                                    </a>
                                                    <p class="wk-price">$290.00 </p>
                                                    <a href="#" class="add-btn">Add to cart</a>
                                                </div>
                                            </div>
                                            <%-- /.pro-text --%>
                                        </div>
                                        <div class="col-xs-12 col-sm-6 col-md-4">
                                            <%-- .pro-text --%>
                                            <div class="pro-text text-center">
                                                <%-- .pro-img --%>
                                                <div class="pro-img">
                                                    <img src="${pageContext.request.contextPath}/mall/assets/images/new-arrivals-img3.jpg" alt="2"/>
                                                </div>
                                                <%-- /.pro-img --%>
                                                <div class="pro-text-outer">
                                                    <span>Macbook, Laptop</span>
                                                    <a href="shop-detail.jsp">
                                                        <h4> Apple Macbook Retina 23’ </h4>
                                                    </a>
                                                    <p class="wk-price">$290.00 </p>
                                                    <a href="#" class="add-btn">Add to cart</a>
                                                </div>
                                            </div>
                                            <%-- /.pro-text --%>
                                        </div>
                                        <div class="col-xs-12 col-sm-6 col-md-4">
                                            <%-- .pro-text --%>
                                            <div class="pro-text text-center">
                                                <%-- .pro-img --%>
                                                <div class="pro-img">
                                                    <img src="${pageContext.request.contextPath}/mall/assets/images/new-arrivals-img4.jpg" alt="2"/>
                                                </div>
                                                <%-- /.pro-img --%>
                                                <div class="pro-text-outer">
                                                    <span>Macbook, Laptop</span>
                                                    <a href="shop-detail.jsp">
                                                        <h4> Apple Macbook Retina 23’ </h4>
                                                    </a>
                                                    <p class="wk-price">$290.00 </p>
                                                    <a href="#" class="add-btn">Add to cart</a>
                                                </div>
                                            </div>
                                            <%-- /.pro-text --%>
                                        </div>
                                        <div class="col-xs-12 col-sm-6 col-md-4">
                                            <%-- .pro-text --%>
                                            <div class="pro-text text-center">
                                                <%-- .pro-img --%>
                                                <div class="pro-img">
                                                    <img src="${pageContext.request.contextPath}/mall/assets/images/new-arrivals-img5.jpg" alt="2"/>
                                                </div>
                                                <%-- /.pro-img --%>
                                                <div class="pro-text-outer">
                                                    <span>Macbook, Laptop</span>
                                                    <a href="shop-detail.jsp">
                                                        <h4> Apple Macbook Retina 23’ </h4>
                                                    </a>
                                                    <p class="wk-price">$290.00 </p>
                                                    <a href="#" class="add-btn">Add to cart</a>
                                                </div>
                                            </div>
                                            <%-- /.pro-text --%>
                                        </div>
                                        <div class="col-xs-12 col-sm-6 col-md-4">
                                            <%-- .pro-text --%>
                                            <div class="pro-text text-center">
                                                <%-- .pro-img --%>
                                                <div class="pro-img">
                                                    <img src="${pageContext.request.contextPath}/mall/assets/images/new-arrivals-img6.jpg" alt="2"/>
                                                </div>
                                                <%-- /.pro-img --%>
                                                <div class="pro-text-outer">
                                                    <span>Macbook, Laptop</span>
                                                    <a href="shop-detail.jsp">
                                                        <h4> Apple Macbook Retina 23’ </h4>
                                                    </a>
                                                    <p class="wk-price">$290.00 </p>
                                                    <a href="#" class="add-btn">Add to cart</a>
                                                </div>
                                            </div>
                                            <%-- /.pro-text --%>
                                        </div>

                                    </div>
                                    <div class="item">
                                        <div class="col-xs-12 col-sm-6 col-md-4">
                                            <%-- .pro-text --%>
                                            <div class="pro-text text-center">
                                                <%-- .pro-img --%>
                                                <div class="pro-img">
                                                    <img src="${pageContext.request.contextPath}/mall/assets/images/new-arrivals-img.jpg" alt="2"/>
                                                </div>
                                                <%-- /.pro-img --%>
                                                <div class="pro-text-outer">
                                                    <span>Macbook, Laptop</span>
                                                    <a href="shop-detail.jsp">
                                                        <h4> Apple Macbook Retina 23’ </h4>
                                                    </a>
                                                    <p class="wk-price">$290.00 </p>
                                                    <a href="#" class="add-btn">Add to cart</a>
                                                </div>
                                            </div>
                                            <%-- /.pro-text --%>
                                        </div>
                                        <div class="col-xs-12 col-sm-6 col-md-4">
                                            <%-- .pro-text --%>
                                            <div class="pro-text text-center">
                                                <%-- .pro-img --%>
                                                <div class="pro-img">
                                                    <img src="${pageContext.request.contextPath}/mall/assets/images/new-arrivals-img2.jpg" alt="2"/>
                                                </div>
                                                <%-- /.pro-img --%>
                                                <div class="pro-text-outer">
                                                    <span>Macbook, Laptop</span>
                                                    <a href="shop-detail.jsp">
                                                        <h4> Apple Macbook Retina 23’ </h4>
                                                    </a>
                                                    <p class="wk-price">$290.00 </p>
                                                    <a href="#" class="add-btn">Add to cart</a>
                                                </div>
                                            </div>
                                            <%-- /.pro-text --%>
                                        </div>
                                        <div class="col-xs-12 col-sm-6 col-md-4">
                                            <%-- .pro-text --%>
                                            <div class="pro-text text-center">
                                                <%-- .pro-img --%>
                                                <div class="pro-img">
                                                    <img src="${pageContext.request.contextPath}/mall/assets/images/new-arrivals-img3.jpg" alt="2"/>
                                                </div>
                                                <%-- /.pro-img --%>
                                                <div class="pro-text-outer">
                                                    <span>Macbook, Laptop</span>
                                                    <a href="shop-detail.jsp">
                                                        <h4> Apple Macbook Retina 23’ </h4>
                                                    </a>
                                                    <p class="wk-price">$290.00 </p>
                                                    <a href="#" class="add-btn">Add to cart</a>
                                                </div>
                                            </div>
                                            <%-- /.pro-text --%>
                                        </div>
                                        <div class="col-xs-12 col-sm-6 col-md-4">
                                            <%-- .pro-text --%>
                                            <div class="pro-text text-center">
                                                <%-- .pro-img --%>
                                                <div class="pro-img">
                                                    <img src="${pageContext.request.contextPath}/mall/assets/images/new-arrivals-img4.jpg" alt="2"/>
                                                </div>
                                                <%-- /.pro-img --%>
                                                <div class="pro-text-outer">
                                                    <span>Macbook, Laptop</span>
                                                    <a href="shop-detail.jsp">
                                                        <h4> Apple Macbook Retina 23’ </h4>
                                                    </a>
                                                    <p class="wk-price">$290.00 </p>
                                                    <a href="#" class="add-btn">Add to cart</a>
                                                </div>
                                            </div>
                                            <%-- /.pro-text --%>
                                        </div>
                                        <div class="col-xs-12 col-sm-6 col-md-4">
                                            <%-- .pro-text --%>
                                            <div class="pro-text text-center">
                                                <%-- .pro-img --%>
                                                <div class="pro-img">
                                                    <img src="${pageContext.request.contextPath}/mall/assets/images/new-arrivals-img5.jpg" alt="2"/>
                                                </div>
                                                <%-- /.pro-img --%>
                                                <div class="pro-text-outer">
                                                    <span>Macbook, Laptop</span>
                                                    <a href="shop-detail.jsp">
                                                        <h4> Apple Macbook Retina 23’ </h4>
                                                    </a>
                                                    <p class="wk-price">$290.00 </p>
                                                    <a href="#" class="add-btn">Add to cart</a>
                                                </div>
                                            </div>
                                            <%-- /.pro-text --%>
                                        </div>
                                        <div class="col-xs-12 col-sm-6 col-md-4">
                                            <%-- .pro-text --%>
                                            <div class="pro-text text-center">
                                                <%-- .pro-img --%>
                                                <div class="pro-img">
                                                    <img src="${pageContext.request.contextPath}/mall/assets/images/new-arrivals-img6.jpg" alt="2"/>
                                                </div>
                                                <%-- /.pro-img --%>
                                                <div class="pro-text-outer">
                                                    <span>Macbook, Laptop</span>
                                                    <a href="shop-detail.jsp">
                                                        <h4> Apple Macbook Retina 23’ </h4>
                                                    </a>
                                                    <p class="wk-price">$290.00 </p>
                                                    <a href="#" class="add-btn">Add to cart</a>
                                                </div>
                                            </div>
                                            <%-- /.pro-text --%>
                                        </div>

                                    </div>


                                    <%-- /#owl-demo --%>
                                </div>
                            </div>
                        </div>
                        <div id="menu1" class="tab-pane fade">
                            <div class="owl-demo-outer">
                                <%-- #owl-demo --%>
                                <div id="owl-demo7" class="deals-wk2">
                                    <div class="item">
                                        <div class="col-xs-12 col-sm-6 col-md-4">
                                            <%-- .pro-text --%>
                                            <div class="pro-text text-center">
                                                <%-- .pro-img --%>
                                                <div class="pro-img">
                                                    <img src="${pageContext.request.contextPath}/mall/assets/images/new-arrivals-img.jpg" alt="2"/>
                                                </div>
                                                <%-- /.pro-img --%>
                                                <div class="pro-text-outer">
                                                    <span>Macbook, Laptop</span>
                                                    <a href="shop-detail.jsp">
                                                        <h4> Apple Macbook Retina 23’ </h4>
                                                    </a>
                                                    <p class="wk-price">$290.00 </p>
                                                    <a href="#" class="add-btn">Add to cart</a>
                                                </div>
                                            </div>
                                            <%-- /.pro-text --%>
                                        </div>
                                        <div class="col-xs-12 col-sm-6 col-md-4">
                                            <%-- .pro-text --%>
                                            <div class="pro-text text-center">
                                                <%-- .pro-img --%>
                                                <div class="pro-img">
                                                    <img src="${pageContext.request.contextPath}/mall/assets/images/new-arrivals-img2.jpg" alt="2"/>
                                                </div>
                                                <%-- /.pro-img --%>
                                                <div class="pro-text-outer">
                                                    <span>Macbook, Laptop</span>
                                                    <a href="shop-detail.jsp">
                                                        <h4> Apple Macbook Retina 23’ </h4>
                                                    </a>
                                                    <p class="wk-price">$290.00 </p>
                                                    <a href="#" class="add-btn">Add to cart</a>
                                                </div>
                                            </div>
                                            <%-- /.pro-text --%>
                                        </div>
                                        <div class="col-xs-12 col-sm-6 col-md-4">
                                            <%-- .pro-text --%>
                                            <div class="pro-text text-center">
                                                <%-- .pro-img --%>
                                                <div class="pro-img">
                                                    <img src="${pageContext.request.contextPath}/mall/assets/images/new-arrivals-img3.jpg" alt="2"/>
                                                </div>
                                                <%-- /.pro-img --%>
                                                <div class="pro-text-outer">
                                                    <span>Macbook, Laptop</span>
                                                    <a href="shop-detail.jsp">
                                                        <h4> Apple Macbook Retina 23’ </h4>
                                                    </a>
                                                    <p class="wk-price">$290.00 </p>
                                                    <a href="#" class="add-btn">Add to cart</a>
                                                </div>
                                            </div>
                                            <%-- /.pro-text --%>
                                        </div>
                                        <div class="col-xs-12 col-sm-6 col-md-4">
                                            <%-- .pro-text --%>
                                            <div class="pro-text text-center">
                                                <%-- .pro-img --%>
                                                <div class="pro-img">
                                                    <img src="${pageContext.request.contextPath}/mall/assets/images/new-arrivals-img4.jpg" alt="2"/>
                                                </div>
                                                <%-- /.pro-img --%>
                                                <div class="pro-text-outer">
                                                    <span>Macbook, Laptop</span>
                                                    <a href="shop-detail.jsp">
                                                        <h4> Apple Macbook Retina 23’ </h4>
                                                    </a>
                                                    <p class="wk-price">$290.00 </p>
                                                    <a href="#" class="add-btn">Add to cart</a>
                                                </div>
                                            </div>
                                            <%-- /.pro-text --%>
                                        </div>
                                        <div class="col-xs-12 col-sm-6 col-md-4">
                                            <%-- .pro-text --%>
                                            <div class="pro-text text-center">
                                                <%-- .pro-img --%>
                                                <div class="pro-img">
                                                    <img src="${pageContext.request.contextPath}/mall/assets/images/new-arrivals-img5.jpg" alt="2"/>
                                                </div>
                                                <%-- /.pro-img --%>
                                                <div class="pro-text-outer">
                                                    <span>Macbook, Laptop</span>
                                                    <a href="shop-detail.jsp">
                                                        <h4> Apple Macbook Retina 23’ </h4>
                                                    </a>
                                                    <p class="wk-price">$290.00 </p>
                                                    <a href="#" class="add-btn">Add to cart</a>
                                                </div>
                                            </div>
                                            <%-- /.pro-text --%>
                                        </div>
                                        <div class="col-xs-12 col-sm-6 col-md-4">
                                            <%-- .pro-text --%>
                                            <div class="pro-text text-center">
                                                <%-- .pro-img --%>
                                                <div class="pro-img">
                                                    <img src="${pageContext.request.contextPath}/mall/assets/images/new-arrivals-img6.jpg" alt="2"/>
                                                </div>
                                                <%-- /.pro-img --%>
                                                <div class="pro-text-outer">
                                                    <span>Macbook, Laptop</span>
                                                    <a href="#">
                                                        <h4> Apple Macbook Retina 23’ </h4>
                                                    </a>
                                                    <p class="wk-price">$290.00 </p>
                                                    <a href="#" class="add-btn">Add to cart</a>
                                                </div>
                                            </div>
                                            <%-- /.pro-text --%>
                                        </div>

                                    </div>
                                    <div class="item">
                                        <div class="col-xs-12 col-sm-6 col-md-4">
                                            <%-- .pro-text --%>
                                            <div class="pro-text text-center">
                                                <%-- .pro-img --%>
                                                <div class="pro-img">
                                                    <img src="${pageContext.request.contextPath}/mall/assets/images/new-arrivals-img.jpg" alt="2"/>
                                                </div>
                                                <%-- /.pro-img --%>
                                                <div class="pro-text-outer">
                                                    <span>Macbook, Laptop</span>
                                                    <a href="shop-detail.jsp">
                                                        <h4> Apple Macbook Retina 23’ </h4>
                                                    </a>
                                                    <p class="wk-price">$290.00 </p>
                                                    <a href="#" class="add-btn">Add to cart</a>
                                                </div>
                                            </div>
                                            <%-- /.pro-text --%>
                                        </div>
                                        <div class="col-xs-12 col-sm-6 col-md-4">
                                            <%-- .pro-text --%>
                                            <div class="pro-text text-center">
                                                <%-- .pro-img --%>
                                                <div class="pro-img">
                                                    <img src="${pageContext.request.contextPath}/mall/assets/images/new-arrivals-img2.jpg" alt="2"/>
                                                </div>
                                                <%-- /.pro-img --%>
                                                <div class="pro-text-outer">
                                                    <span>Macbook, Laptop</span>
                                                    <a href="shop-detail.jsp">
                                                        <h4> Apple Macbook Retina 23’ </h4>
                                                    </a>
                                                    <p class="wk-price">$290.00 </p>
                                                    <a href="#" class="add-btn">Add to cart</a>
                                                </div>
                                            </div>
                                            <%-- /.pro-text --%>
                                        </div>
                                        <div class="col-xs-12 col-sm-6 col-md-4">
                                            <%-- .pro-text --%>
                                            <div class="pro-text text-center">
                                                <%-- .pro-img --%>
                                                <div class="pro-img">
                                                    <img src="${pageContext.request.contextPath}/mall/assets/images/new-arrivals-img3.jpg" alt="2"/>
                                                </div>
                                                <%-- /.pro-img --%>
                                                <div class="pro-text-outer">
                                                    <span>Macbook, Laptop</span>
                                                    <a href="shop-detail.jsp">
                                                        <h4> Apple Macbook Retina 23’ </h4>
                                                    </a>
                                                    <p class="wk-price">$290.00 </p>
                                                    <a href="#" class="add-btn">Add to cart</a>
                                                </div>
                                            </div>
                                            <%-- /.pro-text --%>
                                        </div>
                                        <div class="col-xs-12 col-sm-6 col-md-4">
                                            <%-- .pro-text --%>
                                            <div class="pro-text text-center">
                                                <%-- .pro-img --%>
                                                <div class="pro-img">
                                                    <img src="${pageContext.request.contextPath}/mall/assets/images/new-arrivals-img4.jpg" alt="2"/>
                                                </div>
                                                <%-- /.pro-img --%>
                                                <div class="pro-text-outer">
                                                    <span>Macbook, Laptop</span>
                                                    <a href="shop-detail.jsp">
                                                        <h4> Apple Macbook Retina 23’ </h4>
                                                    </a>
                                                    <p class="wk-price">$290.00 </p>
                                                    <a href="#" class="add-btn">Add to cart</a>
                                                </div>
                                            </div>
                                            <%-- /.pro-text --%>
                                        </div>
                                        <div class="col-xs-12 col-sm-6 col-md-4">
                                            <%-- .pro-text --%>
                                            <div class="pro-text text-center">
                                                <%-- .pro-img --%>
                                                <div class="pro-img">
                                                    <img src="${pageContext.request.contextPath}/mall/assets/images/new-arrivals-img5.jpg" alt="2"/>
                                                </div>
                                                <%-- /.pro-img --%>
                                                <div class="pro-text-outer">
                                                    <span>Macbook, Laptop</span>
                                                    <a href="shop-detail.jsp">
                                                        <h4> Apple Macbook Retina 23’ </h4>
                                                    </a>
                                                    <p class="wk-price">$290.00 </p>
                                                    <a href="#" class="add-btn">Add to cart</a>
                                                </div>
                                            </div>
                                            <%-- /.pro-text --%>
                                        </div>
                                        <div class="col-xs-12 col-sm-6 col-md-4">
                                            <%-- .pro-text --%>
                                            <div class="pro-text text-center">
                                                <%-- .pro-img --%>
                                                <div class="pro-img">
                                                    <img src="${pageContext.request.contextPath}/mall/assets/images/new-arrivals-img6.jpg" alt="2"/>
                                                </div>
                                                <%-- /.pro-img --%>
                                                <div class="pro-text-outer">
                                                    <span>Macbook, Laptop</span>
                                                    <a href="shop-detail.jsp">
                                                        <h4> Apple Macbook Retina 23’ </h4>
                                                    </a>
                                                    <p class="wk-price">$290.00 </p>
                                                    <a href="#" class="add-btn">Add to cart</a>
                                                </div>
                                            </div>
                                            <%-- /.pro-text --%>
                                        </div>

                                    </div>


                                    <%-- /#owl-demo --%>
                                </div>
                            </div>
                        </div>
                        <div id="menu2" class="tab-pane fade">
                            <div class="owl-demo-outer">
                                <%-- #owl-demo --%>
                                <div id="owl-demo6" class="deals-wk2">
                                    <div class="item">
                                        <div class="col-xs-12 col-sm-6 col-md-4">
                                            <%-- .pro-text --%>
                                            <div class="pro-text text-center">
                                                <%-- .pro-img --%>
                                                <div class="pro-img">
                                                    <img src="${pageContext.request.contextPath}/mall/assets/images/new-arrivals-img.jpg" alt="2"/>
                                                </div>
                                                <%-- /.pro-img --%>
                                                <div class="pro-text-outer">
                                                    <span>Macbook, Laptop</span>
                                                    <a href="shop-detail.jsp">
                                                        <h4> Apple Macbook Retina 23’ </h4>
                                                    </a>
                                                    <p class="wk-price">$290.00 </p>
                                                    <a href="#" class="add-btn">Add to cart</a>
                                                </div>
                                            </div>
                                            <%-- /.pro-text --%>
                                        </div>
                                        <div class="col-xs-12 col-sm-6 col-md-4">
                                            <%-- .pro-text --%>
                                            <div class="pro-text text-center">
                                                <%-- .pro-img --%>
                                                <div class="pro-img">
                                                    <img src="${pageContext.request.contextPath}/mall/assets/images/new-arrivals-img2.jpg" alt="2"/>
                                                </div>
                                                <%-- /.pro-img --%>
                                                <div class="pro-text-outer">
                                                    <span>Macbook, Laptop</span>
                                                    <a href="shop-detail.jsp">
                                                        <h4> Apple Macbook Retina 23’ </h4>
                                                    </a>
                                                    <p class="wk-price">$290.00 </p>
                                                    <a href="#" class="add-btn">Add to cart</a>
                                                </div>
                                            </div>
                                            <%-- /.pro-text --%>
                                        </div>
                                        <div class="col-xs-12 col-sm-6 col-md-4">
                                            <%-- .pro-text --%>
                                            <div class="pro-text text-center">
                                                <%-- .pro-img --%>
                                                <div class="pro-img">
                                                    <img src="${pageContext.request.contextPath}/mall/assets/images/new-arrivals-img3.jpg" alt="2"/>
                                                </div>
                                                <%-- /.pro-img --%>
                                                <div class="pro-text-outer">
                                                    <span>Macbook, Laptop</span>
                                                    <a href="shop-detail.jsp">
                                                        <h4> Apple Macbook Retina 23’ </h4>
                                                    </a>
                                                    <p class="wk-price">$290.00 </p>
                                                    <a href="#" class="add-btn">Add to cart</a>
                                                </div>
                                            </div>
                                            <%-- /.pro-text --%>
                                        </div>
                                        <div class="col-xs-12 col-sm-6 col-md-4">
                                            <%-- .pro-text --%>
                                            <div class="pro-text text-center">
                                                <%-- .pro-img --%>
                                                <div class="pro-img">
                                                    <img src="${pageContext.request.contextPath}/mall/assets/images/new-arrivals-img4.jpg" alt="2"/>
                                                </div>
                                                <%-- /.pro-img --%>
                                                <div class="pro-text-outer">
                                                    <span>Macbook, Laptop</span>
                                                    <a href="shop-detail.jsp">
                                                        <h4> Apple Macbook Retina 23’ </h4>
                                                    </a>
                                                    <p class="wk-price">$290.00 </p>
                                                    <a href="#" class="add-btn">Add to cart</a>
                                                </div>
                                            </div>
                                            <%-- /.pro-text --%>
                                        </div>
                                        <div class="col-xs-12 col-sm-6 col-md-4">
                                            <%-- .pro-text --%>
                                            <div class="pro-text text-center">
                                                <%-- .pro-img --%>
                                                <div class="pro-img">
                                                    <img src="${pageContext.request.contextPath}/mall/assets/images/new-arrivals-img5.jpg" alt="2"/>
                                                </div>
                                                <%-- /.pro-img --%>
                                                <div class="pro-text-outer">
                                                    <span>Macbook, Laptop</span>
                                                    <a href="#">
                                                        <h4> Apple Macbook Retina 23’ </h4>
                                                    </a>
                                                    <p class="wk-price">$290.00 </p>
                                                    <a href="#" class="add-btn">Add to cart</a>
                                                </div>
                                            </div>
                                            <%-- /.pro-text --%>
                                        </div>
                                        <div class="col-xs-12 col-sm-6 col-md-4">
                                            <%-- .pro-text --%>
                                            <div class="pro-text text-center">
                                                <%-- .pro-img --%>
                                                <div class="pro-img">
                                                    <img src="${pageContext.request.contextPath}/mall/assets/images/new-arrivals-img6.jpg" alt="2"/>
                                                </div>
                                                <%-- /.pro-img --%>
                                                <div class="pro-text-outer">
                                                    <span>Macbook, Laptop</span>
                                                    <a href="#">
                                                        <h4> Apple Macbook Retina 23’ </h4>
                                                    </a>
                                                    <p class="wk-price">$290.00 </p>
                                                    <a href="#" class="add-btn">Add to cart</a>
                                                </div>
                                            </div>
                                            <%-- /.pro-text --%>
                                        </div>

                                    </div>
                                    <div class="item">
                                        <div class="col-xs-12 col-sm-6 col-md-4">
                                            <%-- .pro-text --%>
                                            <div class="pro-text text-center">
                                                <%-- .pro-img --%>
                                                <div class="pro-img">
                                                    <img src="${pageContext.request.contextPath}/mall/assets/images/new-arrivals-img.jpg" alt="2"/>
                                                </div>
                                                <%-- /.pro-img --%>
                                                <div class="pro-text-outer">
                                                    <span>Macbook, Laptop</span>
                                                    <a href="#">
                                                        <h4> Apple Macbook Retina 23’ </h4>
                                                    </a>
                                                    <p class="wk-price">$290.00 </p>
                                                    <a href="#" class="add-btn">Add to cart</a>
                                                </div>
                                            </div>
                                            <%-- /.pro-text --%>
                                        </div>
                                        <div class="col-xs-12 col-sm-6 col-md-4">
                                            <%-- .pro-text --%>
                                            <div class="pro-text text-center">
                                                <%-- .pro-img --%>
                                                <div class="pro-img">
                                                    <img src="${pageContext.request.contextPath}/mall/assets/images/new-arrivals-img2.jpg" alt="2"/>
                                                </div>
                                                <%-- /.pro-img --%>
                                                <div class="pro-text-outer">
                                                    <span>Macbook, Laptop</span>
                                                    <a href="#">
                                                        <h4> Apple Macbook Retina 23’ </h4>
                                                    </a>
                                                    <p class="wk-price">$290.00 </p>
                                                    <a href="#" class="add-btn">Add to cart</a>
                                                </div>
                                            </div>
                                            <%-- /.pro-text --%>
                                        </div>
                                        <div class="col-xs-12 col-sm-6 col-md-4">
                                            <%-- .pro-text --%>
                                            <div class="pro-text text-center">
                                                <%-- .pro-img --%>
                                                <div class="pro-img">
                                                    <img src="${pageContext.request.contextPath}/mall/assets/images/new-arrivals-img3.jpg" alt="2"/>
                                                </div>
                                                <%-- /.pro-img --%>
                                                <div class="pro-text-outer">
                                                    <span>Macbook, Laptop</span>
                                                    <a href="#">
                                                        <h4> Apple Macbook Retina 23’ </h4>
                                                    </a>
                                                    <p class="wk-price">$290.00 </p>
                                                    <a href="#" class="add-btn">Add to cart</a>
                                                </div>
                                            </div>
                                            <%-- /.pro-text --%>
                                        </div>
                                        <div class="col-xs-12 col-sm-6 col-md-4">
                                            <%-- .pro-text --%>
                                            <div class="pro-text text-center">
                                                <%-- .pro-img --%>
                                                <div class="pro-img">
                                                    <img src="${pageContext.request.contextPath}/mall/assets/images/new-arrivals-img4.jpg" alt="2"/>
                                                </div>
                                                <%-- /.pro-img --%>
                                                <div class="pro-text-outer">
                                                    <span>Macbook, Laptop</span>
                                                    <a href="#">
                                                        <h4> Apple Macbook Retina 23’ </h4>
                                                    </a>
                                                    <p class="wk-price">$290.00 </p>
                                                    <a href="#" class="add-btn">Add to cart</a>
                                                </div>
                                            </div>
                                            <%-- /.pro-text --%>
                                        </div>
                                        <div class="col-xs-12 col-sm-6 col-md-4">
                                            <%-- .pro-text --%>
                                            <div class="pro-text text-center">
                                                <%-- .pro-img --%>
                                                <div class="pro-img">
                                                    <img src="${pageContext.request.contextPath}/mall/assets/images/new-arrivals-img5.jpg" alt="2"/>
                                                </div>
                                                <%-- /.pro-img --%>
                                                <div class="pro-text-outer">
                                                    <span>Macbook, Laptop</span>
                                                    <a href="#">
                                                        <h4> Apple Macbook Retina 23’ </h4>
                                                    </a>
                                                    <p class="wk-price">$290.00 </p>
                                                    <a href="#" class="add-btn">Add to cart</a>
                                                </div>
                                            </div>
                                            <%-- /.pro-text --%>
                                        </div>
                                        <div class="col-xs-12 col-sm-6 col-md-4">
                                            <%-- .pro-text --%>
                                            <div class="pro-text text-center">
                                                <%-- .pro-img --%>
                                                <div class="pro-img">
                                                    <img src="${pageContext.request.contextPath}/mall/assets/images/new-arrivals-img6.jpg" alt="2"/>
                                                </div>
                                                <%-- /.pro-img --%>
                                                <div class="pro-text-outer">
                                                    <span>Macbook, Laptop</span>
                                                    <a href="#">
                                                        <h4> Apple Macbook Retina 23’ </h4>
                                                    </a>
                                                    <p class="wk-price">$290.00 </p>
                                                    <a href="#" class="add-btn">Add to cart</a>
                                                </div>
                                            </div>
                                            <%-- /.pro-text --%>
                                        </div>

                                    </div>


                                    <%-- /#owl-demo --%>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <%-- /new-arrivals --%>

            </div>
        </div>
    </div>
</section>
<%-- /deal-outer --%>
<%-- all-product --%>
<section class="all-product">
    <div class="container">
        <div class="row">
            <%-- title --%>
            <div class="title">
                <h2>
                    ELECTRONICS & COMPUTERS
                </h2>
                <ul class="nav nav-tabs etabs">
                    <li class="active"><a data-toggle="tab" href="#phones">Cell Phones</a></li>
                    <li><a data-toggle="tab" href="#laptop">Laptop</a></li>
                    <li><a data-toggle="tab" href="#desktop">Desktop</a></li>
                    <li><a data-toggle="tab" href="#tV">TV & Video</a></li>
                    <li><a data-toggle="tab" href="#tablets">Tablets</a></li>
                </ul>
            </div>
            <%-- /title --%>
            <%-- electonics --%>
            <div class="electonics">

                <div class="brd2 col-xs-12 col-sm-3 col-md-3">
                    <div id="home-slider2" class="carousel slide carousel-fade" data-ride="carousel">
                        <%-- .home-slider --%>
                        <div class="carousel-inner">
                            <div class="item active">
                                <a class="ads" href="#">
                                    <img src="${pageContext.request.contextPath}/mall/assets/images/add-banner.jpg" alt="add-banner"/>
                                </a>
                            </div>
                            <div class="item">
                                <a class="ads" href="#">
                                    <img src="${pageContext.request.contextPath}/mall/assets/images/add-banner.jpg" alt="add-banner"/>
                                </a>
                            </div>
                        </div>
                        <%-- indicators --%>
                        <ol class="carousel-indicators">
                            <li data-target="#home-slider2" data-slide-to="0" class="active"></li>
                            <li data-target="#home-slider2" data-slide-to="1"></li>
                        </ol>
                        <%-- /indicators --%>
                        <%-- /.home-slider --%>
                    </div>
                </div>
                <div class="col-xs-12 col-sm-9 col-md-9">
                    <div class="row">
                        <%-- tab-content --%>
                        <div class="tab-content">
                            <%-- tab-pane --%>
                            <div id="phones" class="tab-pane fade in active">
                                <div class="owl-demo-outer">
                                    <%-- #owl-demo --%>
                                    <div id="owl-demo3" class="deals-wk2">
                                        <div class="item">
                                            <div class="bdr col-xs-12 col-sm-12 col-md-6">
                                                <%-- e-product --%>
                                                <div class="e-product">
                                                    <div class="pro-img">
                                                        <img src="${pageContext.request.contextPath}/mall/assets/images/elec-img1.jpg" alt="2">
                                                        <div class="hover-icon">
                                                            <a href="#"><i class="fa fa-search" aria-hidden="true"></i></a>
                                                        </div>
                                                    </div>
                                                    <div class="pro-text-outer">
                                                        <span>Macbook, Laptop</span>
                                                        <a href="#">
                                                            <h4> Apple Macbook Retina 23’ </h4>
                                                        </a>
                                                        <p class="wk-price">$290.00 </p>
                                                        <a href="#" class="add-btn">Add to cart</a>
                                                        <a href="#" class="add-btn2"><i class="icon-heart icons"
                                                                                        aria-hidden="true"></i></a>
                                                        <a href="#" class="add-btn2"><i class="icon-refresh icons"></i></a>
                                                    </div>
                                                </div>
                                                <%-- /e-product --%>
                                            </div>
                                            <div class="bdr col-xs-12 col-sm-12 col-md-6">
                                                <%-- e-product --%>
                                                <div class="e-product">
                                                    <div class="pro-img">
                                                        <sup class="sale-tag">sale!</sup>
                                                        <img src="${pageContext.request.contextPath}/mall/assets/images/elec-img2.jpg" alt="2">
                                                        <div class="hover-icon">
                                                            <a href="#"><i class="fa fa-search" aria-hidden="true"></i></a>
                                                        </div>
                                                    </div>
                                                    <div class="pro-text-outer">
                                                        <span>Macbook, Laptop</span>
                                                        <a href="#">
                                                            <h4> Apple Macbook Retina 23’ </h4>
                                                        </a>
                                                        <p class="wk-price">$290.00 </p>
                                                        <a href="#" class="add-btn">Add to cart</a>
                                                    </div>
                                                </div>
                                                <%-- /e-product --%>
                                            </div>
                                            <div class="bdr col-xs-12 col-sm-12 col-md-6">
                                                <%-- e-product --%>
                                                <div class="e-product">
                                                    <div class="pro-img">
                                                        <sup class="sale-tag">sale!</sup>
                                                        <img src="${pageContext.request.contextPath}/mall/assets/images/elec-img3.jpg" alt="2">
                                                        <div class="hover-icon">
                                                            <a href="#"><i class="fa fa-search" aria-hidden="true"></i></a>
                                                        </div>
                                                    </div>
                                                    <div class="pro-text-outer">
                                                        <span>Macbook, Laptop</span>
                                                        <a href="#">
                                                            <h4> Apple Macbook Retina 23’ </h4>
                                                        </a>
                                                        <p class="wk-price">$290.00 </p>
                                                        <a href="#" class="add-btn">Add to cart</a>
                                                    </div>
                                                </div>
                                                <%-- /e-product --%>
                                            </div>
                                            <div class="bdr col-xs-12 col-sm-12 col-md-6">
                                                <%-- e-product --%>
                                                <div class="e-product">
                                                    <div class="pro-img">
                                                        <sup class="new-tag">NEW</sup>
                                                        <img src="${pageContext.request.contextPath}/mall/assets/images/elec-img4.jpg" alt="2">
                                                        <div class="hover-icon">
                                                            <a href="#"><i class="fa fa-search" aria-hidden="true"></i></a>
                                                        </div>
                                                    </div>
                                                    <div class="pro-text-outer">
                                                        <span>Macbook, Laptop</span>
                                                        <a href="#">
                                                            <h4> Apple Macbook Retina 23’ </h4>
                                                        </a>
                                                        <p class="wk-price">$290.00 </p>
                                                        <a href="#" class="add-btn">Add to cart</a>
                                                    </div>
                                                </div>
                                                <%-- /e-product --%>
                                            </div>
                                        </div>
                                        <div class="item">
                                            <div class="bdr col-xs-12 col-sm-12 col-md-6">
                                                <%-- e-product --%>
                                                <div class="e-product">
                                                    <div class="pro-img">
                                                        <sup class="sale-tag">sale!</sup>
                                                        <img src="${pageContext.request.contextPath}/mall/assets/images/elec-img1.jpg" alt="2">
                                                        <div class="hover-icon">
                                                            <a href="#"><i class="fa fa-search" aria-hidden="true"></i></a>
                                                        </div>
                                                    </div>
                                                    <div class="pro-text-outer">
                                                        <span>Macbook, Laptop</span>
                                                        <a href="#">
                                                            <h4> Apple Macbook Retina 23’ </h4>
                                                        </a>
                                                        <p class="wk-price">$290.00 </p>
                                                        <a href="#" class="add-btn">Add to cart</a>
                                                        <a href="#" class="add-btn2"><i class="icon-heart icons"
                                                                                        aria-hidden="true"></i></a>
                                                        <a href="#" class="add-btn2"><i class="icon-refresh icons"></i></a>
                                                    </div>
                                                </div>
                                                <%-- /e-product --%>
                                            </div>
                                            <div class="bdr col-xs-12 col-sm-12 col-md-6">
                                                <%-- e-product --%>
                                                <div class="e-product">
                                                    <div class="pro-img">
                                                        <img src="${pageContext.request.contextPath}/mall/assets/images/elec-img2.jpg" alt="2">
                                                        <div class="hover-icon">
                                                            <a href="#"><i class="fa fa-search" aria-hidden="true"></i></a>
                                                        </div>
                                                    </div>
                                                    <div class="pro-text-outer">
                                                        <span>Macbook, Laptop</span>
                                                        <a href="#">
                                                            <h4> Apple Macbook Retina 23’ </h4>
                                                        </a>
                                                        <p class="wk-price">$290.00 </p>
                                                        <a href="#" class="add-btn">Add to cart</a>
                                                    </div>
                                                </div>
                                                <%-- /e-product --%>
                                            </div>
                                            <div class="bdr col-xs-12 col-sm-12 col-md-6">
                                                <%-- e-product --%>
                                                <div class="e-product">
                                                    <div class="pro-img">
                                                        <img src="${pageContext.request.contextPath}/mall/assets/images/elec-img3.jpg" alt="2">
                                                        <div class="hover-icon">
                                                            <a href="#"><i class="fa fa-search" aria-hidden="true"></i></a>
                                                        </div>
                                                    </div>
                                                    <div class="pro-text-outer">
                                                        <span>Macbook, Laptop</span>
                                                        <a href="#">
                                                            <h4> Apple Macbook Retina 23’ </h4>
                                                        </a>
                                                        <p class="wk-price">$290.00 </p>
                                                        <a href="#" class="add-btn">Add to cart</a>
                                                    </div>
                                                </div>
                                                <%-- /e-product --%>
                                            </div>
                                            <div class="bdr col-xs-12 col-sm-12 col-md-6">
                                                <%-- e-product --%>
                                                <div class="e-product">
                                                    <div class="pro-img">
                                                        <img src="${pageContext.request.contextPath}/mall/assets/images/elec-img4.jpg" alt="2">
                                                        <div class="hover-icon">
                                                            <a href="#"><i class="fa fa-search" aria-hidden="true"></i></a>
                                                        </div>
                                                    </div>
                                                    <div class="pro-text-outer">
                                                        <span>Macbook, Laptop</span>
                                                        <a href="#">
                                                            <h4> Apple Macbook Retina 23’ </h4>
                                                        </a>
                                                        <p class="wk-price">$290.00 </p>
                                                        <a href="#" class="add-btn">Add to cart</a>
                                                    </div>
                                                </div>
                                                <%-- /e-product --%>
                                            </div>
                                        </div>
                                    </div>
                                </div>


                            </div>
                            <%-- /tab-pane --%>
                            <%-- tab-pane --%>
                            <div id="laptop" class="tab-pane fade in">
                                <div id="owl-demo13" class="deals-wk2">
                                    <div class="item">
                                        <div class="bdr col-xs-12 col-sm-12 col-md-6">
                                            <%-- e-product --%>
                                            <div class="e-product">
                                                <div class="pro-img">
                                                    <img src="${pageContext.request.contextPath}/mall/assets/images/elec-img1.jpg" alt="2">
                                                    <div class="hover-icon">
                                                        <a href="#"><i class="fa fa-search" aria-hidden="true"></i></a>
                                                    </div>
                                                </div>
                                                <div class="pro-text-outer">
                                                    <span>Macbook, Laptop</span>
                                                    <a href="#">
                                                        <h4> Apple Macbook Retina 23’ </h4>
                                                    </a>
                                                    <p class="wk-price">$290.00 </p>
                                                    <a href="#" class="add-btn">Add to cart</a>
                                                    <a href="#" class="add-btn2"><i class="icon-heart icons"
                                                                                    aria-hidden="true"></i></a>
                                                    <a href="#" class="add-btn2"><i class="icon-refresh icons"></i></a>
                                                </div>
                                            </div>
                                            <%-- /e-product --%>
                                        </div>
                                        <div class="bdr col-xs-12 col-sm-12 col-md-6">
                                            <%-- e-product --%>
                                            <div class="e-product">
                                                <div class="pro-img">
                                                    <sup class="sale-tag">sale!</sup>
                                                    <img src="${pageContext.request.contextPath}/mall/assets/images/elec-img2.jpg" alt="2">
                                                    <div class="hover-icon">
                                                        <a href="#"><i class="fa fa-search" aria-hidden="true"></i></a>
                                                    </div>
                                                </div>
                                                <div class="pro-text-outer">
                                                    <span>Macbook, Laptop</span>
                                                    <a href="#">
                                                        <h4> Apple Macbook Retina 23’ </h4>
                                                    </a>
                                                    <p class="wk-price">$290.00 </p>
                                                    <a href="#" class="add-btn">Add to cart</a>
                                                </div>
                                            </div>
                                            <%-- /e-product --%>
                                        </div>
                                        <div class="bdr col-xs-12 col-sm-12 col-md-6">
                                            <%-- e-product --%>
                                            <div class="e-product">
                                                <div class="pro-img">
                                                    <sup class="sale-tag">sale!</sup>
                                                    <img src="${pageContext.request.contextPath}/mall/assets/images/elec-img3.jpg" alt="2">
                                                    <div class="hover-icon">
                                                        <a href="#"><i class="fa fa-search" aria-hidden="true"></i></a>
                                                    </div>
                                                </div>
                                                <div class="pro-text-outer">
                                                    <span>Macbook, Laptop</span>
                                                    <a href="#">
                                                        <h4> Apple Macbook Retina 23’ </h4>
                                                    </a>
                                                    <p class="wk-price">$290.00 </p>
                                                    <a href="#" class="add-btn">Add to cart</a>
                                                </div>
                                            </div>
                                            <%-- /e-product --%>
                                        </div>
                                        <div class="bdr col-xs-12 col-sm-12 col-md-6">
                                            <%-- e-product --%>
                                            <div class="e-product">
                                                <div class="pro-img">
                                                    <sup class="new-tag">NEW</sup>
                                                    <img src="${pageContext.request.contextPath}/mall/assets/images/elec-img4.jpg" alt="2">
                                                    <div class="hover-icon">
                                                        <a href="#"><i class="fa fa-search" aria-hidden="true"></i></a>
                                                    </div>
                                                </div>
                                                <div class="pro-text-outer">
                                                    <span>Macbook, Laptop</span>
                                                    <a href="#">
                                                        <h4> Apple Macbook Retina 23’ </h4>
                                                    </a>
                                                    <p class="wk-price">$290.00 </p>
                                                    <a href="#" class="add-btn">Add to cart</a>
                                                </div>
                                            </div>
                                            <%-- /e-product --%>
                                        </div>
                                    </div>
                                    <div class="item">
                                        <div class="bdr col-xs-12 col-sm-12 col-md-6">
                                            <%-- e-product --%>
                                            <div class="e-product">
                                                <div class="pro-img">
                                                    <sup class="sale-tag">sale!</sup>
                                                    <img src="${pageContext.request.contextPath}/mall/assets/images/elec-img1.jpg" alt="2">
                                                    <div class="hover-icon">
                                                        <a href="#"><i class="fa fa-search" aria-hidden="true"></i></a>
                                                    </div>
                                                </div>
                                                <div class="pro-text-outer">
                                                    <span>Macbook, Laptop</span>
                                                    <a href="#">
                                                        <h4> Apple Macbook Retina 23’ </h4>
                                                    </a>
                                                    <p class="wk-price">$290.00 </p>
                                                    <a href="#" class="add-btn">Add to cart</a>
                                                    <a href="#" class="add-btn2"><i class="icon-heart icons"
                                                                                    aria-hidden="true"></i></a>
                                                    <a href="#" class="add-btn2"><i class="icon-refresh icons"></i></a>
                                                </div>
                                            </div>
                                            <%-- /e-product --%>
                                        </div>
                                        <div class="bdr col-xs-12 col-sm-12 col-md-6">
                                            <%-- e-product --%>
                                            <div class="e-product">
                                                <div class="pro-img">
                                                    <img src="${pageContext.request.contextPath}/mall/assets/images/elec-img2.jpg" alt="2">
                                                    <div class="hover-icon">
                                                        <a href="#"><i class="fa fa-search" aria-hidden="true"></i></a>
                                                    </div>
                                                </div>
                                                <div class="pro-text-outer">
                                                    <span>Macbook, Laptop</span>
                                                    <a href="#">
                                                        <h4> Apple Macbook Retina 23’ </h4>
                                                    </a>
                                                    <p class="wk-price">$290.00 </p>
                                                    <a href="#" class="add-btn">Add to cart</a>
                                                </div>
                                            </div>
                                            <%-- /e-product --%>
                                        </div>
                                        <div class="bdr col-xs-12 col-sm-12 col-md-6">
                                            <%-- e-product --%>
                                            <div class="e-product">
                                                <div class="pro-img">
                                                    <img src="${pageContext.request.contextPath}/mall/assets/images/elec-img3.jpg" alt="2">
                                                    <div class="hover-icon">
                                                        <a href="#"><i class="fa fa-search" aria-hidden="true"></i></a>
                                                    </div>
                                                </div>
                                                <div class="pro-text-outer">
                                                    <span>Macbook, Laptop</span>
                                                    <a href="#">
                                                        <h4> Apple Macbook Retina 23’ </h4>
                                                    </a>
                                                    <p class="wk-price">$290.00 </p>
                                                    <a href="#" class="add-btn">Add to cart</a>
                                                </div>
                                            </div>
                                            <%-- /e-product --%>
                                        </div>
                                        <div class="bdr col-xs-12 col-sm-12 col-md-6">
                                            <%-- e-product --%>
                                            <div class="e-product">
                                                <div class="pro-img">
                                                    <img src="${pageContext.request.contextPath}/mall/assets/images/elec-img4.jpg" alt="2">
                                                    <div class="hover-icon">
                                                        <a href="#"><i class="fa fa-search" aria-hidden="true"></i></a>
                                                    </div>
                                                </div>
                                                <div class="pro-text-outer">
                                                    <span>Macbook, Laptop</span>
                                                    <a href="#">
                                                        <h4> Apple Macbook Retina 23’ </h4>
                                                    </a>
                                                    <p class="wk-price">$290.00 </p>
                                                    <a href="#" class="add-btn">Add to cart</a>
                                                </div>
                                            </div>
                                            <%-- /e-product --%>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <%-- /tab-pane --%>
                            <%-- tab-pane --%>
                            <div id="desktop" class="tab-pane fade in">
                                <div id="owl-demo14" class="deals-wk2">
                                    <div class="item">
                                        <div class="bdr col-xs-12 col-sm-12 col-md-6">
                                            <%-- e-product --%>
                                            <div class="e-product">
                                                <div class="pro-img">
                                                    <img src="${pageContext.request.contextPath}/mall/assets/images/elec-img1.jpg" alt="2">
                                                    <div class="hover-icon">
                                                        <a href="#"><i class="fa fa-search" aria-hidden="true"></i></a>
                                                    </div>
                                                </div>
                                                <div class="pro-text-outer">
                                                    <span>Macbook, Laptop</span>
                                                    <a href="#">
                                                        <h4> Apple Macbook Retina 23’ </h4>
                                                    </a>
                                                    <p class="wk-price">$290.00 </p>
                                                    <a href="#" class="add-btn">Add to cart</a>
                                                    <a href="#" class="add-btn2"><i class="icon-heart icons"
                                                                                    aria-hidden="true"></i></a>
                                                    <a href="#" class="add-btn2"><i class="icon-refresh icons"></i></a>
                                                </div>
                                            </div>
                                            <%-- /e-product --%>
                                        </div>
                                        <div class="bdr col-xs-12 col-sm-12 col-md-6">
                                            <%-- e-product --%>
                                            <div class="e-product">
                                                <div class="pro-img">
                                                    <sup class="sale-tag">sale!</sup>
                                                    <img src="${pageContext.request.contextPath}/mall/assets/images/elec-img2.jpg" alt="2">
                                                    <div class="hover-icon">
                                                        <a href="#"><i class="fa fa-search" aria-hidden="true"></i></a>
                                                    </div>
                                                </div>
                                                <div class="pro-text-outer">
                                                    <span>Macbook, Laptop</span>
                                                    <a href="#">
                                                        <h4> Apple Macbook Retina 23’ </h4>
                                                    </a>
                                                    <p class="wk-price">$290.00 </p>
                                                    <a href="#" class="add-btn">Add to cart</a>
                                                </div>
                                            </div>
                                            <%-- /e-product --%>
                                        </div>
                                        <div class="bdr col-xs-12 col-sm-12 col-md-6">
                                            <%-- e-product --%>
                                            <div class="e-product">
                                                <div class="pro-img">
                                                    <sup class="sale-tag">sale!</sup>
                                                    <img src="${pageContext.request.contextPath}/mall/assets/images/elec-img3.jpg" alt="2">
                                                    <div class="hover-icon">
                                                        <a href="#"><i class="fa fa-search" aria-hidden="true"></i></a>
                                                    </div>
                                                </div>
                                                <div class="pro-text-outer">
                                                    <span>Macbook, Laptop</span>
                                                    <a href="#">
                                                        <h4> Apple Macbook Retina 23’ </h4>
                                                    </a>
                                                    <p class="wk-price">$290.00 </p>
                                                    <a href="#" class="add-btn">Add to cart</a>
                                                </div>
                                            </div>
                                            <%-- /e-product --%>
                                        </div>
                                        <div class="bdr col-xs-12 col-sm-12 col-md-6">
                                            <%-- e-product --%>
                                            <div class="e-product">
                                                <div class="pro-img">
                                                    <sup class="new-tag">NEW</sup>
                                                    <img src="${pageContext.request.contextPath}/mall/assets/images/elec-img4.jpg" alt="2">
                                                    <div class="hover-icon">
                                                        <a href="#"><i class="fa fa-search" aria-hidden="true"></i></a>
                                                    </div>
                                                </div>
                                                <div class="pro-text-outer">
                                                    <span>Macbook, Laptop</span>
                                                    <a href="#">
                                                        <h4> Apple Macbook Retina 23’ </h4>
                                                    </a>
                                                    <p class="wk-price">$290.00 </p>
                                                    <a href="#" class="add-btn">Add to cart</a>
                                                </div>
                                            </div>
                                            <%-- /e-product --%>
                                        </div>
                                    </div>
                                    <div class="item">
                                        <div class="bdr col-xs-12 col-sm-12 col-md-6">
                                            <%-- e-product --%>
                                            <div class="e-product">
                                                <div class="pro-img">
                                                    <sup class="sale-tag">sale!</sup>
                                                    <img src="${pageContext.request.contextPath}/mall/assets/images/elec-img1.jpg" alt="2">
                                                    <div class="hover-icon">
                                                        <a href="#"><i class="fa fa-search" aria-hidden="true"></i></a>
                                                    </div>
                                                </div>
                                                <div class="pro-text-outer">
                                                    <span>Macbook, Laptop</span>
                                                    <a href="#">
                                                        <h4> Apple Macbook Retina 23’ </h4>
                                                    </a>
                                                    <p class="wk-price">$290.00 </p>
                                                    <a href="#" class="add-btn">Add to cart</a>
                                                    <a href="#" class="add-btn2"><i class="icon-heart icons"
                                                                                    aria-hidden="true"></i></a>
                                                    <a href="#" class="add-btn2"><i class="icon-refresh icons"></i></a>
                                                </div>
                                            </div>
                                            <%-- /e-product --%>
                                        </div>
                                        <div class="bdr col-xs-12 col-sm-12 col-md-6">
                                            <%-- e-product --%>
                                            <div class="e-product">
                                                <div class="pro-img">
                                                    <img src="${pageContext.request.contextPath}/mall/assets/images/elec-img2.jpg" alt="2">
                                                    <div class="hover-icon">
                                                        <a href="#"><i class="fa fa-search" aria-hidden="true"></i></a>
                                                    </div>
                                                </div>
                                                <div class="pro-text-outer">
                                                    <span>Macbook, Laptop</span>
                                                    <a href="#">
                                                        <h4> Apple Macbook Retina 23’ </h4>
                                                    </a>
                                                    <p class="wk-price">$290.00 </p>
                                                    <a href="#" class="add-btn">Add to cart</a>
                                                </div>
                                            </div>
                                            <%-- /e-product --%>
                                        </div>
                                        <div class="bdr col-xs-12 col-sm-12 col-md-6">
                                            <%-- e-product --%>
                                            <div class="e-product">
                                                <div class="pro-img">
                                                    <img src="${pageContext.request.contextPath}/mall/assets/images/elec-img3.jpg" alt="2">
                                                    <div class="hover-icon">
                                                        <a href="#"><i class="fa fa-search" aria-hidden="true"></i></a>
                                                    </div>
                                                </div>
                                                <div class="pro-text-outer">
                                                    <span>Macbook, Laptop</span>
                                                    <a href="#">
                                                        <h4> Apple Macbook Retina 23’ </h4>
                                                    </a>
                                                    <p class="wk-price">$290.00 </p>
                                                    <a href="#" class="add-btn">Add to cart</a>
                                                </div>
                                            </div>
                                            <%-- /e-product --%>
                                        </div>
                                        <div class="bdr col-xs-12 col-sm-12 col-md-6">
                                            <%-- e-product --%>
                                            <div class="e-product">
                                                <div class="pro-img">
                                                    <img src="${pageContext.request.contextPath}/mall/assets/images/elec-img4.jpg" alt="2">
                                                    <div class="hover-icon">
                                                        <a href="#"><i class="fa fa-search" aria-hidden="true"></i></a>
                                                    </div>
                                                </div>
                                                <div class="pro-text-outer">
                                                    <span>Macbook, Laptop</span>
                                                    <a href="#">
                                                        <h4> Apple Macbook Retina 23’ </h4>
                                                    </a>
                                                    <p class="wk-price">$290.00 </p>
                                                    <a href="#" class="add-btn">Add to cart</a>
                                                </div>
                                            </div>
                                            <%-- /e-product --%>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <%-- /tab-pane --%>
                            <%-- tab-pane --%>
                            <div id="tV" class="tab-pane fade in">
                                <div id="owl-demo15" class="deals-wk2">
                                    <div class="item">
                                        <div class="bdr col-xs-12 col-sm-12 col-md-6">
                                            <%-- e-product --%>
                                            <div class="e-product">
                                                <div class="pro-img">
                                                    <img src="${pageContext.request.contextPath}/mall/assets/images/elec-img1.jpg" alt="2">
                                                    <div class="hover-icon">
                                                        <a href="#"><i class="fa fa-search" aria-hidden="true"></i></a>
                                                    </div>
                                                </div>
                                                <div class="pro-text-outer">
                                                    <span>Macbook, Laptop</span>
                                                    <a href="#">
                                                        <h4> Apple Macbook Retina 23’ </h4>
                                                    </a>
                                                    <p class="wk-price">$290.00 </p>
                                                    <a href="#" class="add-btn">Add to cart</a>
                                                    <a href="#" class="add-btn2"><i class="icon-heart icons"
                                                                                    aria-hidden="true"></i></a>
                                                    <a href="#" class="add-btn2"><i class="icon-refresh icons"></i></a>
                                                </div>
                                            </div>
                                            <%-- /e-product --%>
                                        </div>
                                        <div class="bdr col-xs-12 col-sm-12 col-md-6">
                                            <%-- e-product --%>
                                            <div class="e-product">
                                                <div class="pro-img">
                                                    <sup class="sale-tag">sale!</sup>
                                                    <img src="${pageContext.request.contextPath}/mall/assets/images/elec-img2.jpg" alt="2">
                                                    <div class="hover-icon">
                                                        <a href="#"><i class="fa fa-search" aria-hidden="true"></i></a>
                                                    </div>
                                                </div>
                                                <div class="pro-text-outer">
                                                    <span>Macbook, Laptop</span>
                                                    <a href="#">
                                                        <h4> Apple Macbook Retina 23’ </h4>
                                                    </a>
                                                    <p class="wk-price">$290.00 </p>
                                                    <a href="#" class="add-btn">Add to cart</a>
                                                </div>
                                            </div>
                                            <%-- /e-product --%>
                                        </div>
                                        <div class="bdr col-xs-12 col-sm-12 col-md-6">
                                            <%-- e-product --%>
                                            <div class="e-product">
                                                <div class="pro-img">
                                                    <sup class="sale-tag">sale!</sup>
                                                    <img src="${pageContext.request.contextPath}/mall/assets/images/elec-img3.jpg" alt="2">
                                                    <div class="hover-icon">
                                                        <a href="#"><i class="fa fa-search" aria-hidden="true"></i></a>
                                                    </div>
                                                </div>
                                                <div class="pro-text-outer">
                                                    <span>Macbook, Laptop</span>
                                                    <a href="#">
                                                        <h4> Apple Macbook Retina 23’ </h4>
                                                    </a>
                                                    <p class="wk-price">$290.00 </p>
                                                    <a href="#" class="add-btn">Add to cart</a>
                                                </div>
                                            </div>
                                            <%-- /e-product --%>
                                        </div>
                                        <div class="bdr col-xs-12 col-sm-12 col-md-6">
                                            <%-- e-product --%>
                                            <div class="e-product">
                                                <div class="pro-img">
                                                    <sup class="new-tag">NEW</sup>
                                                    <img src="${pageContext.request.contextPath}/mall/assets/images/elec-img4.jpg" alt="2">
                                                    <div class="hover-icon">
                                                        <a href="#"><i class="fa fa-search" aria-hidden="true"></i></a>
                                                    </div>
                                                </div>
                                                <div class="pro-text-outer">
                                                    <span>Macbook, Laptop</span>
                                                    <a href="#">
                                                        <h4> Apple Macbook Retina 23’ </h4>
                                                    </a>
                                                    <p class="wk-price">$290.00 </p>
                                                    <a href="#" class="add-btn">Add to cart</a>
                                                </div>
                                            </div>
                                            <%-- /e-product --%>
                                        </div>
                                    </div>
                                    <div class="item">
                                        <div class="bdr col-xs-12 col-sm-12 col-md-6">
                                            <%-- e-product --%>
                                            <div class="e-product">
                                                <div class="pro-img">
                                                    <sup class="sale-tag">sale!</sup>
                                                    <img src="${pageContext.request.contextPath}/mall/assets/images/elec-img1.jpg" alt="2">
                                                    <div class="hover-icon">
                                                        <a href="#"><i class="fa fa-search" aria-hidden="true"></i></a>
                                                    </div>
                                                </div>
                                                <div class="pro-text-outer">
                                                    <span>Macbook, Laptop</span>
                                                    <a href="#">
                                                        <h4> Apple Macbook Retina 23’ </h4>
                                                    </a>
                                                    <p class="wk-price">$290.00 </p>
                                                    <a href="#" class="add-btn">Add to cart</a>
                                                    <a href="#" class="add-btn2"><i class="icon-heart icons"
                                                                                    aria-hidden="true"></i></a>
                                                    <a href="#" class="add-btn2"><i class="icon-refresh icons"></i></a>
                                                </div>
                                            </div>
                                            <%-- /e-product --%>
                                        </div>
                                        <div class="bdr col-xs-12 col-sm-12 col-md-6">
                                            <%-- e-product --%>
                                            <div class="e-product">
                                                <div class="pro-img">
                                                    <img src="${pageContext.request.contextPath}/mall/assets/images/elec-img2.jpg" alt="2">
                                                    <div class="hover-icon">
                                                        <a href="#"><i class="fa fa-search" aria-hidden="true"></i></a>
                                                    </div>
                                                </div>
                                                <div class="pro-text-outer">
                                                    <span>Macbook, Laptop</span>
                                                    <a href="#">
                                                        <h4> Apple Macbook Retina 23’ </h4>
                                                    </a>
                                                    <p class="wk-price">$290.00 </p>
                                                    <a href="#" class="add-btn">Add to cart</a>
                                                </div>
                                            </div>
                                            <%-- /e-product --%>
                                        </div>
                                        <div class="bdr col-xs-12 col-sm-12 col-md-6">
                                            <%-- e-product --%>
                                            <div class="e-product">
                                                <div class="pro-img">
                                                    <img src="${pageContext.request.contextPath}/mall/assets/images/elec-img3.jpg" alt="2">
                                                    <div class="hover-icon">
                                                        <a href="#"><i class="fa fa-search" aria-hidden="true"></i></a>
                                                    </div>
                                                </div>
                                                <div class="pro-text-outer">
                                                    <span>Macbook, Laptop</span>
                                                    <a href="#">
                                                        <h4> Apple Macbook Retina 23’ </h4>
                                                    </a>
                                                    <p class="wk-price">$290.00 </p>
                                                    <a href="#" class="add-btn">Add to cart</a>
                                                </div>
                                            </div>
                                            <%-- /e-product --%>
                                        </div>
                                        <div class="bdr col-xs-12 col-sm-12 col-md-6">
                                            <%-- e-product --%>
                                            <div class="e-product">
                                                <div class="pro-img">
                                                    <img src="${pageContext.request.contextPath}/mall/assets/images/elec-img4.jpg" alt="2">
                                                    <div class="hover-icon">
                                                        <a href="#"><i class="fa fa-search" aria-hidden="true"></i></a>
                                                    </div>
                                                </div>
                                                <div class="pro-text-outer">
                                                    <span>Macbook, Laptop</span>
                                                    <a href="#">
                                                        <h4> Apple Macbook Retina 23’ </h4>
                                                    </a>
                                                    <p class="wk-price">$290.00 </p>
                                                    <a href="#" class="add-btn">Add to cart</a>
                                                </div>
                                            </div>
                                            <%-- /e-product --%>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <%-- /tab-pane --%>
                            <%-- tab-pane --%>
                            <div id="tablets" class="tab-pane fade in">
                                <div id="owl-demo16" class="deals-wk2">
                                    <div class="item">
                                        <div class="bdr col-xs-12 col-sm-12 col-md-6">
                                            <%-- e-product --%>
                                            <div class="e-product">
                                                <div class="pro-img">
                                                    <img src="${pageContext.request.contextPath}/mall/assets/images/elec-img1.jpg" alt="2">
                                                    <div class="hover-icon">
                                                        <a href="#"><i class="fa fa-search" aria-hidden="true"></i></a>
                                                    </div>
                                                </div>
                                                <div class="pro-text-outer">
                                                    <span>Macbook, Laptop</span>
                                                    <a href="#">
                                                        <h4> Apple Macbook Retina 23’ </h4>
                                                    </a>
                                                    <p class="wk-price">$290.00 </p>
                                                    <a href="#" class="add-btn">Add to cart</a>
                                                    <a href="#" class="add-btn2"><i class="icon-heart icons"
                                                                                    aria-hidden="true"></i></a>
                                                    <a href="#" class="add-btn2"><i class="icon-refresh icons"></i></a>
                                                </div>
                                            </div>
                                            <%-- /e-product --%>
                                        </div>
                                        <div class="bdr col-xs-12 col-sm-12 col-md-6">
                                            <%-- e-product --%>
                                            <div class="e-product">
                                                <div class="pro-img">
                                                    <sup class="sale-tag">sale!</sup>
                                                    <img src="${pageContext.request.contextPath}/mall/assets/images/elec-img2.jpg" alt="2">
                                                    <div class="hover-icon">
                                                        <a href="#"><i class="fa fa-search" aria-hidden="true"></i></a>
                                                    </div>
                                                </div>
                                                <div class="pro-text-outer">
                                                    <span>Macbook, Laptop</span>
                                                    <a href="#">
                                                        <h4> Apple Macbook Retina 23’ </h4>
                                                    </a>
                                                    <p class="wk-price">$290.00 </p>
                                                    <a href="#" class="add-btn">Add to cart</a>
                                                </div>
                                            </div>
                                            <%-- /e-product --%>
                                        </div>
                                        <div class="bdr col-xs-12 col-sm-12 col-md-6">
                                            <%-- e-product --%>
                                            <div class="e-product">
                                                <div class="pro-img">
                                                    <sup class="sale-tag">sale!</sup>
                                                    <img src="${pageContext.request.contextPath}/mall/assets/images/elec-img3.jpg" alt="2">
                                                    <div class="hover-icon">
                                                        <a href="#"><i class="fa fa-search" aria-hidden="true"></i></a>
                                                    </div>
                                                </div>
                                                <div class="pro-text-outer">
                                                    <span>Macbook, Laptop</span>
                                                    <a href="#">
                                                        <h4> Apple Macbook Retina 23’ </h4>
                                                    </a>
                                                    <p class="wk-price">$290.00 </p>
                                                    <a href="#" class="add-btn">Add to cart</a>
                                                </div>
                                            </div>
                                            <%-- /e-product --%>
                                        </div>
                                        <div class="bdr col-xs-12 col-sm-12 col-md-6">
                                            <%-- e-product --%>
                                            <div class="e-product">
                                                <div class="pro-img">
                                                    <sup class="new-tag">NEW</sup>
                                                    <img src="${pageContext.request.contextPath}/mall/assets/images/elec-img4.jpg" alt="2">
                                                    <div class="hover-icon">
                                                        <a href="#"><i class="fa fa-search" aria-hidden="true"></i></a>
                                                    </div>
                                                </div>
                                                <div class="pro-text-outer">
                                                    <span>Macbook, Laptop</span>
                                                    <a href="#">
                                                        <h4> Apple Macbook Retina 23’ </h4>
                                                    </a>
                                                    <p class="wk-price">$290.00 </p>
                                                    <a href="#" class="add-btn">Add to cart</a>
                                                </div>
                                            </div>
                                            <%-- /e-product --%>
                                        </div>
                                    </div>
                                    <div class="item">
                                        <div class="bdr col-xs-12 col-sm-12 col-md-6">
                                            <%-- e-product --%>
                                            <div class="e-product">
                                                <div class="pro-img">
                                                    <sup class="sale-tag">sale!</sup>
                                                    <img src="${pageContext.request.contextPath}/mall/assets/images/elec-img1.jpg" alt="2">
                                                    <div class="hover-icon">
                                                        <a href="#"><i class="fa fa-search" aria-hidden="true"></i></a>
                                                    </div>
                                                </div>
                                                <div class="pro-text-outer">
                                                    <span>Macbook, Laptop</span>
                                                    <a href="#">
                                                        <h4> Apple Macbook Retina 23’ </h4>
                                                    </a>
                                                    <p class="wk-price">$290.00 </p>
                                                    <a href="#" class="add-btn">Add to cart</a>
                                                    <a href="#" class="add-btn2"><i class="icon-heart icons"
                                                                                    aria-hidden="true"></i></a>
                                                    <a href="#" class="add-btn2"><i class="icon-refresh icons"></i></a>
                                                </div>
                                            </div>
                                            <%-- /e-product --%>
                                        </div>
                                        <div class="bdr col-xs-12 col-sm-12 col-md-6">
                                            <%-- e-product --%>
                                            <div class="e-product">
                                                <div class="pro-img">
                                                    <img src="${pageContext.request.contextPath}/mall/assets/images/elec-img2.jpg" alt="2">
                                                    <div class="hover-icon">
                                                        <a href="#"><i class="fa fa-search" aria-hidden="true"></i></a>
                                                    </div>
                                                </div>
                                                <div class="pro-text-outer">
                                                    <span>Macbook, Laptop</span>
                                                    <a href="#">
                                                        <h4> Apple Macbook Retina 23’ </h4>
                                                    </a>
                                                    <p class="wk-price">$290.00 </p>
                                                    <a href="#" class="add-btn">Add to cart</a>
                                                </div>
                                            </div>
                                            <%-- /e-product --%>
                                        </div>
                                        <div class="bdr col-xs-12 col-sm-12 col-md-6">
                                            <%-- e-product --%>
                                            <div class="e-product">
                                                <div class="pro-img">
                                                    <img src="${pageContext.request.contextPath}/mall/assets/images/elec-img3.jpg" alt="2">
                                                    <div class="hover-icon">
                                                        <a href="#"><i class="fa fa-search" aria-hidden="true"></i></a>
                                                    </div>
                                                </div>
                                                <div class="pro-text-outer">
                                                    <span>Macbook, Laptop</span>
                                                    <a href="#">
                                                        <h4> Apple Macbook Retina 23’ </h4>
                                                    </a>
                                                    <p class="wk-price">$290.00 </p>
                                                    <a href="#" class="add-btn">Add to cart</a>
                                                </div>
                                            </div>
                                            <%-- /e-product --%>
                                        </div>
                                        <div class="bdr col-xs-12 col-sm-12 col-md-6">
                                            <%-- e-product --%>
                                            <div class="e-product">
                                                <div class="pro-img">
                                                    <img src="${pageContext.request.contextPath}/mall/assets/images/elec-img4.jpg" alt="2">
                                                    <div class="hover-icon">
                                                        <a href="#"><i class="fa fa-search" aria-hidden="true"></i></a>
                                                    </div>
                                                </div>
                                                <div class="pro-text-outer">
                                                    <span>Macbook, Laptop</span>
                                                    <a href="#">
                                                        <h4> Apple Macbook Retina 23’ </h4>
                                                    </a>
                                                    <p class="wk-price">$290.00 </p>
                                                    <a href="#" class="add-btn">Add to cart</a>
                                                </div>
                                            </div>
                                            <%-- /e-product --%>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <%-- /tab-pane --%>
                        </div>
                        <%-- /tab-content --%>

                    </div>
                </div>
            </div>
            <%-- /electonics --%>
            <%-- half-banner --%>
            <div class="half-banner">
                <div class="row">
                    <div class="col-xs-12 col-sm-6 col-md-6">
                        <a href="#" class="banner half-banner1">
                            <div class="text">
                                <h4>best digital</h4>
                                <h3>sale smartwatch</h3>
                                <div class="banner-price">
                                    $620.00 <span>$60.00  </span>
                                </div>
                            </div>
                        </a>
                    </div>
                    <a href="#" class="col-xs-12 col-sm-6 col-md-6">
                        <div class="banner half-banner2">
                            <div class="text">
                                <h4>strong prices</h4>
                                <h3>Lenovo Yoga Tablet 2</h3>
                                <div class="banner-price">
                                    $620.00 <span>$60.00  </span>
                                </div>
                            </div>
                        </div>
                    </a>
                </div>
            </div>
            <%-- /half-banner --%>
            <%-- title --%>
            <div class="title">
                <h2>
                    FASHION & CLOTHING
                </h2>
                <ul class="nav nav-tabs etabs">
                    <li class="active"><a data-toggle="tab" href="#men">Men’s</a></li>
                    <li><a data-toggle="tab" href="#women">Women’s</a></li>
                    <li><a data-toggle="tab" href="#kid">Kid’s</a></li>
                    <li><a data-toggle="tab" href="#clothing">Clothing</a></li>
                    <li><a data-toggle="tab" href="#shoes">Shoes</a></li>
                    <li><a data-toggle="tab" href="#handbag">Handbag</a></li>
                </ul>
            </div>
            <%-- /title --%>
            <%-- FASHION --%>
            <div class="electonics">

                <div class="brd2 col-xs-12 col-sm-3 col-md-3">
                    <div id="home-slider3" class="carousel slide carousel-fade" data-ride="carousel">
                        <%-- .home-slider --%>
                        <div class="carousel-inner">
                            <div class="item active">
                                <a class="ads" href="#">
                                    <img src="${pageContext.request.contextPath}/mall/assets/images/fs-add-banner.jpg" alt="add-banner"/>
                                </a>
                            </div>
                            <div class="item">
                                <a class="ads" href="#">
                                    <img src="${pageContext.request.contextPath}/mall/assets/images/fs-add-banner.jpg" alt="add-banner"/>
                                </a>
                            </div>
                        </div>
                        <%-- indicators --%>
                        <ol class="carousel-indicators">
                            <li data-target="#home-slider3" data-slide-to="0" class="active"></li>
                            <li data-target="#home-slider3" data-slide-to="1"></li>
                        </ol>
                        <%-- /indicators --%>
                        <%-- /.home-slider --%>
                    </div>
                </div>
                <div class="col-xs-12 col-sm-9 col-md-9">
                    <div class="row">
                        <%-- tab-content --%>
                        <div class="tab-content">
                            <%-- tab-pane --%>
                            <div id="men" class="tab-pane fade in active">
                                <div class="owl-demo-outer">
                                    <%-- #owl-demo --%>
                                    <div id="owl-demo9" class="deals-wk2">
                                        <div class="item">
                                            <div class="bdr col-xs-12 col-sm-12 col-md-6">
                                                <%-- e-product --%>
                                                <div class="e-product">
                                                    <div class="pro-img">
                                                        <img src="${pageContext.request.contextPath}/mall/assets/images/fc-img1.jpg" alt="2">
                                                        <div class="hover-icon">
                                                            <a href="#"><i class="fa fa-search" aria-hidden="true"></i></a>
                                                        </div>
                                                    </div>
                                                    <div class="pro-text-outer">
                                                        <span>Macbook, Laptop</span>
                                                        <a href="#">
                                                            <h4> Apple Macbook Retina 23’ </h4>
                                                        </a>
                                                        <p class="wk-price">$290.00 </p>
                                                        <a href="#" class="add-btn">Add to cart</a>
                                                        <a href="#" class="add-btn2"><i class="icon-heart icons"
                                                                                        aria-hidden="true"></i></a>
                                                        <a href="#" class="add-btn2"><i class="icon-refresh icons"></i></a>
                                                    </div>
                                                </div>
                                                <%-- /e-product --%>
                                            </div>
                                            <div class="bdr col-xs-12 col-sm-12 col-md-6">
                                                <%-- e-product --%>
                                                <div class="e-product">
                                                    <div class="pro-img">
                                                        <sup class="sale-tag">sale!</sup>
                                                        <img src="${pageContext.request.contextPath}/mall/assets/images/fc-img2.jpg" alt="2">
                                                        <div class="hover-icon">
                                                            <a href="#"><i class="fa fa-search" aria-hidden="true"></i></a>
                                                        </div>
                                                    </div>
                                                    <div class="pro-text-outer">
                                                        <span>Macbook, Laptop</span>
                                                        <a href="#">
                                                            <h4> Apple Macbook Retina 23’ </h4>
                                                        </a>
                                                        <p class="wk-price">$290.00 </p>
                                                        <a href="#" class="add-btn">Add to cart</a>
                                                    </div>
                                                </div>
                                                <%-- /e-product --%>
                                            </div>
                                            <div class="bdr col-xs-12 col-sm-12 col-md-6">
                                                <%-- e-product --%>
                                                <div class="e-product">
                                                    <div class="pro-img">
                                                        <sup class="sale-tag">sale!</sup>
                                                        <img src="${pageContext.request.contextPath}/mall/assets/images/fc-img3.jpg" alt="2">
                                                        <div class="hover-icon">
                                                            <a href="#"><i class="fa fa-search" aria-hidden="true"></i></a>
                                                        </div>
                                                    </div>
                                                    <div class="pro-text-outer">
                                                        <span>Macbook, Laptop</span>
                                                        <a href="#">
                                                            <h4> Apple Macbook Retina 23’ </h4>
                                                        </a>
                                                        <p class="wk-price">$290.00 </p>
                                                        <a href="#" class="add-btn">Add to cart</a>
                                                    </div>
                                                </div>
                                                <%-- /e-product --%>
                                            </div>
                                            <div class="bdr col-xs-12 col-sm-12 col-md-6">
                                                <%-- e-product --%>
                                                <div class="e-product">
                                                    <div class="pro-img">
                                                        <sup class="new-tag">NEW</sup>
                                                        <img src="${pageContext.request.contextPath}/mall/assets/images/fc-img4.jpg" alt="2">
                                                        <div class="hover-icon">
                                                            <a href="#"><i class="fa fa-search" aria-hidden="true"></i></a>
                                                        </div>
                                                    </div>
                                                    <div class="pro-text-outer">
                                                        <span>Macbook, Laptop</span>
                                                        <a href="#">
                                                            <h4> Apple Macbook Retina 23’ </h4>
                                                        </a>
                                                        <p class="wk-price">$290.00 </p>
                                                        <a href="#" class="add-btn">Add to cart</a>
                                                    </div>
                                                </div>
                                                <%-- /e-product --%>
                                            </div>
                                        </div>
                                        <div class="item">
                                            <div class="bdr col-xs-12 col-sm-12 col-md-6">
                                                <%-- e-product --%>
                                                <div class="e-product">
                                                    <div class="pro-img">
                                                        <sup class="sale-tag">sale!</sup>
                                                        <img src="${pageContext.request.contextPath}/mall/assets/images/fc-img1.jpg" alt="2">
                                                        <div class="hover-icon">
                                                            <a href="#"><i class="fa fa-search" aria-hidden="true"></i></a>
                                                        </div>
                                                    </div>
                                                    <div class="pro-text-outer">
                                                        <span>Macbook, Laptop</span>
                                                        <a href="#">
                                                            <h4> Apple Macbook Retina 23’ </h4>
                                                        </a>
                                                        <p class="wk-price">$290.00 </p>
                                                        <a href="#" class="add-btn">Add to cart</a>
                                                        <a href="#" class="add-btn2"><i class="icon-heart icons"
                                                                                        aria-hidden="true"></i></a>
                                                        <a href="#" class="add-btn2"><i class="icon-refresh icons"></i></a>
                                                    </div>
                                                </div>
                                                <%-- /e-product --%>
                                            </div>
                                            <div class="bdr col-xs-12 col-sm-12 col-md-6">
                                                <%-- e-product --%>
                                                <div class="e-product">
                                                    <div class="pro-img">
                                                        <img src="${pageContext.request.contextPath}/mall/assets/images/fc-img2.jpg" alt="2">
                                                        <div class="hover-icon">
                                                            <a href="#"><i class="fa fa-search" aria-hidden="true"></i></a>
                                                        </div>
                                                    </div>
                                                    <div class="pro-text-outer">
                                                        <span>Macbook, Laptop</span>
                                                        <a href="#">
                                                            <h4> Apple Macbook Retina 23’ </h4>
                                                        </a>
                                                        <p class="wk-price">$290.00 </p>
                                                        <a href="#" class="add-btn">Add to cart</a>
                                                    </div>
                                                </div>
                                                <%-- /e-product --%>
                                            </div>
                                            <div class="bdr col-xs-12 col-sm-12 col-md-6">
                                                <%-- e-product --%>
                                                <div class="e-product">
                                                    <div class="pro-img">
                                                        <img src="${pageContext.request.contextPath}/mall/assets/images/fc-img3.jpg" alt="2">
                                                        <div class="hover-icon">
                                                            <a href="#"><i class="fa fa-search" aria-hidden="true"></i></a>
                                                        </div>
                                                    </div>
                                                    <div class="pro-text-outer">
                                                        <span>Macbook, Laptop</span>
                                                        <a href="#">
                                                            <h4> Apple Macbook Retina 23’ </h4>
                                                        </a>
                                                        <p class="wk-price">$290.00 </p>
                                                        <a href="#" class="add-btn">Add to cart</a>
                                                    </div>
                                                </div>
                                                <%-- /e-product --%>
                                            </div>
                                            <div class="bdr col-xs-12 col-sm-12 col-md-6">
                                                <%-- e-product --%>
                                                <div class="e-product">
                                                    <div class="pro-img">
                                                        <img src="${pageContext.request.contextPath}/mall/assets/images/fc-img4.jpg" alt="2">
                                                        <div class="hover-icon">
                                                            <a href="#"><i class="fa fa-search" aria-hidden="true"></i></a>
                                                        </div>
                                                    </div>
                                                    <div class="pro-text-outer">
                                                        <span>Macbook, Laptop</span>
                                                        <a href="#">
                                                            <h4> Apple Macbook Retina 23’ </h4>
                                                        </a>
                                                        <p class="wk-price">$290.00 </p>
                                                        <a href="#" class="add-btn">Add to cart</a>
                                                    </div>
                                                </div>
                                                <%-- /e-product --%>
                                            </div>
                                        </div>
                                    </div>
                                </div>


                            </div>
                            <%-- /tab-pane --%>
                            <%-- tab-pane --%>
                            <div id="women" class="tab-pane fade in">
                                <div class="owl-demo-outer">
                                    <%-- #owl-demo --%>
                                    <div id="owl-demo17" class="deals-wk2">
                                        <div class="item">
                                            <div class="bdr col-xs-12 col-sm-12 col-md-6">
                                                <%-- e-product --%>
                                                <div class="e-product">
                                                    <div class="pro-img">
                                                        <img src="${pageContext.request.contextPath}/mall/assets/images/fc-img1.jpg" alt="2">
                                                        <div class="hover-icon">
                                                            <a href="#"><i class="fa fa-search" aria-hidden="true"></i></a>
                                                        </div>
                                                    </div>
                                                    <div class="pro-text-outer">
                                                        <span>Macbook, Laptop</span>
                                                        <a href="#">
                                                            <h4> Apple Macbook Retina 23’ </h4>
                                                        </a>
                                                        <p class="wk-price">$290.00 </p>
                                                        <a href="#" class="add-btn">Add to cart</a>
                                                        <a href="#" class="add-btn2"><i class="icon-heart icons"
                                                                                        aria-hidden="true"></i></a>
                                                        <a href="#" class="add-btn2"><i class="icon-refresh icons"></i></a>
                                                    </div>
                                                </div>
                                                <%-- /e-product --%>
                                            </div>
                                            <div class="bdr col-xs-12 col-sm-12 col-md-6">
                                                <%-- e-product --%>
                                                <div class="e-product">
                                                    <div class="pro-img">
                                                        <sup class="sale-tag">sale!</sup>
                                                        <img src="${pageContext.request.contextPath}/mall/assets/images/fc-img2.jpg" alt="2">
                                                        <div class="hover-icon">
                                                            <a href="#"><i class="fa fa-search" aria-hidden="true"></i></a>
                                                        </div>
                                                    </div>
                                                    <div class="pro-text-outer">
                                                        <span>Macbook, Laptop</span>
                                                        <a href="#">
                                                            <h4> Apple Macbook Retina 23’ </h4>
                                                        </a>
                                                        <p class="wk-price">$290.00 </p>
                                                        <a href="#" class="add-btn">Add to cart</a>
                                                    </div>
                                                </div>
                                                <%-- /e-product --%>
                                            </div>
                                            <div class="bdr col-xs-12 col-sm-12 col-md-6">
                                                <%-- e-product --%>
                                                <div class="e-product">
                                                    <div class="pro-img">
                                                        <sup class="sale-tag">sale!</sup>
                                                        <img src="${pageContext.request.contextPath}/mall/assets/images/fc-img3.jpg" alt="2">
                                                        <div class="hover-icon">
                                                            <a href="#"><i class="fa fa-search" aria-hidden="true"></i></a>
                                                        </div>
                                                    </div>
                                                    <div class="pro-text-outer">
                                                        <span>Macbook, Laptop</span>
                                                        <a href="#">
                                                            <h4> Apple Macbook Retina 23’ </h4>
                                                        </a>
                                                        <p class="wk-price">$290.00 </p>
                                                        <a href="#" class="add-btn">Add to cart</a>
                                                    </div>
                                                </div>
                                                <%-- /e-product --%>
                                            </div>
                                            <div class="bdr col-xs-12 col-sm-12 col-md-6">
                                                <%-- e-product --%>
                                                <div class="e-product">
                                                    <div class="pro-img">
                                                        <sup class="new-tag">NEW</sup>
                                                        <img src="${pageContext.request.contextPath}/mall/assets/images/fc-img4.jpg" alt="2">
                                                        <div class="hover-icon">
                                                            <a href="#"><i class="fa fa-search" aria-hidden="true"></i></a>
                                                        </div>
                                                    </div>
                                                    <div class="pro-text-outer">
                                                        <span>Macbook, Laptop</span>
                                                        <a href="#">
                                                            <h4> Apple Macbook Retina 23’ </h4>
                                                        </a>
                                                        <p class="wk-price">$290.00 </p>
                                                        <a href="#" class="add-btn">Add to cart</a>
                                                    </div>
                                                </div>
                                                <%-- /e-product --%>
                                            </div>
                                        </div>
                                        <div class="item">
                                            <div class="bdr col-xs-12 col-sm-12 col-md-6">
                                                <%-- e-product --%>
                                                <div class="e-product">
                                                    <div class="pro-img">
                                                        <sup class="sale-tag">sale!</sup>
                                                        <img src="${pageContext.request.contextPath}/mall/assets/images/fc-img1.jpg" alt="2">
                                                        <div class="hover-icon">
                                                            <a href="#"><i class="fa fa-search" aria-hidden="true"></i></a>
                                                        </div>
                                                    </div>
                                                    <div class="pro-text-outer">
                                                        <span>Macbook, Laptop</span>
                                                        <a href="#">
                                                            <h4> Apple Macbook Retina 23’ </h4>
                                                        </a>
                                                        <p class="wk-price">$290.00 </p>
                                                        <a href="#" class="add-btn">Add to cart</a>
                                                        <a href="#" class="add-btn2"><i class="icon-heart icons"
                                                                                        aria-hidden="true"></i></a>
                                                        <a href="#" class="add-btn2"><i class="icon-refresh icons"></i></a>
                                                    </div>
                                                </div>
                                                <%-- /e-product --%>
                                            </div>
                                            <div class="bdr col-xs-12 col-sm-12 col-md-6">
                                                <%-- e-product --%>
                                                <div class="e-product">
                                                    <div class="pro-img">
                                                        <img src="${pageContext.request.contextPath}/mall/assets/images/fc-img2.jpg" alt="2">
                                                        <div class="hover-icon">
                                                            <a href="#"><i class="fa fa-search" aria-hidden="true"></i></a>
                                                        </div>
                                                    </div>
                                                    <div class="pro-text-outer">
                                                        <span>Macbook, Laptop</span>
                                                        <a href="#">
                                                            <h4> Apple Macbook Retina 23’ </h4>
                                                        </a>
                                                        <p class="wk-price">$290.00 </p>
                                                        <a href="#" class="add-btn">Add to cart</a>
                                                    </div>
                                                </div>
                                                <%-- /e-product --%>
                                            </div>
                                            <div class="bdr col-xs-12 col-sm-12 col-md-6">
                                                <%-- e-product --%>
                                                <div class="e-product">
                                                    <div class="pro-img">
                                                        <img src="${pageContext.request.contextPath}/mall/assets/images/fc-img3.jpg" alt="2">
                                                        <div class="hover-icon">
                                                            <a href="#"><i class="fa fa-search" aria-hidden="true"></i></a>
                                                        </div>
                                                    </div>
                                                    <div class="pro-text-outer">
                                                        <span>Macbook, Laptop</span>
                                                        <a href="#">
                                                            <h4> Apple Macbook Retina 23’ </h4>
                                                        </a>
                                                        <p class="wk-price">$290.00 </p>
                                                        <a href="#" class="add-btn">Add to cart</a>
                                                    </div>
                                                </div>
                                                <%-- /e-product --%>
                                            </div>
                                            <div class="bdr col-xs-12 col-sm-12 col-md-6">
                                                <%-- e-product --%>
                                                <div class="e-product">
                                                    <div class="pro-img">
                                                        <img src="${pageContext.request.contextPath}/mall/assets/images/fc-img4.jpg" alt="2">
                                                        <div class="hover-icon">
                                                            <a href="#"><i class="fa fa-search" aria-hidden="true"></i></a>
                                                        </div>
                                                    </div>
                                                    <div class="pro-text-outer">
                                                        <span>Macbook, Laptop</span>
                                                        <a href="#">
                                                            <h4> Apple Macbook Retina 23’ </h4>
                                                        </a>
                                                        <p class="wk-price">$290.00 </p>
                                                        <a href="#" class="add-btn">Add to cart</a>
                                                    </div>
                                                </div>
                                                <%-- /e-product --%>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <%-- /tab-pane --%>
                            <%-- tab-pane --%>
                            <div id="kid" class="tab-pane fade in">
                                <div class="owl-demo-outer">
                                    <%-- #owl-demo --%>
                                    <div id="owl-demo18" class="deals-wk2">
                                        <div class="item">
                                            <div class="bdr col-xs-12 col-sm-12 col-md-6">
                                                <%-- e-product --%>
                                                <div class="e-product">
                                                    <div class="pro-img">
                                                        <img src="${pageContext.request.contextPath}/mall/assets/images/fc-img1.jpg" alt="2">
                                                        <div class="hover-icon">
                                                            <a href="#"><i class="fa fa-search" aria-hidden="true"></i></a>
                                                        </div>
                                                    </div>
                                                    <div class="pro-text-outer">
                                                        <span>Macbook, Laptop</span>
                                                        <a href="#">
                                                            <h4> Apple Macbook Retina 23’ </h4>
                                                        </a>
                                                        <p class="wk-price">$290.00 </p>
                                                        <a href="#" class="add-btn">Add to cart</a>
                                                        <a href="#" class="add-btn2"><i class="icon-heart icons"
                                                                                        aria-hidden="true"></i></a>
                                                        <a href="#" class="add-btn2"><i class="icon-refresh icons"></i></a>
                                                    </div>
                                                </div>
                                                <%-- /e-product --%>
                                            </div>
                                            <div class="bdr col-xs-12 col-sm-12 col-md-6">
                                                <%-- e-product --%>
                                                <div class="e-product">
                                                    <div class="pro-img">
                                                        <sup class="sale-tag">sale!</sup>
                                                        <img src="${pageContext.request.contextPath}/mall/assets/images/fc-img2.jpg" alt="2">
                                                        <div class="hover-icon">
                                                            <a href="#"><i class="fa fa-search" aria-hidden="true"></i></a>
                                                        </div>
                                                    </div>
                                                    <div class="pro-text-outer">
                                                        <span>Macbook, Laptop</span>
                                                        <a href="#">
                                                            <h4> Apple Macbook Retina 23’ </h4>
                                                        </a>
                                                        <p class="wk-price">$290.00 </p>
                                                        <a href="#" class="add-btn">Add to cart</a>
                                                    </div>
                                                </div>
                                                <%-- /e-product --%>
                                            </div>
                                            <div class="bdr col-xs-12 col-sm-12 col-md-6">
                                                <%-- e-product --%>
                                                <div class="e-product">
                                                    <div class="pro-img">
                                                        <sup class="sale-tag">sale!</sup>
                                                        <img src="${pageContext.request.contextPath}/mall/assets/images/fc-img3.jpg" alt="2">
                                                        <div class="hover-icon">
                                                            <a href="#"><i class="fa fa-search" aria-hidden="true"></i></a>
                                                        </div>
                                                    </div>
                                                    <div class="pro-text-outer">
                                                        <span>Macbook, Laptop</span>
                                                        <a href="#">
                                                            <h4> Apple Macbook Retina 23’ </h4>
                                                        </a>
                                                        <p class="wk-price">$290.00 </p>
                                                        <a href="#" class="add-btn">Add to cart</a>
                                                    </div>
                                                </div>
                                                <%-- /e-product --%>
                                            </div>
                                            <div class="bdr col-xs-12 col-sm-12 col-md-6">
                                                <%-- e-product --%>
                                                <div class="e-product">
                                                    <div class="pro-img">
                                                        <sup class="new-tag">NEW</sup>
                                                        <img src="${pageContext.request.contextPath}/mall/assets/images/fc-img4.jpg" alt="2">
                                                        <div class="hover-icon">
                                                            <a href="#"><i class="fa fa-search" aria-hidden="true"></i></a>
                                                        </div>
                                                    </div>
                                                    <div class="pro-text-outer">
                                                        <span>Macbook, Laptop</span>
                                                        <a href="#">
                                                            <h4> Apple Macbook Retina 23’ </h4>
                                                        </a>
                                                        <p class="wk-price">$290.00 </p>
                                                        <a href="#" class="add-btn">Add to cart</a>
                                                    </div>
                                                </div>
                                                <%-- /e-product --%>
                                            </div>
                                        </div>
                                        <div class="item">
                                            <div class="bdr col-xs-12 col-sm-12 col-md-6">
                                                <%-- e-product --%>
                                                <div class="e-product">
                                                    <div class="pro-img">
                                                        <sup class="sale-tag">sale!</sup>
                                                        <img src="${pageContext.request.contextPath}/mall/assets/images/fc-img1.jpg" alt="2">
                                                        <div class="hover-icon">
                                                            <a href="#"><i class="fa fa-search" aria-hidden="true"></i></a>
                                                        </div>
                                                    </div>
                                                    <div class="pro-text-outer">
                                                        <span>Macbook, Laptop</span>
                                                        <a href="#">
                                                            <h4> Apple Macbook Retina 23’ </h4>
                                                        </a>
                                                        <p class="wk-price">$290.00 </p>
                                                        <a href="#" class="add-btn">Add to cart</a>
                                                        <a href="#" class="add-btn2"><i class="icon-heart icons"
                                                                                        aria-hidden="true"></i></a>
                                                        <a href="#" class="add-btn2"><i class="icon-refresh icons"></i></a>
                                                    </div>
                                                </div>
                                                <%-- /e-product --%>
                                            </div>
                                            <div class="bdr col-xs-12 col-sm-12 col-md-6">
                                                <%-- e-product --%>
                                                <div class="e-product">
                                                    <div class="pro-img">
                                                        <img src="${pageContext.request.contextPath}/mall/assets/images/fc-img2.jpg" alt="2">
                                                        <div class="hover-icon">
                                                            <a href="#"><i class="fa fa-search" aria-hidden="true"></i></a>
                                                        </div>
                                                    </div>
                                                    <div class="pro-text-outer">
                                                        <span>Macbook, Laptop</span>
                                                        <a href="#">
                                                            <h4> Apple Macbook Retina 23’ </h4>
                                                        </a>
                                                        <p class="wk-price">$290.00 </p>
                                                        <a href="#" class="add-btn">Add to cart</a>
                                                    </div>
                                                </div>
                                                <%-- /e-product --%>
                                            </div>
                                            <div class="bdr col-xs-12 col-sm-12 col-md-6">
                                                <%-- e-product --%>
                                                <div class="e-product">
                                                    <div class="pro-img">
                                                        <img src="${pageContext.request.contextPath}/mall/assets/images/fc-img3.jpg" alt="2">
                                                        <div class="hover-icon">
                                                            <a href="#"><i class="fa fa-search" aria-hidden="true"></i></a>
                                                        </div>
                                                    </div>
                                                    <div class="pro-text-outer">
                                                        <span>Macbook, Laptop</span>
                                                        <a href="#">
                                                            <h4> Apple Macbook Retina 23’ </h4>
                                                        </a>
                                                        <p class="wk-price">$290.00 </p>
                                                        <a href="#" class="add-btn">Add to cart</a>
                                                    </div>
                                                </div>
                                                <%-- /e-product --%>
                                            </div>
                                            <div class="bdr col-xs-12 col-sm-12 col-md-6">
                                                <%-- e-product --%>
                                                <div class="e-product">
                                                    <div class="pro-img">
                                                        <img src="${pageContext.request.contextPath}/mall/assets/images/fc-img4.jpg" alt="2">
                                                        <div class="hover-icon">
                                                            <a href="#"><i class="fa fa-search" aria-hidden="true"></i></a>
                                                        </div>
                                                    </div>
                                                    <div class="pro-text-outer">
                                                        <span>Macbook, Laptop</span>
                                                        <a href="#">
                                                            <h4> Apple Macbook Retina 23’ </h4>
                                                        </a>
                                                        <p class="wk-price">$290.00 </p>
                                                        <a href="#" class="add-btn">Add to cart</a>
                                                    </div>
                                                </div>
                                                <%-- /e-product --%>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <%-- /tab-pane --%>
                            <%-- tab-pane --%>
                            <div id="clothing" class="tab-pane fade in">
                                <div class="owl-demo-outer">
                                    <%-- #owl-demo --%>
                                    <div id="owl-demo19" class="deals-wk2">
                                        <div class="item">
                                            <div class="bdr col-xs-12 col-sm-12 col-md-6">
                                                <%-- e-product --%>
                                                <div class="e-product">
                                                    <div class="pro-img">
                                                        <img src="${pageContext.request.contextPath}/mall/assets/images/fc-img1.jpg" alt="2">
                                                        <div class="hover-icon">
                                                            <a href="#"><i class="fa fa-search" aria-hidden="true"></i></a>
                                                        </div>
                                                    </div>
                                                    <div class="pro-text-outer">
                                                        <span>Macbook, Laptop</span>
                                                        <a href="#">
                                                            <h4> Apple Macbook Retina 23’ </h4>
                                                        </a>
                                                        <p class="wk-price">$290.00 </p>
                                                        <a href="#" class="add-btn">Add to cart</a>
                                                        <a href="#" class="add-btn2"><i class="icon-heart icons"
                                                                                        aria-hidden="true"></i></a>
                                                        <a href="#" class="add-btn2"><i class="icon-refresh icons"></i></a>
                                                    </div>
                                                </div>
                                                <%-- /e-product --%>
                                            </div>
                                            <div class="bdr col-xs-12 col-sm-12 col-md-6">
                                                <%-- e-product --%>
                                                <div class="e-product">
                                                    <div class="pro-img">
                                                        <sup class="sale-tag">sale!</sup>
                                                        <img src="${pageContext.request.contextPath}/mall/assets/images/fc-img2.jpg" alt="2">
                                                        <div class="hover-icon">
                                                            <a href="#"><i class="fa fa-search" aria-hidden="true"></i></a>
                                                        </div>
                                                    </div>
                                                    <div class="pro-text-outer">
                                                        <span>Macbook, Laptop</span>
                                                        <a href="#">
                                                            <h4> Apple Macbook Retina 23’ </h4>
                                                        </a>
                                                        <p class="wk-price">$290.00 </p>
                                                        <a href="#" class="add-btn">Add to cart</a>
                                                    </div>
                                                </div>
                                                <%-- /e-product --%>
                                            </div>
                                            <div class="bdr col-xs-12 col-sm-12 col-md-6">
                                                <%-- e-product --%>
                                                <div class="e-product">
                                                    <div class="pro-img">
                                                        <sup class="sale-tag">sale!</sup>
                                                        <img src="${pageContext.request.contextPath}/mall/assets/images/fc-img3.jpg" alt="2">
                                                        <div class="hover-icon">
                                                            <a href="#"><i class="fa fa-search" aria-hidden="true"></i></a>
                                                        </div>
                                                    </div>
                                                    <div class="pro-text-outer">
                                                        <span>Macbook, Laptop</span>
                                                        <a href="#">
                                                            <h4> Apple Macbook Retina 23’ </h4>
                                                        </a>
                                                        <p class="wk-price">$290.00 </p>
                                                        <a href="#" class="add-btn">Add to cart</a>
                                                    </div>
                                                </div>
                                                <%-- /e-product --%>
                                            </div>
                                            <div class="bdr col-xs-12 col-sm-12 col-md-6">
                                                <%-- e-product --%>
                                                <div class="e-product">
                                                    <div class="pro-img">
                                                        <sup class="new-tag">NEW</sup>
                                                        <img src="${pageContext.request.contextPath}/mall/assets/images/fc-img4.jpg" alt="2">
                                                        <div class="hover-icon">
                                                            <a href="#"><i class="fa fa-search" aria-hidden="true"></i></a>
                                                        </div>
                                                    </div>
                                                    <div class="pro-text-outer">
                                                        <span>Macbook, Laptop</span>
                                                        <a href="#">
                                                            <h4> Apple Macbook Retina 23’ </h4>
                                                        </a>
                                                        <p class="wk-price">$290.00 </p>
                                                        <a href="#" class="add-btn">Add to cart</a>
                                                    </div>
                                                </div>
                                                <%-- /e-product --%>
                                            </div>
                                        </div>
                                        <div class="item">
                                            <div class="bdr col-xs-12 col-sm-12 col-md-6">
                                                <%-- e-product --%>
                                                <div class="e-product">
                                                    <div class="pro-img">
                                                        <sup class="sale-tag">sale!</sup>
                                                        <img src="${pageContext.request.contextPath}/mall/assets/images/fc-img1.jpg" alt="2">
                                                        <div class="hover-icon">
                                                            <a href="#"><i class="fa fa-search" aria-hidden="true"></i></a>
                                                        </div>
                                                    </div>
                                                    <div class="pro-text-outer">
                                                        <span>Macbook, Laptop</span>
                                                        <a href="#">
                                                            <h4> Apple Macbook Retina 23’ </h4>
                                                        </a>
                                                        <p class="wk-price">$290.00 </p>
                                                        <a href="#" class="add-btn">Add to cart</a>
                                                        <a href="#" class="add-btn2"><i class="icon-heart icons"
                                                                                        aria-hidden="true"></i></a>
                                                        <a href="#" class="add-btn2"><i class="icon-refresh icons"></i></a>
                                                    </div>
                                                </div>
                                                <%-- /e-product --%>
                                            </div>
                                            <div class="bdr col-xs-12 col-sm-12 col-md-6">
                                                <%-- e-product --%>
                                                <div class="e-product">
                                                    <div class="pro-img">
                                                        <img src="${pageContext.request.contextPath}/mall/assets/images/fc-img2.jpg" alt="2">
                                                        <div class="hover-icon">
                                                            <a href="#"><i class="fa fa-search" aria-hidden="true"></i></a>
                                                        </div>
                                                    </div>
                                                    <div class="pro-text-outer">
                                                        <span>Macbook, Laptop</span>
                                                        <a href="#">
                                                            <h4> Apple Macbook Retina 23’ </h4>
                                                        </a>
                                                        <p class="wk-price">$290.00 </p>
                                                        <a href="#" class="add-btn">Add to cart</a>
                                                    </div>
                                                </div>
                                                <%-- /e-product --%>
                                            </div>
                                            <div class="bdr col-xs-12 col-sm-12 col-md-6">
                                                <%-- e-product --%>
                                                <div class="e-product">
                                                    <div class="pro-img">
                                                        <img src="${pageContext.request.contextPath}/mall/assets/images/fc-img3.jpg" alt="2">
                                                        <div class="hover-icon">
                                                            <a href="#"><i class="fa fa-search" aria-hidden="true"></i></a>
                                                        </div>
                                                    </div>
                                                    <div class="pro-text-outer">
                                                        <span>Macbook, Laptop</span>
                                                        <a href="#">
                                                            <h4> Apple Macbook Retina 23’ </h4>
                                                        </a>
                                                        <p class="wk-price">$290.00 </p>
                                                        <a href="#" class="add-btn">Add to cart</a>
                                                    </div>
                                                </div>
                                                <%-- /e-product --%>
                                            </div>
                                            <div class="bdr col-xs-12 col-sm-12 col-md-6">
                                                <%-- e-product --%>
                                                <div class="e-product">
                                                    <div class="pro-img">
                                                        <img src="${pageContext.request.contextPath}/mall/assets/images/fc-img4.jpg" alt="2">
                                                        <div class="hover-icon">
                                                            <a href="#"><i class="fa fa-search" aria-hidden="true"></i></a>
                                                        </div>
                                                    </div>
                                                    <div class="pro-text-outer">
                                                        <span>Macbook, Laptop</span>
                                                        <a href="#">
                                                            <h4> Apple Macbook Retina 23’ </h4>
                                                        </a>
                                                        <p class="wk-price">$290.00 </p>
                                                        <a href="#" class="add-btn">Add to cart</a>
                                                    </div>
                                                </div>
                                                <%-- /e-product --%>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <%-- /tab-pane --%>
                            <%-- tab-pane --%>
                            <div id="shoes" class="tab-pane fade in">
                                <div class="owl-demo-outer">
                                    <%-- #owl-demo --%>
                                    <div id="owl-demo20" class="deals-wk2">
                                        <div class="item">
                                            <div class="bdr col-xs-12 col-sm-12 col-md-6">
                                                <%-- e-product --%>
                                                <div class="e-product">
                                                    <div class="pro-img">
                                                        <img src="${pageContext.request.contextPath}/mall/assets/images/fc-img1.jpg" alt="2">
                                                        <div class="hover-icon">
                                                            <a href="#"><i class="fa fa-search" aria-hidden="true"></i></a>
                                                        </div>
                                                    </div>
                                                    <div class="pro-text-outer">
                                                        <span>Macbook, Laptop</span>
                                                        <a href="#">
                                                            <h4> Apple Macbook Retina 23’ </h4>
                                                        </a>
                                                        <p class="wk-price">$290.00 </p>
                                                        <a href="#" class="add-btn">Add to cart</a>
                                                        <a href="#" class="add-btn2"><i class="icon-heart icons"
                                                                                        aria-hidden="true"></i></a>
                                                        <a href="#" class="add-btn2"><i class="icon-refresh icons"></i></a>
                                                    </div>
                                                </div>
                                                <%-- /e-product --%>
                                            </div>
                                            <div class="bdr col-xs-12 col-sm-12 col-md-6">
                                                <%-- e-product --%>
                                                <div class="e-product">
                                                    <div class="pro-img">
                                                        <sup class="sale-tag">sale!</sup>
                                                        <img src="${pageContext.request.contextPath}/mall/assets/images/fc-img2.jpg" alt="2">
                                                        <div class="hover-icon">
                                                            <a href="#"><i class="fa fa-search" aria-hidden="true"></i></a>
                                                        </div>
                                                    </div>
                                                    <div class="pro-text-outer">
                                                        <span>Macbook, Laptop</span>
                                                        <a href="#">
                                                            <h4> Apple Macbook Retina 23’ </h4>
                                                        </a>
                                                        <p class="wk-price">$290.00 </p>
                                                        <a href="#" class="add-btn">Add to cart</a>
                                                    </div>
                                                </div>
                                                <%-- /e-product --%>
                                            </div>
                                            <div class="bdr col-xs-12 col-sm-12 col-md-6">
                                                <%-- e-product --%>
                                                <div class="e-product">
                                                    <div class="pro-img">
                                                        <sup class="sale-tag">sale!</sup>
                                                        <img src="${pageContext.request.contextPath}/mall/assets/images/fc-img3.jpg" alt="2">
                                                        <div class="hover-icon">
                                                            <a href="#"><i class="fa fa-search" aria-hidden="true"></i></a>
                                                        </div>
                                                    </div>
                                                    <div class="pro-text-outer">
                                                        <span>Macbook, Laptop</span>
                                                        <a href="#">
                                                            <h4> Apple Macbook Retina 23’ </h4>
                                                        </a>
                                                        <p class="wk-price">$290.00 </p>
                                                        <a href="#" class="add-btn">Add to cart</a>
                                                    </div>
                                                </div>
                                                <%-- /e-product --%>
                                            </div>
                                            <div class="bdr col-xs-12 col-sm-12 col-md-6">
                                                <%-- e-product --%>
                                                <div class="e-product">
                                                    <div class="pro-img">
                                                        <sup class="new-tag">NEW</sup>
                                                        <img src="${pageContext.request.contextPath}/mall/assets/images/fc-img4.jpg" alt="2">
                                                        <div class="hover-icon">
                                                            <a href="#"><i class="fa fa-search" aria-hidden="true"></i></a>
                                                        </div>
                                                    </div>
                                                    <div class="pro-text-outer">
                                                        <span>Macbook, Laptop</span>
                                                        <a href="#">
                                                            <h4> Apple Macbook Retina 23’ </h4>
                                                        </a>
                                                        <p class="wk-price">$290.00 </p>
                                                        <a href="#" class="add-btn">Add to cart</a>
                                                    </div>
                                                </div>
                                                <%-- /e-product --%>
                                            </div>
                                        </div>
                                        <div class="item">
                                            <div class="bdr col-xs-12 col-sm-12 col-md-6">
                                                <%-- e-product --%>
                                                <div class="e-product">
                                                    <div class="pro-img">
                                                        <sup class="sale-tag">sale!</sup>
                                                        <img src="${pageContext.request.contextPath}/mall/assets/images/fc-img1.jpg" alt="2">
                                                        <div class="hover-icon">
                                                            <a href="#"><i class="fa fa-search" aria-hidden="true"></i></a>
                                                        </div>
                                                    </div>
                                                    <div class="pro-text-outer">
                                                        <span>Macbook, Laptop</span>
                                                        <a href="#">
                                                            <h4> Apple Macbook Retina 23’ </h4>
                                                        </a>
                                                        <p class="wk-price">$290.00 </p>
                                                        <a href="#" class="add-btn">Add to cart</a>
                                                        <a href="#" class="add-btn2"><i class="icon-heart icons"
                                                                                        aria-hidden="true"></i></a>
                                                        <a href="#" class="add-btn2"><i class="icon-refresh icons"></i></a>
                                                    </div>
                                                </div>
                                                <%-- /e-product --%>
                                            </div>
                                            <div class="bdr col-xs-12 col-sm-12 col-md-6">
                                                <%-- e-product --%>
                                                <div class="e-product">
                                                    <div class="pro-img">
                                                        <img src="${pageContext.request.contextPath}/mall/assets/images/fc-img2.jpg" alt="2">
                                                        <div class="hover-icon">
                                                            <a href="#"><i class="fa fa-search" aria-hidden="true"></i></a>
                                                        </div>
                                                    </div>
                                                    <div class="pro-text-outer">
                                                        <span>Macbook, Laptop</span>
                                                        <a href="#">
                                                            <h4> Apple Macbook Retina 23’ </h4>
                                                        </a>
                                                        <p class="wk-price">$290.00 </p>
                                                        <a href="#" class="add-btn">Add to cart</a>
                                                    </div>
                                                </div>
                                                <%-- /e-product --%>
                                            </div>
                                            <div class="bdr col-xs-12 col-sm-12 col-md-6">
                                                <%-- e-product --%>
                                                <div class="e-product">
                                                    <div class="pro-img">
                                                        <img src="${pageContext.request.contextPath}/mall/assets/images/fc-img3.jpg" alt="2">
                                                        <div class="hover-icon">
                                                            <a href="#"><i class="fa fa-search" aria-hidden="true"></i></a>
                                                        </div>
                                                    </div>
                                                    <div class="pro-text-outer">
                                                        <span>Macbook, Laptop</span>
                                                        <a href="#">
                                                            <h4> Apple Macbook Retina 23’ </h4>
                                                        </a>
                                                        <p class="wk-price">$290.00 </p>
                                                        <a href="#" class="add-btn">Add to cart</a>
                                                    </div>
                                                </div>
                                                <%-- /e-product --%>
                                            </div>
                                            <div class="bdr col-xs-12 col-sm-12 col-md-6">
                                                <%-- e-product --%>
                                                <div class="e-product">
                                                    <div class="pro-img">
                                                        <img src="${pageContext.request.contextPath}/mall/assets/images/fc-img4.jpg" alt="2">
                                                        <div class="hover-icon">
                                                            <a href="#"><i class="fa fa-search" aria-hidden="true"></i></a>
                                                        </div>
                                                    </div>
                                                    <div class="pro-text-outer">
                                                        <span>Macbook, Laptop</span>
                                                        <a href="#">
                                                            <h4> Apple Macbook Retina 23’ </h4>
                                                        </a>
                                                        <p class="wk-price">$290.00 </p>
                                                        <a href="#" class="add-btn">Add to cart</a>
                                                    </div>
                                                </div>
                                                <%-- /e-product --%>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <%-- /tab-pane --%>
                            <%-- tab-pane --%>
                            <div id="handbag" class="tab-pane fade in">
                                <div class="owl-demo-outer">
                                    <%-- #owl-demo --%>
                                    <div id="owl-demo21" class="deals-wk2">
                                        <div class="item">
                                            <div class="bdr col-xs-12 col-sm-12 col-md-6">
                                                <%-- e-product --%>
                                                <div class="e-product">
                                                    <div class="pro-img">
                                                        <img src="${pageContext.request.contextPath}/mall/assets/images/fc-img1.jpg" alt="2">
                                                        <div class="hover-icon">
                                                            <a href="#"><i class="fa fa-search" aria-hidden="true"></i></a>
                                                        </div>
                                                    </div>
                                                    <div class="pro-text-outer">
                                                        <span>Macbook, Laptop</span>
                                                        <a href="#">
                                                            <h4> Apple Macbook Retina 23’ </h4>
                                                        </a>
                                                        <p class="wk-price">$290.00 </p>
                                                        <a href="#" class="add-btn">Add to cart</a>
                                                        <a href="#" class="add-btn2"><i class="icon-heart icons"
                                                                                        aria-hidden="true"></i></a>
                                                        <a href="#" class="add-btn2"><i class="icon-refresh icons"></i></a>
                                                    </div>
                                                </div>
                                                <%-- /e-product --%>
                                            </div>
                                            <div class="bdr col-xs-12 col-sm-12 col-md-6">
                                                <%-- e-product --%>
                                                <div class="e-product">
                                                    <div class="pro-img">
                                                        <sup class="sale-tag">sale!</sup>
                                                        <img src="${pageContext.request.contextPath}/mall/assets/images/fc-img2.jpg" alt="2">
                                                        <div class="hover-icon">
                                                            <a href="#"><i class="fa fa-search" aria-hidden="true"></i></a>
                                                        </div>
                                                    </div>
                                                    <div class="pro-text-outer">
                                                        <span>Macbook, Laptop</span>
                                                        <a href="#">
                                                            <h4> Apple Macbook Retina 23’ </h4>
                                                        </a>
                                                        <p class="wk-price">$290.00 </p>
                                                        <a href="#" class="add-btn">Add to cart</a>
                                                    </div>
                                                </div>
                                                <%-- /e-product --%>
                                            </div>
                                            <div class="bdr col-xs-12 col-sm-12 col-md-6">
                                                <%-- e-product --%>
                                                <div class="e-product">
                                                    <div class="pro-img">
                                                        <sup class="sale-tag">sale!</sup>
                                                        <img src="${pageContext.request.contextPath}/mall/assets/images/fc-img3.jpg" alt="2">
                                                        <div class="hover-icon">
                                                            <a href="#"><i class="fa fa-search" aria-hidden="true"></i></a>
                                                        </div>
                                                    </div>
                                                    <div class="pro-text-outer">
                                                        <span>Macbook, Laptop</span>
                                                        <a href="#">
                                                            <h4> Apple Macbook Retina 23’ </h4>
                                                        </a>
                                                        <p class="wk-price">$290.00 </p>
                                                        <a href="#" class="add-btn">Add to cart</a>
                                                    </div>
                                                </div>
                                                <%-- /e-product --%>
                                            </div>
                                            <div class="bdr col-xs-12 col-sm-12 col-md-6">
                                                <%-- e-product --%>
                                                <div class="e-product">
                                                    <div class="pro-img">
                                                        <sup class="new-tag">NEW</sup>
                                                        <img src="${pageContext.request.contextPath}/mall/assets/images/fc-img4.jpg" alt="2">
                                                        <div class="hover-icon">
                                                            <a href="#"><i class="fa fa-search" aria-hidden="true"></i></a>
                                                        </div>
                                                    </div>
                                                    <div class="pro-text-outer">
                                                        <span>Macbook, Laptop</span>
                                                        <a href="#">
                                                            <h4> Apple Macbook Retina 23’ </h4>
                                                        </a>
                                                        <p class="wk-price">$290.00 </p>
                                                        <a href="#" class="add-btn">Add to cart</a>
                                                    </div>
                                                </div>
                                                <%-- /e-product --%>
                                            </div>
                                        </div>
                                        <div class="item">
                                            <div class="bdr col-xs-12 col-sm-12 col-md-6">
                                                <%-- e-product --%>
                                                <div class="e-product">
                                                    <div class="pro-img">
                                                        <sup class="sale-tag">sale!</sup>
                                                        <img src="${pageContext.request.contextPath}/mall/assets/images/fc-img1.jpg" alt="2">
                                                        <div class="hover-icon">
                                                            <a href="#"><i class="fa fa-search" aria-hidden="true"></i></a>
                                                        </div>
                                                    </div>
                                                    <div class="pro-text-outer">
                                                        <span>Macbook, Laptop</span>
                                                        <a href="#">
                                                            <h4> Apple Macbook Retina 23’ </h4>
                                                        </a>
                                                        <p class="wk-price">$290.00 </p>
                                                        <a href="#" class="add-btn">Add to cart</a>
                                                        <a href="#" class="add-btn2"><i class="icon-heart icons"
                                                                                        aria-hidden="true"></i></a>
                                                        <a href="#" class="add-btn2"><i class="icon-refresh icons"></i></a>
                                                    </div>
                                                </div>
                                                <%-- /e-product --%>
                                            </div>
                                            <div class="bdr col-xs-12 col-sm-12 col-md-6">
                                                <%-- e-product --%>
                                                <div class="e-product">
                                                    <div class="pro-img">
                                                        <img src="${pageContext.request.contextPath}/mall/assets/images/fc-img2.jpg" alt="2">
                                                        <div class="hover-icon">
                                                            <a href="#"><i class="fa fa-search" aria-hidden="true"></i></a>
                                                        </div>
                                                    </div>
                                                    <div class="pro-text-outer">
                                                        <span>Macbook, Laptop</span>
                                                        <a href="#">
                                                            <h4> Apple Macbook Retina 23’ </h4>
                                                        </a>
                                                        <p class="wk-price">$290.00 </p>
                                                        <a href="#" class="add-btn">Add to cart</a>
                                                    </div>
                                                </div>
                                                <%-- /e-product --%>
                                            </div>
                                            <div class="bdr col-xs-12 col-sm-12 col-md-6">
                                                <%-- e-product --%>
                                                <div class="e-product">
                                                    <div class="pro-img">
                                                        <img src="${pageContext.request.contextPath}/mall/assets/images/fc-img3.jpg" alt="2">
                                                        <div class="hover-icon">
                                                            <a href="#"><i class="fa fa-search" aria-hidden="true"></i></a>
                                                        </div>
                                                    </div>
                                                    <div class="pro-text-outer">
                                                        <span>Macbook, Laptop</span>
                                                        <a href="#">
                                                            <h4> Apple Macbook Retina 23’ </h4>
                                                        </a>
                                                        <p class="wk-price">$290.00 </p>
                                                        <a href="#" class="add-btn">Add to cart</a>
                                                    </div>
                                                </div>
                                                <%-- /e-product --%>
                                            </div>
                                            <div class="bdr col-xs-12 col-sm-12 col-md-6">
                                                <%-- e-product --%>
                                                <div class="e-product">
                                                    <div class="pro-img">
                                                        <img src="${pageContext.request.contextPath}/mall/assets/images/fc-img4.jpg" alt="2">
                                                        <div class="hover-icon">
                                                            <a href="#"><i class="fa fa-search" aria-hidden="true"></i></a>
                                                        </div>
                                                    </div>
                                                    <div class="pro-text-outer">
                                                        <span>Macbook, Laptop</span>
                                                        <a href="#">
                                                            <h4> Apple Macbook Retina 23’ </h4>
                                                        </a>
                                                        <p class="wk-price">$290.00 </p>
                                                        <a href="#" class="add-btn">Add to cart</a>
                                                    </div>
                                                </div>
                                                <%-- /e-product --%>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <%-- /tab-pane --%>
                        </div>
                        <%-- /tab-content --%>

                    </div>
                </div>
            </div>
            <%-- /FASHION --%>
            <%-- full-banner --%>
            <div class="half-banner">
                <div class="row">
                    <div class="col-xs-12 col-sm-12 col-md-12">
                        <a href="#" class="banner animated wow slideInUp" data-wow-delay="0ms"
                           data-wow-duration="1500ms">
                            <img src="${pageContext.request.contextPath}/mall/assets/images/add-banner-large.jpg" alt="add banner large">
                        </a>
                    </div>
                </div>
            </div>
            <%-- /full-banner --%>
            <%-- title --%>
            <div class="title">
                <h2>
                    Home, Garden & Kitchen
                </h2>
                <ul class="nav nav-tabs etabs">
                    <li class="active"><a data-toggle="tab" href="#men2">Men’s</a></li>
                    <li><a data-toggle="tab" href="#women2">Women’s</a></li>
                    <li><a data-toggle="tab" href="#kid2">Kid’s</a></li>
                    <li><a data-toggle="tab" href="#clothing2">Clothing</a></li>
                    <li><a data-toggle="tab" href="#shoes2">Shoes</a></li>
                    <li><a data-toggle="tab" href="#handbag2">Handbag</a></li>
                </ul>
            </div>
            <%-- /title --%>
            <%-- Home-Garden-Kitchen --%>
            <div class="electonics">

                <div class="brd2 col-xs-12 col-sm-3 col-md-3">
                    <div id="home-slider4" class="carousel slide carousel-fade" data-ride="carousel">
                        <%-- .home-slider --%>
                        <div class="carousel-inner">
                            <div class="item active">
                                <a class="ads" href="#">
                                    <img src="${pageContext.request.contextPath}/mall/assets/images/hgk-add-banner.jpg" alt="add-banner"/>
                                </a>
                            </div>
                            <div class="item">
                                <a class="ads" href="#">
                                    <img src="${pageContext.request.contextPath}/mall/assets/images/hgk-add-banner.jpg" alt="add-banner"/>
                                </a>
                            </div>
                        </div>
                        <%-- indicators --%>
                        <ol class="carousel-indicators">
                            <li data-target="#home-slider4" data-slide-to="0" class="active"></li>
                            <li data-target="#home-slider4" data-slide-to="1"></li>
                        </ol>
                        <%-- /indicators --%>
                        <%-- /.home-slider --%>
                    </div>
                </div>
                <div class="col-xs-12 col-sm-9 col-md-9">
                    <div class="row">
                        <%-- tab-content --%>
                        <div class="tab-content">
                            <%-- tab-pane --%>
                            <div id="men2" class="tab-pane fade in active">
                                <div class="owl-demo-outer">
                                    <%-- #owl-demo --%>
                                    <div id="owl-demo10" class="deals-wk2">
                                        <div class="item">
                                            <div class="bdr col-xs-12 col-sm-12 col-md-6">
                                                <%-- e-product --%>
                                                <div class="e-product">
                                                    <div class="pro-img">
                                                        <img src="${pageContext.request.contextPath}/mall/assets/images/hgk-img1.jpg" alt="2">
                                                        <div class="hover-icon">
                                                            <a href="#"><i class="fa fa-search" aria-hidden="true"></i></a>
                                                        </div>
                                                    </div>
                                                    <div class="pro-text-outer">
                                                        <span>Macbook, Laptop</span>
                                                        <a href="#">
                                                            <h4> Apple Macbook Retina 23’ </h4>
                                                        </a>
                                                        <p class="wk-price">$290.00 </p>
                                                        <a href="#" class="add-btn">Add to cart</a>
                                                        <a href="#" class="add-btn2"><i class="icon-heart icons"
                                                                                        aria-hidden="true"></i></a>
                                                        <a href="#" class="add-btn2"><i class="icon-refresh icons"></i></a>
                                                    </div>
                                                </div>
                                                <%-- /e-product --%>
                                            </div>
                                            <div class="bdr col-xs-12 col-sm-12 col-md-6">
                                                <%-- e-product --%>
                                                <div class="e-product">
                                                    <div class="pro-img">
                                                        <sup class="sale-tag">sale!</sup>
                                                        <img src="${pageContext.request.contextPath}/mall/assets/images/hgk-img2.jpg" alt="2">
                                                        <div class="hover-icon">
                                                            <a href="#"><i class="fa fa-search" aria-hidden="true"></i></a>
                                                        </div>
                                                    </div>
                                                    <div class="pro-text-outer">
                                                        <span>Macbook, Laptop</span>
                                                        <a href="#">
                                                            <h4> Apple Macbook Retina 23’ </h4>
                                                        </a>
                                                        <p class="wk-price">$290.00 </p>
                                                        <a href="#" class="add-btn">Add to cart</a>
                                                    </div>
                                                </div>
                                                <%-- /e-product --%>
                                            </div>
                                            <div class="bdr col-xs-12 col-sm-12 col-md-6">
                                                <%-- e-product --%>
                                                <div class="e-product">
                                                    <div class="pro-img">
                                                        <sup class="sale-tag">sale!</sup>
                                                        <img src="${pageContext.request.contextPath}/mall/assets/images/hgk-img3.jpg" alt="2">
                                                        <div class="hover-icon">
                                                            <a href="#"><i class="fa fa-search" aria-hidden="true"></i></a>
                                                        </div>
                                                    </div>
                                                    <div class="pro-text-outer">
                                                        <span>Macbook, Laptop</span>
                                                        <a href="#">
                                                            <h4> Apple Macbook Retina 23’ </h4>
                                                        </a>
                                                        <p class="wk-price">$290.00 </p>
                                                        <a href="#" class="add-btn">Add to cart</a>
                                                    </div>
                                                </div>
                                                <%-- /e-product --%>
                                            </div>
                                            <div class="bdr col-xs-12 col-sm-12 col-md-6">
                                                <%-- e-product --%>
                                                <div class="e-product">
                                                    <div class="pro-img">
                                                        <sup class="new-tag">NEW</sup>
                                                        <img src="${pageContext.request.contextPath}/mall/assets/images/hgk-img4.jpg" alt="2">
                                                        <div class="hover-icon">
                                                            <a href="#"><i class="fa fa-search" aria-hidden="true"></i></a>
                                                        </div>
                                                    </div>
                                                    <div class="pro-text-outer">
                                                        <span>Macbook, Laptop</span>
                                                        <a href="#">
                                                            <h4> Apple Macbook Retina 23’ </h4>
                                                        </a>
                                                        <p class="wk-price">$290.00 </p>
                                                        <a href="#" class="add-btn">Add to cart</a>
                                                    </div>
                                                </div>
                                                <%-- /e-product --%>
                                            </div>
                                        </div>
                                        <div class="item">
                                            <div class="bdr col-xs-12 col-sm-12 col-md-6">
                                                <%-- e-product --%>
                                                <div class="e-product">
                                                    <div class="pro-img">
                                                        <sup class="sale-tag">sale!</sup>
                                                        <img src="${pageContext.request.contextPath}/mall/assets/images/hgk-img1.jpg" alt="2">
                                                        <div class="hover-icon">
                                                            <a href="#"><i class="fa fa-search" aria-hidden="true"></i></a>
                                                        </div>
                                                    </div>
                                                    <div class="pro-text-outer">
                                                        <span>Macbook, Laptop</span>
                                                        <a href="#">
                                                            <h4> Apple Macbook Retina 23’ </h4>
                                                        </a>
                                                        <p class="wk-price">$290.00 </p>
                                                        <a href="#" class="add-btn">Add to cart</a>
                                                        <a href="#" class="add-btn2"><i class="icon-heart icons"
                                                                                        aria-hidden="true"></i></a>
                                                        <a href="#" class="add-btn2"><i class="icon-refresh icons"></i></a>
                                                    </div>
                                                </div>
                                                <%-- /e-product --%>
                                            </div>
                                            <div class="bdr col-xs-12 col-sm-12 col-md-6">
                                                <%-- e-product --%>
                                                <div class="e-product">
                                                    <div class="pro-img">
                                                        <img src="${pageContext.request.contextPath}/mall/assets/images/hgk-img2.jpg" alt="2">
                                                        <div class="hover-icon">
                                                            <a href="#"><i class="fa fa-search" aria-hidden="true"></i></a>
                                                        </div>
                                                    </div>
                                                    <div class="pro-text-outer">
                                                        <span>Macbook, Laptop</span>
                                                        <a href="#">
                                                            <h4> Apple Macbook Retina 23’ </h4>
                                                        </a>
                                                        <p class="wk-price">$290.00 </p>
                                                        <a href="#" class="add-btn">Add to cart</a>
                                                    </div>
                                                </div>
                                                <%-- /e-product --%>
                                            </div>
                                            <div class="bdr col-xs-12 col-sm-12 col-md-6">
                                                <%-- e-product --%>
                                                <div class="e-product">
                                                    <div class="pro-img">
                                                        <img src="${pageContext.request.contextPath}/mall/assets/images/hgk-img3.jpg" alt="2">
                                                        <div class="hover-icon">
                                                            <a href="#"><i class="fa fa-search" aria-hidden="true"></i></a>
                                                        </div>
                                                    </div>
                                                    <div class="pro-text-outer">
                                                        <span>Macbook, Laptop</span>
                                                        <a href="#">
                                                            <h4> Apple Macbook Retina 23’ </h4>
                                                        </a>
                                                        <p class="wk-price">$290.00 </p>
                                                        <a href="#" class="add-btn">Add to cart</a>
                                                    </div>
                                                </div>
                                                <%-- /e-product --%>
                                            </div>
                                            <div class="bdr col-xs-12 col-sm-12 col-md-6">
                                                <%-- e-product --%>
                                                <div class="e-product">
                                                    <div class="pro-img">
                                                        <img src="${pageContext.request.contextPath}/mall/assets/images/hgk-img4.jpg" alt="2">
                                                        <div class="hover-icon">
                                                            <a href="#"><i class="fa fa-search" aria-hidden="true"></i></a>
                                                        </div>
                                                    </div>
                                                    <div class="pro-text-outer">
                                                        <span>Macbook, Laptop</span>
                                                        <a href="#">
                                                            <h4> Apple Macbook Retina 23’ </h4>
                                                        </a>
                                                        <p class="wk-price">$290.00 </p>
                                                        <a href="#" class="add-btn">Add to cart</a>
                                                    </div>
                                                </div>
                                                <%-- /e-product --%>
                                            </div>
                                        </div>
                                    </div>
                                </div>


                            </div>
                            <%-- /tab-pane --%>
                            <%-- tab-pane --%>
                            <div id="women2" class="tab-pane fade in">
                                <div class="owl-demo-outer">
                                    <%-- #owl-demo --%>
                                    <div id="owl-demo22" class="deals-wk2">
                                        <div class="item">
                                            <div class="bdr col-xs-12 col-sm-12 col-md-6">
                                                <%-- e-product --%>
                                                <div class="e-product">
                                                    <div class="pro-img">
                                                        <img src="${pageContext.request.contextPath}/mall/assets/images/hgk-img1.jpg" alt="2">
                                                        <div class="hover-icon">
                                                            <a href="#"><i class="fa fa-search" aria-hidden="true"></i></a>
                                                        </div>
                                                    </div>
                                                    <div class="pro-text-outer">
                                                        <span>Macbook, Laptop</span>
                                                        <a href="#">
                                                            <h4> Apple Macbook Retina 23’ </h4>
                                                        </a>
                                                        <p class="wk-price">$290.00 </p>
                                                        <a href="#" class="add-btn">Add to cart</a>
                                                        <a href="#" class="add-btn2"><i class="icon-heart icons"
                                                                                        aria-hidden="true"></i></a>
                                                        <a href="#" class="add-btn2"><i class="icon-refresh icons"></i></a>
                                                    </div>
                                                </div>
                                                <%-- /e-product --%>
                                            </div>
                                            <div class="bdr col-xs-12 col-sm-12 col-md-6">
                                                <%-- e-product --%>
                                                <div class="e-product">
                                                    <div class="pro-img">
                                                        <sup class="sale-tag">sale!</sup>
                                                        <img src="${pageContext.request.contextPath}/mall/assets/images/hgk-img2.jpg" alt="2">
                                                        <div class="hover-icon">
                                                            <a href="#"><i class="fa fa-search" aria-hidden="true"></i></a>
                                                        </div>
                                                    </div>
                                                    <div class="pro-text-outer">
                                                        <span>Macbook, Laptop</span>
                                                        <a href="#">
                                                            <h4> Apple Macbook Retina 23’ </h4>
                                                        </a>
                                                        <p class="wk-price">$290.00 </p>
                                                        <a href="#" class="add-btn">Add to cart</a>
                                                    </div>
                                                </div>
                                                <%-- /e-product --%>
                                            </div>
                                            <div class="bdr col-xs-12 col-sm-12 col-md-6">
                                                <%-- e-product --%>
                                                <div class="e-product">
                                                    <div class="pro-img">
                                                        <sup class="sale-tag">sale!</sup>
                                                        <img src="${pageContext.request.contextPath}/mall/assets/images/hgk-img3.jpg" alt="2">
                                                        <div class="hover-icon">
                                                            <a href="#"><i class="fa fa-search" aria-hidden="true"></i></a>
                                                        </div>
                                                    </div>
                                                    <div class="pro-text-outer">
                                                        <span>Macbook, Laptop</span>
                                                        <a href="#">
                                                            <h4> Apple Macbook Retina 23’ </h4>
                                                        </a>
                                                        <p class="wk-price">$290.00 </p>
                                                        <a href="#" class="add-btn">Add to cart</a>
                                                    </div>
                                                </div>
                                                <%-- /e-product --%>
                                            </div>
                                            <div class="bdr col-xs-12 col-sm-12 col-md-6">
                                                <%-- e-product --%>
                                                <div class="e-product">
                                                    <div class="pro-img">
                                                        <sup class="new-tag">NEW</sup>
                                                        <img src="${pageContext.request.contextPath}/mall/assets/images/hgk-img4.jpg" alt="2">
                                                        <div class="hover-icon">
                                                            <a href="#"><i class="fa fa-search" aria-hidden="true"></i></a>
                                                        </div>
                                                    </div>
                                                    <div class="pro-text-outer">
                                                        <span>Macbook, Laptop</span>
                                                        <a href="#">
                                                            <h4> Apple Macbook Retina 23’ </h4>
                                                        </a>
                                                        <p class="wk-price">$290.00 </p>
                                                        <a href="#" class="add-btn">Add to cart</a>
                                                    </div>
                                                </div>
                                                <%-- /e-product --%>
                                            </div>
                                        </div>
                                        <div class="item">
                                            <div class="bdr col-xs-12 col-sm-12 col-md-6">
                                                <%-- e-product --%>
                                                <div class="e-product">
                                                    <div class="pro-img">
                                                        <sup class="sale-tag">sale!</sup>
                                                        <img src="${pageContext.request.contextPath}/mall/assets/images/hgk-img1.jpg" alt="2">
                                                        <div class="hover-icon">
                                                            <a href="#"><i class="fa fa-search" aria-hidden="true"></i></a>
                                                        </div>
                                                    </div>
                                                    <div class="pro-text-outer">
                                                        <span>Macbook, Laptop</span>
                                                        <a href="#">
                                                            <h4> Apple Macbook Retina 23’ </h4>
                                                        </a>
                                                        <p class="wk-price">$290.00 </p>
                                                        <a href="#" class="add-btn">Add to cart</a>
                                                        <a href="#" class="add-btn2"><i class="icon-heart icons"
                                                                                        aria-hidden="true"></i></a>
                                                        <a href="#" class="add-btn2"><i class="icon-refresh icons"></i></a>
                                                    </div>
                                                </div>
                                                <%-- /e-product --%>
                                            </div>
                                            <div class="bdr col-xs-12 col-sm-12 col-md-6">
                                                <%-- e-product --%>
                                                <div class="e-product">
                                                    <div class="pro-img">
                                                        <img src="${pageContext.request.contextPath}/mall/assets/images/hgk-img2.jpg" alt="2">
                                                        <div class="hover-icon">
                                                            <a href="#"><i class="fa fa-search" aria-hidden="true"></i></a>
                                                        </div>
                                                    </div>
                                                    <div class="pro-text-outer">
                                                        <span>Macbook, Laptop</span>
                                                        <a href="#">
                                                            <h4> Apple Macbook Retina 23’ </h4>
                                                        </a>
                                                        <p class="wk-price">$290.00 </p>
                                                        <a href="#" class="add-btn">Add to cart</a>
                                                    </div>
                                                </div>
                                                <%-- /e-product --%>
                                            </div>
                                            <div class="bdr col-xs-12 col-sm-12 col-md-6">
                                                <%-- e-product --%>
                                                <div class="e-product">
                                                    <div class="pro-img">
                                                        <img src="${pageContext.request.contextPath}/mall/assets/images/hgk-img3.jpg" alt="2">
                                                        <div class="hover-icon">
                                                            <a href="#"><i class="fa fa-search" aria-hidden="true"></i></a>
                                                        </div>
                                                    </div>
                                                    <div class="pro-text-outer">
                                                        <span>Macbook, Laptop</span>
                                                        <a href="#">
                                                            <h4> Apple Macbook Retina 23’ </h4>
                                                        </a>
                                                        <p class="wk-price">$290.00 </p>
                                                        <a href="#" class="add-btn">Add to cart</a>
                                                    </div>
                                                </div>
                                                <%-- /e-product --%>
                                            </div>
                                            <div class="bdr col-xs-12 col-sm-12 col-md-6">
                                                <%-- e-product --%>
                                                <div class="e-product">
                                                    <div class="pro-img">
                                                        <img src="${pageContext.request.contextPath}/mall/assets/images/hgk-img4.jpg" alt="2">
                                                        <div class="hover-icon">
                                                            <a href="#"><i class="fa fa-search" aria-hidden="true"></i></a>
                                                        </div>
                                                    </div>
                                                    <div class="pro-text-outer">
                                                        <span>Macbook, Laptop</span>
                                                        <a href="#">
                                                            <h4> Apple Macbook Retina 23’ </h4>
                                                        </a>
                                                        <p class="wk-price">$290.00 </p>
                                                        <a href="#" class="add-btn">Add to cart</a>
                                                    </div>
                                                </div>
                                                <%-- /e-product --%>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <%-- /tab-pane --%>
                            <%-- tab-pane --%>
                            <div id="kid2" class="tab-pane fade in">
                                <div class="owl-demo-outer">
                                    <%-- #owl-demo --%>
                                    <div id="owl-demo23" class="deals-wk2">
                                        <div class="item">
                                            <div class="bdr col-xs-12 col-sm-12 col-md-6">
                                                <%-- e-product --%>
                                                <div class="e-product">
                                                    <div class="pro-img">
                                                        <img src="${pageContext.request.contextPath}/mall/assets/images/hgk-img1.jpg" alt="2">
                                                        <div class="hover-icon">
                                                            <a href="#"><i class="fa fa-search" aria-hidden="true"></i></a>
                                                        </div>
                                                    </div>
                                                    <div class="pro-text-outer">
                                                        <span>Macbook, Laptop</span>
                                                        <a href="#">
                                                            <h4> Apple Macbook Retina 23’ </h4>
                                                        </a>
                                                        <p class="wk-price">$290.00 </p>
                                                        <a href="#" class="add-btn">Add to cart</a>
                                                        <a href="#" class="add-btn2"><i class="icon-heart icons"
                                                                                        aria-hidden="true"></i></a>
                                                        <a href="#" class="add-btn2"><i class="icon-refresh icons"></i></a>
                                                    </div>
                                                </div>
                                                <%-- /e-product --%>
                                            </div>
                                            <div class="bdr col-xs-12 col-sm-12 col-md-6">
                                                <%-- e-product --%>
                                                <div class="e-product">
                                                    <div class="pro-img">
                                                        <sup class="sale-tag">sale!</sup>
                                                        <img src="${pageContext.request.contextPath}/mall/assets/images/hgk-img2.jpg" alt="2">
                                                        <div class="hover-icon">
                                                            <a href="#"><i class="fa fa-search" aria-hidden="true"></i></a>
                                                        </div>
                                                    </div>
                                                    <div class="pro-text-outer">
                                                        <span>Macbook, Laptop</span>
                                                        <a href="#">
                                                            <h4> Apple Macbook Retina 23’ </h4>
                                                        </a>
                                                        <p class="wk-price">$290.00 </p>
                                                        <a href="#" class="add-btn">Add to cart</a>
                                                    </div>
                                                </div>
                                                <%-- /e-product --%>
                                            </div>
                                            <div class="bdr col-xs-12 col-sm-12 col-md-6">
                                                <%-- e-product --%>
                                                <div class="e-product">
                                                    <div class="pro-img">
                                                        <sup class="sale-tag">sale!</sup>
                                                        <img src="${pageContext.request.contextPath}/mall/assets/images/hgk-img3.jpg" alt="2">
                                                        <div class="hover-icon">
                                                            <a href="#"><i class="fa fa-search" aria-hidden="true"></i></a>
                                                        </div>
                                                    </div>
                                                    <div class="pro-text-outer">
                                                        <span>Macbook, Laptop</span>
                                                        <a href="#">
                                                            <h4> Apple Macbook Retina 23’ </h4>
                                                        </a>
                                                        <p class="wk-price">$290.00 </p>
                                                        <a href="#" class="add-btn">Add to cart</a>
                                                    </div>
                                                </div>
                                                <%-- /e-product --%>
                                            </div>
                                            <div class="bdr col-xs-12 col-sm-12 col-md-6">
                                                <%-- e-product --%>
                                                <div class="e-product">
                                                    <div class="pro-img">
                                                        <sup class="new-tag">NEW</sup>
                                                        <img src="${pageContext.request.contextPath}/mall/assets/images/hgk-img4.jpg" alt="2">
                                                        <div class="hover-icon">
                                                            <a href="#"><i class="fa fa-search" aria-hidden="true"></i></a>
                                                        </div>
                                                    </div>
                                                    <div class="pro-text-outer">
                                                        <span>Macbook, Laptop</span>
                                                        <a href="#">
                                                            <h4> Apple Macbook Retina 23’ </h4>
                                                        </a>
                                                        <p class="wk-price">$290.00 </p>
                                                        <a href="#" class="add-btn">Add to cart</a>
                                                    </div>
                                                </div>
                                                <%-- /e-product --%>
                                            </div>
                                        </div>
                                        <div class="item">
                                            <div class="bdr col-xs-12 col-sm-12 col-md-6">
                                                <%-- e-product --%>
                                                <div class="e-product">
                                                    <div class="pro-img">
                                                        <sup class="sale-tag">sale!</sup>
                                                        <img src="${pageContext.request.contextPath}/mall/assets/images/hgk-img1.jpg" alt="2">
                                                        <div class="hover-icon">
                                                            <a href="#"><i class="fa fa-search" aria-hidden="true"></i></a>
                                                        </div>
                                                    </div>
                                                    <div class="pro-text-outer">
                                                        <span>Macbook, Laptop</span>
                                                        <a href="#">
                                                            <h4> Apple Macbook Retina 23’ </h4>
                                                        </a>
                                                        <p class="wk-price">$290.00 </p>
                                                        <a href="#" class="add-btn">Add to cart</a>
                                                        <a href="#" class="add-btn2"><i class="icon-heart icons"
                                                                                        aria-hidden="true"></i></a>
                                                        <a href="#" class="add-btn2"><i class="icon-refresh icons"></i></a>
                                                    </div>
                                                </div>
                                                <%-- /e-product --%>
                                            </div>
                                            <div class="bdr col-xs-12 col-sm-12 col-md-6">
                                                <%-- e-product --%>
                                                <div class="e-product">
                                                    <div class="pro-img">
                                                        <img src="${pageContext.request.contextPath}/mall/assets/images/hgk-img2.jpg" alt="2">
                                                        <div class="hover-icon">
                                                            <a href="#"><i class="fa fa-search" aria-hidden="true"></i></a>
                                                        </div>
                                                    </div>
                                                    <div class="pro-text-outer">
                                                        <span>Macbook, Laptop</span>
                                                        <a href="#">
                                                            <h4> Apple Macbook Retina 23’ </h4>
                                                        </a>
                                                        <p class="wk-price">$290.00 </p>
                                                        <a href="#" class="add-btn">Add to cart</a>
                                                    </div>
                                                </div>
                                                <%-- /e-product --%>
                                            </div>
                                            <div class="bdr col-xs-12 col-sm-12 col-md-6">
                                                <%-- e-product --%>
                                                <div class="e-product">
                                                    <div class="pro-img">
                                                        <img src="${pageContext.request.contextPath}/mall/assets/images/hgk-img3.jpg" alt="2">
                                                        <div class="hover-icon">
                                                            <a href="#"><i class="fa fa-search" aria-hidden="true"></i></a>
                                                        </div>
                                                    </div>
                                                    <div class="pro-text-outer">
                                                        <span>Macbook, Laptop</span>
                                                        <a href="#">
                                                            <h4> Apple Macbook Retina 23’ </h4>
                                                        </a>
                                                        <p class="wk-price">$290.00 </p>
                                                        <a href="#" class="add-btn">Add to cart</a>
                                                    </div>
                                                </div>
                                                <%-- /e-product --%>
                                            </div>
                                            <div class="bdr col-xs-12 col-sm-12 col-md-6">
                                                <%-- e-product --%>
                                                <div class="e-product">
                                                    <div class="pro-img">
                                                        <img src="${pageContext.request.contextPath}/mall/assets/images/hgk-img4.jpg" alt="2">
                                                        <div class="hover-icon">
                                                            <a href="#"><i class="fa fa-search" aria-hidden="true"></i></a>
                                                        </div>
                                                    </div>
                                                    <div class="pro-text-outer">
                                                        <span>Macbook, Laptop</span>
                                                        <a href="#">
                                                            <h4> Apple Macbook Retina 23’ </h4>
                                                        </a>
                                                        <p class="wk-price">$290.00 </p>
                                                        <a href="#" class="add-btn">Add to cart</a>
                                                    </div>
                                                </div>
                                                <%-- /e-product --%>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <%-- /tab-pane --%>
                            <%-- tab-pane --%>
                            <div id="clothing2" class="tab-pane fade in">
                                <div class="owl-demo-outer">
                                    <%-- #owl-demo --%>
                                    <div id="owl-demo24" class="deals-wk2">
                                        <div class="item">
                                            <div class="bdr col-xs-12 col-sm-12 col-md-6">
                                                <%-- e-product --%>
                                                <div class="e-product">
                                                    <div class="pro-img">
                                                        <img src="${pageContext.request.contextPath}/mall/assets/images/hgk-img1.jpg" alt="2">
                                                        <div class="hover-icon">
                                                            <a href="#"><i class="fa fa-search" aria-hidden="true"></i></a>
                                                        </div>
                                                    </div>
                                                    <div class="pro-text-outer">
                                                        <span>Macbook, Laptop</span>
                                                        <a href="#">
                                                            <h4> Apple Macbook Retina 23’ </h4>
                                                        </a>
                                                        <p class="wk-price">$290.00 </p>
                                                        <a href="#" class="add-btn">Add to cart</a>
                                                        <a href="#" class="add-btn2"><i class="icon-heart icons"
                                                                                        aria-hidden="true"></i></a>
                                                        <a href="#" class="add-btn2"><i class="icon-refresh icons"></i></a>
                                                    </div>
                                                </div>
                                                <%-- /e-product --%>
                                            </div>
                                            <div class="bdr col-xs-12 col-sm-12 col-md-6">
                                                <%-- e-product --%>
                                                <div class="e-product">
                                                    <div class="pro-img">
                                                        <sup class="sale-tag">sale!</sup>
                                                        <img src="${pageContext.request.contextPath}/mall/assets/images/hgk-img2.jpg" alt="2">
                                                        <div class="hover-icon">
                                                            <a href="#"><i class="fa fa-search" aria-hidden="true"></i></a>
                                                        </div>
                                                    </div>
                                                    <div class="pro-text-outer">
                                                        <span>Macbook, Laptop</span>
                                                        <a href="#">
                                                            <h4> Apple Macbook Retina 23’ </h4>
                                                        </a>
                                                        <p class="wk-price">$290.00 </p>
                                                        <a href="#" class="add-btn">Add to cart</a>
                                                    </div>
                                                </div>
                                                <%-- /e-product --%>
                                            </div>
                                            <div class="bdr col-xs-12 col-sm-12 col-md-6">
                                                <%-- e-product --%>
                                                <div class="e-product">
                                                    <div class="pro-img">
                                                        <sup class="sale-tag">sale!</sup>
                                                        <img src="${pageContext.request.contextPath}/mall/assets/images/hgk-img3.jpg" alt="2">
                                                        <div class="hover-icon">
                                                            <a href="#"><i class="fa fa-search" aria-hidden="true"></i></a>
                                                        </div>
                                                    </div>
                                                    <div class="pro-text-outer">
                                                        <span>Macbook, Laptop</span>
                                                        <a href="#">
                                                            <h4> Apple Macbook Retina 23’ </h4>
                                                        </a>
                                                        <p class="wk-price">$290.00 </p>
                                                        <a href="#" class="add-btn">Add to cart</a>
                                                    </div>
                                                </div>
                                                <%-- /e-product --%>
                                            </div>
                                            <div class="bdr col-xs-12 col-sm-12 col-md-6">
                                                <%-- e-product --%>
                                                <div class="e-product">
                                                    <div class="pro-img">
                                                        <sup class="new-tag">NEW</sup>
                                                        <img src="${pageContext.request.contextPath}/mall/assets/images/hgk-img4.jpg" alt="2">
                                                        <div class="hover-icon">
                                                            <a href="#"><i class="fa fa-search" aria-hidden="true"></i></a>
                                                        </div>
                                                    </div>
                                                    <div class="pro-text-outer">
                                                        <span>Macbook, Laptop</span>
                                                        <a href="#">
                                                            <h4> Apple Macbook Retina 23’ </h4>
                                                        </a>
                                                        <p class="wk-price">$290.00 </p>
                                                        <a href="#" class="add-btn">Add to cart</a>
                                                    </div>
                                                </div>
                                                <%-- /e-product --%>
                                            </div>
                                        </div>
                                        <div class="item">
                                            <div class="bdr col-xs-12 col-sm-12 col-md-6">
                                                <%-- e-product --%>
                                                <div class="e-product">
                                                    <div class="pro-img">
                                                        <sup class="sale-tag">sale!</sup>
                                                        <img src="${pageContext.request.contextPath}/mall/assets/images/hgk-img1.jpg" alt="2">
                                                        <div class="hover-icon">
                                                            <a href="#"><i class="fa fa-search" aria-hidden="true"></i></a>
                                                        </div>
                                                    </div>
                                                    <div class="pro-text-outer">
                                                        <span>Macbook, Laptop</span>
                                                        <a href="#">
                                                            <h4> Apple Macbook Retina 23’ </h4>
                                                        </a>
                                                        <p class="wk-price">$290.00 </p>
                                                        <a href="#" class="add-btn">Add to cart</a>
                                                        <a href="#" class="add-btn2"><i class="icon-heart icons"
                                                                                        aria-hidden="true"></i></a>
                                                        <a href="#" class="add-btn2"><i class="icon-refresh icons"></i></a>
                                                    </div>
                                                </div>
                                                <%-- /e-product --%>
                                            </div>
                                            <div class="bdr col-xs-12 col-sm-12 col-md-6">
                                                <%-- e-product --%>
                                                <div class="e-product">
                                                    <div class="pro-img">
                                                        <img src="${pageContext.request.contextPath}/mall/assets/images/hgk-img2.jpg" alt="2">
                                                        <div class="hover-icon">
                                                            <a href="#"><i class="fa fa-search" aria-hidden="true"></i></a>
                                                        </div>
                                                    </div>
                                                    <div class="pro-text-outer">
                                                        <span>Macbook, Laptop</span>
                                                        <a href="#">
                                                            <h4> Apple Macbook Retina 23’ </h4>
                                                        </a>
                                                        <p class="wk-price">$290.00 </p>
                                                        <a href="#" class="add-btn">Add to cart</a>
                                                    </div>
                                                </div>
                                                <%-- /e-product --%>
                                            </div>
                                            <div class="bdr col-xs-12 col-sm-12 col-md-6">
                                                <%-- e-product --%>
                                                <div class="e-product">
                                                    <div class="pro-img">
                                                        <img src="${pageContext.request.contextPath}/mall/assets/images/hgk-img3.jpg" alt="2">
                                                        <div class="hover-icon">
                                                            <a href="#"><i class="fa fa-search" aria-hidden="true"></i></a>
                                                        </div>
                                                    </div>
                                                    <div class="pro-text-outer">
                                                        <span>Macbook, Laptop</span>
                                                        <a href="#">
                                                            <h4> Apple Macbook Retina 23’ </h4>
                                                        </a>
                                                        <p class="wk-price">$290.00 </p>
                                                        <a href="#" class="add-btn">Add to cart</a>
                                                    </div>
                                                </div>
                                                <%-- /e-product --%>
                                            </div>
                                            <div class="bdr col-xs-12 col-sm-12 col-md-6">
                                                <%-- e-product --%>
                                                <div class="e-product">
                                                    <div class="pro-img">
                                                        <img src="${pageContext.request.contextPath}/mall/assets/images/hgk-img4.jpg" alt="2">
                                                        <div class="hover-icon">
                                                            <a href="#"><i class="fa fa-search" aria-hidden="true"></i></a>
                                                        </div>
                                                    </div>
                                                    <div class="pro-text-outer">
                                                        <span>Macbook, Laptop</span>
                                                        <a href="#">
                                                            <h4> Apple Macbook Retina 23’ </h4>
                                                        </a>
                                                        <p class="wk-price">$290.00 </p>
                                                        <a href="#" class="add-btn">Add to cart</a>
                                                    </div>
                                                </div>
                                                <%-- /e-product --%>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <%-- /tab-pane --%>
                            <%-- tab-pane --%>
                            <div id="shoes2" class="tab-pane fade in">
                                <div class="owl-demo-outer">
                                    <%-- #owl-demo --%>
                                    <div id="owl-demo25" class="deals-wk2">
                                        <div class="item">
                                            <div class="bdr col-xs-12 col-sm-12 col-md-6">
                                                <%-- e-product --%>
                                                <div class="e-product">
                                                    <div class="pro-img">
                                                        <img src="${pageContext.request.contextPath}/mall/assets/images/hgk-img1.jpg" alt="2">
                                                        <div class="hover-icon">
                                                            <a href="#"><i class="fa fa-search" aria-hidden="true"></i></a>
                                                        </div>
                                                    </div>
                                                    <div class="pro-text-outer">
                                                        <span>Macbook, Laptop</span>
                                                        <a href="#">
                                                            <h4> Apple Macbook Retina 23’ </h4>
                                                        </a>
                                                        <p class="wk-price">$290.00 </p>
                                                        <a href="#" class="add-btn">Add to cart</a>
                                                        <a href="#" class="add-btn2"><i class="icon-heart icons"
                                                                                        aria-hidden="true"></i></a>
                                                        <a href="#" class="add-btn2"><i class="icon-refresh icons"></i></a>
                                                    </div>
                                                </div>
                                                <%-- /e-product --%>
                                            </div>
                                            <div class="bdr col-xs-12 col-sm-12 col-md-6">
                                                <%-- e-product --%>
                                                <div class="e-product">
                                                    <div class="pro-img">
                                                        <sup class="sale-tag">sale!</sup>
                                                        <img src="${pageContext.request.contextPath}/mall/assets/images/hgk-img2.jpg" alt="2">
                                                        <div class="hover-icon">
                                                            <a href="#"><i class="fa fa-search" aria-hidden="true"></i></a>
                                                        </div>
                                                    </div>
                                                    <div class="pro-text-outer">
                                                        <span>Macbook, Laptop</span>
                                                        <a href="#">
                                                            <h4> Apple Macbook Retina 23’ </h4>
                                                        </a>
                                                        <p class="wk-price">$290.00 </p>
                                                        <a href="#" class="add-btn">Add to cart</a>
                                                    </div>
                                                </div>
                                                <%-- /e-product --%>
                                            </div>
                                            <div class="bdr col-xs-12 col-sm-12 col-md-6">
                                                <%-- e-product --%>
                                                <div class="e-product">
                                                    <div class="pro-img">
                                                        <sup class="sale-tag">sale!</sup>
                                                        <img src="${pageContext.request.contextPath}/mall/assets/images/hgk-img3.jpg" alt="2">
                                                        <div class="hover-icon">
                                                            <a href="#"><i class="fa fa-search" aria-hidden="true"></i></a>
                                                        </div>
                                                    </div>
                                                    <div class="pro-text-outer">
                                                        <span>Macbook, Laptop</span>
                                                        <a href="#">
                                                            <h4> Apple Macbook Retina 23’ </h4>
                                                        </a>
                                                        <p class="wk-price">$290.00 </p>
                                                        <a href="#" class="add-btn">Add to cart</a>
                                                    </div>
                                                </div>
                                                <%-- /e-product --%>
                                            </div>
                                            <div class="bdr col-xs-12 col-sm-12 col-md-6">
                                                <%-- e-product --%>
                                                <div class="e-product">
                                                    <div class="pro-img">
                                                        <sup class="new-tag">NEW</sup>
                                                        <img src="${pageContext.request.contextPath}/mall/assets/images/hgk-img4.jpg" alt="2">
                                                        <div class="hover-icon">
                                                            <a href="#"><i class="fa fa-search" aria-hidden="true"></i></a>
                                                        </div>
                                                    </div>
                                                    <div class="pro-text-outer">
                                                        <span>Macbook, Laptop</span>
                                                        <a href="#">
                                                            <h4> Apple Macbook Retina 23’ </h4>
                                                        </a>
                                                        <p class="wk-price">$290.00 </p>
                                                        <a href="#" class="add-btn">Add to cart</a>
                                                    </div>
                                                </div>
                                                <%-- /e-product --%>
                                            </div>
                                        </div>
                                        <div class="item">
                                            <div class="bdr col-xs-12 col-sm-12 col-md-6">
                                                <%-- e-product --%>
                                                <div class="e-product">
                                                    <div class="pro-img">
                                                        <sup class="sale-tag">sale!</sup>
                                                        <img src="${pageContext.request.contextPath}/mall/assets/images/hgk-img1.jpg" alt="2">
                                                        <div class="hover-icon">
                                                            <a href="#"><i class="fa fa-search" aria-hidden="true"></i></a>
                                                        </div>
                                                    </div>
                                                    <div class="pro-text-outer">
                                                        <span>Macbook, Laptop</span>
                                                        <a href="#">
                                                            <h4> Apple Macbook Retina 23’ </h4>
                                                        </a>
                                                        <p class="wk-price">$290.00 </p>
                                                        <a href="#" class="add-btn">Add to cart</a>
                                                        <a href="#" class="add-btn2"><i class="icon-heart icons"
                                                                                        aria-hidden="true"></i></a>
                                                        <a href="#" class="add-btn2"><i class="icon-refresh icons"></i></a>
                                                    </div>
                                                </div>
                                                <%-- /e-product --%>
                                            </div>
                                            <div class="bdr col-xs-12 col-sm-12 col-md-6">
                                                <%-- e-product --%>
                                                <div class="e-product">
                                                    <div class="pro-img">
                                                        <img src="${pageContext.request.contextPath}/mall/assets/images/hgk-img2.jpg" alt="2">
                                                        <div class="hover-icon">
                                                            <a href="#"><i class="fa fa-search" aria-hidden="true"></i></a>
                                                        </div>
                                                    </div>
                                                    <div class="pro-text-outer">
                                                        <span>Macbook, Laptop</span>
                                                        <a href="#">
                                                            <h4> Apple Macbook Retina 23’ </h4>
                                                        </a>
                                                        <p class="wk-price">$290.00 </p>
                                                        <a href="#" class="add-btn">Add to cart</a>
                                                    </div>
                                                </div>
                                                <%-- /e-product --%>
                                            </div>
                                            <div class="bdr col-xs-12 col-sm-12 col-md-6">
                                                <%-- e-product --%>
                                                <div class="e-product">
                                                    <div class="pro-img">
                                                        <img src="${pageContext.request.contextPath}/mall/assets/images/hgk-img3.jpg" alt="2">
                                                        <div class="hover-icon">
                                                            <a href="#"><i class="fa fa-search" aria-hidden="true"></i></a>
                                                        </div>
                                                    </div>
                                                    <div class="pro-text-outer">
                                                        <span>Macbook, Laptop</span>
                                                        <a href="#">
                                                            <h4> Apple Macbook Retina 23’ </h4>
                                                        </a>
                                                        <p class="wk-price">$290.00 </p>
                                                        <a href="#" class="add-btn">Add to cart</a>
                                                    </div>
                                                </div>
                                                <%-- /e-product --%>
                                            </div>
                                            <div class="bdr col-xs-12 col-sm-12 col-md-6">
                                                <%-- e-product --%>
                                                <div class="e-product">
                                                    <div class="pro-img">
                                                        <img src="${pageContext.request.contextPath}/mall/assets/images/hgk-img4.jpg" alt="2">
                                                        <div class="hover-icon">
                                                            <a href="#"><i class="fa fa-search" aria-hidden="true"></i></a>
                                                        </div>
                                                    </div>
                                                    <div class="pro-text-outer">
                                                        <span>Macbook, Laptop</span>
                                                        <a href="#">
                                                            <h4> Apple Macbook Retina 23’ </h4>
                                                        </a>
                                                        <p class="wk-price">$290.00 </p>
                                                        <a href="#" class="add-btn">Add to cart</a>
                                                    </div>
                                                </div>
                                                <%-- /e-product --%>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <%-- /tab-pane --%>
                            <%-- tab-pane --%>
                            <div id="handbag2" class="tab-pane fade in">
                                <div class="owl-demo-outer">
                                    <%-- #owl-demo --%>
                                    <div id="owl-demo26" class="deals-wk2">
                                        <div class="item">
                                            <div class="bdr col-xs-12 col-sm-12 col-md-6">
                                                <%-- e-product --%>
                                                <div class="e-product">
                                                    <div class="pro-img">
                                                        <img src="${pageContext.request.contextPath}/mall/assets/images/hgk-img1.jpg" alt="2">
                                                        <div class="hover-icon">
                                                            <a href="#"><i class="fa fa-search" aria-hidden="true"></i></a>
                                                        </div>
                                                    </div>
                                                    <div class="pro-text-outer">
                                                        <span>Macbook, Laptop</span>
                                                        <a href="#">
                                                            <h4> Apple Macbook Retina 23’ </h4>
                                                        </a>
                                                        <p class="wk-price">$290.00 </p>
                                                        <a href="#" class="add-btn">Add to cart</a>
                                                        <a href="#" class="add-btn2"><i class="icon-heart icons"
                                                                                        aria-hidden="true"></i></a>
                                                        <a href="#" class="add-btn2"><i class="icon-refresh icons"></i></a>
                                                    </div>
                                                </div>
                                                <%-- /e-product --%>
                                            </div>
                                            <div class="bdr col-xs-12 col-sm-12 col-md-6">
                                                <%-- e-product --%>
                                                <div class="e-product">
                                                    <div class="pro-img">
                                                        <sup class="sale-tag">sale!</sup>
                                                        <img src="${pageContext.request.contextPath}/mall/assets/images/hgk-img2.jpg" alt="2">
                                                        <div class="hover-icon">
                                                            <a href="#"><i class="fa fa-search" aria-hidden="true"></i></a>
                                                        </div>
                                                    </div>
                                                    <div class="pro-text-outer">
                                                        <span>Macbook, Laptop</span>
                                                        <a href="#">
                                                            <h4> Apple Macbook Retina 23’ </h4>
                                                        </a>
                                                        <p class="wk-price">$290.00 </p>
                                                        <a href="#" class="add-btn">Add to cart</a>
                                                    </div>
                                                </div>
                                                <%-- /e-product --%>
                                            </div>
                                            <div class="bdr col-xs-12 col-sm-12 col-md-6">
                                                <%-- e-product --%>
                                                <div class="e-product">
                                                    <div class="pro-img">
                                                        <sup class="sale-tag">sale!</sup>
                                                        <img src="${pageContext.request.contextPath}/mall/assets/images/hgk-img3.jpg" alt="2">
                                                        <div class="hover-icon">
                                                            <a href="#"><i class="fa fa-search" aria-hidden="true"></i></a>
                                                        </div>
                                                    </div>
                                                    <div class="pro-text-outer">
                                                        <span>Macbook, Laptop</span>
                                                        <a href="#">
                                                            <h4> Apple Macbook Retina 23’ </h4>
                                                        </a>
                                                        <p class="wk-price">$290.00 </p>
                                                        <a href="#" class="add-btn">Add to cart</a>
                                                    </div>
                                                </div>
                                                <%-- /e-product --%>
                                            </div>
                                            <div class="bdr col-xs-12 col-sm-12 col-md-6">
                                                <%-- e-product --%>
                                                <div class="e-product">
                                                    <div class="pro-img">
                                                        <sup class="new-tag">NEW</sup>
                                                        <img src="${pageContext.request.contextPath}/mall/assets/images/hgk-img4.jpg" alt="2">
                                                        <div class="hover-icon">
                                                            <a href="#"><i class="fa fa-search" aria-hidden="true"></i></a>
                                                        </div>
                                                    </div>
                                                    <div class="pro-text-outer">
                                                        <span>Macbook, Laptop</span>
                                                        <a href="#">
                                                            <h4> Apple Macbook Retina 23’ </h4>
                                                        </a>
                                                        <p class="wk-price">$290.00 </p>
                                                        <a href="#" class="add-btn">Add to cart</a>
                                                    </div>
                                                </div>
                                                <%-- /e-product --%>
                                            </div>
                                        </div>
                                        <div class="item">
                                            <div class="bdr col-xs-12 col-sm-12 col-md-6">
                                                <%-- e-product --%>
                                                <div class="e-product">
                                                    <div class="pro-img">
                                                        <sup class="sale-tag">sale!</sup>
                                                        <img src="${pageContext.request.contextPath}/mall/assets/images/hgk-img1.jpg" alt="2">
                                                        <div class="hover-icon">
                                                            <a href="#"><i class="fa fa-search" aria-hidden="true"></i></a>
                                                        </div>
                                                    </div>
                                                    <div class="pro-text-outer">
                                                        <span>Macbook, Laptop</span>
                                                        <a href="#">
                                                            <h4> Apple Macbook Retina 23’ </h4>
                                                        </a>
                                                        <p class="wk-price">$290.00 </p>
                                                        <a href="#" class="add-btn">Add to cart</a>
                                                        <a href="#" class="add-btn2"><i class="icon-heart icons"
                                                                                        aria-hidden="true"></i></a>
                                                        <a href="#" class="add-btn2"><i class="icon-refresh icons"></i></a>
                                                    </div>
                                                </div>
                                                <%-- /e-product --%>
                                            </div>
                                            <div class="bdr col-xs-12 col-sm-12 col-md-6">
                                                <%-- e-product --%>
                                                <div class="e-product">
                                                    <div class="pro-img">
                                                        <img src="${pageContext.request.contextPath}/mall/assets/images/hgk-img2.jpg" alt="2">
                                                        <div class="hover-icon">
                                                            <a href="#"><i class="fa fa-search" aria-hidden="true"></i></a>
                                                        </div>
                                                    </div>
                                                    <div class="pro-text-outer">
                                                        <span>Macbook, Laptop</span>
                                                        <a href="#">
                                                            <h4> Apple Macbook Retina 23’ </h4>
                                                        </a>
                                                        <p class="wk-price">$290.00 </p>
                                                        <a href="#" class="add-btn">Add to cart</a>
                                                    </div>
                                                </div>
                                                <%-- /e-product --%>
                                            </div>
                                            <div class="bdr col-xs-12 col-sm-12 col-md-6">
                                                <%-- e-product --%>
                                                <div class="e-product">
                                                    <div class="pro-img">
                                                        <img src="${pageContext.request.contextPath}/mall/assets/images/hgk-img3.jpg" alt="2">
                                                        <div class="hover-icon">
                                                            <a href="#"><i class="fa fa-search" aria-hidden="true"></i></a>
                                                        </div>
                                                    </div>
                                                    <div class="pro-text-outer">
                                                        <span>Macbook, Laptop</span>
                                                        <a href="#">
                                                            <h4> Apple Macbook Retina 23’ </h4>
                                                        </a>
                                                        <p class="wk-price">$290.00 </p>
                                                        <a href="#" class="add-btn">Add to cart</a>
                                                    </div>
                                                </div>
                                                <%-- /e-product --%>
                                            </div>
                                            <div class="bdr col-xs-12 col-sm-12 col-md-6">
                                                <%-- e-product --%>
                                                <div class="e-product">
                                                    <div class="pro-img">
                                                        <img src="${pageContext.request.contextPath}/mall/assets/images/hgk-img4.jpg" alt="2">
                                                        <div class="hover-icon">
                                                            <a href="#"><i class="fa fa-search" aria-hidden="true"></i></a>
                                                        </div>
                                                    </div>
                                                    <div class="pro-text-outer">
                                                        <span>Macbook, Laptop</span>
                                                        <a href="#">
                                                            <h4> Apple Macbook Retina 23’ </h4>
                                                        </a>
                                                        <p class="wk-price">$290.00 </p>
                                                        <a href="#" class="add-btn">Add to cart</a>
                                                    </div>
                                                </div>
                                                <%-- /e-product --%>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <%-- /tab-pane --%>
                        </div>
                        <%-- /tab-content --%>

                    </div>
                </div>
            </div>
            <%-- Home-Garden-Kitchen --%>
            <%-- half-banner --%>
            <div class="half-banner">
                <div class="row">
                    <a href="#" class="col-xs-12 col-sm-6 col-md-6">
                        <img src="${pageContext.request.contextPath}/mall/assets/images/half-banner3.jpg" alt="half-banner3"/>
                    </a>
                    <a href="#" class="col-xs-12 col-sm-6 col-md-6">
                        <img src="${pageContext.request.contextPath}/mall/assets/images/half-banner4.jpg" alt="half-banner3"/>
                    </a>
                </div>
            </div>
            <%-- /half-banner --%>
            <%-- title --%>
            <div class="title">
                <h2>
                    GIFT & HAND MADE
                </h2>
                <ul class="nav nav-tabs etabs">
                    <li class="active"><a data-toggle="tab" href="#men3">Men’s</a></li>
                    <li><a data-toggle="tab" href="#women3">Women’s</a></li>
                    <li><a data-toggle="tab" href="#kid3">Kid’s</a></li>
                    <li><a data-toggle="tab" href="#clothing3">Clothing</a></li>
                    <li><a data-toggle="tab" href="#shoes3">Shoes</a></li>
                    <li><a data-toggle="tab" href="#handbag3">Handbag</a></li>
                </ul>
            </div>
            <%-- /title --%>
            <%-- GIFT --%>
            <div class="electonics">

                <div class="brd2 col-xs-12 col-sm-3 col-md-3">
                    <div id="home-slider5" class="carousel slide carousel-fade" data-ride="carousel">
                        <%-- .home-slider --%>
                        <div class="carousel-inner">
                            <div class="item active">
                                <a class="ads" href="#">
                                    <img src="${pageContext.request.contextPath}/mall/assets/images/home-design-add-banner.jpg" alt="add-banner"/>
                                </a>
                            </div>
                            <div class="item">
                                <a class="ads" href="#">
                                    <img src="${pageContext.request.contextPath}/mall/assets/images/home-design-add-banner.jpg" alt="add-banner"/>
                                </a>
                            </div>
                        </div>
                        <%-- indicators --%>
                        <ol class="carousel-indicators">
                            <li data-target="#home-slider5" data-slide-to="0" class="active"></li>
                            <li data-target="#home-slider5" data-slide-to="1"></li>
                        </ol>
                        <%-- /indicators --%>
                        <%-- /.home-slider --%>
                    </div>
                </div>
                <div class="col-xs-12 col-sm-9 col-md-9">
                    <div class="row">
                        <%-- tab-content --%>
                        <div class="tab-content">
                            <%-- tab-pane --%>
                            <div id="men3" class="tab-pane fade in active">
                                <div class="owl-demo-outer">
                                    <%-- #owl-demo --%>
                                    <div id="owl-demo11" class="deals-wk2">
                                        <div class="item">
                                            <div class="bdr col-xs-12 col-sm-12 col-md-6">
                                                <%-- e-product --%>
                                                <div class="e-product">
                                                    <div class="pro-img">
                                                        <img src="${pageContext.request.contextPath}/mall/assets/images/ghm-img1.jpg" alt="2">
                                                        <div class="hover-icon">
                                                            <a href="#"><i class="fa fa-search" aria-hidden="true"></i></a>
                                                        </div>
                                                    </div>
                                                    <div class="pro-text-outer">
                                                        <span>Macbook, Laptop</span>
                                                        <a href="#">
                                                            <h4> Apple Macbook Retina 23’ </h4>
                                                        </a>
                                                        <p class="wk-price">$290.00 </p>
                                                        <a href="#" class="add-btn">Add to cart</a>
                                                        <a href="#" class="add-btn2"><i class="icon-heart icons"
                                                                                        aria-hidden="true"></i></a>
                                                        <a href="#" class="add-btn2"><i class="icon-refresh icons"></i></a>
                                                    </div>
                                                </div>
                                                <%-- /e-product --%>
                                            </div>
                                            <div class="bdr col-xs-12 col-sm-12 col-md-6">
                                                <%-- e-product --%>
                                                <div class="e-product">
                                                    <div class="pro-img">
                                                        <sup class="sale-tag">sale!</sup>
                                                        <img src="${pageContext.request.contextPath}/mall/assets/images/ghm-img2.jpg" alt="2">
                                                        <div class="hover-icon">
                                                            <a href="#"><i class="fa fa-search" aria-hidden="true"></i></a>
                                                        </div>
                                                    </div>
                                                    <div class="pro-text-outer">
                                                        <span>Macbook, Laptop</span>
                                                        <a href="#">
                                                            <h4> Apple Macbook Retina 23’ </h4>
                                                        </a>
                                                        <p class="wk-price">$290.00 </p>
                                                        <a href="#" class="add-btn">Add to cart</a>
                                                    </div>
                                                </div>
                                                <%-- /e-product --%>
                                            </div>
                                            <div class="bdr col-xs-12 col-sm-12 col-md-6">
                                                <%-- e-product --%>
                                                <div class="e-product">
                                                    <div class="pro-img">
                                                        <sup class="sale-tag">sale!</sup>
                                                        <img src="${pageContext.request.contextPath}/mall/assets/images/ghm-img3.jpg" alt="2">
                                                        <div class="hover-icon">
                                                            <a href="#"><i class="fa fa-search" aria-hidden="true"></i></a>
                                                        </div>
                                                    </div>
                                                    <div class="pro-text-outer">
                                                        <span>Macbook, Laptop</span>
                                                        <a href="#">
                                                            <h4> Apple Macbook Retina 23’ </h4>
                                                        </a>
                                                        <p class="wk-price">$290.00 </p>
                                                        <a href="#" class="add-btn">Add to cart</a>
                                                    </div>
                                                </div>
                                                <%-- /e-product --%>
                                            </div>
                                            <div class="bdr col-xs-12 col-sm-12 col-md-6">
                                                <%-- e-product --%>
                                                <div class="e-product">
                                                    <div class="pro-img">
                                                        <sup class="new-tag">NEW</sup>
                                                        <img src="${pageContext.request.contextPath}/mall/assets/images/ghm-img4.jpg" alt="2">
                                                        <div class="hover-icon">
                                                            <a href="#"><i class="fa fa-search" aria-hidden="true"></i></a>
                                                        </div>
                                                    </div>
                                                    <div class="pro-text-outer">
                                                        <span>Macbook, Laptop</span>
                                                        <a href="#">
                                                            <h4> Apple Macbook Retina 23’ </h4>
                                                        </a>
                                                        <p class="wk-price">$290.00 </p>
                                                        <a href="#" class="add-btn">Add to cart</a>
                                                    </div>
                                                </div>
                                                <%-- /e-product --%>
                                            </div>
                                        </div>
                                        <div class="item">
                                            <div class="bdr col-xs-12 col-sm-12 col-md-6">
                                                <%-- e-product --%>
                                                <div class="e-product">
                                                    <div class="pro-img">
                                                        <sup class="sale-tag">sale!</sup>
                                                        <img src="${pageContext.request.contextPath}/mall/assets/images/ghm-img1.jpg" alt="2">
                                                        <div class="hover-icon">
                                                            <a href="#"><i class="fa fa-search" aria-hidden="true"></i></a>
                                                        </div>
                                                    </div>
                                                    <div class="pro-text-outer">
                                                        <span>Macbook, Laptop</span>
                                                        <a href="#">
                                                            <h4> Apple Macbook Retina 23’ </h4>
                                                        </a>
                                                        <p class="wk-price">$290.00 </p>
                                                        <a href="#" class="add-btn">Add to cart</a>
                                                        <a href="#" class="add-btn2"><i class="icon-heart icons"
                                                                                        aria-hidden="true"></i></a>
                                                        <a href="#" class="add-btn2"><i class="icon-refresh icons"></i></a>
                                                    </div>
                                                </div>
                                                <%-- /e-product --%>
                                            </div>
                                            <div class="bdr col-xs-12 col-sm-12 col-md-6">
                                                <%-- e-product --%>
                                                <div class="e-product">
                                                    <div class="pro-img">
                                                        <img src="${pageContext.request.contextPath}/mall/assets/images/ghm-img2.jpg" alt="2">
                                                        <div class="hover-icon">
                                                            <a href="#"><i class="fa fa-search" aria-hidden="true"></i></a>
                                                        </div>
                                                    </div>
                                                    <div class="pro-text-outer">
                                                        <span>Macbook, Laptop</span>
                                                        <a href="#">
                                                            <h4> Apple Macbook Retina 23’ </h4>
                                                        </a>
                                                        <p class="wk-price">$290.00 </p>
                                                        <a href="#" class="add-btn">Add to cart</a>
                                                    </div>
                                                </div>
                                                <%-- /e-product --%>
                                            </div>
                                            <div class="bdr col-xs-12 col-sm-12 col-md-6">
                                                <%-- e-product --%>
                                                <div class="e-product">
                                                    <div class="pro-img">
                                                        <img src="${pageContext.request.contextPath}/mall/assets/images/ghm-img3.jpg" alt="2">
                                                        <div class="hover-icon">
                                                            <a href="#"><i class="fa fa-search" aria-hidden="true"></i></a>
                                                        </div>
                                                    </div>
                                                    <div class="pro-text-outer">
                                                        <span>Macbook, Laptop</span>
                                                        <a href="#">
                                                            <h4> Apple Macbook Retina 23’ </h4>
                                                        </a>
                                                        <p class="wk-price">$290.00 </p>
                                                        <a href="#" class="add-btn">Add to cart</a>
                                                    </div>
                                                </div>
                                                <%-- /e-product --%>
                                            </div>
                                            <div class="bdr col-xs-12 col-sm-12 col-md-6">
                                                <%-- e-product --%>
                                                <div class="e-product">
                                                    <div class="pro-img">
                                                        <img src="${pageContext.request.contextPath}/mall/assets/images/ghm-img4.jpg" alt="2">
                                                        <div class="hover-icon">
                                                            <a href="#"><i class="fa fa-search" aria-hidden="true"></i></a>
                                                        </div>
                                                    </div>
                                                    <div class="pro-text-outer">
                                                        <span>Macbook, Laptop</span>
                                                        <a href="#">
                                                            <h4> Apple Macbook Retina 23’ </h4>
                                                        </a>
                                                        <p class="wk-price">$290.00 </p>
                                                        <a href="#" class="add-btn">Add to cart</a>
                                                    </div>
                                                </div>
                                                <%-- /e-product --%>
                                            </div>
                                        </div>
                                    </div>
                                </div>


                            </div>
                            <%-- /tab-pane --%>
                            <%-- tab-pane --%>
                            <div id="women3" class="tab-pane fade in">
                                <div class="owl-demo-outer">
                                    <%-- #owl-demo --%>
                                    <div id="owl-demo27" class="deals-wk2">
                                        <div class="item">
                                            <div class="bdr col-xs-12 col-sm-12 col-md-6">
                                                <%-- e-product --%>
                                                <div class="e-product">
                                                    <div class="pro-img">
                                                        <img src="${pageContext.request.contextPath}/mall/assets/images/ghm-img1.jpg" alt="2">
                                                        <div class="hover-icon">
                                                            <a href="#"><i class="fa fa-search" aria-hidden="true"></i></a>
                                                        </div>
                                                    </div>
                                                    <div class="pro-text-outer">
                                                        <span>Macbook, Laptop</span>
                                                        <a href="#">
                                                            <h4> Apple Macbook Retina 23’ </h4>
                                                        </a>
                                                        <p class="wk-price">$290.00 </p>
                                                        <a href="#" class="add-btn">Add to cart</a>
                                                        <a href="#" class="add-btn2"><i class="icon-heart icons"
                                                                                        aria-hidden="true"></i></a>
                                                        <a href="#" class="add-btn2"><i class="icon-refresh icons"></i></a>
                                                    </div>
                                                </div>
                                                <%-- /e-product --%>
                                            </div>
                                            <div class="bdr col-xs-12 col-sm-12 col-md-6">
                                                <%-- e-product --%>
                                                <div class="e-product">
                                                    <div class="pro-img">
                                                        <sup class="sale-tag">sale!</sup>
                                                        <img src="${pageContext.request.contextPath}/mall/assets/images/ghm-img2.jpg" alt="2">
                                                        <div class="hover-icon">
                                                            <a href="#"><i class="fa fa-search" aria-hidden="true"></i></a>
                                                        </div>
                                                    </div>
                                                    <div class="pro-text-outer">
                                                        <span>Macbook, Laptop</span>
                                                        <a href="#">
                                                            <h4> Apple Macbook Retina 23’ </h4>
                                                        </a>
                                                        <p class="wk-price">$290.00 </p>
                                                        <a href="#" class="add-btn">Add to cart</a>
                                                    </div>
                                                </div>
                                                <%-- /e-product --%>
                                            </div>
                                            <div class="bdr col-xs-12 col-sm-12 col-md-6">
                                                <%-- e-product --%>
                                                <div class="e-product">
                                                    <div class="pro-img">
                                                        <sup class="sale-tag">sale!</sup>
                                                        <img src="${pageContext.request.contextPath}/mall/assets/images/ghm-img3.jpg" alt="2">
                                                        <div class="hover-icon">
                                                            <a href="#"><i class="fa fa-search" aria-hidden="true"></i></a>
                                                        </div>
                                                    </div>
                                                    <div class="pro-text-outer">
                                                        <span>Macbook, Laptop</span>
                                                        <a href="#">
                                                            <h4> Apple Macbook Retina 23’ </h4>
                                                        </a>
                                                        <p class="wk-price">$290.00 </p>
                                                        <a href="#" class="add-btn">Add to cart</a>
                                                    </div>
                                                </div>
                                                <%-- /e-product --%>
                                            </div>
                                            <div class="bdr col-xs-12 col-sm-12 col-md-6">
                                                <%-- e-product --%>
                                                <div class="e-product">
                                                    <div class="pro-img">
                                                        <sup class="new-tag">NEW</sup>
                                                        <img src="${pageContext.request.contextPath}/mall/assets/images/ghm-img4.jpg" alt="2">
                                                        <div class="hover-icon">
                                                            <a href="#"><i class="fa fa-search" aria-hidden="true"></i></a>
                                                        </div>
                                                    </div>
                                                    <div class="pro-text-outer">
                                                        <span>Macbook, Laptop</span>
                                                        <a href="#">
                                                            <h4> Apple Macbook Retina 23’ </h4>
                                                        </a>
                                                        <p class="wk-price">$290.00 </p>
                                                        <a href="#" class="add-btn">Add to cart</a>
                                                    </div>
                                                </div>
                                                <%-- /e-product --%>
                                            </div>
                                        </div>
                                        <div class="item">
                                            <div class="bdr col-xs-12 col-sm-12 col-md-6">
                                                <%-- e-product --%>
                                                <div class="e-product">
                                                    <div class="pro-img">
                                                        <sup class="sale-tag">sale!</sup>
                                                        <img src="${pageContext.request.contextPath}/mall/assets/images/ghm-img1.jpg" alt="2">
                                                        <div class="hover-icon">
                                                            <a href="#"><i class="fa fa-search" aria-hidden="true"></i></a>
                                                        </div>
                                                    </div>
                                                    <div class="pro-text-outer">
                                                        <span>Macbook, Laptop</span>
                                                        <a href="#">
                                                            <h4> Apple Macbook Retina 23’ </h4>
                                                        </a>
                                                        <p class="wk-price">$290.00 </p>
                                                        <a href="#" class="add-btn">Add to cart</a>
                                                        <a href="#" class="add-btn2"><i class="icon-heart icons"
                                                                                        aria-hidden="true"></i></a>
                                                        <a href="#" class="add-btn2"><i class="icon-refresh icons"></i></a>
                                                    </div>
                                                </div>
                                                <%-- /e-product --%>
                                            </div>
                                            <div class="bdr col-xs-12 col-sm-12 col-md-6">
                                                <%-- e-product --%>
                                                <div class="e-product">
                                                    <div class="pro-img">
                                                        <img src="${pageContext.request.contextPath}/mall/assets/images/ghm-img2.jpg" alt="2">
                                                        <div class="hover-icon">
                                                            <a href="#"><i class="fa fa-search" aria-hidden="true"></i></a>
                                                        </div>
                                                    </div>
                                                    <div class="pro-text-outer">
                                                        <span>Macbook, Laptop</span>
                                                        <a href="#">
                                                            <h4> Apple Macbook Retina 23’ </h4>
                                                        </a>
                                                        <p class="wk-price">$290.00 </p>
                                                        <a href="#" class="add-btn">Add to cart</a>
                                                    </div>
                                                </div>
                                                <%-- /e-product --%>
                                            </div>
                                            <div class="bdr col-xs-12 col-sm-12 col-md-6">
                                                <%-- e-product --%>
                                                <div class="e-product">
                                                    <div class="pro-img">
                                                        <img src="${pageContext.request.contextPath}/mall/assets/images/ghm-img3.jpg" alt="2">
                                                        <div class="hover-icon">
                                                            <a href="#"><i class="fa fa-search" aria-hidden="true"></i></a>
                                                        </div>
                                                    </div>
                                                    <div class="pro-text-outer">
                                                        <span>Macbook, Laptop</span>
                                                        <a href="#">
                                                            <h4> Apple Macbook Retina 23’ </h4>
                                                        </a>
                                                        <p class="wk-price">$290.00 </p>
                                                        <a href="#" class="add-btn">Add to cart</a>
                                                    </div>
                                                </div>
                                                <%-- /e-product --%>
                                            </div>
                                            <div class="bdr col-xs-12 col-sm-12 col-md-6">
                                                <%-- e-product --%>
                                                <div class="e-product">
                                                    <div class="pro-img">
                                                        <img src="${pageContext.request.contextPath}/mall/assets/images/ghm-img4.jpg" alt="2">
                                                        <div class="hover-icon">
                                                            <a href="#"><i class="fa fa-search" aria-hidden="true"></i></a>
                                                        </div>
                                                    </div>
                                                    <div class="pro-text-outer">
                                                        <span>Macbook, Laptop</span>
                                                        <a href="#">
                                                            <h4> Apple Macbook Retina 23’ </h4>
                                                        </a>
                                                        <p class="wk-price">$290.00 </p>
                                                        <a href="#" class="add-btn">Add to cart</a>
                                                    </div>
                                                </div>
                                                <%-- /e-product --%>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <%-- /tab-pane --%>
                            <%-- tab-pane --%>
                            <div id="kid3" class="tab-pane fade in">
                                <div class="owl-demo-outer">
                                    <%-- #owl-demo --%>
                                    <div id="owl-demo28" class="deals-wk2">
                                        <div class="item">
                                            <div class="bdr col-xs-12 col-sm-12 col-md-6">
                                                <%-- e-product --%>
                                                <div class="e-product">
                                                    <div class="pro-img">
                                                        <img src="${pageContext.request.contextPath}/mall/assets/images/ghm-img1.jpg" alt="2">
                                                        <div class="hover-icon">
                                                            <a href="#"><i class="fa fa-search" aria-hidden="true"></i></a>
                                                        </div>
                                                    </div>
                                                    <div class="pro-text-outer">
                                                        <span>Macbook, Laptop</span>
                                                        <a href="#">
                                                            <h4> Apple Macbook Retina 23’ </h4>
                                                        </a>
                                                        <p class="wk-price">$290.00 </p>
                                                        <a href="#" class="add-btn">Add to cart</a>
                                                        <a href="#" class="add-btn2"><i class="icon-heart icons"
                                                                                        aria-hidden="true"></i></a>
                                                        <a href="#" class="add-btn2"><i class="icon-refresh icons"></i></a>
                                                    </div>
                                                </div>
                                                <%-- /e-product --%>
                                            </div>
                                            <div class="bdr col-xs-12 col-sm-12 col-md-6">
                                                <%-- e-product --%>
                                                <div class="e-product">
                                                    <div class="pro-img">
                                                        <sup class="sale-tag">sale!</sup>
                                                        <img src="${pageContext.request.contextPath}/mall/assets/images/ghm-img2.jpg" alt="2">
                                                        <div class="hover-icon">
                                                            <a href="#"><i class="fa fa-search" aria-hidden="true"></i></a>
                                                        </div>
                                                    </div>
                                                    <div class="pro-text-outer">
                                                        <span>Macbook, Laptop</span>
                                                        <a href="#">
                                                            <h4> Apple Macbook Retina 23’ </h4>
                                                        </a>
                                                        <p class="wk-price">$290.00 </p>
                                                        <a href="#" class="add-btn">Add to cart</a>
                                                    </div>
                                                </div>
                                                <%-- /e-product --%>
                                            </div>
                                            <div class="bdr col-xs-12 col-sm-12 col-md-6">
                                                <%-- e-product --%>
                                                <div class="e-product">
                                                    <div class="pro-img">
                                                        <sup class="sale-tag">sale!</sup>
                                                        <img src="${pageContext.request.contextPath}/mall/assets/images/ghm-img3.jpg" alt="2">
                                                        <div class="hover-icon">
                                                            <a href="#"><i class="fa fa-search" aria-hidden="true"></i></a>
                                                        </div>
                                                    </div>
                                                    <div class="pro-text-outer">
                                                        <span>Macbook, Laptop</span>
                                                        <a href="#">
                                                            <h4> Apple Macbook Retina 23’ </h4>
                                                        </a>
                                                        <p class="wk-price">$290.00 </p>
                                                        <a href="#" class="add-btn">Add to cart</a>
                                                    </div>
                                                </div>
                                                <%-- /e-product --%>
                                            </div>
                                            <div class="bdr col-xs-12 col-sm-12 col-md-6">
                                                <%-- e-product --%>
                                                <div class="e-product">
                                                    <div class="pro-img">
                                                        <sup class="new-tag">NEW</sup>
                                                        <img src="${pageContext.request.contextPath}/mall/assets/images/ghm-img4.jpg" alt="2">
                                                        <div class="hover-icon">
                                                            <a href="#"><i class="fa fa-search" aria-hidden="true"></i></a>
                                                        </div>
                                                    </div>
                                                    <div class="pro-text-outer">
                                                        <span>Macbook, Laptop</span>
                                                        <a href="#">
                                                            <h4> Apple Macbook Retina 23’ </h4>
                                                        </a>
                                                        <p class="wk-price">$290.00 </p>
                                                        <a href="#" class="add-btn">Add to cart</a>
                                                    </div>
                                                </div>
                                                <%-- /e-product --%>
                                            </div>
                                        </div>
                                        <div class="item">
                                            <div class="bdr col-xs-12 col-sm-12 col-md-6">
                                                <%-- e-product --%>
                                                <div class="e-product">
                                                    <div class="pro-img">
                                                        <sup class="sale-tag">sale!</sup>
                                                        <img src="${pageContext.request.contextPath}/mall/assets/images/ghm-img1.jpg" alt="2">
                                                        <div class="hover-icon">
                                                            <a href="#"><i class="fa fa-search" aria-hidden="true"></i></a>
                                                        </div>
                                                    </div>
                                                    <div class="pro-text-outer">
                                                        <span>Macbook, Laptop</span>
                                                        <a href="#">
                                                            <h4> Apple Macbook Retina 23’ </h4>
                                                        </a>
                                                        <p class="wk-price">$290.00 </p>
                                                        <a href="#" class="add-btn">Add to cart</a>
                                                        <a href="#" class="add-btn2"><i class="icon-heart icons"
                                                                                        aria-hidden="true"></i></a>
                                                        <a href="#" class="add-btn2"><i class="icon-refresh icons"></i></a>
                                                    </div>
                                                </div>
                                                <%-- /e-product --%>
                                            </div>
                                            <div class="bdr col-xs-12 col-sm-12 col-md-6">
                                                <%-- e-product --%>
                                                <div class="e-product">
                                                    <div class="pro-img">
                                                        <img src="${pageContext.request.contextPath}/mall/assets/images/ghm-img2.jpg" alt="2">
                                                        <div class="hover-icon">
                                                            <a href="#"><i class="fa fa-search" aria-hidden="true"></i></a>
                                                        </div>
                                                    </div>
                                                    <div class="pro-text-outer">
                                                        <span>Macbook, Laptop</span>
                                                        <a href="#">
                                                            <h4> Apple Macbook Retina 23’ </h4>
                                                        </a>
                                                        <p class="wk-price">$290.00 </p>
                                                        <a href="#" class="add-btn">Add to cart</a>
                                                    </div>
                                                </div>
                                                <%-- /e-product --%>
                                            </div>
                                            <div class="bdr col-xs-12 col-sm-12 col-md-6">
                                                <%-- e-product --%>
                                                <div class="e-product">
                                                    <div class="pro-img">
                                                        <img src="${pageContext.request.contextPath}/mall/assets/images/ghm-img3.jpg" alt="2">
                                                        <div class="hover-icon">
                                                            <a href="#"><i class="fa fa-search" aria-hidden="true"></i></a>
                                                        </div>
                                                    </div>
                                                    <div class="pro-text-outer">
                                                        <span>Macbook, Laptop</span>
                                                        <a href="#">
                                                            <h4> Apple Macbook Retina 23’ </h4>
                                                        </a>
                                                        <p class="wk-price">$290.00 </p>
                                                        <a href="#" class="add-btn">Add to cart</a>
                                                    </div>
                                                </div>
                                                <%-- /e-product --%>
                                            </div>
                                            <div class="bdr col-xs-12 col-sm-12 col-md-6">
                                                <%-- e-product --%>
                                                <div class="e-product">
                                                    <div class="pro-img">
                                                        <img src="${pageContext.request.contextPath}/mall/assets/images/ghm-img4.jpg" alt="2">
                                                        <div class="hover-icon">
                                                            <a href="#"><i class="fa fa-search" aria-hidden="true"></i></a>
                                                        </div>
                                                    </div>
                                                    <div class="pro-text-outer">
                                                        <span>Macbook, Laptop</span>
                                                        <a href="#">
                                                            <h4> Apple Macbook Retina 23’ </h4>
                                                        </a>
                                                        <p class="wk-price">$290.00 </p>
                                                        <a href="#" class="add-btn">Add to cart</a>
                                                    </div>
                                                </div>
                                                <%-- /e-product --%>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <%-- /tab-pane --%>
                            <%-- tab-pane --%>
                            <div id="clothing3" class="tab-pane fade in">
                                <div class="owl-demo-outer">
                                    <%-- #owl-demo --%>
                                    <div id="owl-demo29" class="deals-wk2">
                                        <div class="item">
                                            <div class="bdr col-xs-12 col-sm-12 col-md-6">
                                                <%-- e-product --%>
                                                <div class="e-product">
                                                    <div class="pro-img">
                                                        <img src="${pageContext.request.contextPath}/mall/assets/images/ghm-img1.jpg" alt="2">
                                                        <div class="hover-icon">
                                                            <a href="#"><i class="fa fa-search" aria-hidden="true"></i></a>
                                                        </div>
                                                    </div>
                                                    <div class="pro-text-outer">
                                                        <span>Macbook, Laptop</span>
                                                        <a href="#">
                                                            <h4> Apple Macbook Retina 23’ </h4>
                                                        </a>
                                                        <p class="wk-price">$290.00 </p>
                                                        <a href="#" class="add-btn">Add to cart</a>
                                                        <a href="#" class="add-btn2"><i class="icon-heart icons"
                                                                                        aria-hidden="true"></i></a>
                                                        <a href="#" class="add-btn2"><i class="icon-refresh icons"></i></a>
                                                    </div>
                                                </div>
                                                <%-- /e-product --%>
                                            </div>
                                            <div class="bdr col-xs-12 col-sm-12 col-md-6">
                                                <%-- e-product --%>
                                                <div class="e-product">
                                                    <div class="pro-img">
                                                        <sup class="sale-tag">sale!</sup>
                                                        <img src="${pageContext.request.contextPath}/mall/assets/images/ghm-img2.jpg" alt="2">
                                                        <div class="hover-icon">
                                                            <a href="#"><i class="fa fa-search" aria-hidden="true"></i></a>
                                                        </div>
                                                    </div>
                                                    <div class="pro-text-outer">
                                                        <span>Macbook, Laptop</span>
                                                        <a href="#">
                                                            <h4> Apple Macbook Retina 23’ </h4>
                                                        </a>
                                                        <p class="wk-price">$290.00 </p>
                                                        <a href="#" class="add-btn">Add to cart</a>
                                                    </div>
                                                </div>
                                                <%-- /e-product --%>
                                            </div>
                                            <div class="bdr col-xs-12 col-sm-12 col-md-6">
                                                <%-- e-product --%>
                                                <div class="e-product">
                                                    <div class="pro-img">
                                                        <sup class="sale-tag">sale!</sup>
                                                        <img src="${pageContext.request.contextPath}/mall/assets/images/ghm-img3.jpg" alt="2">
                                                        <div class="hover-icon">
                                                            <a href="#"><i class="fa fa-search" aria-hidden="true"></i></a>
                                                        </div>
                                                    </div>
                                                    <div class="pro-text-outer">
                                                        <span>Macbook, Laptop</span>
                                                        <a href="#">
                                                            <h4> Apple Macbook Retina 23’ </h4>
                                                        </a>
                                                        <p class="wk-price">$290.00 </p>
                                                        <a href="#" class="add-btn">Add to cart</a>
                                                    </div>
                                                </div>
                                                <%-- /e-product --%>
                                            </div>
                                            <div class="bdr col-xs-12 col-sm-12 col-md-6">
                                                <%-- e-product --%>
                                                <div class="e-product">
                                                    <div class="pro-img">
                                                        <sup class="new-tag">NEW</sup>
                                                        <img src="${pageContext.request.contextPath}/mall/assets/images/ghm-img4.jpg" alt="2">
                                                        <div class="hover-icon">
                                                            <a href="#"><i class="fa fa-search" aria-hidden="true"></i></a>
                                                        </div>
                                                    </div>
                                                    <div class="pro-text-outer">
                                                        <span>Macbook, Laptop</span>
                                                        <a href="#">
                                                            <h4> Apple Macbook Retina 23’ </h4>
                                                        </a>
                                                        <p class="wk-price">$290.00 </p>
                                                        <a href="#" class="add-btn">Add to cart</a>
                                                    </div>
                                                </div>
                                                <%-- /e-product --%>
                                            </div>
                                        </div>
                                        <div class="item">
                                            <div class="bdr col-xs-12 col-sm-12 col-md-6">
                                                <%-- e-product --%>
                                                <div class="e-product">
                                                    <div class="pro-img">
                                                        <sup class="sale-tag">sale!</sup>
                                                        <img src="${pageContext.request.contextPath}/mall/assets/images/ghm-img1.jpg" alt="2">
                                                        <div class="hover-icon">
                                                            <a href="#"><i class="fa fa-search" aria-hidden="true"></i></a>
                                                        </div>
                                                    </div>
                                                    <div class="pro-text-outer">
                                                        <span>Macbook, Laptop</span>
                                                        <a href="#">
                                                            <h4> Apple Macbook Retina 23’ </h4>
                                                        </a>
                                                        <p class="wk-price">$290.00 </p>
                                                        <a href="#" class="add-btn">Add to cart</a>
                                                        <a href="#" class="add-btn2"><i class="icon-heart icons"
                                                                                        aria-hidden="true"></i></a>
                                                        <a href="#" class="add-btn2"><i class="icon-refresh icons"></i></a>
                                                    </div>
                                                </div>
                                                <%-- /e-product --%>
                                            </div>
                                            <div class="bdr col-xs-12 col-sm-12 col-md-6">
                                                <%-- e-product --%>
                                                <div class="e-product">
                                                    <div class="pro-img">
                                                        <img src="${pageContext.request.contextPath}/mall/assets/images/ghm-img2.jpg" alt="2">
                                                        <div class="hover-icon">
                                                            <a href="#"><i class="fa fa-search" aria-hidden="true"></i></a>
                                                        </div>
                                                    </div>
                                                    <div class="pro-text-outer">
                                                        <span>Macbook, Laptop</span>
                                                        <a href="#">
                                                            <h4> Apple Macbook Retina 23’ </h4>
                                                        </a>
                                                        <p class="wk-price">$290.00 </p>
                                                        <a href="#" class="add-btn">Add to cart</a>
                                                    </div>
                                                </div>
                                                <%-- /e-product --%>
                                            </div>
                                            <div class="bdr col-xs-12 col-sm-12 col-md-6">
                                                <%-- e-product --%>
                                                <div class="e-product">
                                                    <div class="pro-img">
                                                        <img src="${pageContext.request.contextPath}/mall/assets/images/ghm-img3.jpg" alt="2">
                                                        <div class="hover-icon">
                                                            <a href="#"><i class="fa fa-search" aria-hidden="true"></i></a>
                                                        </div>
                                                    </div>
                                                    <div class="pro-text-outer">
                                                        <span>Macbook, Laptop</span>
                                                        <a href="#">
                                                            <h4> Apple Macbook Retina 23’ </h4>
                                                        </a>
                                                        <p class="wk-price">$290.00 </p>
                                                        <a href="#" class="add-btn">Add to cart</a>
                                                    </div>
                                                </div>
                                                <%-- /e-product --%>
                                            </div>
                                            <div class="bdr col-xs-12 col-sm-12 col-md-6">
                                                <%-- e-product --%>
                                                <div class="e-product">
                                                    <div class="pro-img">
                                                        <img src="${pageContext.request.contextPath}/mall/assets/images/ghm-img4.jpg" alt="2">
                                                        <div class="hover-icon">
                                                            <a href="#"><i class="fa fa-search" aria-hidden="true"></i></a>
                                                        </div>
                                                    </div>
                                                    <div class="pro-text-outer">
                                                        <span>Macbook, Laptop</span>
                                                        <a href="#">
                                                            <h4> Apple Macbook Retina 23’ </h4>
                                                        </a>
                                                        <p class="wk-price">$290.00 </p>
                                                        <a href="#" class="add-btn">Add to cart</a>
                                                    </div>
                                                </div>
                                                <%-- /e-product --%>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <%-- /tab-pane --%>
                            <%-- tab-pane --%>
                            <div id="shoes3" class="tab-pane fade in">
                                <div class="owl-demo-outer">
                                    <%-- #owl-demo --%>
                                    <div id="owl-demo30" class="deals-wk2">
                                        <div class="item">
                                            <div class="bdr col-xs-12 col-sm-12 col-md-6">
                                                <%-- e-product --%>
                                                <div class="e-product">
                                                    <div class="pro-img">
                                                        <img src="${pageContext.request.contextPath}/mall/assets/images/ghm-img1.jpg" alt="2">
                                                        <div class="hover-icon">
                                                            <a href="#"><i class="fa fa-search" aria-hidden="true"></i></a>
                                                        </div>
                                                    </div>
                                                    <div class="pro-text-outer">
                                                        <span>Macbook, Laptop</span>
                                                        <a href="#">
                                                            <h4> Apple Macbook Retina 23’ </h4>
                                                        </a>
                                                        <p class="wk-price">$290.00 </p>
                                                        <a href="#" class="add-btn">Add to cart</a>
                                                        <a href="#" class="add-btn2"><i class="icon-heart icons"
                                                                                        aria-hidden="true"></i></a>
                                                        <a href="#" class="add-btn2"><i class="icon-refresh icons"></i></a>
                                                    </div>
                                                </div>
                                                <%-- /e-product --%>
                                            </div>
                                            <div class="bdr col-xs-12 col-sm-12 col-md-6">
                                                <%-- e-product --%>
                                                <div class="e-product">
                                                    <div class="pro-img">
                                                        <sup class="sale-tag">sale!</sup>
                                                        <img src="${pageContext.request.contextPath}/mall/assets/images/ghm-img2.jpg" alt="2">
                                                        <div class="hover-icon">
                                                            <a href="#"><i class="fa fa-search" aria-hidden="true"></i></a>
                                                        </div>
                                                    </div>
                                                    <div class="pro-text-outer">
                                                        <span>Macbook, Laptop</span>
                                                        <a href="#">
                                                            <h4> Apple Macbook Retina 23’ </h4>
                                                        </a>
                                                        <p class="wk-price">$290.00 </p>
                                                        <a href="#" class="add-btn">Add to cart</a>
                                                    </div>
                                                </div>
                                                <%-- /e-product --%>
                                            </div>
                                            <div class="bdr col-xs-12 col-sm-12 col-md-6">
                                                <%-- e-product --%>
                                                <div class="e-product">
                                                    <div class="pro-img">
                                                        <sup class="sale-tag">sale!</sup>
                                                        <img src="${pageContext.request.contextPath}/mall/assets/images/ghm-img3.jpg" alt="2">
                                                        <div class="hover-icon">
                                                            <a href="#"><i class="fa fa-search" aria-hidden="true"></i></a>
                                                        </div>
                                                    </div>
                                                    <div class="pro-text-outer">
                                                        <span>Macbook, Laptop</span>
                                                        <a href="#">
                                                            <h4> Apple Macbook Retina 23’ </h4>
                                                        </a>
                                                        <p class="wk-price">$290.00 </p>
                                                        <a href="#" class="add-btn">Add to cart</a>
                                                    </div>
                                                </div>
                                                <%-- /e-product --%>
                                            </div>
                                            <div class="bdr col-xs-12 col-sm-12 col-md-6">
                                                <%-- e-product --%>
                                                <div class="e-product">
                                                    <div class="pro-img">
                                                        <sup class="new-tag">NEW</sup>
                                                        <img src="${pageContext.request.contextPath}/mall/assets/images/ghm-img4.jpg" alt="2">
                                                        <div class="hover-icon">
                                                            <a href="#"><i class="fa fa-search" aria-hidden="true"></i></a>
                                                        </div>
                                                    </div>
                                                    <div class="pro-text-outer">
                                                        <span>Macbook, Laptop</span>
                                                        <a href="#">
                                                            <h4> Apple Macbook Retina 23’ </h4>
                                                        </a>
                                                        <p class="wk-price">$290.00 </p>
                                                        <a href="#" class="add-btn">Add to cart</a>
                                                    </div>
                                                </div>
                                                <%-- /e-product --%>
                                            </div>
                                        </div>
                                        <div class="item">
                                            <div class="bdr col-xs-12 col-sm-12 col-md-6">
                                                <%-- e-product --%>
                                                <div class="e-product">
                                                    <div class="pro-img">
                                                        <sup class="sale-tag">sale!</sup>
                                                        <img src="${pageContext.request.contextPath}/mall/assets/images/ghm-img1.jpg" alt="2">
                                                        <div class="hover-icon">
                                                            <a href="#"><i class="fa fa-search" aria-hidden="true"></i></a>
                                                        </div>
                                                    </div>
                                                    <div class="pro-text-outer">
                                                        <span>Macbook, Laptop</span>
                                                        <a href="#">
                                                            <h4> Apple Macbook Retina 23’ </h4>
                                                        </a>
                                                        <p class="wk-price">$290.00 </p>
                                                        <a href="#" class="add-btn">Add to cart</a>
                                                        <a href="#" class="add-btn2"><i class="icon-heart icons"
                                                                                        aria-hidden="true"></i></a>
                                                        <a href="#" class="add-btn2"><i class="icon-refresh icons"></i></a>
                                                    </div>
                                                </div>
                                                <%-- /e-product --%>
                                            </div>
                                            <div class="bdr col-xs-12 col-sm-12 col-md-6">
                                                <%-- e-product --%>
                                                <div class="e-product">
                                                    <div class="pro-img">
                                                        <img src="${pageContext.request.contextPath}/mall/assets/images/ghm-img2.jpg" alt="2">
                                                        <div class="hover-icon">
                                                            <a href="#"><i class="fa fa-search" aria-hidden="true"></i></a>
                                                        </div>
                                                    </div>
                                                    <div class="pro-text-outer">
                                                        <span>Macbook, Laptop</span>
                                                        <a href="#">
                                                            <h4> Apple Macbook Retina 23’ </h4>
                                                        </a>
                                                        <p class="wk-price">$290.00 </p>
                                                        <a href="#" class="add-btn">Add to cart</a>
                                                    </div>
                                                </div>
                                                <%-- /e-product --%>
                                            </div>
                                            <div class="bdr col-xs-12 col-sm-12 col-md-6">
                                                <%-- e-product --%>
                                                <div class="e-product">
                                                    <div class="pro-img">
                                                        <img src="${pageContext.request.contextPath}/mall/assets/images/ghm-img3.jpg" alt="2">
                                                        <div class="hover-icon">
                                                            <a href="#"><i class="fa fa-search" aria-hidden="true"></i></a>
                                                        </div>
                                                    </div>
                                                    <div class="pro-text-outer">
                                                        <span>Macbook, Laptop</span>
                                                        <a href="#">
                                                            <h4> Apple Macbook Retina 23’ </h4>
                                                        </a>
                                                        <p class="wk-price">$290.00 </p>
                                                        <a href="#" class="add-btn">Add to cart</a>
                                                    </div>
                                                </div>
                                                <%-- /e-product --%>
                                            </div>
                                            <div class="bdr col-xs-12 col-sm-12 col-md-6">
                                                <%-- e-product --%>
                                                <div class="e-product">
                                                    <div class="pro-img">
                                                        <img src="${pageContext.request.contextPath}/mall/assets/images/ghm-img4.jpg" alt="2">
                                                        <div class="hover-icon">
                                                            <a href="#"><i class="fa fa-search" aria-hidden="true"></i></a>
                                                        </div>
                                                    </div>
                                                    <div class="pro-text-outer">
                                                        <span>Macbook, Laptop</span>
                                                        <a href="#">
                                                            <h4> Apple Macbook Retina 23’ </h4>
                                                        </a>
                                                        <p class="wk-price">$290.00 </p>
                                                        <a href="#" class="add-btn">Add to cart</a>
                                                    </div>
                                                </div>
                                                <%-- /e-product --%>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <%-- /tab-pane --%>
                            <%-- tab-pane --%>
                            <div id="handbag3" class="tab-pane fade in">
                                <div class="owl-demo-outer">
                                    <%-- #owl-demo --%>
                                    <div id="owl-demo31" class="deals-wk2">
                                        <div class="item">
                                            <div class="bdr col-xs-12 col-sm-12 col-md-6">
                                                <%-- e-product --%>
                                                <div class="e-product">
                                                    <div class="pro-img">
                                                        <img src="${pageContext.request.contextPath}/mall/assets/images/ghm-img1.jpg" alt="2">
                                                        <div class="hover-icon">
                                                            <a href="#"><i class="fa fa-search" aria-hidden="true"></i></a>
                                                        </div>
                                                    </div>
                                                    <div class="pro-text-outer">
                                                        <span>Macbook, Laptop</span>
                                                        <a href="#">
                                                            <h4> Apple Macbook Retina 23’ </h4>
                                                        </a>
                                                        <p class="wk-price">$290.00 </p>
                                                        <a href="#" class="add-btn">Add to cart</a>
                                                        <a href="#" class="add-btn2"><i class="icon-heart icons"
                                                                                        aria-hidden="true"></i></a>
                                                        <a href="#" class="add-btn2"><i class="icon-refresh icons"></i></a>
                                                    </div>
                                                </div>
                                                <%-- /e-product --%>
                                            </div>
                                            <div class="bdr col-xs-12 col-sm-12 col-md-6">
                                                <%-- e-product --%>
                                                <div class="e-product">
                                                    <div class="pro-img">
                                                        <sup class="sale-tag">sale!</sup>
                                                        <img src="${pageContext.request.contextPath}/mall/assets/images/ghm-img2.jpg" alt="2">
                                                        <div class="hover-icon">
                                                            <a href="#"><i class="fa fa-search" aria-hidden="true"></i></a>
                                                        </div>
                                                    </div>
                                                    <div class="pro-text-outer">
                                                        <span>Macbook, Laptop</span>
                                                        <a href="#">
                                                            <h4> Apple Macbook Retina 23’ </h4>
                                                        </a>
                                                        <p class="wk-price">$290.00 </p>
                                                        <a href="#" class="add-btn">Add to cart</a>
                                                    </div>
                                                </div>
                                                <%-- /e-product --%>
                                            </div>
                                            <div class="bdr col-xs-12 col-sm-12 col-md-6">
                                                <%-- e-product --%>
                                                <div class="e-product">
                                                    <div class="pro-img">
                                                        <sup class="sale-tag">sale!</sup>
                                                        <img src="${pageContext.request.contextPath}/mall/assets/images/ghm-img3.jpg" alt="2">
                                                        <div class="hover-icon">
                                                            <a href="#"><i class="fa fa-search" aria-hidden="true"></i></a>
                                                        </div>
                                                    </div>
                                                    <div class="pro-text-outer">
                                                        <span>Macbook, Laptop</span>
                                                        <a href="#">
                                                            <h4> Apple Macbook Retina 23’ </h4>
                                                        </a>
                                                        <p class="wk-price">$290.00 </p>
                                                        <a href="#" class="add-btn">Add to cart</a>
                                                    </div>
                                                </div>
                                                <%-- /e-product --%>
                                            </div>
                                            <div class="bdr col-xs-12 col-sm-12 col-md-6">
                                                <%-- e-product --%>
                                                <div class="e-product">
                                                    <div class="pro-img">
                                                        <sup class="new-tag">NEW</sup>
                                                        <img src="${pageContext.request.contextPath}/mall/assets/images/ghm-img4.jpg" alt="2">
                                                        <div class="hover-icon">
                                                            <a href="#"><i class="fa fa-search" aria-hidden="true"></i></a>
                                                        </div>
                                                    </div>
                                                    <div class="pro-text-outer">
                                                        <span>Macbook, Laptop</span>
                                                        <a href="#">
                                                            <h4> Apple Macbook Retina 23’ </h4>
                                                        </a>
                                                        <p class="wk-price">$290.00 </p>
                                                        <a href="#" class="add-btn">Add to cart</a>
                                                    </div>
                                                </div>
                                                <%-- /e-product --%>
                                            </div>
                                        </div>
                                        <div class="item">
                                            <div class="bdr col-xs-12 col-sm-12 col-md-6">
                                                <%-- e-product --%>
                                                <div class="e-product">
                                                    <div class="pro-img">
                                                        <sup class="sale-tag">sale!</sup>
                                                        <img src="${pageContext.request.contextPath}/mall/assets/images/ghm-img1.jpg" alt="2">
                                                        <div class="hover-icon">
                                                            <a href="#"><i class="fa fa-search" aria-hidden="true"></i></a>
                                                        </div>
                                                    </div>
                                                    <div class="pro-text-outer">
                                                        <span>Macbook, Laptop</span>
                                                        <a href="#">
                                                            <h4> Apple Macbook Retina 23’ </h4>
                                                        </a>
                                                        <p class="wk-price">$290.00 </p>
                                                        <a href="#" class="add-btn">Add to cart</a>
                                                        <a href="#" class="add-btn2"><i class="icon-heart icons"
                                                                                        aria-hidden="true"></i></a>
                                                        <a href="#" class="add-btn2"><i class="icon-refresh icons"></i></a>
                                                    </div>
                                                </div>
                                                <%-- /e-product --%>
                                            </div>
                                            <div class="bdr col-xs-12 col-sm-12 col-md-6">
                                                <%-- e-product --%>
                                                <div class="e-product">
                                                    <div class="pro-img">
                                                        <img src="${pageContext.request.contextPath}/mall/assets/images/ghm-img2.jpg" alt="2">
                                                        <div class="hover-icon">
                                                            <a href="#"><i class="fa fa-search" aria-hidden="true"></i></a>
                                                        </div>
                                                    </div>
                                                    <div class="pro-text-outer">
                                                        <span>Macbook, Laptop</span>
                                                        <a href="#">
                                                            <h4> Apple Macbook Retina 23’ </h4>
                                                        </a>
                                                        <p class="wk-price">$290.00 </p>
                                                        <a href="#" class="add-btn">Add to cart</a>
                                                    </div>
                                                </div>
                                                <%-- /e-product --%>
                                            </div>
                                            <div class="bdr col-xs-12 col-sm-12 col-md-6">
                                                <%-- e-product --%>
                                                <div class="e-product">
                                                    <div class="pro-img">
                                                        <img src="${pageContext.request.contextPath}/mall/assets/images/ghm-img3.jpg" alt="2">
                                                        <div class="hover-icon">
                                                            <a href="#"><i class="fa fa-search" aria-hidden="true"></i></a>
                                                        </div>
                                                    </div>
                                                    <div class="pro-text-outer">
                                                        <span>Macbook, Laptop</span>
                                                        <a href="#">
                                                            <h4> Apple Macbook Retina 23’ </h4>
                                                        </a>
                                                        <p class="wk-price">$290.00 </p>
                                                        <a href="#" class="add-btn">Add to cart</a>
                                                    </div>
                                                </div>
                                                <%-- /e-product --%>
                                            </div>
                                            <div class="bdr col-xs-12 col-sm-12 col-md-6">
                                                <%-- e-product --%>
                                                <div class="e-product">
                                                    <div class="pro-img">
                                                        <img src="${pageContext.request.contextPath}/mall/assets/images/ghm-img4.jpg" alt="2">
                                                        <div class="hover-icon">
                                                            <a href="#"><i class="fa fa-search" aria-hidden="true"></i></a>
                                                        </div>
                                                    </div>
                                                    <div class="pro-text-outer">
                                                        <span>Macbook, Laptop</span>
                                                        <a href="#">
                                                            <h4> Apple Macbook Retina 23’ </h4>
                                                        </a>
                                                        <p class="wk-price">$290.00 </p>
                                                        <a href="#" class="add-btn">Add to cart</a>
                                                    </div>
                                                </div>
                                                <%-- /e-product --%>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <%-- /tab-pane --%>
                        </div>
                        <%-- /tab-content --%>

                    </div>
                </div>
            </div>
            <%-- /GIFT --%>
            <%-- full-banner --%>
            <div class="half-banner">
                <div class="row">
                    <a href="#" class="col-xs-12 col-sm-12 col-md-12">
                        <img src="${pageContext.request.contextPath}/mall/assets/images/add-banner-large2.jpg" alt="add-banner-large2"/>
                    </a>
                </div>
            </div>
            <%-- /full-banner --%>
            <%-- title --%>
            <div class="title">
                <h2>
                    LATEST POSTS BLOG
                </h2>
            </div>
            <%-- /title --%>
            <%-- BLOG --%>
            <div class="home-blog">
                <div class="col-xs-12 col-sm-12 col-md-12">
                    <div class="row">
                        <div class="owl-demo-outer">
                            <%-- #owl-demo --%>
                            <div id="owl-demo2" class="deals-wk2">
                                <%-- item --%>
                                <div class="item">
                                    <div class="bdr col-xs-12 col-sm-6 col-md-4">
                                        <%-- blog-outer --%>
                                        <div class="blog-outer">
                                            <div class="blog-img">
                                                <img src="${pageContext.request.contextPath}/mall/assets/images/lt-blog-img1.jpg" alt="lt-blog-img1">
                                            </div>
                                            <div class="blog-text-outer">
                                                <a href="#">
                                                    <h4>Nam liber tempor cum soluta nobis </h4>
                                                </a>
                                                <p><span class="dt">March 20, 2017</span> by <span class="ath">Zcubedesign</span>
                                                </p>
                                                <p class="content-text">Typi non habent claritatem insitam est usus
                                                    legentis in iis qui facit eorum claritatem. Investigationes...</p>
                                                <a href="#" class="add-btn">read more</a>
                                            </div>
                                        </div>
                                        <%-- /blog-outer --%>
                                    </div>
                                    <div class="bdr col-xs-12 col-sm-6 col-md-4">
                                        <%-- blog-outer --%>
                                        <div class="blog-outer">
                                            <div class="blog-img">
                                                <img src="${pageContext.request.contextPath}/mall/assets/images/lt-blog-img2.jpg" alt="lt-blog-img1">
                                            </div>
                                            <div class="blog-text-outer">
                                                <a href="#">
                                                    <h4>Nam liber tempor cum soluta nobis </h4>
                                                </a>
                                                <p><span class="dt">March 20, 2017</span> by <span class="ath">Zcubedesign</span>
                                                </p>
                                                <p class="content-text">Typi non habent claritatem insitam est usus
                                                    legentis in iis qui facit eorum claritatem. Investigationes...</p>
                                                <a href="#" class="add-btn">read more</a>
                                            </div>
                                        </div>
                                        <%-- /blog-outer --%>
                                    </div>
                                    <div class="bdr col-xs-12 col-sm-6 col-md-4">
                                        <%-- blog-outer --%>
                                        <div class="blog-outer">
                                            <div class="blog-img">
                                                <img src="${pageContext.request.contextPath}/mall/assets/images/lt-blog-img3.jpg" alt="lt-blog-img1">
                                            </div>
                                            <div class="blog-text-outer">
                                                <a href="#">
                                                    <h4>Nam liber tempor cum soluta nobis </h4>
                                                </a>
                                                <p><span class="dt">March 20, 2017</span> by <span class="ath">Zcubedesign</span>
                                                </p>
                                                <p class="content-text">Typi non habent claritatem insitam est usus
                                                    legentis in iis qui facit eorum claritatem. Investigationes...</p>
                                                <a href="#" class="add-btn">read more</a>
                                            </div>
                                        </div>
                                        <%-- /blog-outer --%>
                                    </div>
                                </div>
                                <%-- /item --%>
                                <%-- item --%>
                                <div class="item">
                                    <div class="bdr col-xs-12 col-sm-6 col-md-4">
                                        <%-- blog-outer --%>
                                        <div class="blog-outer">
                                            <div class="blog-img">
                                                <img src="${pageContext.request.contextPath}/mall/assets/images/lt-blog-img1.jpg" alt="lt-blog-img1">
                                            </div>
                                            <div class="blog-text-outer">
                                                <a href="#">
                                                    <h4>Nam liber tempor cum soluta nobis </h4>
                                                </a>
                                                <p><span class="dt">March 20, 2017</span> by <span class="ath">Zcubedesign</span>
                                                </p>
                                                <p class="content-text">Typi non habent claritatem insitam est usus
                                                    legentis in iis qui facit eorum claritatem. Investigationes...</p>
                                                <a href="#" class="add-btn">read more</a>
                                            </div>
                                        </div>
                                        <%-- /blog-outer --%>
                                    </div>
                                    <div class="bdr col-xs-12 col-sm-6 col-md-4">
                                        <%-- blog-outer --%>
                                        <div class="blog-outer">
                                            <div class="blog-img">
                                                <img src="${pageContext.request.contextPath}/mall/assets/images/lt-blog-img2.jpg" alt="lt-blog-img1">
                                            </div>
                                            <div class="blog-text-outer">
                                                <a href="#">
                                                    <h4>Nam liber tempor cum soluta nobis </h4>
                                                </a>
                                                <p><span class="dt">March 20, 2017</span> by <span class="ath">Zcubedesign</span>
                                                </p>
                                                <p class="content-text">Typi non habent claritatem insitam est usus
                                                    legentis in iis qui facit eorum claritatem. Investigationes...</p>
                                                <a href="#" class="add-btn">read more</a>
                                            </div>
                                        </div>
                                        <%-- /blog-outer --%>
                                    </div>
                                    <div class="bdr col-xs-12 col-sm-6 col-md-4">
                                        <%-- blog-outer --%>
                                        <div class="blog-outer">
                                            <div class="blog-img">
                                                <img src="${pageContext.request.contextPath}/mall/assets/images/lt-blog-img3.jpg" alt="lt-blog-img1">
                                            </div>
                                            <div class="blog-text-outer">
                                                <a href="#">
                                                    <h4>Nam liber tempor cum soluta nobis </h4>
                                                </a>
                                                <p><span class="dt">March 20, 2017</span> by <span class="ath">Zcubedesign</span>
                                                </p>
                                                <p class="content-text">Typi non habent claritatem insitam est usus
                                                    legentis in iis qui facit eorum claritatem. Investigationes...</p>
                                                <a href="#" class="add-btn">read more</a>
                                            </div>
                                        </div>
                                        <%-- /blog-outer --%>
                                    </div>
                                </div>
                                <%-- /item --%>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <%-- /BLOG --%>
            <div class="testimonal">
                <%-- .testimonal --%>
                <div class="col-md-12 text-center">
                    <div id="home-slider11" class="carousel slide carousel-fade" data-ride="carousel">
                        <%-- .testimonal-slider --%>
                        <div class="carousel-inner">
                            <div class="item">
                                <div class="caption">
                                    <p class="animated fadeInRightBig">Duis autem vel eum iriure dolor in hendrerit in
                                        vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla
                                        facilisis at vero eros et accumsan et iusto odio dignissim qui blandit.
                                        <br>
                                        <br>
                                        <span>Zcubedesign</span> - Web designer
                                    </p>
                                </div>
                            </div>
                            <div class="item">
                                <div class="caption">
                                    <p class="animated fadeInRightBig">Duis autem vel eum iriure dolor in hendrerit in
                                        vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla
                                        facilisis at vero eros et accumsan et iusto odio dignissim qui blandit.
                                        <br>
                                        <br>
                                        <span>Zcubedesign</span> - Web designer
                                    </p>
                                </div>
                            </div>
                            <div class="item active">
                                <div class="caption">
                                    <p class="animated fadeInRightBig">Duis autem vel eum iriure dolor in hendrerit in
                                        vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla
                                        facilisis at vero eros et accumsan et iusto odio dignissim qui blandit.
                                        <br>
                                        <br>
                                        <span>Zcubedesign</span> - Web designer
                                    </p>
                                </div>
                            </div>
                            <div class="item">
                                <div class="caption">
                                    <p class="animated fadeInRightBig">Duis autem vel eum iriure dolor in hendrerit in
                                        vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla
                                        facilisis at vero eros et accumsan et iusto odio dignissim qui blandit.
                                        <br>
                                        <br>
                                        <span>Zcubedesign</span> - Web designer
                                    </p>
                                </div>
                            </div>
                            <div class="item">
                                <div class="caption">
                                    <p class="animated fadeInRightBig">Duis autem vel eum iriure dolor in hendrerit in
                                        vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla
                                        facilisis at vero eros et accumsan et iusto odio dignissim qui blandit.
                                        <br>
                                        <br>
                                        <span>Zcubedesign</span> - Web designer
                                    </p>
                                </div>
                            </div>

                            <ol class="carousel-indicators">
                                <li data-target="#home-slider11" data-slide-to="0" class=""><img
                                        src="${pageContext.request.contextPath}/mall/assets/images/test-img1.jpg" alt="11"></li>
                                <li data-target="#home-slider11" data-slide-to="1" class=""><img
                                        src="${pageContext.request.contextPath}/mall/assets/images/test-img1.jpg" alt="11"></li>
                                <li data-target="#home-slider11" data-slide-to="2" class="active"><img
                                        src="${pageContext.request.contextPath}/mall/assets/images/test-img1.jpg" alt="11"></li>
                                <li data-target="#home-slider11" data-slide-to="3" class=""><img
                                        src="${pageContext.request.contextPath}/mall/assets/images/test-img1.jpg" alt="11"></li>
                                <li data-target="#home-slider11" data-slide-to="4" class=""><img
                                        src="${pageContext.request.contextPath}/mall/assets/images/test-img1.jpg" alt="11"></li>
                            </ol>
                        </div>
                        <%-- /.testimonal-slider --%>
                    </div>
                </div>
                <%-- /.testimonal --%>
            </div>
            <%-- .free-shipping --%>
            <div class="free-shipping">
                <div class="row">
                    <div class="col-xs-12 col-sm-6 col-md-3">
                        <div class="icon-shipping">
                            <i class="icon-rocket icons"></i>
                        </div>
                        <div class="shipping-text">
                            <h4>free shipping </h4>
                            <p>Free Shipping On All Order</p>
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-6 col-md-3">
                        <div class="icon-shipping">
                            <i class="icon-earphones-alt icons"></i>
                        </div>
                        <div class="shipping-text">
                            <h4>online support 24/7</h4>
                            <p>Technical Support 24/7</p>
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-6 col-md-3">
                        <div class="icon-shipping">
                            <i class="icon-refresh icons"></i>
                        </div>
                        <div class="shipping-text">
                            <h4>MONEY BACK GUARANTEE </h4>
                            <p>30 Day Money Back</p>
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-6 col-md-3">
                        <div class="icon-shipping">
                            <i class="icon-badge icons"></i>
                        </div>
                        <div class="shipping-text">
                            <h4>MEMBER DISCOUNT</h4>
                            <p>Upto 40% Discount</p>
                        </div>
                    </div>

                </div>
            </div>
            <%-- /.free-shipping --%>
        </div>
    </div>
</section>
<%-- /all-product --%>
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
                    <input name="submit" type="button" value="Submit"/>
                </div>
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
                <div class="f-weghit">
                    <img src="${pageContext.request.contextPath}/mall/assets/images/logo.png" alt="logo"/>
                    <p><strong>赵奇做的网站</strong> 是一个牛逼哄哄的网站。很厉害的网站很厉害的网站很厉害的网站很厉害的网站很厉害的网站很厉害的网站很厉害的网站很厉害的网站很厉害的网站</p>
                    <ul>
                        <li><i class="icon-location-pin icons" aria-hidden="true"></i> <strong>地址：</strong> 我就不告诉你我在哪，万一你来打我咋办。
                        </li>
                        <li><i class="icon-envelope-letter icons"></i> <strong>邮箱：</strong> starryzhaoqi@gmail.com
                        </li>
                        <li><i class="icon-call-in icons"></i> <strong>联系电话：</strong> (800) 123 456 789</li>
                    </ul>
                </div>
                <%-- /f-weghit --%>
            </div>
            <div class="col-xs-12 col-sm-4 col-md-4">
                <%-- f-weghit2 --%>
                <div class="f-weghit2">
                    <h4>问讯处</h4>
                    <ul>
                        <li><a href="#">关于我们</a></li>
                        <li><a href="#">联系我们</a></li>
                        <li><a href="#">所有商品贝</a></li>
                        <li><a href="#">隐私权政策；</a></li>
                        <li><a href="#">条款和条件</a></li>
                    </ul>
                </div>
                <%-- /f-weghit2 --%>
                <%-- f-weghit2 --%>
                <div class="f-weghit2">
                    <h4>类别</h4>
                    <ul>
                        <li><a href="#">时装</a></li>
                        <li><a href="#">电子产品</a></li>
                        <li><a href="#">饰品与服饰</a></li>
                        <li><a href="#">珠宝与手表</a></li>
                        <li><a href="#">健康美容</a></li>
                    </ul>
                </div>
                <%-- /f-weghit2 --%>
            </div>
            <div class="col-xs-12 col-sm-4 col-md-4">
                <%-- f-weghit --%>
                <div class="f-weghit">
                    <h4>代销的产品</h4>
                    <%-- e-product --%>
                    <div class="e-product">
                        <div class="pro-img">
                            <img src="${pageContext.request.contextPath}/mall/assets/images/on-seal-img1.jpg" alt="2">
                        </div>
                        <div class="pro-text-outer">
                            <span>Macbook, Laptop</span>
                            <a href="#">
                                <h4> Apple Macbook Retina 23’ </h4>
                            </a>
                            <p class="wk-price">$290.00 </p>
                        </div>
                    </div>
                    <%-- e-product --%>
                    <%-- e-product --%>
                    <div class="e-product">
                        <div class="pro-img">
                            <img src="${pageContext.request.contextPath}/mall/assets/images/on-seal-img2.jpg" alt="2">
                        </div>
                        <div class="pro-text-outer">
                            <span>Macbook, Laptop</span>
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
                    <div class="col-xs-12 col-sm-6 col-md-6">
                        Copyright &copy; 2017.Company name All rights reserved.
                    </div>
                    <div class="text-right col-xs-12 col-sm-6 col-md-6">
                        <img src="${pageContext.request.contextPath}/mall/assets/images/payment-img.jpg" alt="payment-img"/>
                    </div>
                </div>
            </div>
            <%-- /copayright --%>

        </div>
    </div>
</footer>
<%-- sticky-socia --%>
<aside id="sticky-social">
    <ul>
        <li><a href="#" class="fa fa-facebook" target="_blank"><span><i class="fa fa-facebook" aria-hidden="true"></i> Facebook</span></a>
        </li>
        <li><a href="#" class="fa fa-twitter" target="_blank"><span><i class="fa fa-twitter" aria-hidden="true"></i> Twitter</span></a>
        </li>
        <li><a href="#" class="fa fa-rss" target="_blank"><span><i class="fa fa-rss" aria-hidden="true"></i> RSS</span></a>
        </li>
        <li><a href="#" class="fa fa-pinterest-p" target="_blank"><span><i class="fa fa-pinterest-p"
                                                                           aria-hidden="true"></i> Pinterest</span></a>
        </li>
        <li><a href="#" class="fa fa-share-alt" target="_blank"><span><i class="fa fa-share-alt" aria-hidden="true"></i> Flickr</span></a>
        </li>
    </ul>
</aside>
<%-- /sticky-socia --%>
<%-- Get Our Email Letter popup --%>
<%--<div class="modal fade modal-popup" id="modal1" data-open-onload="true" data-open-delay="1500" tabindex="-1"--%>
     <%--role="dialog">--%>
    <%--<div class="modal-dialog modal-lg" role="document">--%>
        <%--<div class="modal-content">--%>
            <%--<button type="button" class="close" data-dismiss="modal" aria-label="Close"><i class="fa fa-times"></i>--%>
            <%--</button>--%>
            <%--<div class="modal-body">--%>
                <%--<div class="container-fluid">--%>
                    <%--<div class="row">--%>
                        <%--<div class="col-sm-6 pt-20">--%>
                        <%--</div>--%>
                        <%--<div class="col-sm-6 pt-20 text-center">--%>
                            <%--<h2 class="heading font34 inverse">--%>
                                <%--Get Our Email Letter--%>
                            <%--</h2>--%>
                            <%--<p class="font22 text-center">Subscribe to the Platin mailing list to receive updates on new--%>
                                <%--arrivals, special offers and other discount information.</p>--%>
                            <%--<form name="main">--%>
                                <%--<div class="form-group">--%>
                                    <%--<input type="text" class="form-control" placeholder="Enter your Email id">--%>
                                <%--</div>--%>
                                <%--<div class="form-group">--%>
                                    <%--<button class="btn btn-black" type="button">Subscribe!</button>--%>
                                <%--</div>--%>
                                <%--<div class="form-group">--%>
                                    <%--<input type="checkbox" name="check"/> Do not show this popup again--%>
                                <%--</div>--%>
                            <%--</form>--%>
                        <%--</div>--%>
                    <%--</div>--%>
                <%--</div>--%>
            <%--</div>--%>
        <%--</div>--%>
    <%--</div>--%>
<%--</div>--%>
<%-- /Get Our Email Letter popup --%>
<p id="back-top">
    <a href="#top"><i class="fa fa-chevron-up" aria-hidden="true"></i></a>
</p>
<script src="${pageContext.request.contextPath}/mall/assets/js/jquery.js"></script>
<%-- Bootstrap Core JavaScript --%>
<script src="${pageContext.request.contextPath}/mall/assets/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/mall/assets/js/bootstrap-dropdownhover.min.js"></script>
<%-- Plugin JavaScript --%>
<script src="${pageContext.request.contextPath}/mall/assets/js/jquery.easing.min.js"></script>
<script src="${pageContext.request.contextPath}/mall/assets/js/wow.min.js"></script>
<%-- owl carousel --%>
<script src="${pageContext.request.contextPath}/mall/assets/owl-carousel/owl.carousel.js"></script>
<%--  Custom Theme JavaScript  --%>
<script src="${pageContext.request.contextPath}/mall/assets/js/custom.js"></script>
</body>

</html>
