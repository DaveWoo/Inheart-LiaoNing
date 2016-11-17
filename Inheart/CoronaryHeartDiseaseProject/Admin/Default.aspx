<%@ Page Language="C#" AutoEventWireup="true" Inherits="Admin" %>

<%@ Register Src="inc/IsAdmin.ascx" TagName="IsAdmin" TagPrefix="uc1" %>

<html>
<head>
    <%--设置编码--%>
    <meta charset="utf-8" />
    <%--页面首次由浏览器加载时的初始缩放级别。--%>
    <meta name="viewport" content="width=device-width, initial-scale=1" />

    <%--引用bootstrap和相关的Jquery--%>
    <link rel="stylesheet" href="../Content/bootstrap.min.css" />
    <script type="text/javascript" src="../Scripts/jquery-1.9.1.min.js"></script>
    <script type="text/javascript" src="../Scripts/bootstrap.min.js"></script>

    <%--页面主题风格脚本--%>
    <script type="text/javascript" src="../Scripts/default.js"></script>
    <link rel="stylesheet" href="../Styles/default-nav.css" type="text/css" />

    <!--font-awesome字体库-->
    <link href="../Content/font-awesome.min.css" rel="stylesheet" />

    <%--弹窗页面样式--%>
    <script type="text/javascript" src="../Scripts/sweetalert.min.js"></script>
    <link rel="stylesheet" type="text/css" href="../Styles/sweetalert.css" />

    <title>辽宁省冠心病急救网络信息平台</title>
</head>
<body>
    <form id="form1" runat="server">
        <nav class="navbar navbar-inverse navbar-fixed-top" style="height: 50px">
            <div class="container-fluid">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle show pull-left" data-target="sidebar">
                        <span class="sr-only">Toggle navigation</span> <span class="icon-bar"></span><span class="icon-bar"></span><span class="icon-bar"></span>
                    </button>
                    <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar"
                        aria-expanded="false" aria-controls="navbar">
                        <span class="sr-only">Toggle navigation</span> <span class="icon-bar"></span><span class="icon-bar"></span><span class="icon-bar"></span>
                    </button>

                    <a class="navbar-brand" target="content3">管理平台</a>
                </div>
                <div id="navbar" class="collapse navbar-collapse">
                    <ul class="nav navbar-nav navbar-right">
                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button"
                                aria-expanded="false"><i class="fa fa-user fa-fw"></i>&nbsp;<%=UserName%>&nbsp;<span class="caret"></span></a>
                            <ul class="dropdown-menu" role="menu">
                                <li><a href="Logout.aspx"><i class="glyphicon glyphicon-log-out"></i>&nbsp;&nbsp;注销</a></li>
                            </ul>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>
        <div class="container-fluid all">
            <div class="sidebar">
                <ul class="nav">
                    <li class="has-sub">
                        <a href="SystemManage/AddUser.aspx" tag="admin" target="content3" onclick="show_title('添加新用户',this,'用户管理')"><span>用户管理</span><i title="nav" class="fa fa-caret-right fa-fw pull-right"></i></a>
                        <ul class="sub-menu">
                            <li><a title="添加新用户" onclick="show_title('添加新用户',this)" href="SystemManage/AddUser.aspx"
                                target="content3"><i class="glyphicon glyphicon-map-marker"></i>添加新用户</a></li>
                            <li><a title="管理用户" onclick="show_title('管理用户',this)" href="SystemManage/UserManage.aspx"
                                target="content3"><i class="glyphicon glyphicon-map-marker"></i>管理用户</a></li>
                            <li><a title="修改用户密码" onclick="show_title('修改用户密码',this)" href="SystemManage/UserCenter.aspx"
                                target="content3"><i class="glyphicon glyphicon-map-marker"></i>修改用户密码</a></li>
                        </ul>
                    </li>
                    <li class="has-sub">
                        <a href="SystemManage/MessageManageAdmin.aspx" tag="admin" target="content3" onclick="show_title('病例管理',this,'日常管理')"><span>日常管理</span><i title="nav" class="fa fa-caret-right fa-fw pull-right"></i></a>
                        <ul class="sub-menu">
                            <li><a title="病例管理" onclick="show_title('病例管理',this)" href="SystemManage/MessageManageAdmin.aspx"
                                target="content3"><i class="glyphicon glyphicon-map-marker"></i>病例管理</a></li>
                            <li><a title="查看日志" onclick="show_title('查看日志',this)" href="SystemManage/ViewLogs.aspx"
                                target="content3"><i class="glyphicon glyphicon-map-marker"></i>查看日志</a> </li>
                        </ul>
                    </li>
                </ul>
            </div>
            <div class="tabContent ">
                <div class="nav_bar_top"><span class="nav_name">网站导航:&nbsp;<i class="fa fa-angle-right" aria-hidden="true"></i>&nbsp;</span><span id="nav_host">用户管理</span>&nbsp;<i class="fa fa-angle-right" aria-hidden="true"></i>&nbsp;<span class="label label-info" id="nav_title">添加新用户</span></div>

                <iframe name="content3" src="SystemManage/AddUser.aspx" onclick="show_title('添加新用户',this)" frameborder="0" style="width: inherit; height: inherit; margin-left: 0; padding-left: 0"></iframe>
            </div>
        </div>

        <uc1:IsAdmin ID="IsAdmin1" runat="server" />
    </form>
</body>
</html>
