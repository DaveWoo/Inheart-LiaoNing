<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ViewLogs.aspx.cs" Inherits="CoronaryHeartDiseaseProject.Admin.ViewLogs" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <title>修改资料</title>
    <link href="../../Styles/admin.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" language="javascript">
        function CheckAll(form) {
            for (var i = 0; i < form.elements.length; i++) {
                var e = form.elements[i];
                if (e.name != 'chkall')
                    if (e.disabled == 0) {
                        e.checked = form.chkall.checked;
                    }
            }
        }
    </script>
</head>
<body>
    <form id="Form1" name="listform" runat="server" onsubmit="return confirm('确认要执行此操作？');">
        <asp:Label ID="Label1" runat="server"></asp:Label>&nbsp;
    <asp:DataList ID="DataListUserLog" runat="server" Width="100%">
        <HeaderTemplate>
            <table width="100%" border="0" align="center" cellpadding="3" cellspacing="1" class="tableborder">
                <tr class="header">
                    <td width="10%" height="25">
                        <div align="center">
                            医院
                        </div>
                    </td>
                    <td width="10%" height="25">
                        <div align="left">
                            用户ID
                        </div>
                    </td>
                    <td width="10%" height="25">
                        <div align="center">
                            登录时间
                        </div>
                    </td>
                </tr>
            </table>
        </HeaderTemplate>
        <ItemTemplate>
            <table width="100%" border="0" align="center" cellpadding="3" cellspacing="1" class="tableborder">
                <tr bgcolor="#ffffff" id="news<%#Eval("LogID") %>">
                    <td height="25" width="10%">
                        <div align="center">
                            <%#ShowHospitalName(Eval("HospitalID").ToString())%>
                        </div>
                    </td>
                    <td height="25" width="10%">
                        <div align="left">
                            <%#ShowUserName(Eval("UserID").ToString())%>
                        </div>
                    </td>
                    <td height="25" width="10%">
                        <div align="center">
                            <%#Eval("LoginDate")%>
                        </div>
                    </td>
                </tr>
            </table>
        </ItemTemplate>
    </asp:DataList>
        <table width="100%" border="0" align="center" cellpadding="3" cellspacing="1" class="tableborder">
            <tr bgcolor="#ffffff">
                <td height="25" colspan="4">
                    <div align="left">
                        &nbsp;&nbsp;
                    </div>
                </td>
            </tr>
        </table>
    </form>
    <%#Eval("OrderID")%>
</body>
</html>
