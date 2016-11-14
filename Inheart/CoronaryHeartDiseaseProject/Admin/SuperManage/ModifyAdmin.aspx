<%@ Page Language="C#" AutoEventWireup="true" Inherits="CoronaryHeartDiseaseProject.Admin.SuperManage.ModifyAdmin" %>

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
    <form id="myform" runat="server" onsubmit="return checkUser()">
        <table width="100%" border="0" align="center" cellpadding="3" cellspacing="1" class="tableborder">
            <tr class="header">
                <td class="tableTDCell" colspan="2">修改管理员&nbsp;
                    <asp:TextBox ID="TextBox1" runat="server" Width="61px" Visible="false"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td  class="tableTDCell">管理员用户名</td>
                <td >
                    <input type="text" class="form-control" name="username" size="35" readonly value="<%=UserName %>" style="width: 250px"/>
                </td>
            </tr>
            <tr>
                <td  class="tableTDCell">管理员密码</td>
                <td >
                    <input type="password" class="form-control"  name="newpass" size="35" value="" placeholder="输入密码" style="width: 250px"/>
                </td>
            </tr>
            <tr>
                <td  class="tableTDCell">确认密码</td>
                <td ">
                    <input type="password" class="form-control"  name="repass" size="35" value="" placeholder="请再次输入密码" style="width: 250px">
                </td>
            </tr>
            <tr>
                <td>&nbsp;
                </td>
                <td>
                    <input type="submit" value="修改管理员" name="B1" class="btn btn-info" id="Submit2" onserverclick="Submit1_ServerClick"
                        runat="server" />
                    <input type="reset" name="Submit2" class="btn btn-info" value="重置" />
                </td>
            </tr>
        </table>
        <br />
        <br />
        <uc1:IsSuperAdmin ID="IsSuperAdmin1" runat="server" />
    </form>
</body>
</html>
