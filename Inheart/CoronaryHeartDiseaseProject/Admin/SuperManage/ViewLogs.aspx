<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ViewLogs.aspx.cs" Inherits="CoronaryHeartDiseaseProject.Admin.SuperManage.ViewLogs" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <title>�޸�����</title>
    <link href="../../Styles/admin.css" rel="stylesheet" type="text/css" />
    <link rel="stylesheet" href="/Content/bootstrap.min.css" />
    <script type="text/javascript" src="/Scripts/bootstrap.min.js"></script>
    <script type="text/javascript" src="/Scripts/jquery-1.9.1.min.js"></script>
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
    <form id="divbody" name="listform" runat="server" onsubmit="return confirm('ȷ��Ҫִ�д˲�����');">
        <asp:Label ID="Label1" runat="server"></asp:Label>&nbsp;
   
        <asp:DataList ID="DataListUserLog" runat="server" Width="100%">
            <HeaderTemplate>
                <table width="100%" border="0" align="center" cellpadding="3" cellspacing="1" class="tableborder">
                    <tr class="header">
                        <td width="10%" height="25">
                            <div align="left">ҽԺ</div>
                        </td>
                        <td width="10%" height="25">
                            <div align="left">�û�ID</div>
                        </td>
                        <td width="10%" height="25">
                            <div align="left">��¼ʱ��</div>
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
        <table width="100%" border="0" align="center" cellpadding="3" cellspacing="1" class="tableborder">
            <tr bgcolor="#ffffff">
                <td height="25" colspan="4">
                    <div align="left">
                        <input id="btnClear" name="Submit822" type="button" value="������е�½��¼" runat="server"
                            align="left" class="btn btn-info" onserverclick="Clear_Click" />&nbsp;&nbsp;
                   
                    </div>
                </td>
            </tr>
        </table>
    </form>
    <%#Eval("OrderID")%>
</body>
</html>
