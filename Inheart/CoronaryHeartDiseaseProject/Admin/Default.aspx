<%@ Page Language="C#" AutoEventWireup="true" Inherits="Admin" %>

<%@ Register Src="inc/IsAdmin.ascx" TagName="IsAdmin" TagPrefix="uc1" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <script type="text/javascript" src="/Scripts/jquery-1.9.1.min.js"></script>
    <script type="text/javascript" src="../Scripts/default.js"></script>
    <script type="text/javascript" src="../Scripts/bootstrap.min.js"></script>
    <link rel="stylesheet" href="/Content/bootstrap.min.css" />
    <link rel="stylesheet" href="../Styles/default-nav.css" type="text/css" />
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
                
                <a class="navbar-brand" target="content3">管理平台&nbsp;&nbsp;-&nbsp;&nbsp; <span id="title" style="color: #9d9d9d;">用户管理</span> </a>
            </div>
            <div id="navbar" class="collapse navbar-collapse">           
                <ul class="nav navbar-nav navbar-right">
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button"
                           aria-expanded="false"><i class="fa fa-user fa-fw"></i>&nbsp;<%=UserName%>&nbsp;<span class="caret"></span></a>
                        <ul class="dropdown-menu" role="menu">
                            <li><a href="Logout.aspx"><i class="fa fa-sign-out fa-fw"></i>&nbsp;注销</a></li>
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
                        <a href="SystemManage/AddUser.aspx" tag="admin" target="content3" onclick="show_title('添加新用户',this)"><span>用户管理</span><i class="fa fa-caret-right fa-fw pull-right"></i></a>
                        <ul class="sub-menu">
                            <li><a title="添加新用户" onclick="show_title('添加新用户',this)" href="SystemManage/AddUser.aspx"
                                target="content3"><i class="fa fa-circle-o fa-fw"></i>添加新用户</a></li>
                            <li><a title="管理用户" onclick="show_title('管理用户',this)" href="SystemManage/UserManage.aspx"
                                target="content3"><i class="fa fa-circle-o fa-fw"></i>管理用户</a></li>
                            <li><a title="修改用户密码" onclick="show_title('修改用户密码'),this)" href="SystemManage/UserCenter.aspx"
                                target="content3"><i class="fa fa-circle-o fa-fw"></i>修改用户密码</a></li>
                        </ul>
                    </li>
                    <li class="has-sub">
                        <a href="SystemManage/MessageManageAdmin.aspx" tag="admin" target="content3" onclick="show_title('管理',this)"><span>日常管理</span><i class="fa fa-caret-right fa-fw pull-right"></i></a>
                        <ul class="sub-menu">
                            <li><a title="病例管理" onclick="show_title('病例管理',this)" href="SystemManage/MessageManageAdmin.aspx"
                                target="content3"><i class="fa fa-circle-o fa-fw"></i>病例管理</a></li>
                            <li><a title="查看日志" onclick="show_title('查看日志',this)" href="SystemManage/ViewLogs.aspx"
                                target="content3"><i class="fa fa-circle-o fa-fw"></i>查看日志</a> </li>
                        </ul>
                    </li>
                </ul>
            </div>
            <div class="tabContent ">
                <iframe name="content3" src="SystemManage/AddUser.aspx" onclick="show_title('添加新用户',this)" frameborder="0" style="width: inherit; height: inherit; margin-left: 0; padding-left: 0"></iframe>
            </div>
        </div>

        <uc1:IsAdmin ID="IsAdmin1" runat="server" />
    </form>
</body>
</html>
