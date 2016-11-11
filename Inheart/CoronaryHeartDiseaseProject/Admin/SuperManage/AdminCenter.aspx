<%@ Page Language="C#" AutoEventWireup="true" Inherits="CoronaryHeartDiseaseProject.Admin.SuperManage.AdminCenter" %>

<%@ Register Src="../inc/IsSuperAdmin.ascx" TagName="IsSuperAdmin" TagPrefix="uc1" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link rel="stylesheet" href="/Content/bootstrap.min.css" />
    <link rel="stylesheet" href="../../Styles/admin.css" />
    <script type="text/javascript" src="/Scripts/bootstrap.min.js"></script>
    <script type="text/javascript" src="/Scripts/jquery-1.9.1.min.js"></script>
    <script type="text/javascript" src="/Scripts/check.js"></script>
    <title>修改资料</title>
</head>
<body>
    <form id="myform" runat="server" onsubmit="return checkReSetPwd()">
        <table width="100%" border="0" align="center" cellpadding="3" cellspacing="1" class="table">
            <tr class="header">
                <td height="30px" colspan="2">修改超级管理员密码&nbsp;
                </td>
            </tr>
            <tr bgcolor="#FFFFFF">
                <td width="25%" height="30px">原密码</td>
                <td width="75%" >
                    <input type="password" class="form-control" placeholder="原密码" name="oldpass" style="width: 250px" />
                </td>
            </tr>
            <tr bgcolor="#FFFFFF">
                <td >新密码</td>
                <td >
                    <input type="password" class="form-control" name="newpass" placeholder="新密码" style="width: 250px" />
                </td>
            </tr>
            <tr bgcolor="#FFFFFF">
                <td >确认密码</td>
                <td >
                    <input type="password" class="form-control" name="repass" placeholder="确认新密码" style="width: 250px" />
                </td>
            </tr>
            <tr bgcolor="#FFFFFF">
                <td height="25">&nbsp;
                </td>
                <td height="25">
                    <input type="submit" class="btn btn-info widthButton" value="保存密码" name="B1" id="Submit2" onserverclick="Submit1_SavePassword_ServerClick"
                        runat="server">
                    <input type="reset" class="btn btn-info widthButton" name="Submit2" value="重置">
                </td>
            </tr>
        </table>
        <uc1:IsSuperAdmin ID="IsSuperAdmin1" runat="server" />
    </form>
</body>
</html>