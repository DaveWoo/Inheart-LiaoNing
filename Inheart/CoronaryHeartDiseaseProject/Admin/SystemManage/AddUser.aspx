<%@ Page Language="C#" AutoEventWireup="true" Inherits="CoronaryHeartDiseaseProject.Admin.AddUser" %>

<%@ Register Src="../inc/IsAdmin.ascx" TagName="IsAdmin" TagPrefix="uc1" %>

<!DOCTYPE html>
<html>
<head>
    <%--设置编码--%>
    <meta charset="utf-8" />
    <%--页面首次由浏览器加载时的初始缩放级别。--%>
    <meta name="viewport" content="width=device-width, initial-scale=1" />

    <%--引用bootstrap和相关的Jquery--%>
    <link rel="stylesheet" href="/Content/bootstrap.min.css" />
    <script type="text/javascript" src="/Scripts/jquery-1.9.1.min.js"></script>
    <script type="text/javascript" src="/Scripts/bootstrap.min.js"></script>

    <%--管理页面相关的样式--%>
    <link rel="stylesheet" href="/Styles/admin.css" />
    <%--输入框检查--%><script type="text/javascript" src="/Scripts/check.js"></script>

    <title>修改资料</title>
</head>
<body>
    <form id="myform" runat="server">
        <table width="100%" border="1" align="center" cellpadding="3" cellspacing="1" class="tableborder">
            <tr class="header">
                <td colspan="2" class="tableTDCell">添加新用户</td>
            </tr>
            <tr>
                <td width="25%" class="tableTDCell">新用户</td>
                <td width="75%">
                    <input type="text" class="form-control-user" name="username" placeholder="户用名" />
                </td>
            </tr>
            <tr>
                <td class="tableTDCell">用户密码</td>
                <td>
                    <input type="password" class="form-control-user" name="newpass" placeholder="用户密码" />
                </td>
            </tr>
            <tr>
                <td class="tableTDCell">确认密码</td>
                <td>
                    <input type="password" class="form-control-user" name="repass" placeholder="确认密码" />
                </td>
            </tr>
            <tr>
                <td></td>
                <td>
                    <input type="submit" value="添加新用户" name="B1" class="btn btn-info " id="Submit2" onserverclick="Submit1_ServerClick"
                        runat="server" onclick="return Submit2_onclick()" />
                    <input type="reset" name="Submit2" class="btn btn-info " value="重置" />
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
