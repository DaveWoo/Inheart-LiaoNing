<%@ Page Language="C#" AutoEventWireup="true" Inherits="CoronaryHeartDiseaseProject.Admin.SuperManage.AddHospital" %>

<%@ Register Src="../inc/IsSuperAdmin.ascx" TagName="IsSuperAdmin" TagPrefix="uc1" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
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
                        <td height="25" colspan="2">网站导航: &nbsp;<a href="AddHospital.aspx"><b>添加医院</b></a> &nbsp;|&nbsp; <a href="AdminManageHospital.aspx">管理医院</a>&nbsp; |
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    <form id="myform" runat="server" onsubmit="return checkHospital()">
        <table width="98%%" border="0" align="center" cellpadding="5" cellspacing="1" class="tableborder">
            <tr class="header">
                <td height="25" colspan="2">添加医院&nbsp;
                </td>
            </tr>
            <tr bgcolor="#FFFFFF">
                <td width="25%" height="25">所在地区</td>
                <td width="75%" height="25">
                    <asp:DropDownList ID="Region" runat="server" CssClass="form-control" Width="250px" />
                </td>
            </tr>
            <tr bgcolor="#FFFFFF">
                <td width="25%" height="25">医院名称</td>
                <td height="25" colspan="2">
                    <input type="text" name="hospitalname" class="form-control" placeholder="请输入医院名称" style="width: 250px" />
                </td>
            </tr>
            <tr bgcolor="#FFFFFF">
                <td height="25">备注</td>
                <td height="25">
                    <input type="text" name="comment" class="form-control" placeholder="医院备注" style="width: 250px" />
                </td>
            </tr>
            <tr bgcolor="#FFFFFF">
                <td height="25">&nbsp;
                </td>
                <td height="25">
                    <input type="submit" value="添加" name="B1" class="btn btn-info" id="Submit2" onserverclick="Submit1_ServerClick" style="width: 100px;"
                        runat="server" />
                    <input type="reset" name="Submit2" value="重置" class="btn btn-info" style="width: 100px;" onclick="return Submit2_onclick()" />
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
