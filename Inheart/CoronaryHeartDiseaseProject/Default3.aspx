﻿<%@ Page Language="C#" AutoEventWireup="true" Inherits="index" %>

<%@ Register Src="Admin/inc/User.ascx" TagName="User" TagPrefix="uc1" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link rel="stylesheet" href="/Content/bootstrap.min.css" />
    <script type="text/javascript" src="/Scripts/jquery-1.9.1.min.js"></script>
    <script type="text/javascript" src="../Scripts/default.js"></script>
    <script type="text/javascript" src="../Scripts/bootstrap.min.js"></script>
    <link rel="stylesheet" href="../Styles/default-nav.css" type="text/css" />
    <title>辽宁省冠心病急救网络信息平台</title>
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="sc" runat="server">
        </asp:ScriptManager>

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

                    <a class="navbar-brand" href="SuperManage/AddHospital.aspx" target="content3">病例录入平台&nbsp;&nbsp;-&nbsp;&nbsp; <span id="title" style="color: #9d9d9d;">管理</span></a>
                </div>
                <div id="navbar" class="collapse navbar-collapse">
                    <ul class="nav navbar-nav navbar-right">
                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button"
                                aria-expanded="false"><i class="fa fa-user fa-fw"></i>&nbsp;<%=UserName%>&nbsp;<span class="caret"></span></a>
                            <ul class="dropdown-menu" role="menu">
                                <li><a href="Logout.aspx">注销</a></li>
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
                        <a href="MessageManage.aspx" tag="admin" target="content3" onclick="show_title('病例查询',this)"><span>管理</span><i class="fa fa-caret-right fa-fw pull-right"></i></a>
                        <ul class="sub-menu">
                            <li><a title="病例查询" onclick="show_title('病例查询',this)" href="MessageManage.aspx"
                                target="content3"><i class="fa fa-circle-o fa-fw"></i>病例查询</a></li>
                            <li><a title="病例录入" onclick="show_title('病例管理',this)" href="MessageInput.aspx"
                                target="content3"><i class="fa fa-circle-o fa-fw"></i>病例录入</a></li>
                            <li><a title="修改密码" onclick="show_title('修改密码',this)" href="UserCenter.aspx"
                                target="content3"><i class="fa fa-circle-o fa-fw"></i>修改密码</a> </li>
                        </ul>
                    </li>
                </ul>
            </div>
            <div class="tabContent ">
                <iframe name="content3" src="MessageManage.aspx" onclick="show_title('病例查询',this)" frameborder="0" style="width: inherit; height: inherit; margin-left: 0; padding-left: 0"></iframe>
            </div>
        </div>
        <uc1:User ID="User1" runat="server" />
    </form>
</body>
</html>
