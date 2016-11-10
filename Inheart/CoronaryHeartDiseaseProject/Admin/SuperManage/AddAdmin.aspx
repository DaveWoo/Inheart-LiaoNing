<%@ Page Language="C#" AutoEventWireup="true" Inherits="CoronaryHeartDiseaseProject.Admin.SuperManage.AddAdmin" %>

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
    <form id="myform" runat="server" onsubmit="return checkUser()">
        <table width="100%" border="0" align="center" cellpadding="3" cellspacing="1">
            <tr>
                <td>
                    <table width="100%" border="0" align="center" cellpadding="3" cellspacing="1">
                        <tr>
                            <td height="25" colspan="2">网站导航: &nbsp;<a href="AddAdmin.aspx"><span class="label label-info" >添加管理员</span></a> &nbsp;|&nbsp; <a href="AdminManage.aspx">管理管理员</a>&nbsp; | <a href="AdminCenter.aspx">修改密码</a> 
                        </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
        <table width="100%" border="0" align="center" cellpadding="3" cellspacing="1" class="tableborder">
            <tr class="header">
                <td height="30px" colspan="2">添加管理员&nbsp;
                </td>
            </tr>
            <tr bgcolor="#FFFFFF">
                <td width="32%" height="25">医院：</td>
                <td width="100%" height="25" colspan="2">
                    <asp:DropDownList CssClass="form-control" ID="SelectHosptial" runat="server" Width="250px">
                    </asp:DropDownList>
                </td>
            </tr>
            <tr bgcolor="#FFFFFF">
                <td width="25%" height="25">管理员用户名</td>
                <td width="75%" height="25">
                    <input type="text" class="form-control" name="username" placeholder="用户名" style="width: 250px" />
                </td>
            </tr>
            <tr bgcolor="#FFFFFF">
                <td height="25">管理员密码</td>
                <td height="25">
                    <input type="password" name="newpass" class="form-control" placeholder="密码" style="width: 250px" />
                </td>
            </tr>
            <tr bgcolor="#FFFFFF">
                <td height="25">确认密码</td>
                <td height="25">
                    <input type="password" name="repass" class="form-control" placeholder="确认密码" style="width: 250px">
                </td>
            </tr>
            <tr bgcolor="#FFFFFF">
                <td height="25">&nbsp;
                </td>
                <td height="25">
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
