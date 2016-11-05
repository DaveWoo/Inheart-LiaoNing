﻿<%@ Page Language="C#" AutoEventWireup="true" Inherits="CoronaryHeartDiseaseProject.Admin.SuperManage.AddAdmin" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link rel="stylesheet" href="/Content/bootstrap.min.css">
    <script src="/Scripts/bootstrap.min.js"></script>
    <script src="/Scripts/jquery-1.9.1.min.js"></script>
    <title>修改资料</title>
    <link href="../../Styles/admin.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" language="javascript">
        function check() {
            if (document.myform.username.value == "") {
                alert("用户名不能为空！！");
                return false;
            }

            if (document.myform.username.value.length > 12) {
                alert("用户名不能不能长于12！！");
                return false;
            }

            if (document.myform.newpass.value == "") {
                alert("密码不能为空！！");
                return false;
            }

            if (document.myform.newpass.value.length < 6) {
                alert("密码长度不能小于6位！！");
                return false;
            }

            if (document.myform.repass.value != document.myform.newpass.value) {
                alert("两次密码输入不一样！！");
                return false;
            }

            if (document.myform.newpass.value.length > 11) {
                alert("密码长度不能长于12！！");
                return false;
            }
        }

        function Submit2_onclick() {

        }

    </script>
</head>
<body>
    <table width="100%" border="0" align="center" cellpadding="3" cellspacing="1">
        <tr>
            <td>
                <table width="98%%" border="0" align="center" cellpadding="3" cellspacing="1">
                    <tr>
                        <td height="25" colspan="2">网站导航: &nbsp;<a href="AddAdmin.aspx"><b>添加管理员</b></a> &nbsp;|&nbsp; <a href="AdminManage.aspx">管理管理员</a>&nbsp; | <a href="AdminCenter.aspx">修改密码</a> |
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    <form id="myform" runat="server" onsubmit="return check()">
        <table width="98%%" border="0" align="center" cellpadding="3" cellspacing="1" class="tableborder">
            <tr class="header">
                <td height="25" colspan="2">添加管理员&nbsp;
                </td>
            </tr>
            <tr bgcolor="#FFFFFF">
                <td width="32%" height="25">医院：
                </td>
                <td width="100%" height="25" colspan="2">
                    <asp:DropDownList CssClass="form-control" ID="SelectHosptial" runat="server" Width="250px">
                    </asp:DropDownList>
                </td>
            </tr>
            <tr bgcolor="#FFFFFF">
                <td width="25%" height="25">管理员用户名
                </td>
                <td width="75%" height="25">
                    <input type="text" class="form-control" name="username" placeholder="用户名" style="width: 250px" />
                </td>
            </tr>
            <tr bgcolor="#FFFFFF">
                <td height="25">管理员密码
                </td>
                <td height="25">
                    <input type="password" name="newpass" class="form-control" placeholder="密码" style="width: 250px" />
                </td>
            </tr>
            <tr bgcolor="#FFFFFF">
                <td height="25">确认密码
                </td>
                <td height="25">
                    <input type="password" name="repass" class="form-control" placeholder="确认密码" style="width: 250px">
                </td>
            </tr>
            <tr bgcolor="#FFFFFF">
                <td height="25">&nbsp;
                </td>
                <td height="25">
                    <input type="submit" value="添加管理员" class="btn btn-info " name="B1" id="Submit2" onserverclick="Submit1_ServerClick"
                        runat="server" onclick="return Submit2_onclick()">
                    <input type="reset" name="Submit2" value="重置" class="btn btn-info ">
                </td>
            </tr>
        </table>
        <br />
        <br />
        <br />
        <%--    <uc1:session ID="Session1" runat="server" />
    <uc2:IsAdmin ID="IsAdmin1" runat="server" />--%>
    </form>
</body>
</html>
