<%@ Page Language="C#" AutoEventWireup="true" Inherits="CoronaryHeartDiseaseProject.UserCenter" %>

<%@ Register Src="Admin/inc/User.ascx" TagName="User" TagPrefix="uc1" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link rel="stylesheet" href="/Content/bootstrap.min.css" />
    <script type="text/javascript" src="/Scripts/bootstrap.min.js"></script>
    <script type="text/javascript" src="/Scripts/jquery-1.9.1.min.js"></script>
    <link rel="stylesheet" href="../../Styles/admin.css" />
    <script type="text/javascript" src="/Scripts/check.js"></script>
    <title>修改资料</title>
</head>
<body>
    <form id="divbody" runat="server" onsubmit="return   <title>修改资料</title>()">
        <table width="100%" border="0" align="center" cellpadding="3" cellspacing="1" class="tableborder">
            <tr class="header">
                <td height="30px" colspan="2">修改密码&nbsp;</td>
            </tr>
            <tr bgcolor="#FFFFFF">
                <td width="25%" height="25">原密码</td>
                <td width="75%" height="25">
                    <input type="password" class="form-control-user" placeholder="请输入原密码" name="oldpass" size="35">
                </td>
            </tr>
            <tr bgcolor="#FFFFFF">
                <td height="25">新密码</td>
                <td height="25">
                    <input type="password" class="form-control-user" placeholder="请输入密码" name="newpass" size="35" />
                </td>
            </tr>
            <tr bgcolor="#FFFFFF">
                <td height="25">确认密码</td>
                <td height="25">
                    <input type="password" class="form-control-user" placeholder="请您再次输入密码" name="repass" size="35">
                </td>
            </tr>
            <tr bgcolor="#FFFFFF">
                <td height="25">&nbsp;
                </td>
                <td height="25">
                    <input type="submit" value="保存密码" name="B1" Class="btn btn-info" id="Submit2" onserverclick="Submit1_ServerClick"
                        runat="server" onclick="return Submit2_onclick()">
                    <input type="reset" name="Submit2" Class="btn btn-info" value="重置">
                </td>
            </tr>
        </table>
        <uc1:User ID="User1" runat="server" />
    </form>
</body>
</html>
