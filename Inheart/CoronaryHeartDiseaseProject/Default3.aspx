<%@ Page Language="C#" AutoEventWireup="true" Inherits="index" %>

<%@ Register Src="Admin/inc/User.ascx" TagName="User" TagPrefix="uc1" %>
<html>
<head>
    <title>辽宁省冠心病急救网络信息平台</title>
    <link href="Styles/default.css" type="text/css" rel="stylesheet" />
    <script language="javascript" src="Scripts/menu.js" type="text/javascript"></script>
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="sc" runat="server">
        </asp:ScriptManager>
        <table id="indextablebody" cellpadding="0" cellspacing="0" border="0">
            <thead>
                <tr>
                    <th style="padding-left: 20px; text-align: left; font-size: 14; font-weight: bold">
                        <%=HospitalName%>
                    </th>
                    <th>
                        <a>用户ID ：<%=UserName%></a>&nbsp;&nbsp; <a>身份 ：<%=UserRole%></a>&nbsp;&nbsp;
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
                            <li id="tab1" title="病例管理"><span id="spanTitle">病例管理</span></li>
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
                                                <li id="left_tab1" title="操作菜单"><span>病例</span></li>
                                            </ul>
                                            <div id="left_menu_cnt1" class="left_menu_cnt">
                                                <ul id="dleft_tab1">
                                                    <li id="now11"><a title="病例查询" onclick="show_title('病例查询')" href="MessageManage.aspx"
                                                        target="content3"><span>管理查询</span></a></li>
                                                    <li id="now12"><a title="病例录入" onclick="show_title('录入新病例')" href="MessageInput.aspx"
                                                        target="content3"><span>录入新病例</span></a></li>
                                                    <li id="now13"><a title="修改密码" onclick="show_title('修改密码')" href="UserCenter.aspx"
                                                        target="content3"><span>修改密码</span></a></li>
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
                                <iframe name="content3" src="MessageManage.aspx" frameborder="0"></iframe>
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
