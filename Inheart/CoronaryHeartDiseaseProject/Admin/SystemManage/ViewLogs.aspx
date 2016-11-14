<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ViewLogs.aspx.cs" Inherits="CoronaryHeartDiseaseProject.Admin.ViewLogs" %>

<!DOCTYPE html>
<html>
<head>
    <%--设置编码--%>
    <meta charset="utf-8" />
    <%--页面首次由浏览器加载时的初始缩放级别。--%>
    <meta name="viewport" content="width=device-width, initial-scale=1" />

    <%--管理页面相关的样式--%>
    <link rel="stylesheet" href="/Styles/admin.css" />
    <link rel="stylesheet" href="/Styles/main.css" />

    <%--引用bootstrap和相关的Jquery--%>
    <link rel="stylesheet" href="/Content/bootstrap.min.css" />
    <script type="text/javascript" src="/Scripts/jquery-1.9.1.min.js"></script>
    <script type="text/javascript" src="/Scripts/bootstrap.min.js"></script>

    <title>修改资料</title>
</head>
<body>
    <form id="myform" runat="server" onsubmit="return confirm('确认要执行此操作？');">
        <asp:Label ID="Label1" runat="server"></asp:Label>&nbsp;   
       
        <asp:DataList ID="DataListUserLog" runat="server" Width="100%">
            <HeaderTemplate>
                <table width="100%" border="0" align="left" cellpadding="3" cellspacing="1" class="tableborder">
                    <tr class="header">
                        <td width="10%" class="tableTDCell">医院</td>
                        <td width="10%" class="tableTDCell">用户ID</td>
                        <td width="10%" class="tableTDCell">登录时间</td>
                    </tr>
                </table>
            </HeaderTemplate>
            <ItemTemplate>
                <table width="100%" border="1" align="center" cellpadding="3" cellspacing="1" class="tableborder">
                    <tr bgcolor="#ffffff" id="news<%#Eval("LogID") %>">
                        <td width="10%" class="tableTDCell">
                            <%#ShowHospitalName(Eval("HospitalID").ToString())%> 
                        </td>
                        <td width="10%" class="tableTDCell">
                            <%#ShowUserName(Eval("UserID").ToString())%>
                        </td>
                        <td width="10%" class="tableTDCell">
                            <%#Eval("LoginDate")%>
                        </td>
                    </tr>
                </table>
            </ItemTemplate>
        </asp:DataList>
    </form>
</body>
</html>
