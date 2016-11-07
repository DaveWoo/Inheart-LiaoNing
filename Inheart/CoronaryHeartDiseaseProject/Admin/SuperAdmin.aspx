<%@ Page Language="C#" AutoEventWireup="true" Inherits="SuperAdmin" %>

<%@ Register Src="inc/IsSuperAdmin.ascx" TagName="IsSuperAdmin" TagPrefix="uc1" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link rel="stylesheet" href="../Styles/default.css" type="text/css" rel="stylesheet">
    <link rel="stylesheet" href="/Content/bootstrap.min.css" />
    <script type="text/javascript" src="/Scripts/bootstrap.min.js"></script>
    <script type="text/javascript" src="/Scripts/jquery-1.9.1.min.js"></script>
    <script type="text/javascript" src="../Scripts/menu.js"></script>
    <title>辽宁省冠心病急救网络信息平台</title>
</head>
<body onload="javascript:border_left('left_tab1','left_menu_cnt1');">
    <form id="form1" runat="server">
        <table id="indextablebody" cellpadding="0">
            <thead>
                <tr>
                    <th style="padding-left: 10px; text-align: center; font-size: 18px;">超级管理管理平台</th>
                    <th>
                        <a>用户ID ：<%=UserName%></a>&nbsp;&nbsp; <a>身份 ：<%=UserRole%></a>
                    </th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td class="menu">
                        <ul class="bigbtu">
                            <li id="left"><a title="安全退出" href="Logout.aspx">安全退出</a></li>
                            <li id="right"><a title="更新当前页面" onclick="window.parent['content3'].location.reload()"
                                style="cursor: hand;">更新当前页面</a></li>
                        </ul>
                    </td>
                    <td class="tab">
                        <ul id="tabpage1">
                            <li id="tab1" title="管理首页"><span id="spanTitle">管理首页</span></li>
                        </ul>
                    </td>
                </tr>
                <tr>
                    <td class="t1">
                        <div id="contents">
                            <table cellpadding="0">
                                <tr class="t1">
                                    <td>
                                        <div class="menu_top">
                                        </div>
                                    </td>
                                </tr>
                                <tr class="t2">
                                    <td>
                                        <div id="menu" class="menu">
                                            <ul class="tabpage2">
                                                <li id="left_tab1" title="操作菜单" onclick="javascript:border_left('left_tab1','left_menu_cnt1');">
                                                    <span>医院</span></li>
                                            </ul>
                                            <div id="left_menu_cnt1" class="left_menu_cnt">
                                                <ul id="dleft_tab1">
                                                    <li id="now11"><a title="添加医院" href="SuperManage/AddHospital.aspx" onclick="show_title('添加医院')"
                                                        target="content3"><span>添加医院</span></a></li>
                                                    <li id="now12"><a title="管理医院" href="SuperManage/AdminManageHospital.aspx" onclick="show_title('管理医院')"
                                                        target="content3"><span>管理医院</span></a></li>
                                                </ul>
                                            </div>
                                            <div class="clear">
                                            </div>
                                            <ul class="tabpage2">
                                                <li id="left_tab2" onclick="javascript:border_left('left_tab2','left_menu_cnt2');"
                                                    title="操作菜单"><span>管理员</span></li>
                                            </ul>
                                            <div id="left_menu_cnt2" class="left_menu_cnt">
                                                <ul id="dleft_tab2">
                                                    <li id="now12"><a title="添加管理员" onclick="show_title('添加管理员')" href="SuperManage/AddAdmin.aspx"
                                                        target="content3"><span>添加管理员</span></a></li>
                                                    <li id="now13"><a title="管理管理员" onclick="show_title('管理管理员')" href="SuperManage/AdminManage.aspx"
                                                        target="content3"><span>管理管理员</span></a></li>
                                                    <li id="now12"><a title="修改密码" onclick="show_title('修改密码')" href="SuperManage/AdminCenter.aspx"
                                                        target="content3"><span>修改密码</span></a></li>
                                                </ul>
                                            </div>
                                            <div class="clear">
                                            </div>
                                            <ul class="tabpage2">
                                                <li id="left_tab3" onclick="javascript:border_left('left_tab3','left_menu_cnt3');"
                                                    title="报表"><a target="content3" href="SuperManage/SummaryReport.aspx?type=All"><span>报表</span></a></li>
                                            </ul>
                                            <div id="left_menu_cnt3" class="left_menu_cnt">
                                                <ul id="dleft_tab3">
                                                    <li id="now13"><a title="患者总人数" onclick="show_title('患者总人数')" href="SuperManage/SummaryReport.aspx?type=Sum"
                                                        target="content3"><span>患者总人数</span></a></li>
                                                    <li id="now13"><a title="患者性别" onclick="show_title('患者性别')" href="SuperManage/SummaryReport.aspx?type=Sex"
                                                        target="content3"><span>患者性别</span></a></li>
                                                    <li id="now13"><a title="患者年龄" onclick="show_title('患者年龄')" href="SuperManage/SummaryReport.aspx?type=Age"
                                                        target="content3"><span>患者年龄</span></a></li>
                                                    <li id="now13"><a title="溶栓人数" onclick="show_title('溶栓人数')" href="SuperManage/SummaryReport.aspx?type=ThrombolysisCount"
                                                        target="content3"><span>溶栓人数</span></a></li>
                                                    <li id="now13"><a title="急诊介入人数" onclick="show_title('急诊介入')" href="SuperManage/SummaryReport.aspx?type=EmergencyTreate"
                                                        target="content3"><span>急诊介入人数</span></a></li>
                                                    <li id="now13"><a title="死亡人数" onclick="show_title('死亡人数')" href="SuperManage/SummaryReport.aspx?type=DeathCount"
                                                        target="content3"><span>死亡人数</span></a></li>
                                                    <li id="now13"><a title="转上级医院患者数" onclick="show_title('转上级医院')" href="SuperManage/SummaryReport.aspx?type=TransferUpHospitalCount"
                                                        target="content3"><span>转上级医院患者数</span></a></li>
                                                </ul>
                                            </div>
                                            <div class="clear">
                                            </div>
                                            <ul class="tabpage2">
                                                <li id="left_tab4" onclick="javascript:border_left('left_tab4','left_menu_cnt4');"
                                                    title="操作菜单"><span>管理</span></li>
                                            </ul>
                                            <div id="left_menu_cnt4" class="left_menu_cnt">
                                                <ul id="dleft_tab4">
                                                    <li id="now14"><a title="病例管理" onclick="show_title('病例管理')" href="SuperManage/MessageManageSupperAdmin.aspx"
                                                        target="content3"><span>病例管理</span></a></li>
                                                    <li id="now16"><a title="查看日志" onclick="show_title('查看日志')" href="SuperManage/ViewLogs.aspx"
                                                        target="content3" href="Content.aspx" target="content3" /><span>查看日志</span></a></li>

                                                </ul>
                                            </div>
                                            <div class="clear">
                                            </div>
                                        </div>
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </td>
                    <td class="t2">
                        <div id="cnt">
                            <div id="dtab1">
                                <iframe name="content3" src="SuperManage/AddHospital.aspx" frameborder="0"></iframe>
                            </div>
                        </div>
                    </td>
                </tr>
            </tbody>
        </table>
        <script>
            //修改标题
            function show_title(str) {
                document.getElementById("spanTitle").innerHTML = str;
            }
        </script>
        <uc1:IsSuperAdmin ID="IsSuperAdmin1" runat="server" />
    </form>
</body>
</html>
