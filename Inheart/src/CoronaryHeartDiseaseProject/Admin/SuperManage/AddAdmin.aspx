<%@ Page Language="C#" AutoEventWireup="true" Inherits="CoronaryHeartDiseaseProject.Admin.SuperManage.AddAdmin" %>

<%@ Register Src="../inc/IsSuperAdmin.ascx" TagName="IsSuperAdmin" TagPrefix="uc1" %>

<!DOCTYPE html>
<html>
<head>
    <%--设置编码--%>
    <meta charset="utf-8" />
    <%--页面首次由浏览器加载时的初始缩放级别。--%>
    <meta name="viewport" content="width=device-width, initial-scale=1" />

    <%--引用bootstrap和相关的Jquery--%>
    <link rel="stylesheet" href="../../Content/bootstrap.min.css" />
    <script type="text/javascript" src="../../Scripts/jquery-1.9.1.min.js"></script>
    <script type="text/javascript" src="../../Scripts/bootstrap.min.js"></script>

    <%--管理页面相关的样式--%>
    <link rel="stylesheet" href="../../Styles/admin.css" />
    <%--输入框检查--%>
    <script type="text/javascript" src="../../Scripts/check.js"></script>

    <title>修改资料</title>
</head>
<body>
    <form id="myform" runat="server" onsubmit="return checkUser()">
        <table width="100%" border="0" align="center" cellpadding="3" cellspacing="1" class="table-bordered">
            <tr>
                <td colspan="2" class="header">添加管理员
                </td>
            </tr>
            <tr>
                <td class="tableTDCell" width="32%">医院</td>
                <td width="100%" colspan="2">
                    <asp:DropDownList CssClass="form-control" ID="SelectHosptial" runat="server" Width="250px">
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td class="tableTDCell" width="25%">管理员用户名</td>
                <td width="75%">
                    <input type="text" class="form-control" name="username" placeholder="用户名" style="width: 250px" />
                </td>
            </tr>
            <tr>
                <td class="tableTDCell">管理员密码</td>
                <td>
                    <input type="password" name="newpass" class="form-control" placeholder="密码" style="width: 250px" />
                </td>
            </tr>
            <tr>
                <td class="tableTDCell">确认密码</td>
                <td>
                    <input type="password" name="repass" class="form-control" placeholder="确认密码" style="width: 250px">
                </td>
            </tr>
            <tr>
                <td>&nbsp;
                </td>
                <td>
                    <input type="submit" value="添加管理员" class="btn btn-info " name="B1" id="Submit2" onserverclick="Submit1_ServerClick"
                        runat="server" onclick="return Submit2_onclick()">
                    <input type="reset" name="Submit2" value="重置" class="btn btn-info ">
                </td>
            </tr>
        </table>
        <br />
        <br />
        <br />
        <uc1:IsSuperAdmin ID="IsSuperAdmin1" runat="server" />
    </form>
</body>
</html>
