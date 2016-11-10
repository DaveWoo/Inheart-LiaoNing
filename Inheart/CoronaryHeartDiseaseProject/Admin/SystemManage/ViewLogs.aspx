<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ViewLogs.aspx.cs" Inherits="CoronaryHeartDiseaseProject.Admin.ViewLogs" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>修改资料</title>
    <link rel="stylesheet" href="../../Styles/admin.css" />
    <link rel="stylesheet" href="/Content/bootstrap.min.css" />
    <script type="text/javascript" src="/Scripts/bootstrap.min.js"></script>
    <script type="text/javascript" src="/Scripts/jquery-1.9.1.min.js"></script>
</head>
<body>
    <form id="myform" runat="server" onsubmit="return confirm('确认要执行此操作？');">
        <table width="100%" border="0" align="center" cellpadding="3" cellspacing="1">
            <tr>
                <td>
                    <table width="100%" border="0" align="center" cellpadding="3" cellspacing="1" style="border: 0">
                        <tr>
                            <td height="25" colspan="2">网站导航: &nbsp;<a href="MessageManageAdmin.aspx">病例管理</a> &nbsp;|&nbsp; <a href="ViewLogs.aspx"><span class="label label-info">查看日志</span></a>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
        <asp:Label ID="Label1" runat="server"></asp:Label>&nbsp;   
        <asp:DataList ID="DataListUserLog" runat="server" Width="100%">
            <HeaderTemplate>
                <table width="100%" border="0" align="left" cellpadding="3" cellspacing="1" class="tableborder">
                    <tr class="header">
                        <td width="10%" height="25">
                            <div align="left">医院</div>
                        </td>
                        <td width="10%" height="25">
                            <div align="left">用户ID</div>
                        </td>
                        <td width="10%" height="25">
                            <div align="left">登录时间</div>
                        </td>
                    </tr>
                </table>
            </HeaderTemplate>
            <ItemTemplate>
                <table width="100%" border="0" align="center" cellpadding="3" cellspacing="1" class="tableborder">
                    <tr bgcolor="#ffffff" id="news<%#Eval("LogID") %>">
                        <td height="25" width="10%">
                            <div align="left">
                                <%#ShowHospitalName(Eval("HospitalID").ToString())%>
                            </div>
                        </td>
                        <td height="25" width="10%">
                            <div align="left">
                                <%#ShowUserName(Eval("UserID").ToString())%>
                            </div>
                        </td>
                        <td height="25" width="10%">
                            <div align="left">
                                <%#Eval("LoginDate")%>
                            </div>
                        </td>
                    </tr>
                </table>
            </ItemTemplate>
        </asp:DataList>
    </form>
</body>
</html>
