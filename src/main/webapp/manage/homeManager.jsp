<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE HTML>
<html>
<head>
    <title>后台管理系统</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link href="assets/css/dpl-min.css" rel="stylesheet" type="text/css"/>
    <link href="assets/css/bui-min.css" rel="stylesheet" type="text/css"/>
    <link href="assets/css/main-min.css" rel="stylesheet" type="text/css"/>
</head>
<body>

<div class="header">

    <div class="dl-title">
        <!--<img src="/chinapost/Public/assets/img/top.png">-->
    </div>

    <div class="dl-log">
        欢迎您，<span class="dl-log-user">root</span>
        <a href="" title="退出系统" class="dl-log-quit">[退出]</a>
    </div>
</div>
<div class="content">
    <div class="dl-main-nav">
        <div class="dl-inform">
            <div class="dl-inform-title"><s class="dl-inform-icon dl-up"></s></div>
        </div>
        <ul id="J_Nav" class="nav-list ks-clear">
            <li class="nav-item dl-selected">
                <div class="nav-item-inner nav-home">主页</div>
            </li>
            <li class="nav-item dl-selected">
                <div class="nav-item-inner nav-order">商品管理</div>
            </li>
            <li class="nav-item dl-selected">
                <div class="nav-item-inner nav-order">销售管理</div>
            </li>
            <li class="nav-item dl-selected">
                <div class="nav-item-inner nav-order">订单管理</div>
            </li>
            <li class="nav-item dl-selected">
                <div class="nav-item-inner nav-order">库存管理</div>
            </li>
            <li class="nav-item dl-selected">
                <div class="nav-item-inner nav-order">内容管理</div>
            </li>
            <li class="nav-item dl-selected">
                <div class="nav-item-inner nav-order">客户管理</div>
            </li>
            <li class="nav-item dl-selected">
                <div class="nav-item-inner nav-order">报表管理</div>
            </li>
            <li class="nav-item dl-selected">
                <div class="nav-item-inner nav-order">系统管理</div>
            </li>
        </ul>
    </div>
    <ul id="J_NavContent" class="dl-tab-conten">

    </ul>
</div>
<script type="text/javascript" src="assets/js/jquery-1.8.1.min.js"></script>
<script type="text/javascript" src="assets/js/bui-min.js"></script>
<script type="text/javascript" src="assets/js/common/main-min.js"></script>
<script type="text/javascript" src="assets/js/config-min.js"></script>
<script>
    BUI.use('common/main', function () {
        var config = [
            {
                id: '1',
                menu: [
                    {
                        text: '主页', items: [
                            {
                                id: '10', text: '概要信息', href: 'Node/index.html'
                            }
                        ]
                    }
                ]
            },
            {
                id: '2',
                homePage: '20',
                menu: [
                    {
                        text: '商品管理', items: [
                            {
                                id: '20', text: '类别管理', href: 'Node/index.html'
                            },{
                                id: '21', text: '商品管理', href: 'Node/index.html'
                            }
                        ]
                    }
                ]
            },{
                id: '3',
                menu: [
                    {
                        text: '销售管理', items: [
                            {
                                id: '30', text: '概要信息', href: 'Node/index.html'
                            }
                        ]
                    }
                ]
            },
            {
                id: '4',
                menu: [
                    {
                        text: '订单管理', items: [
                            {
                                id: '40', text: '概要信息', href: 'Node/index.html'
                            }
                        ]
                    }
                ]
            },
            {
                id: '5',
                homePage:'50',
                menu: [
                    {
                        text: '库存管理', items: [
                            {
                                id: '50', text: '概要信息', href: 'Node/index.html'
                            }
                        ]
                    }
                ]
            },
            {
                id: '6',
                menu: [
                    {
                        text: '内容管理', items: [
                            {
                                id: '60', text: '概要信息', href: 'Node/index.html'
                            }
                        ]
                    }
                ]
            },
            {
                id: '7',
                menu: [
                    {
                        text: '客户管理', items: [
                            {
                                id: '70', text: '概要信息', href: 'Node/index.html'
                            }
                        ]
                    }
                ]
            },
            {
                id: '8',
                menu: [
                    {
                        text: '报表管理', items: [
                            {
                                id: '80', text: '概要信息', href: 'Node/index.html'
                            }
                        ]
                    }
                ]
            },
            {
                id: '9',
                menu: [
                    {
                        text: '系统管理', items: [
                            {
                                id: '90', text: '管理管理员', href: 'Node/index.html'
                            },{
                                id: '91', text: '不知道干啥', href: '#'
                            }
                        ]
                    }
                ]
            }
        ];
        new PageUtil.MainPage({
            modulesConfig: config
        });
    });
</script>
</body>
</html>