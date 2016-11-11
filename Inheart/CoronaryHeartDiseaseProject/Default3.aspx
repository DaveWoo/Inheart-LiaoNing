<%@ Page Language="C#" AutoEventWireup="true" Inherits="index" %>

<%@ Register Src="Admin/inc/User.ascx" TagName="User" TagPrefix="uc1" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link rel="stylesheet" href="/Content/bootstrap.min.css" />
    <script type="text/javascript" src="/Scripts/jquery-1.9.1.min.js"></script>
    <script type="text/javascript" src="../Scripts/default.js"></script>
    <script type="text/javascript" src="../Scripts/bootstrap.min.js"></script>
    <link rel="stylesheet" href="../Styles/default-nav.css" type="text/css" />
    <!--font-awesome字体库-->
    <link href="/Content/font-awesome.min.css" rel="stylesheet" />
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
                    <a class="navbar-brand" href="SuperManage/AddHospital.aspx" target="content3">病例录入平台</a>
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
                        <a href="MessageManage.aspx" tag="admin" target="content3" onclick="show_title('病例查询',this,'病例管理')"><span>病例管理</span><i title="nav" class="fa fa-caret-right fa-fw pull-right"></i></a>
                        <ul class="sub-menu">
                            <li><a title="病例查询" onclick="show_title('病例查询',this)" href="MessageManage.aspx"
                                target="content3"><i class="glyphicon glyphicon-map-marker"></i>病例查询</a></li>
                            <li><a title="病例录入" onclick="show_title('病例录入',this)" href="MessageInput.aspx"
                                target="content3"><i class="glyphicon glyphicon-map-marker"></i>病例录入</a></li>
                        </ul>
                    </li>
                    <li class="has-sub">
                        <a href="UserCenter.aspx" tag="admin" target="content3" onclick="show_title('病例查询',this,'用户管理')"><span>用户管理</span><i title="nav" class="fa fa-caret-right fa-fw pull-right"></i></a>
                        <ul class="sub-menu">
                            <li><a title="修改密码" onclick="show_title('修改密码',this)" href="UserCenter.aspx"
                                target="content3"><i class="glyphicon glyphicon-map-marker"></i>修改密码</a> </li>
                        </ul>
                    </li>
                </ul>
            </div>
            <div class="tabContent ">
                <div class="nav_bar_top"><span class="nav_name">网站导航: > </span><span id="nav_host">管理</span> > <span class="label label-info" id="nav_title">病例查询</span></div>
                <iframe name="content3" src="MessageManage.aspx" onclick="show_title('病例查询',this)" frameborder="0" style="width: inherit; height: inherit; margin-left: 0; padding-left: 0"></iframe>
            </div>
        </div>
        <uc1:User ID="User1" runat="server" />
    </form>
</body>
</html>
