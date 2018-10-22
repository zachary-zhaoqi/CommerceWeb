<%@ page import="entity.Members" %>
<%@ page import="dao.mall.ClassificationDAO" %>
<%@ page import="entity.Classification" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: starr
  Date: 2018/9/25
  Time: 22:27
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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/mall/assets/css/bootstrap.min.css" type="text/css">
    <%-- Dropdownhover CSS --%>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/mall/assets/css/bootstrap-dropdownhover.min.css" type="text/css">
    <%-- latest fonts awesome --%>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/mall/assets/font/css/font-awesome.min.css" type="text/css">
    <%-- simple line fonts awesome --%>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/mall/assets/simple-line-icon/css/simple-line-icons.css" type="text/css">
    <%-- stroke-gap-icons --%>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/mall/assets/stroke-gap-icons/stroke-gap-icons.css" type="text/css">
    <%-- Animate CSS --%>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/mall/assets/css/animate.min.css" type="text/css">
    <%-- Style CSS --%>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/mall/assets/css/style.css" type="text/css">
    <%-- Style CSS --%>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/mall/assets/css/jcarousel.connected-carousels.css" type="text/css">
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
    <div id="loading"> </div>
</div>
<header class="header2">
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
                                    <ul class="dropdown-menu dropdownhover-bottom" role="menu">
                                        <%--通过数据库查询有哪些类别显示--%>
                                        <%
                                            for (int i = 0; i < primaryclassifications.size(); i++) {
                                                String primaryclassification_grade = primaryclassifications.get(i).getClassificationgrade();
                                                String primaryclassification_name = primaryclassifications.get(i).getClassificationname();
                                                String primaryclassification_src=primaryclassifications.get(i).getClassificationsrc();
                                                String primaryclassification_href=request.getContextPath()+"/mall/CommodityShow.action?mark=show&primaryclassification="+primaryclassification_name;
                                                out.println("<li class=\"dropdown\">\n" +
                                                        "<a href=\""+primaryclassification_href+"\"><img src=\""+request.getContextPath()+"/"+ primaryclassification_src +"\"alt=\"menu-icon"+ primaryclassification_grade +"\"/>\n" + primaryclassification_name
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
                                                        String secondaryClassification_name=secondaryClassifications.get(j).getClassificationname();
                                                        String secondaryClassification_href=request.getContextPath()+"/mall/CommodityShow.action?mark=show&secondaryclassification="+secondaryClassification_name;
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
</header>
<%-- newsletter --%>
<section class="grid-shop">
    <%-- .grid-shop --%>
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="#">Home</a></li>
                    <li class="breadcrumb-item active">Shop Detail.</li>
                </ol>
                <div class="row">
                    <%-- left side --%>
                    <div class="col-sm-5 col-md-5">
                        <%-- product gallery --%>
                        <div class="connected-carousels">
                            <div class="stage">
                                <div class="carousel carousel-stage">
                                    <ul>
                                        <li><img class="zoom_01" src="${pageContext.request.contextPath}/mall/assets/images/products/fashion/1.jpg" data-zoom-image="assets/images/products/fashion/1.jpg" alt="qoute-icon" /> </li>
                                        <li><img class="zoom_01" src="${pageContext.request.contextPath}/mall/assets/images/products/fashion/2.jpg" data-zoom-image="assets/images/products/fashion/2.jpg" alt="qoute-icon" /></li>
                                        <li><img class="zoom_01" src="${pageContext.request.contextPath}/mall/assets/images/products/fashion/3.jpg" data-zoom-image="assets/images/products/fashion/3.jpg" alt="qoute-icon" /></li>
                                        <li><img class="zoom_01" src="${pageContext.request.contextPath}/mall/assets/images/products/fashion/15.jpg" data-zoom-image="assets/images/products/fashion/15.jpg" alt="qoute-icon" /> </li>
                                        <li><img class="zoom_01" src="${pageContext.request.contextPath}/mall/assets/images/products/fashion/8.jpg" data-zoom-image="assets/images/products/fashion/8.jpg" alt="qoute-icon" /></li>
                                        <li><img class="zoom_01" src="${pageContext.request.contextPath}/mall/assets/images/products/fashion/12.jpg" data-zoom-image="assets/images/products/fashion/12.jpg" alt="qoute-icon" /></li>
                                    </ul>
                                </div>
                                <p class="photo-credits">
                                    Photos by <a href="http://www.mw-fotografie.de">Marc Wiegelmann</a>
                                </p>
                                <a href="#" class="prev prev-stage"><span>&lsaquo;</span></a>
                                <a href="#" class="next next-stage"><span>&rsaquo;</span></a>
                            </div>

                            <div class="navigation">
                                <a href="#" class="prev prev-navigation">&lsaquo;</a>
                                <a href="#" class="next next-navigation">&rsaquo;</a>
                                <div class="carousel carousel-navigation">
                                    <ul>
                                        <li><img src="${pageContext.request.contextPath}/mall/assets/images/products/fashion/1.jpg" width="110" height="110" alt=""></li>
                                        <li><img src="${pageContext.request.contextPath}/mall/assets/images/products/fashion/2.jpg" width="110" height="110" alt=""></li>
                                        <li><img src="${pageContext.request.contextPath}/mall/assets/images/products/fashion/3.jpg" width="110" height="110" alt=""></li>
                                        <li><img src="${pageContext.request.contextPath}/mall/assets/images/products/fashion/15.jpg" width="110" height="110" alt=""></li>
                                        <li><img src="${pageContext.request.contextPath}/mall/assets/images/products/fashion/8.jpg" width="110" height="110" alt=""></li>
                                        <li><img src="${pageContext.request.contextPath}/mall/assets/images/products/fashion/12.jpg" width="110" height="110" alt=""></li>
                                    </ul>
                                </div>
                            </div>
                        </div>

                        <%-- / product gallery --%>
                    </div>
                    <%-- left side --%>
                    <%-- right side --%>
                    <div class="col-sm-7 col-md-7">
                        <%-- .pro-text --%>
                        <div class="pro-text product-detail">
                            <%-- /.pro-img --%>
                            <span class="span1">Macbook, Laptop</span>
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
                            <p><strong>$160.00</strong><span class="line-through">$190.00</span></p>
                            <p class="in-stock">Availability:   <span>In Stock</span></p>
                            <p>Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore te feugait nulla facilisi. </p>
                            <ul class="ul-content">
                                <li> Light green crewneck sweatshirt.</li>
                                <li>Hand pockets.</li>
                                <li>Relaxed fit.</li>
                                <li>Machine wash/dry.</li>
                            </ul>
                            <form>
                                <div class="numbers-row">
                                    <input type="text" name="french-hens" id="french-hens" value="3">
                                </div>
                            </form>
                            <a href="#" class="addtocart2">Add to cart</a>
                            <a href="#" class="hart"><span class="icon icon-Heart"></span></a>
                            <div class="share">
                                <p>Share:</p>
                                <ul>
                                    <li><a href="http://www.facebook.com/sharer.php?u=http://zcube.in/platin/platin/products-detail.html" target="_blank"><i class="fa fa-facebook" aria-hidden="true"></i></a></li>
                                    <li> <a href="https://twitter.com/share?url=http://zcube.in/platin/platin/products-detail.html" target="_blank"><i class="fa fa-twitter" aria-hidden="true"></i></a></li>
                                    <li><a href="#"><i class="fa fa-dribbble" aria-hidden="true"></i></a></li>
                                    <li><a href="http://www.linkedin.com/shareArticle?mini=true&amp;url=http://zcube.in/platin/platin/products-detail.html" target="_blank"><i class="fa fa-linkedin" aria-hidden="true"></i></a></li>
                                </ul>
                            </div>
                            <div class="tag">
                                <p>Categories: <span>Bags, Blazers, Boots, Jackets, Pants, Shirts.</span></p>
                                <p>Tag: <span>outerwear.</span></p>
                            </div>
                        </div>
                        <%-- /.pro-text --%>
                    </div>
                </div>
                <div class="row">
                    <div class="tab-bg">
                        <ul>
                            <li class="active"><a data-toggle="tab" href="#home">Description</a></li>
                            <li><a data-toggle="tab" href="#menu1">ADDITIONAL INFORMATION</a></li>
                            <li><a data-toggle="tab" href="#menu2">REVIEWS (4)</a></li>
                        </ul>
                    </div>
                    <div class="tab-content">
                        <div id="home" class="tab-pane fade in active">
                            <p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when anunknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages..</p>
                            <ul>
                                <li>Claritas est etiam processus dynamicus.</li>
                                <li>Qui sequitur mutationem consuetudium lectorum. </li>
                                <li>Claritas est etiam processus dynamicus.</li>
                                <li>Qui sequitur mutationem consuetudium lectorum. </li>
                                <li>Claritas est etiam processus dynamicus.</li>
                                <li>Qui sequitur mutationem consuetudium lectorum. </li>
                            </ul>
                            <p>It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release.</p>
                        </div>
                        <div id="menu1" class="tab-pane fade">
                            <p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when anunknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages..</p>
                            <ul>
                                <li>Claritas est etiam processus dynamicus.</li>
                                <li>Qui sequitur mutationem consuetudium lectorum. </li>
                                <li>Claritas est etiam processus dynamicus.</li>
                                <li>Qui sequitur mutationem consuetudium lectorum. </li>
                                <li>Claritas est etiam processus dynamicus.</li>
                                <li>Qui sequitur mutationem consuetudium lectorum. </li>
                            </ul>
                            <p>It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release.</p>
                        </div>
                        <div id="menu2" class="tab-pane fade">
                            <p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when anunknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages..</p>
                            <ul>
                                <li>Claritas est etiam processus dynamicus.</li>
                                <li>Qui sequitur mutationem consuetudium lectorum. </li>
                                <li>Claritas est etiam processus dynamicus.</li>
                                <li>Qui sequitur mutationem consuetudium lectorum. </li>
                                <li>Claritas est etiam processus dynamicus.</li>
                                <li>Qui sequitur mutationem consuetudium lectorum. </li>
                            </ul>
                            <p>It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release.</p>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-12">
                <div class="owl-demo-outer">
                    <%-- #owl-demo --%>
                    <div id="owl-demo8" class="deals-wk2">
                        <div class="item">
                            <div class="col-xs-12 col-sm-3 col-md-3">
                                <%-- .pro-text --%>
                                <div class="pro-text text-center">
                                    <%-- .pro-img --%>
                                    <div class="pro-img"> <img src="${pageContext.request.contextPath}/mall/assets/images/products/digital/2.jpg" alt="2"> <sup class="sale-tag">sale!</sup>
                                        <%-- .hover-icon --%>
                                        <div class="hover-icon"> <a href="#"><span class="icon icon-Heart"></span></a> <a href="#"><span class="icon icon-Search"></span></a> <a href="#"><span class="icon icon-Restart"></span></a> </div>
                                        <%-- /.hover-icon --%>
                                    </div>
                                    <%-- /.pro-img --%>
                                    <div class="pro-text-outer"> <span>Macbook, Laptop</span>
                                        <a href="#">
                                            <h4> Apple Macbook Retina 23’ </h4>
                                        </a>
                                        <p class="wk-price">$290.00 </p> <a href="#" class="add-btn">Add to cart</a> </div>
                                </div>
                                <%-- /.pro-text --%>
                            </div>
                            <div class="col-xs-12 col-sm-3 col-md-3">
                                <%-- .pro-text --%>
                                <div class="pro-text text-center">
                                    <%-- .pro-img --%>
                                    <div class="pro-img"> <img src="${pageContext.request.contextPath}/mall/assets/images/products/digital/3.jpg" alt="2">
                                        <%-- .hover-icon --%>
                                        <div class="hover-icon"> <a href="#"><span class="icon icon-Heart"></span></a> <a href="#"><span class="icon icon-Search"></span></a> <a href="#"><span class="icon icon-Restart"></span></a> </div>
                                        <%-- /.hover-icon --%>
                                    </div>
                                    <%-- /.pro-img --%>
                                    <div class="pro-text-outer"> <span>Macbook, Laptop</span>
                                        <a href="#">
                                            <h4> Apple Macbook Retina 23’ </h4>
                                        </a>
                                        <p class="wk-price">$290.00 </p> <a href="#" class="add-btn">Add to cart</a> </div>
                                </div>
                                <%-- /.pro-text --%>
                            </div>
                            <div class="col-xs-12 col-sm-3 col-md-3">
                                <%-- .pro-text --%>
                                <div class="pro-text text-center">
                                    <%-- .pro-img --%>
                                    <div class="pro-img"> <img src="${pageContext.request.contextPath}/mall/assets/images/products/digital/5.jpg" alt="2">
                                        <%-- .hover-icon --%>
                                        <div class="hover-icon"> <a href="#"><span class="icon icon-Heart"></span></a> <a href="#"><span class="icon icon-Search"></span></a> <a href="#"><span class="icon icon-Restart"></span></a> </div>
                                        <%-- /.hover-icon --%>
                                    </div>
                                    <%-- /.pro-img --%>
                                    <div class="pro-text-outer"> <span>Macbook, Laptop</span>
                                        <a href="#">
                                            <h4> Apple Macbook Retina 23’ </h4>
                                        </a>
                                        <p class="wk-price">$290.00 </p> <a href="#" class="add-btn">Add to cart</a> </div>
                                </div>
                                <%-- /.pro-text --%>
                            </div>
                            <div class="col-xs-12 col-sm-3 col-md-3">
                                <%-- .pro-text --%>
                                <div class="pro-text text-center">
                                    <%-- .pro-img --%>
                                    <div class="pro-img"> <img src="${pageContext.request.contextPath}/mall/assets/images/products/digital/7.jpg" alt="2">
                                        <%-- .hover-icon --%>
                                        <div class="hover-icon"> <a href="#"><span class="icon icon-Heart"></span></a> <a href="#"><span class="icon icon-Search"></span></a> <a href="#"><span class="icon icon-Restart"></span></a> </div>
                                        <%-- /.hover-icon --%>
                                    </div>
                                    <%-- /.pro-img --%>
                                    <div class="pro-text-outer"> <span>Macbook, Laptop</span>
                                        <a href="#">
                                            <h4> Apple Macbook Retina 23’ </h4>
                                        </a>
                                        <p class="wk-price">$290.00 </p> <a href="#" class="add-btn">Add to cart</a> </div>
                                </div>
                                <%-- /.pro-text --%>
                            </div>

                        </div>
                        <div class="item">
                            <div class="col-xs-12 col-sm-3 col-md-3">
                                <%-- .pro-text --%>
                                <div class="pro-text text-center">
                                    <%-- .pro-img --%>
                                    <div class="pro-img"> <img src="${pageContext.request.contextPath}/mall/assets/images/products/digital/2.jpg" alt="2"> <sup class="sale-tag">sale!</sup>
                                        <%-- .hover-icon --%>
                                        <div class="hover-icon"> <a href="#"><span class="icon icon-Heart"></span></a> <a href="#"><span class="icon icon-Search"></span></a> <a href="#"><span class="icon icon-Restart"></span></a> </div>
                                        <%-- /.hover-icon --%>
                                    </div>
                                    <%-- /.pro-img --%>
                                    <div class="pro-text-outer"> <span>Macbook, Laptop</span>
                                        <a href="#">
                                            <h4> Apple Macbook Retina 23’ </h4>
                                        </a>
                                        <p class="wk-price">$290.00 </p> <a href="#" class="add-btn">Add to cart</a> </div>
                                </div>
                                <%-- /.pro-text --%>
                            </div>
                            <div class="col-xs-12 col-sm-3 col-md-3">
                                <%-- .pro-text --%>
                                <div class="pro-text text-center">
                                    <%-- .pro-img --%>
                                    <div class="pro-img"> <img src="${pageContext.request.contextPath}/mall/assets/images/products/digital/3.jpg" alt="2">
                                        <%-- .hover-icon --%>
                                        <div class="hover-icon"> <a href="#"><span class="icon icon-Heart"></span></a> <a href="#"><span class="icon icon-Search"></span></a> <a href="#"><span class="icon icon-Restart"></span></a> </div>
                                        <%-- /.hover-icon --%>
                                    </div>
                                    <%-- /.pro-img --%>
                                    <div class="pro-text-outer"> <span>Macbook, Laptop</span>
                                        <a href="#">
                                            <h4> Apple Macbook Retina 23’ </h4>
                                        </a>
                                        <p class="wk-price">$290.00 </p> <a href="#" class="add-btn">Add to cart</a> </div>
                                </div>
                                <%-- /.pro-text --%>
                            </div>
                            <div class="col-xs-12 col-sm-3 col-md-3">
                                <%-- .pro-text --%>
                                <div class="pro-text text-center">
                                    <%-- .pro-img --%>
                                    <div class="pro-img"> <img src="${pageContext.request.contextPath}/mall/assets/images/products/digital/5.jpg" alt="2">
                                        <%-- .hover-icon --%>
                                        <div class="hover-icon"> <a href="#"><span class="icon icon-Heart"></span></a> <a href="#"><span class="icon icon-Search"></span></a> <a href="#"><span class="icon icon-Restart"></span></a> </div>
                                        <%-- /.hover-icon --%>
                                    </div>
                                    <%-- /.pro-img --%>
                                    <div class="pro-text-outer"> <span>Macbook, Laptop</span>
                                        <a href="#">
                                            <h4> Apple Macbook Retina 23’ </h4>
                                        </a>
                                        <p class="wk-price">$290.00 </p> <a href="#" class="add-btn">Add to cart</a> </div>
                                </div>
                                <%-- /.pro-text --%>
                            </div>
                            <div class="col-xs-12 col-sm-3 col-md-3">
                                <%-- .pro-text --%>
                                <div class="pro-text text-center">
                                    <%-- .pro-img --%>
                                    <div class="pro-img"> <img src="${pageContext.request.contextPath}/mall/assets/images/products/digital/7.jpg" alt="2">
                                        <%-- .hover-icon --%>
                                        <div class="hover-icon"> <a href="#"><span class="icon icon-Heart"></span></a> <a href="#"><span class="icon icon-Search"></span></a> <a href="#"><span class="icon icon-Restart"></span></a> </div>
                                        <%-- /.hover-icon --%>
                                    </div>
                                    <%-- /.pro-img --%>
                                    <div class="pro-text-outer"> <span>Macbook, Laptop</span>
                                        <a href="#">
                                            <h4> Apple Macbook Retina 23’ </h4>
                                        </a>
                                        <p class="wk-price">$290.00 </p> <a href="#" class="add-btn">Add to cart</a> </div>
                                </div>
                                <%-- /.pro-text --%>
                            </div>

                        </div>
                        <%-- /#owl-demo --%>
                    </div>
                </div>
            </div>
            <%-- right side --%>
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
        <li><a href="#" class="fa fa-facebook" target="_blank"><span><i class="fa fa-facebook" aria-hidden="true"></i> Facebook</span></a></li>
        <li><a href="#" class="fa fa-twitter" target="_blank"><span><i class="fa fa-twitter" aria-hidden="true"></i> Twitter</span></a></li>
        <li><a href="#" class="fa fa-rss" target="_blank"><span><i class="fa fa-rss" aria-hidden="true"></i> RSS</span></a></li>
        <li><a href="#" class="fa fa-pinterest-p" target="_blank"><span><i class="fa fa-pinterest-p" aria-hidden="true"></i> Pinterest</span></a></li>
        <li><a href="#" class="fa fa-share-alt" target="_blank"><span><i class="fa fa-share-alt" aria-hidden="true"></i> Flickr</span></a></li>
    </ul>
</aside>
<%-- /sticky-socia --%>
<p id="back-top"> <a href="#top"><i class="fa fa-chevron-up" aria-hidden="true"></i></a> </p>
<script src="${pageContext.request.contextPath}/mall/assets/js/jquery.js"></script>
<%-- Bootstrap Core JavaScript --%>
<script src="${pageContext.request.contextPath}/mall/assets/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/mall/assets/js/bootstrap-dropdownhover.min.js"></script>
<script src="${pageContext.request.contextPath}/mall/assets/js/incrementing.js"></script>
<%-- Plugin JavaScript --%>
<script src="${pageContext.request.contextPath}/mall/assets/js/jquery.easing.min.js"></script>
<script src="${pageContext.request.contextPath}/mall/assets/js/wow.min.js"></script>
<%-- owl carousel --%>
<script src="${pageContext.request.contextPath}/mall/assets/owl-carousel/owl.carousel.js"></script>
<%--  Custom Theme JavaScript  --%>
<script src="${pageContext.request.contextPath}/mall/assets/js/custom.js"></script>
<%--  jcarousel Theme JavaScript  --%>
<script type="text/javascript" src="${pageContext.request.contextPath}/mall/assets/js/jquery.jcarousel.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/mall/assets/js/jcarousel.connected-carousels.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/mall/assets/js/jquery.elevatezoom.js"></script>
<script>
    $('.zoom_01').elevateZoom({
        zoomType: "inner",
        cursor: "crosshair",
        zoomWindowFadeIn: 500,
        zoomWindowFadeOut: 750
    });
</script>
</body>

</html>

