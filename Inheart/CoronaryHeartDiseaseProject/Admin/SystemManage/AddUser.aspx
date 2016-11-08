<%@ Page Language="C#" AutoEventWireup="true" Inherits="CoronaryHeartDiseaseProject.Admin.AddUser" %>

<%@ Register Src="../inc/IsAdmin.ascx" TagName="IsAdmin" TagPrefix="uc1" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link rel="stylesheet" href="../../Styles/admin.css" />
    <link rel="stylesheet" href="/Content/bootstrap.min.css" />
    <script type="text/javascript" src="/Scripts/bootstrap.min.js"></script>
    <script type="text/javascript" src="/Scripts/jquery-1.9.1.min.js"></script>
    <script type="text/javascript" src="/Scripts/check.js"></script>
    <title>修改资料</title>
</head>
<body>
    <table width="100%" border="0" align="center" cellpadding="3" cellspacing="1">
        <tr>
            <td>
                <table width="98%" border="0" align="center" cellpadding="3" cellspacing="1">
                    <tr>
                        <td height="25" colspan="2">网站导航: &nbsp;<a href="AddUser.aspx"><b>添加新用户</b></a> &nbsp;|&nbsp; <a href="UserManage.aspx">用户管理</a>&nbsp; | <a href="UserCenter.aspx">修改管理员密码 </a>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    <form id="myform" runat="server" onsubmit="return checkUser()">
        <table width="98%" border="0" align="center" cellpadding="3" cellspacing="1" class="tableborder">
            <tr class="header">
                <td height="30px" colspan="2">添加新用户</td>
            </tr>
            <tr bgcolor="#FFFFFF">
                <td width="25%" height="25">新用户用名</td>
                <td width="75%" height="25">
                    <input type="text" class="form-control-user" name="username" placeholder="户用名" />
                </td>
            </tr>
            <tr bgcolor="#FFFFFF">
                <td height="25">用户密码</td>
                <td height="25">
                    <input type="password" class="form-control-user" name="newpass" placeholder="用户密码" />
                </td>
            </tr>
            <tr bgcolor="#FFFFFF">
                <td height="25">确认密码</td>
                <td height="25">
                    <input type="password" class="form-control-user" name="repass" placeholder="确认密码" />
                </td>
            </tr>
            <tr bgcolor="#FFFFFF">
                <td height="25">&nbsp;
                </td>
                <td height="25">
                    <input type="submit" value="添加新用户" name="B1" Class="btn btn-info " id="Submit2" onserverclick="Submit1_ServerClick"
                        runat="server" onclick="return Submit2_onclick()" />
                    <input type="reset" name="Submit2" Class="btn btn-info " value="重置" />
                </td>
            </tr>
        </table>
        <br />
        <br />
        <br />
        <%--    <uc1:session ID="Session1" runat="server" />
    <uc2:IsAdmin ID="IsAdmin1" runat="server" />--%>
        <uc1:IsAdmin ID="IsAdmin1" runat="server" />
    </form>
</body>
</html>
