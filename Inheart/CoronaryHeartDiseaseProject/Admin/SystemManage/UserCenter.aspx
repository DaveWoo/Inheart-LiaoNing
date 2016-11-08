<%@ Page Language="C#" AutoEventWireup="true" Inherits="CoronaryHeartDiseaseProject.Admin.UserCenter" %>

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
    <form id="myform" runat="server" onsubmit="return checkReSetPwd()">
        <table width="100%" border="0" align="center" cellpadding="3" cellspacing="1">
            <tr>
                <td>
                    <table width="100%" border="0" align="center" cellpadding="3" cellspacing="1">
                        <tr>
                            <td height="25" colspan="2">网站导航: &nbsp;<a href="AddUser.aspx">添加新用户</a> &nbsp;|&nbsp; <a href="UserManage.aspx">用户管理</a>&nbsp; | <a href="UserCenter.aspx"><b>修改管理员密码</b> </a>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
        <table width="100%" border="0" align="center" cellpadding="3" cellspacing="1" class="tableborder">
            <tr class="header">
                <td height="30px" colspan="2">修改管理员密码&nbsp;
                </td>
            </tr>
            <tr bgcolor="#FFFFFF">
                <td width="25%" height="25">原密码
                </td>
                <td width="75%" height="25">
                    <input type="password" name="oldpass" placeholder="请输入原密码" class="form-control-user">
                </td>
            </tr>
            <tr bgcolor="#FFFFFF">
                <td height="25">新密码
                </td>
                <td height="25">
                    <input type="password" name="newpass" placeholder="请输入新密码" class="form-control-user" />
                </td>
            </tr>
            <tr bgcolor="#FFFFFF">
                <td height="25">确认密码
                </td>
                <td height="25">
                    <input type="password" name="repass" placeholder="请再次输入新密码" class="form-control-user">
                </td>
            </tr>
            <tr bgcolor="#FFFFFF">
                <td height="25">&nbsp;
                </td>
                <td height="25">
                    <input type="submit" value="保存密码" name="B1" class="btn btn-info" id="Submit2" onserverclick="Submit1_ServerClick"
                        runat="server" onclick="return Submit2_onclick()">
                    <input type="reset" name="Submit2" class="btn btn-info" value="重置">
                </td>
            </tr>
        </table>
        <uc1:IsAdmin ID="IsAdmin1" runat="server" />
    </form>
</body>
</html>
