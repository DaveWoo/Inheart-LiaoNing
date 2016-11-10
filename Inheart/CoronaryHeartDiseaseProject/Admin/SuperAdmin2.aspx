<%@ Page Language="C#" AutoEventWireup="true" Inherits="SuperAdmin" %>

<%@ Register Src="inc/IsSuperAdmin.ascx" TagName="IsSuperAdmin" TagPrefix="uc1" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <script type="text/javascript" src="../Scripts/jquery-1.9.1.min.js"></script>
    <script type="text/javascript" src="../Scripts/bootstrap.min.js"></script>
    <script type="text/javascript" src="../Scripts/menu.js"></script>
    <script type="text/javascript" src="../Scripts/default.js"></script>
    <link rel="stylesheet" href="/Content/bootstrap.min.css" />
    <link rel="stylesheet" href="../Styles/default.css" type="text/css" />
    <link rel="stylesheet" href="../Styles/default-nav.css" type="text/css" />

    <title>辽宁省冠心病急救网络信息平台</title>
    <style type="text/css">
        .auto-style1 {
            width: 453px;
        }
    </style>
</head>
<body onload="javascript:nav_left('left_tab1','left_menu_cnt1');">
    <form id="form1" runat="server">
        <table id="indextablebody" cellpadding="0">
            <thead>
                <tr>
                    <div id="spanTitle"></div>
                    <th style="padding-left: 10px; text-align: center; font-size: 18px;" class="auto-style1">超级管理管理平台</th>
                    <th>
                        <a>用户ID ：<%=UserName%></a>&nbsp;&nbsp; <a>身份 ：<%=UserRole%></a>
                    </th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td class="auto-style1">
                        <div class="container-fluid all">
                            <div class="sidebar">
                                <ul class="nav">
                                    <li class="has-sub">
                                        <a href="SuperManage/AddHospital.aspx" tag="admin" onclick="nav_left(this);" target="content3" ><span>医院</span><i class="fa fa-caret-right fa-fw pull-right"></i></a>
                                        <ul class="sub-menu">
                                            <li><a title="添加医院" href="SuperManage/AddHospital.aspx" onclick="show_title('添加医院',this)"
                                                target="content3"><i class="glyphicon glyphicon-map-marker"></i>添加医院</a></li>
                                            <li><a title="管理医院" href="SuperManage/AdminManageHospital.aspx" onclick="show_title('管理医院',this)"
                                                target="content3"><i class="glyphicon glyphicon-map-marker"></i>管理医院</a></li>
                                        </ul>
                                    </li>

                                    <li class="has-sub">
                                        <a href="SuperManage/AddAdmin.aspx" tag="admin" target="content3" onclick="nav_left(this);"><span>管理员</span><i class="fa fa-caret-right fa-fw pull-right"></i></a>
                                        <ul class="sub-menu">
                                            <li><a title="添加管理员" onclick="show_title('添加管理员',this)" href="SuperManage/AddAdmin.aspx"
                                                target="content3"><i class="glyphicon glyphicon-map-marker"></i>添加管理员</a></li>
                                            <li><a title="管理管理员" onclick="show_title('管理管理员',this)" href="SuperManage/AdminManage.aspx"
                                                target="content3"><i class="glyphicon glyphicon-map-marker"></i>管理管理员</a></li>
                                            <li><a title="修改密码" onclick="show_title('修改密码'),this)" href="SuperManage/AdminCenter.aspx"
                                                target="content3"><i class="glyphicon glyphicon-map-marker"></i>修改密码</a></li>
                                        </ul>
                                    </li>
                                    <li class="has-sub">
                                        <a tag="admin" href="SuperManage/SummaryReport.aspx?type=All" target="content3" onclick="nav_left(this);"><span>报表</span><i class="fa fa-caret-right fa-fw pull-right"></i></a>
                                        <ul class="sub-menu">
                                            <li><a title="患者总人数" onclick="show_title('患者总人数',this)" href="SuperManage/SummaryReport.aspx?type=Sum"
                                                target="content3"><i class="glyphicon glyphicon-map-marker"></i>患者总人数</a></li>
                                            <li><a title="患者性别" onclick="show_title('患者性别',this)" href="SuperManage/SummaryReport.aspx?type=Sex"
                                                target="content3"><i class="glyphicon glyphicon-map-marker"></i>患者性别</a></li>
                                            <li><a title="患者年龄" onclick="show_title('患者年龄',this)" href="SuperManage/SummaryReport.aspx?type=Age"
                                                target="content3"><i class="glyphicon glyphicon-map-marker"></i>患者年龄</a></li>
                                            <li><a title="溶栓人数" onclick="show_title('溶栓人数',this)" href="SuperManage/SummaryReport.aspx?type=ThrombolysisCount"
                                                target="content3"><i class="glyphicon glyphicon-map-marker"></i>溶栓人数</a></li>
                                            <li><a title="急诊介入人数" onclick="show_title('急诊介入',this)" href="SuperManage/SummaryReport.aspx?type=EmergencyTreate"
                                                target="content3"><i class="glyphicon glyphicon-map-marker"></i>急诊介入人数</a></li>
                                            <li><a title="死亡人数" onclick="show_title('死亡人数',this)" href="SuperManage/SummaryReport.aspx?type=DeathCount"
                                                target="content3"><i class="glyphicon glyphicon-map-marker"></i>死亡人数</a></li>
                                            <li><a title="转上级医院患者数" onclick="show_title('转上级医院',this)" href="SuperManage/SummaryReport.aspx?type=TransferUpHospitalCount"
                                                target="content3"><i class="glyphicon glyphicon-map-marker"></i>转上级医院患者数</a></li>
                                        </ul>
                                    </li>
                                    <li class="has-sub">
                                        <a href="SuperManage/MessageManageSupperAdmin.aspx" tag="admin" target="content3" onclick="border_left(this);"><span>管理</span><i class="fa fa-caret-right fa-fw pull-right"></i></a>
                                        <ul class="sub-menu">
                                            <li><a title="病例管理" onclick="show_title('病例管理',this)" href="SuperManage/MessageManageSupperAdmin.aspx"
                                                target="content3"><i class="glyphicon glyphicon-map-marker"></i>病例管理</a></li>
                                            <li><a title="查看日志" onclick="show_title('查看日志',this)" href="SuperManage/ViewLogs.aspx"
                                                target="content3"><i class="glyphicon glyphicon-map-marker"></i>查看日志</a> </li>
                                        </ul>
                                    </li>
                                </ul>
                            </div>
                            <div class="tabContent ">
                                <iframe name="content3" src="SuperManage/AddHospital.aspx" frameborder="0" style="width: inherit; height: inherit"></iframe>
                            </div>
                        </div>
                    </td>
                </tr>
            </tbody>
        </table>
        <uc1:IsSuperAdmin ID="IsSuperAdmin1" runat="server" />
    </form>
</body>
</html>
