﻿<%@ Page Language="C#" AutoEventWireup="true" Inherits="CoronaryHeartDiseaseProject.Admin.UserCenter" %>

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
    <%--输入框检查--%>
    <script type="text/javascript" src="/Scripts/check.js"></script>

    <title>修改资料</title>
</head>
<body>
    <form id="myform" runat="server" onsubmit="return checkReSetPwd()">
        <table width="100%" border="1" align="center" cellpadding="3" cellspacing="1" class="tableborder">
            <tr class="header">
                <td height="30px" colspan="2" class="tableTDCell">修改管理员密码</td>
            </tr>
            <tr>
                <td width="25%" class="tableTDCell">原密码
                </td>
                <td width="75%">
                    <input type="password" name="oldpass" placeholder="请输入原密码" class="form-control-user">
                </td>
            </tr>
            <tr>
                <td class="tableTDCell">新密码
                </td>
                <td>
                    <input type="password" name="newpass" placeholder="请输入新密码" class="form-control-user" />
                </td>
            </tr>
            <tr>
                <td class="tableTDCell">确认密码
                </td>
                <td>
                    <input type="password" name="repass" placeholder="请再次输入新密码" class="form-control-user">
                </td>
            </tr>
            <tr>
                <td>&nbsp;
                </td>
                <td>
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
