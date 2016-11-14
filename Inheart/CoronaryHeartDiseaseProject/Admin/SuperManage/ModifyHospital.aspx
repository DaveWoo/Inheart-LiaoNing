<%@ Page Language="C#" AutoEventWireup="true" Inherits="CoronaryHeartDiseaseProject.Admin.SuperManage.ModifyHospital" %>

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

    <title>管理医院</title>
</head>
<body>
    <form id="myform" runat="server" onsubmit="return checkHospitalName()">
        <table width="100%" border="0" align="center" cellpadding="3" cellspacing="1" class="table-bordered"">
            <tr class="header">
                <td colspan="2" class="tableTDCell">修改医院&nbsp;</td>
            </tr>
            <tr>
                <td width="25%" class="tableTDCell">医院名称</td>
                <td width="75%">
                    <input type="text" class="form-control" name="hospitalname" size="35" value="<%=hospitalNameOriginal %>" />
                </td>
            </tr>
            <tr>
                <td class="tableTDCell">备注</td>
                <td>
                    <input type="text" class="form-control" name="comment" size="35" value="<%=comment %>" />
                </td>
            </tr>
            <tr>
                <td>&nbsp;
                </td>
                <td>
                    <input type="submit" value="修改" name="B1" class="btn btn-info" id="Submit2" onserverclick="Submit1_ServerClick"
                        runat="server" />
                    <input type="reset" name="Submit2" class="btn btn-info"  value="重置" />
                </td>
            </tr>
        </table>
        <uc1:IsSuperAdmin ID="IsSuperAdmin1" runat="server" />
    </form>
</body>
</html>
