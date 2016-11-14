<%@ Page Language="C#" AutoEventWireup="true" Inherits="CoronaryHeartDiseaseProject.Admin.SuperManage.AdminManage" %>

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

    <title>修改资料</title>
</head>
<body>
    <form id="myform" name="listform" runat="server" onsubmit="return confirm('确认要执行此操作？');">
        <asp:Label ID="Label1" runat="server"></asp:Label>&nbsp;          
        <asp:DataList ID="DataListUser" runat="server" Width="100%">
            <HeaderTemplate>
                <table width="100%" border="1" align="left" cellpadding="1" cellspacing="1" class="tableborder">
                    <tr class="header">
                        <td class="c1">管理员ID</td>
                        <td class="c2">所属医院</td>
                        <td  class="c3">所属地区</td>
                        <td  class="c4">操作</td>
                    </tr>
                </table>
            </HeaderTemplate>
            <ItemTemplate>
                <table width="100%" border="1" align="left" cellpadding="1" cellspacing="1" class="tableborder">
                    <tr bgcolor="#ffffff" id="news<%#Eval("ID") %>">
                        <td class="c1">
                                <%#Eval("UserName")%>
                        </td>
                        <td class="c2">
                                <%#Eval("Hospital.HospitalName")%>
                        </td>
                        <td class="c3">
                                <%#ShowRegionName(Eval("Hospital.RegionID").ToString())%>
                        </td>
                        <td class="c4"">
                                <%#ShowTxt(Eval("ID").ToString())%>
                        </td>
                    </tr>
                </table>
            </ItemTemplate>
            <FooterTemplate>
                <table width="100%" border="0" align="left" cellpadding="3" cellspacing="1" class="tableborder">
                    <tr bgcolor="#ffffff">
                        <td  colspan="4">
                            <div align="left">
                                <input type="button" class="btn btn-info widthButton" name="Submit822" value="添加管理员" onclick="javascript: window.location = 'AddAdmin.aspx';">&nbsp;
                            </div>
                        </td>
                    </tr>
                </table>
            </FooterTemplate>
        </asp:DataList>
        <table width="100%" border="0" align="center" cellpadding="3" cellspacing="1" class="tableborder">
            <tr bgcolor="#ffffff">
                <td  colspan="4">
                    <div align="left">
                        &nbsp;&nbsp;
                    </div>
                </td>
            </tr>
        </table>
        <table width="100%" border="0" cellpadding="0" cellspacing="0">
            <tr bgcolor="#ffffff">
                <td  colspan="4">备注：<span style="color: #ff0000"> 1.多选框背景色为蓝色代表已选中信息,所有操作均为不可恢复，在操作时请管理员慎重。<br />
                    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;   
                    <br />
                </span>
                </td>
            </tr>
        </table>
    </form>
    <uc1:IsSuperAdmin ID="IsSuperAdmin1" runat="server" />
</body>
</html>
