<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminManage.aspx.cs" Inherits="CoronaryHeartDiseaseProject.Admin.SuperManage.AdminManage" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <title>�޸�����</title>
    <link href="../../Styles/admin.css" rel="stylesheet" type="text/css" />
    <style>
        body {
            word-break: break-all;
            word-wrap: break-word;
        }
    </style>
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
    <table width="100%" border="0" align="center" cellpadding="3" cellspacing="1">
        <tr>
            <td>
                <table width="98%%" border="0" align="center" cellpadding="3" cellspacing="1">
                    <tr>
                        <td height="25" colspan="2">��վ����: &nbsp;<a href="AddAdmin.aspx">��ӹ���Ա</a> &nbsp;|&nbsp; <a href="AdminManage.aspx">
                            <b>�������Ա</b></a>&nbsp; | <a href="AdminCenter.aspx">�޸�����</a> |
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    <form id="Form1" name="listform" runat="server" onsubmit="return confirm('ȷ��Ҫִ�д˲�����');">
        <asp:Label ID="Label1" runat="server"></asp:Label>&nbsp;
    <asp:DataList ID="DataListUser" runat="server" Width="100%">
        <HeaderTemplate>
            <table width="100%" border="0" align="left" cellpadding="1" cellspacing="1" class="tableborder">
                <tr class="header">
                    <%--     <td width="10%" height="25">
                        <div align="center">
                            ID</div>
                    </td>--%>
                    <%--        <td width="15%" height="25">
                        <div align="center">
                            ����Ա�û���</div>
                    </td>--%>
                    <td width="100" height="25">
                        <div align="center">
                            ����ԱID
                        </div>
                    </td>
                    <td width="200" height="25">
                        <div align="center">
                            ����ҽԺ
                        </div>
                    </td>
                    <td width="150" height="25">
                        <div align="center">
                            ��������
                        </div>
                    </td>
                    <td width="150" height="25">
                        <div align="center">
                            ����
                        </div>
                    </td>
                </tr>
            </table>
        </HeaderTemplate>
        <ItemTemplate>
            <table width="100%" border="0" align="left" cellpadding="1" cellspacing="1" class="tableborder">
                <tr bgcolor="#ffffff" id="news<%#Eval("ID") %>">
                    <%--    <td height="25" width="10%">
                        <div align="center">
                            <%#Eval("OrderID")%>
                        </div>
                    </td>--%>
                    <td height="25" width="100">
                        <div align="center">
                            <%#Eval("UserName")%>
                        </div>
                    </td>
                    <%--           <td height="25" width="15%">
                        <div align="center">
                            ��ͨ����Ա
                        </div>
                    </td>--%>
                    <td height="25" width="200">
                        <div align="center">
                            <%#Eval("Hospital.HospitalName")%>
                        </div>
                    </td>
                    <td height="25" width="150">
                        <div align="center">
                            <%#ShowRegionName(Eval("Hospital.RegionID").ToString())%>
                        </div>
                    </td>
                    <td height="25" width="150">
                        <div align="center">
                            <%#ShowTxt(Eval("ID").ToString())%>
                        </div>
                    </td>
                </tr>
            </table>
        </ItemTemplate>
        <FooterTemplate>
            <table width="100%" border="0" align="left" cellpadding="3" cellspacing="1" class="tableborder">
                <tr bgcolor="#ffffff">
                    <td height="25" colspan="4">
                        <div align="right">
                            <%--   <input type="submit" name="Submit3" value="����ѡ����Աɾ��" id="Submit1" onserverclick="Submit1_ServerClick"
                                runat="server" />--%>
                            &nbsp;&nbsp;
                            <input type="button" name="Submit822" value="��ӹ���Ա" onclick="javascript: window.location = 'AddAdmin.aspx';">&nbsp;
                            <%--   <input type="checkbox" name="chkall" value="on" onclick="CheckAll(this.form)">ѡ��ȫ�� --%>
                        </div>
                    </td>
                </tr>
            </table>
        </FooterTemplate>
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
        <table width="100%" border="0" cellpadding="0" cellspacing="0">
            <tr bgcolor="#ffffff">
                <td height="25" colspan="4">��ע��<span style="color: #ff0000"> 1.��ѡ�򱳾�ɫΪ��ɫ������ѡ����Ϣ,���в�����Ϊ���ɻָ����ڲ���ʱ�����Ա���ء�<br />
                    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                    <!--2.�������վ�����¿��Իָ�,��ջ���վ���³���ɾ����-->
                    <br />
                </span>
                </td>
            </tr>
        </table>
    </form>
    <%#Eval("ID")%>
</body>
</html>
