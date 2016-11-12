<%@ Page Language="C#" AutoEventWireup="true" Inherits="CoronaryHeartDiseaseProject.Admin.ModifyUser" %>

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
    <form id="myform" runat="server" onsubmit="return checkUser()">
        <table width="100%" border="0" align="center" cellpadding="3" cellspacing="1" class="tableborder">
            <tr class="header">
                <td colspan="2">修改用户             
                    <asp:TextBox ID="TextBox1" runat="server" Width="61px" Visible="false"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td width="25%" class="tableTDCell">用户名</td>
                <td width="75%">
                    <input type="text" class="form-control" name="username" size="35" readonly value="<%=userName %>" />
                </td>
            </tr>
            <tr>
                <td class="tableTDCell">用户密码</td>
                <td>
                    <input type="password" name="newpass" size="35" value="">
                </td>
            </tr>
            <tr>
                <td class="tableTDCell">确认密码</td>
                <td>
                    <input type="password" name="repass" size="35" value="">
                </td>
            </tr>
            <tr>
                <td>&nbsp;
                </td>
                <td>
                    <input type="submit" value="修改用户" name="B1" class="Button" id="Submit2" onserverclick="Submit1_ServerClick"
                        runat="server">
                    <input type="reset" name="Submit2" value="重置">
                </td>
            </tr>
        </table>
        <br />
        <br />
        <br />
        <uc1:IsAdmin ID="IsAdmin1" runat="server" />
    </form>
</body>
</html>
