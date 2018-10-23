<%@ page import="dao.mall.ClassificationDAO" %>
<%@ page import="java.util.List" %>
<%@ page import="entity.*" %><%--
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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/mall/assets/css/bootstrap.min.css" type="text/css">
    <%-- Dropdownhover CSS --%>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/mall/assets/css/bootstrap-dropdownhover.min.css"
          type="text/css">
    <%-- latest fonts awesome --%>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/mall/assets/font/css/font-awesome.min.css"
          type="text/css">
    <%-- simple line fonts awesome --%>
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/mall/assets/simple-line-icon/css/simple-line-icons.css"
          type="text/css">
    <%-- stroke-gap-icons --%>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/mall/assets/stroke-gap-icons/stroke-gap-icons.css"
          type="text/css">
    <%-- Animate CSS --%>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/mall/assets/css/animate.min.css" type="text/css">
    <%-- Style CSS --%>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/mall/assets/css/style.css" type="text/css">
    <%-- Style CSS --%>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/mall/assets/css/slider.css" type="text/css">
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
    <div id="loading"></div>
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
                                    Members members = null;
                                    List<ShoppingCartClause> shoppingCart = null;
                                    String name;
                                    String href;
                                    if (session.getAttribute("Members") != null) {
                                        members = (Members) request.getSession().getAttribute("Members");
                                        members.setShoppingCart();
                                        shoppingCart = members.getShoppingCart();
                                        name = members.getEmail();
                                        href = request.getContextPath() + "/mall/home.jsp";
                                        out.println("你好!" +
                                                "<a href=\"" + href + "\">" + name + "</a>");
                                    } else {
                                        shoppingCart= (List<ShoppingCartClause>) session.getAttribute("ShoppingCart");
                                        out.println("你好!请-" +
                                                "<a href=\"" + request.getContextPath() + "/mall/login.jsp\">登陆</a>" +
                                                "or" +
                                                "<a href=\"" + request.getContextPath() + "/mall/registe.jsp\">注册</a>");
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
                                <a href="#" class="btn btn-default dropdown-toggle" data-toggle="dropdown"
                                   data-hover="dropdown">
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
                                    ClassificationDAO classificationDAO = new ClassificationDAO();
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
                            <a href="#" data-toggle="dropdown" data-hover="dropdown"><i class="icon-basket-loaded icons"
                                                                                        aria-hidden="true"></i></a>
                            <%
                                if (members != null) {
                                    out.println("<span class=\"subno\">"+shoppingCart.size()+"</span>");
                                }
                            %>
                            <strong>购物车</strong>
                            <div class="dropdown-menu  cart-outer">
                                <%--todo：jsp自适应显示购物车--%>
                                <%
                                    if (shoppingCart == null|| shoppingCart.size()==0) {
                                        out.println("<div class=\"cart-content\">\n" +
                                                "                                    <div class=\"col-sm-12 col-md-12\">\n" +
                                                "                                        <h3  style=\"text-align: center;color:#b11e22\">购物车空空如也哦~</h3>\n" +
                                                "                                    </div>\n" +
                                                "                                </div>");
                                    }else {
                                        double total=0;
                                        for (int i = 0; i <shoppingCart.size() ; i++) {
                                            shoppingCart.get(i).setCommodity();
                                            Commodity commodity = shoppingCart.get(i).getCommodity();
                                            total=total+shoppingCart.get(i).getQuantity()*commodity.getCommodityprice();
                                            out.println(
                                                    "<div class=\"cart-content\">\n" +
                                                            "<div class=\"col-sm-4 col-md-4\">" +
                                                            "<img src=\""+ request.getContextPath()+commodity.getCommoditynsrc()+"\">\n" +
                                                            "</div>\n" +
                                                            "<div class=\"col-sm-8 col-md-8\">\n" +
                                                            "<div class=\"pro-text\">\n" +
                                                            "<a href=\"#\">"+commodity.getCommodityname()+"</a>\n" +
                                                            "<div class=\"close\">x</div>\n" +
                                                            "<strong>1 "+shoppingCart.get(i).getQuantity()+"× ￥"+commodity.getCommodityprice()+"</strong>\n" +
                                                            "</div>\n" +
                                                            "</div>\n" +
                                                            "</div>"
                                            );
                                        }
                                        out.println(
                                                "<div class=\"total\">\n" +
                                                        "   <div class=\"col-md-6 text-left\">\n" +
                                                        "       <span>运费 :</span>\n" +
                                                        "       <strong>总额 :</strong>\n" +
                                                        "   </div>\n" +
                                                        "   <div class=\"col-md-6 text-right\">\n" +
                                                        "       <strong>￥0.00</strong>\n" +
                                                        "       <strong>￥"+total+"</strong>\n" +
                                                        "   </div>\n" +
                                                        "</div>\n" +
                                                        "<a href=\"shopping-cart.jsp\" class=\"cart-btn\">查看购物车详情 </a>\n" +
                                                        "<a href=\"checkout.jsp\" class=\"cart-btn\">购买</a>"
                                        );
                                    }
                                %>
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
                    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1" data-hover="dropdown"
                         data-animations=" fadeInLeft fadeInUp fadeInRight">
                        <ul class="nav navbar-nav">
                            <li class="all-departments dropdown">
                                <a href="index.jsp" class="dropdown-toggle" data-toggle="dropdown" role="button"
                                   aria-expanded="false"><span> 商品分类 </span> <i class="fa fa-bars"
                                                                                aria-hidden="true"></i>
                                </a>
                                <ul class="dropdown-menu dropdownhover-bottom" role="menu">
                                    <%--通过数据库查询有哪些类别显示--%>
                                    <%
                                        for (int i = 0; i < primaryclassifications.size(); i++) {
                                            String primaryclassification_grade = primaryclassifications.get(i).getClassificationgrade();
                                            String primaryclassification_name = primaryclassifications.get(i).getClassificationname();
                                            String primaryclassification_src = primaryclassifications.get(i).getClassificationsrc();
                                            String primaryclassification_href = request.getContextPath() + "/mall/CommodityShow.action?mark=show&primaryclassification=" + primaryclassification_name;
                                            out.println("<li class=\"dropdown\">\n" +
                                                    "<a href=\"" + primaryclassification_href + "\"><img src=\"" + request.getContextPath() + "/" + primaryclassification_src + "\"alt=\"menu-icon" + primaryclassification_grade + "\"/>\n" + primaryclassification_name
                                            );
                                            if (primaryclassification_grade.equals("10")) {
                                                System.out.println("aaa");
                                            }
                                            secondaryClassifications = classificationDAO.getsecondaryClassification(Classification.getSecondaryClassificationmapping(primaryclassification_grade));
                                            if (secondaryClassifications.size() > 0) {
                                                out.println("<i class=\"fa fa-angle-right\" aria-hidden=\"true\"></i>\n" +
                                                        "</a>");
                                                out.println("<ul class=\"dropdown-menu right\">");
                                                for (int j = 0; j < secondaryClassifications.size(); j++) {
                                                    String secondaryClassification_name = secondaryClassifications.get(j).getClassificationname();
                                                    String secondaryClassification_href = request.getContextPath() + "/mall/CommodityShow.action?mark=show&secondaryclassification=" + secondaryClassification_name;
                                                    out.println("<li><a href=\"" + secondaryClassification_href + "\">" + secondaryClassification_name + "</a></li>");
                                                }
                                                out.println("</ul>");
                                            } else {
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
                    <li class="breadcrumb-item active">Library</li>
                </ol>
            </div>
            <div class="col-sm-3 col-md-3">
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
                                    <p>Range: <strong>$<span id="sliderValue">100.0</span></strong> - <strong>$<span
                                            id="sliderValue2">1.700.00</span></strong></p>
                                    <input id="bootstrap-slider" data-slider-min="1" data-slider-max="1700"
                                           data-slider-step="1" data-slider-value="100" type="text">
                                    <div class="valueLabelblck">Filter</div>
                                </div>
                            </div>
                        </div>
                        <%-- End of Bootstrap Pricing Slider by ZsharE --%>
                        <div class="brands">
                            <h3>Brands</h3>
                            <ul>
                                <li><a href="#">Black <span>(10)</span></a></li>
                                <li><a href="#">White <span>(13)</span></a></li>
                                <li><a href="#">Blue <span>(05)</span></a></li>
                                <li><a href="#">Red <span>(87)</span></a></li>
                                <li><a href="#">Screen <span>(40)</span></a></li>
                            </ul>
                        </div>
                        <div class="color">
                            <h3>Color</h3>
                            <ul>
                                <li><a href="#" class="color-1"><span></span></a></li>
                                <li><a href="#" class="color-2"><span></span></a></li>
                                <li><a href="#" class="color-3"><span></span></a></li>
                                <li><a href="#" class="color-4"><span></span></a></li>
                                <li><a href="#" class="color-5"><span></span></a></li>
                                <li><a href="#" class="color-6"><span></span></a></li>
                                <li><a href="#" class="color-7"><span></span></a></li>
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
                        <p>You have no item to compare. </p> <img
                            src="${pageContext.request.contextPath}/mall/assets/images/add-banner2.jpg"
                            alt="add banner"></div>
                </div>
                <div class="weight">
                    <div class="title">
                        <h2>BEST PRODUCTS</h2>
                    </div>
                    <div class="toprating-box">
                        <ul>
                            <li>
                                <div class="e-product">
                                    <div class="pro-img"><img
                                            src="${pageContext.request.contextPath}/mall/assets/images/products/digital/5.jpg"
                                            alt="2"></div>
                                    <div class="pro-text-outer"><span>Macbook, Laptop</span>
                                        <a href="#">
                                            <h4> Apple Macbook Retina 23’ </h4>
                                        </a>
                                        <p class="wk-price">$290.00 </p>
                                    </div>
                                </div>
                            </li>
                            <li>
                                <div class="e-product">
                                    <div class="pro-img"><img
                                            src="${pageContext.request.contextPath}/mall/assets/images/products/digital/9.jpg"
                                            alt="2"></div>
                                    <div class="pro-text-outer"><span>Macbook, Laptop</span>
                                        <a href="#">
                                            <h4> Apple Macbook Retina 23’ </h4>
                                        </a>
                                        <p class="wk-price">$290.00 </p>
                                    </div>
                                </div>
                            </li>
                            <li>
                                <div class="e-product">
                                    <div class="pro-img"><img
                                            src="${pageContext.request.contextPath}/mall/assets/images/products/digital/12.jpg"
                                            alt="2"></div>
                                    <div class="pro-text-outer"><span>Macbook, Laptop</span>
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
                <div class="col-md-12 grid-banner"><img
                        src="${pageContext.request.contextPath}/mall/assets/images/Grid-banner.png" alt="Grid-banner"/>
                </div>
                <%
                    PageModel pageModel = (PageModel) request.getAttribute("pageModel");
                %>
                <div class="grid-spr">
                    <div class="col-sm-6 col-md-6">
                        <a href="#" class="grid-view-icon"><i class="fa fa-th-large" aria-hidden="true"></i></a>
                        <a href="#" class="list-view-icon"><i class="fa fa-list" aria-hidden="true"></i></a>
                        <div class="select-option">
                            <a class="btn btn-default btn-select options2">
                                <input type="hidden" class="btn-select-input" id="1" name="1" value=""/>
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
                    <div class="col-sm-6 col-md-6 text-right">
                        <strong>
                            显示<span><%=pageModel.getResultSize()%>个结果中的</span>
                            <%=(pageModel.getCurrentPage() - 1) * PageModel.PAGEMODELSIZE + 1%>
                            -
                            <%=pageModel.getCurrentPage() * PageModel.PAGEMODELSIZE %>
                            个
                        </strong>
                    </div>
                </div>
                <%
                    int total;
                    if (pageModel.getCurrentPage()*PageModel.PAGEMODELSIZE<pageModel.getResultSize()){
                        total=PageModel.PAGEMODELSIZE;
                    }else {
                        total=pageModel.getResultSize()-(pageModel.getCurrentPage()-1)*PageModel.PAGEMODELSIZE;
                    }
                    for (int i =0; i < total; i++) {
                        Commodity commodity= (Commodity) pageModel.getList().get((pageModel.getCurrentPage()-1)*PageModel.PAGEMODELSIZE+i);
                        out.println(
                            "<div class=\"col-xs-12 col-sm-12 col-md-12\">\n" +
                                "<div class=\"pro-text\">\n" +
                                    "<div class=\"col-xs-12 col-sm-5 col-md-5\">\n" +
                                        "<div class=\"pro-img\"><img src=\""+request.getContextPath()+commodity.getCommoditynsrc()+"\" alt=\"2\">\n" +
                                            " <sup class=\"sale-tag\">sale!</sup>\n" +
                                            "<div class=\"hover-icon\">" +
                                            "<a href=\"#\"><span class=\"icon icon-Heart\"></span></a>\n" +
                                            "<a href=\"#\"><span class=\"icon icon-Search\"></span></a>\n" +
                                            "<a href=\"#\"><span class=\"icon icon-Restart\"></span></a>\n" +
                                            "</div>\n" +
                                        "</div>\n" +
                                    "</div>\n" +
                                    "<div class=\"col-xs-12 col-sm-7 col-md-7\">\n" +
                                        "<div class=\"pro-text-outer list-pro-text\">\n" +
                                            "<span>"+commodity.getPrimaryclassification()+","+commodity.getSecondaryclassification()+"</span>\n" +
                                            "<a href=\"#\"><h4>"+commodity.getCommodityname()+"</h4></a>\n" +
                                            "<p class=\"wk-price\">￥"+commodity.getCommodityprice()+" </p>\n" +
                                            "<p>"+commodity.getCommoditydetail()+"</p>\n " +
                                            "<a href=\""+request.getContextPath()+"/mall/Members.action?mark=addShoppingCart&idcommodity="+commodity.getIdcommodity()+"\" class=\"add-btn\">添加到购物车</a>\n" +
                                            "<a href=\"#\" class=\"add-btn2\"><span class=\"icon icon-Heart\"></span></a>\n" +
                                            "<a href=\"#\" class=\"add-btn2\"><span class=\"icon icon-Restart\"></span></a>\n" +
                                        "</div >\n " +
                                    "</div >\n " +
                                "</div >\n " +
                            "</div>"
                        );
                    }
                %>
                <div class="col-xs-12">
                    <div class="grid-spr pag">
                        <%-- .pagetions --%>
                        <div class="col-xs-12 col-sm-6 col-md-6 text-left">
                            <ul class="pagination">
                                <%
                                    for (int i = 1; i <= pageModel.getResultSize()/PageModel.PAGEMODELSIZE+1; i++) {
                                        if (i==pageModel.getCurrentPage()){
                                            out.println("<li class=\"active\">");
                                        }else {
                                            out.println("<li>");
                                        }
                                        session.setAttribute("pageModel",pageModel);
                                        out.println("<a href=\""+request.getContextPath()+"/mall/CommodityShow.action?mark=change&targetPage="+i+"\">"+i+"</a>");

                                        out.println("</li>");
                                    }
                                %>
                            </ul>

                        </div>
                        <%-- /.pagetions --%>
                        <%-- .Showing --%>
                        <div class="col-xs-12 col-sm-6 col-md-6 text-right">
                            <strong>
                                显示<span><%=pageModel.getResultSize()%>个结果中的</span>
                                <%=(pageModel.getCurrentPage() - 1) * PageModel.PAGEMODELSIZE + 1%>
                                -
                                <%=pageModel.getCurrentPage() * PageModel.PAGEMODELSIZE %>
                                个
                            </strong>
                        </div>
                        <%-- /.Showing --%>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <%-- /.grid-shop --%>
</section>
<footer>
    <div class="container">
        <div class="row">
            <div class="col-xs-12 col-sm-4 col-md-4">
                <%-- f-weghit --%>
                <div class="f-weghit"><img src="${pageContext.request.contextPath}/mall/assets/images/logo.png"
                                           alt="logo"/>
                    <p><strong>Complex</strong> is a premium Templates theme with advanced admin module. It’s extremely
                        customizable, easy to use and fully responsive and retina ready.</p>
                    <ul>
                        <li><i class="icon-location-pin icons" aria-hidden="true"></i> <strong>Add:</strong> 1234 Heaven
                            Stress, Beverly Hill, Melbourne, USA.
                        </li>
                        <li><i class="icon-envelope-letter icons"></i> <strong>Email:</strong> Contact@erentheme.com
                        </li>
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
                        <div class="pro-img"><img
                                src="${pageContext.request.contextPath}/mall/assets/images/on-seal-img1.jpg" alt="2">
                        </div>
                        <div class="pro-text-outer"><span>Macbook, Laptop</span>
                            <a href="#">
                                <h4> Apple Macbook Retina 23’ </h4>
                            </a>
                            <p class="wk-price">$290.00 </p>
                        </div>
                    </div>
                    <%-- e-product --%>
                    <%-- e-product --%>
                    <div class="e-product">
                        <div class="pro-img"><img
                                src="${pageContext.request.contextPath}/mall/assets/images/on-seal-img2.jpg" alt="2">
                        </div>
                        <div class="pro-text-outer"><span>Macbook, Laptop</span>
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
                    <div class="col-xs-12 col-sm-6 col-md-6">Copyright &copy; 2017.Company name All rights reserved.
                    </div>
                    <div class="text-right col-xs-12 col-sm-6 col-md-6"><img
                            src="${pageContext.request.contextPath}/mall/assets/images/payment-img.jpg"
                            alt="payment-img"/></div>
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
<p id="back-top"><a href="#top"><i class="fa fa-chevron-up" aria-hidden="true"></i></a></p>
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
<script src="${pageContext.request.contextPath}/mall/assets/js/filter-price.js"></script>
<script src="${pageContext.request.contextPath}/mall/assets/js/custom.js"></script>
</body>

</html>
