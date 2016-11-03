<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="Admin" %>

<%@ Register Src="inc/IsAdmin.ascx" TagName="IsAdmin" TagPrefix="uc1" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
    <title>辽宁省冠心病急救网络信息平台</title>
    <link href="../Styles/default.css" type="text/css" rel="stylesheet" />
    <script language="javascript" src="../Scripts/menu.js" type="text/javascript"></script>
</head>
<body onload="javascript:border_left('left_tab1','left_menu_cnt1');">
    <form id="form1" runat="server">
        <table id="indextablebody" cellpadding="0">
            <thead>
                <tr>
                    <th style="padding-left: 10px; text-align: center; font-size: 20px;">用户管理后台
                    </th>
                    <th>
                        <a>医院 ：<%=Hospital%>
                        </a>&nbsp;&nbsp;<a>用户ID ：<%=UserName%></a>&nbsp;&nbsp; <a>身份 ：<%=UserRole%></a>
                    </th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td class="menu">
                        <ul class="bigbtu">
                            <li id="left"><a title="安全退出" href="Logout.aspx">安全退出</a></li>
                            <li id="right"><a title="更新" onclick="window.parent['content3'].location.reload()"
                                style="cursor: hand;">更新</a></li>
                        </ul>
                    </td>
                    <td class="tab">
                        <ul id="tabpage1">
                            <li id="tab1" title="管理首页"><span id="spanTitle">添加新用户</span></li>
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
                                                <li id="left_tab1" onclick="javascript:border_left('left_tab1','left_menu_cnt1');"
                                                    title="操作菜单"><span>管理员</span></li>
                                            </ul>
                                            <div id="left_menu_cnt1" class="left_menu_cnt">
                                                <ul id="dleft_tab1">
                                                    <li id="now11"><a title="添加新用户" onclick="show_title('添加新用户')" href="SystemManage/AddUser.aspx"
                                                        target="content3"><span>添加新用户</span></a></li>
                                                    <li id="now12"><a title="用户管理" onclick="show_title('用户管理')" href="SystemManage/UserManage.aspx"
                                                        target="content3"><span>用户管理</span></a></li>
                                                    <li id="now13"><a title="修改管理员密码" onclick="show_title('修改密码')" href="SystemManage/UserCenter.aspx"
                                                        target="content3"><span>修改管理员密码</span></a></li>
                                                </ul>
                                            </div>
                                            <div class="clear">
                                            </div>
                                            <ul class="tabpage2">
                                                <li id="left_tab2" onclick="javascript:border_left('left_tab2','left_menu_cnt2');"
                                                    title="操作菜单"><span>管理</span></li>
                                            </ul>
                                            <div id="left_menu_cnt2" class="left_menu_cnt">
                                                <ul id="dleft_tab2">
                                                    <li id="now14"><a title="病例管理" onclick="show_title('病例管理')" href="SystemManage/MessageManageAdmin.aspx"
                                                        target="content3"><span>病例管理</span></a></li>
                                                    <%--   <li id="now15"><a title="报表管理" onclick="show_title('报表管理')" href="Content.aspx" target="content3"
                                                    href="Content.aspx" target="content3" /><span>报表管理</span></a></li>--%>
                                                    <%--  <li id="now16"><a title="查看日志" onclick="show_title('查看日志')" href="SystemManage/ViewLogs.aspx"
                                                    target="content3" href="Content.aspx" target="content3" /><span>查看日志</span></a></li>--%>
                                                </ul>
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
                                <iframe name="content3" src="SystemManage/AddUser.aspx" frameborder="0"></iframe>
                            </div>
                        </div>
                    </td>
                </tr>
            </tbody>
        </table>
        <script type="text/javascript">
            //修改标题
            function show_title(str) {
                document.getElementById("spanTitle").innerHTML = str;
            }
        </script>
    </form>
</body>
</html>
