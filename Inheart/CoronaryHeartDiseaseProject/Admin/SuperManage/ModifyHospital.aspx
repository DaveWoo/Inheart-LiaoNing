<%@ Page Language="C#" AutoEventWireup="true" Inherits="CoronaryHeartDiseaseProject.Admin.SuperManage.ModifyHospital" %>

<%@ Register Src="../inc/IsSuperAdmin.ascx" TagName="IsSuperAdmin" TagPrefix="uc1" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link rel="stylesheet" href="../../Styles/admin.css" />
    <link rel="stylesheet" href="/Content/bootstrap.min.css" />
    <script type="text/javascript" src="/Scripts/bootstrap.min.js"></script>
    <script type="text/javascript" src="/Scripts/jquery-1.9.1.min.js"></script>
    <script type="text/javascript" src="/Scripts/check.js"></script>
    <title>管理医院</title>
</head>
<body>
    <form id="myform" runat="server" onsubmit="return checkHospitalName()">
        <table width="100%" border="0" align="center" cellpadding="3" cellspacing="1" class="tableborder">
            <tr class="header">
                <td height="30px" colspan="2">管理医院&nbsp;</td>
            </tr>
            <tr bgcolor="#FFFFFF">
                <td width="25%" height="25">医院名称</td>
                <td width="75%" height="25">
                    <input type="text" class="form-control" name="hospitalname" size="35" value="<%=hospitalNameOriginal %>" />
                </td>
            </tr>
            <tr bgcolor="#FFFFFF">
                <td height="25">备注</td>
                <td height="25">
                    <input type="text" class="form-control" name="comment" size="35" value="<%=comment %>" />
                </td>
            </tr>
            <tr bgcolor="#FFFFFF">
                <td height="25">&nbsp;
                </td>
                <td height="25">
                    <input type="submit" value="修改" name="B1" class="Button" id="Submit2" onserverclick="Submit1_ServerClick"
                        runat="server" />
                    <input type="reset" name="Submit2" value="重置" />
                </td>
            </tr>
        </table>
        <br />
        <br />
        <br />
        <%--    <uc1:session ID="Session1" runat="server" />
    <uc2:IsAdmin ID="IsAdmin1" runat="server" />--%>
        <uc1:IsSuperAdmin ID="IsSuperAdmin1" runat="server" />
    </form>
</body>
</html>
