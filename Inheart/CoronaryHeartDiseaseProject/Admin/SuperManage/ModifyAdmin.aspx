<%@ Page Language="C#" AutoEventWireup="true" Inherits="CoronaryHeartDiseaseProject.Admin.SuperManage.ModifyAdmin" %>

<%@ Register Src="../inc/IsSuperAdmin.ascx" TagName="IsSuperAdmin" TagPrefix="uc1" %>

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
                        <td height="25" colspan="2">网站导航: &nbsp;<a href="AddAdmin.aspx">添加管理员</a> &nbsp;|&nbsp; <a href="AdminManage.aspx">管理管理员</a>&nbsp; | <a href="AdminCenter.aspx">修改管理员密码</a> |
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    <form id="myform" runat="server" onsubmit="return checkUser()">
        <table width="98%" border="0" align="center" cellpadding="3" cellspacing="1" class="tableborder">
            <tr class="header">
                <td height="30px" colspan="2">修改管理员&nbsp;
                <asp:TextBox ID="TextBox1" runat="server" Width="61px" Visible="false"></asp:TextBox>
                </td>
            </tr>
            <tr bgcolor="#FFFFFF">
                <td width="25%" height="25">管理员用户名</td>
                <td width="75%" height="25">
                    <input type="text" class="form-control" name="username" size="35" readonly value="<%=UserName %>" />
                </td>
            </tr>
            <tr bgcolor="#FFFFFF">
                <td height="25">管理员密码</td>
                <td height="25">
                    <input type="password" name="newpass" size="35" value="" />
                </td>
            </tr>
            <tr bgcolor="#FFFFFF">
                <td height="25">确认密码</td>
                <td height="25">
                    <input type="password" name="repass" size="35" value="">
                </td>
            </tr>
            <tr bgcolor="#FFFFFF">
                <td height="25">&nbsp;
                </td>
                <td height="25">
                    <input type="submit" value="修改管理员" name="B1" class="Button" id="Submit2" onserverclick="Submit1_ServerClick"
                        runat="server" />
                    <input type="reset" name="Submit2" value="重置" />
                </td>
            </tr>
        </table>
        <br />
        <br />
        <uc1:IsSuperAdmin ID="IsSuperAdmin1" runat="server" />
    </form>
</body>
</html>