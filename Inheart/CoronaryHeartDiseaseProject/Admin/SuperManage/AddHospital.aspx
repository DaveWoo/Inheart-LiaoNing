<%@ Page Language="C#" AutoEventWireup="true" Inherits="CoronaryHeartDiseaseProject.Admin.SuperManage.AddHospital" %>

<%@ Register Src="../inc/IsSuperAdmin.ascx" TagName="IsSuperAdmin" TagPrefix="uc1" %>

<!DOCTYPE html>
<html>
<head>
    <%--设置编码--%>
    <meta charset="utf-8" />
    <%--页面首次由浏览器加载时的初始缩放级别。--%>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />

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
    <form id="myform" runat="server" onsubmit="return checkHospital()">
        <table width="100%" border="0" align="center" class="table-bordered">
            <tr>
                <td class="header" colspan="2">添加医院&nbsp;
                </td>
            </tr>
            <tr>
                <td width="25%" class="tableTDCell">所在地区</td>
                <td width="75%">
                    <asp:DropDownList ID="Region" runat="server" CssClass="form-control" Width="200px" />
                </td>
            </tr>
            <tr>
                <td width="25%" class="tableTDCell">医院名称</td>
                <td colspan="2">
                    <input type="text" name="hospitalname" class="form-control" placeholder="请输入医院名称" style="width: 200px" />
                </td>
            </tr>
            <tr>
                <td class="tableTDCell">备注</td>
                <td>
                    <input type="text" name="comment" class="form-control" placeholder="医院备注" style="width: 200px" />
                </td>
            </tr>
            <tr>
                <td>&nbsp;
                </td>
                <td>
                    <input type="submit" value="添加" name="B1" class="btn btn-info" id="Submit2" onserverclick="Submit1_ServerClick" style="width: 98px;"
                        runat="server" />
                    <input type="reset" name="Submit2" value="重置" class="btn btn-info" style="width: 98px;" onclick="return Submit2_onclick()" />
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
