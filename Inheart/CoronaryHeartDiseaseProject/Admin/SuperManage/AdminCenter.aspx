<%@ Page Language="C#" AutoEventWireup="true" Inherits="CoronaryHeartDiseaseProject.Admin.SuperManage.AdminCenter" %>

<%@ Register Src="../inc/IsSuperAdmin.ascx" TagName="IsSuperAdmin" TagPrefix="uc1" %>

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
    <%--输入框检查--%>
    <script type="text/javascript" src="/Scripts/check.js"></script>

    <title>修改资料</title>
</head>
<body>
    <form id="myform" runat="server" onsubmit="return checkReSetPwd()">
        <table width="100%" border="0" align="center" cellpadding="3" cellspacing="1" class="table-bordered">
            <tr>
                <td colspan="2" class="header">修改超级管理员密码&nbsp;
                </td>
            </tr>
            <tr>
                <td class="tableTDCell" width="25%">原密码</td>
                <td width="75%">
                    <input type="password" class="form-control" placeholder="原密码" name="oldpass" style="width: 250px" />
                </td>
            </tr>
            <tr>
                <td class="tableTDCell">新密码</td>
                <td>
                    <input type="password" class="form-control" name="newpass" placeholder="新密码" style="width: 250px" />
                </td>
            </tr>
            <tr>
                <td class="tableTDCell">确认密码</td>
                <td>
                    <input type="password" class="form-control" name="repass" placeholder="确认新密码" style="width: 250px" />
                </td>
            </tr>
            <tr>
                <td>&nbsp;
                </td>
                <td>
                    <input type="submit" class="btn btn-info" value="保存密码" name="B1" id="Submit2" onserverclick="Submit1_SavePassword_ServerClick"
                        runat="server">
                    <input type="reset" class="btn btn-info" name="Submit2" value="重置">
                </td>
            </tr>
        </table>
        <uc1:IsSuperAdmin ID="IsSuperAdmin1" runat="server" />
    </form>
</body>
</html>
