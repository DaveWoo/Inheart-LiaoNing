<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AddAdmin.aspx.cs" Inherits="CoronaryHeartDiseaseProject.Admin.SuperManage.AddAdmin" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <title>�޸�����</title>
    <link href="../../Styles/admin.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" language="javascript">
        function check() {
            if (document.myform.username.value == "") {
                alert("�û�������Ϊ�գ���");
                return false;
            }

            if (document.myform.username.value.length > 12) {
                alert("�û������ܲ��ܳ���12����");
                return false;
            }

            if (document.myform.newpass.value == "") {
                alert("���벻��Ϊ�գ���");
                return false;
            }

            if (document.myform.newpass.value.length < 6) {
                alert("���볤�Ȳ���С��6λ����");
                return false;
            }

            if (document.myform.repass.value != document.myform.newpass.value) {
                alert("�����������벻һ������");
                return false;
            }

            if (document.myform.newpass.value.length > 11) {
                alert("���볤�Ȳ��ܳ���12����");
                return false;
            }
        }

        function Submit2_onclick() {

        }

    </script>
</head>
<body>
    <table width="100%" border="0" align="center" cellpadding="3" cellspacing="1">
        <tr>
            <td>
                <table width="98%%" border="0" align="center" cellpadding="3" cellspacing="1">
                    <tr>
                        <td height="25" colspan="2">��վ����: &nbsp;<a href="AddAdmin.aspx"><b>��ӹ���Ա</b></a> &nbsp;|&nbsp; <a href="AdminManage.aspx">�������Ա</a>&nbsp; | <a href="AdminCenter.aspx">�޸�����</a> |
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    <form id="myform" runat="server" onsubmit="return check()">
        <table width="98%%" border="0" align="center" cellpadding="3" cellspacing="1" class="tableborder">
            <tr class="header">
                <td height="25" colspan="2">��ӹ���Ա&nbsp;
                </td>
            </tr>
            <tr bgcolor="#FFFFFF">
                <td width="32%" height="25">ҽԺ��
                </td>
                <td width="100%" height="25" colspan="2">
                    <asp:DropDownList ID="SelectHosptial" runat="server" Width="250px">
                    </asp:DropDownList>
                </td>
            </tr>
            <tr bgcolor="#FFFFFF">
                <td width="25%" height="25">����Ա�û���
                </td>
                <td width="75%" height="25">
                    <input type="text" name="username" style="width: 250px" />
                </td>
            </tr>
            <tr bgcolor="#FFFFFF">
                <td height="25">����Ա����
                </td>
                <td height="25">
                    <input type="password" name="newpass" style="width: 250px" />
                </td>
            </tr>
            <tr bgcolor="#FFFFFF">
                <td height="25">ȷ������
                </td>
                <td height="25">
                    <input type="password" name="repass" style="width: 250px">
                </td>
            </tr>
            <tr bgcolor="#FFFFFF">
                <td height="25">&nbsp;
                </td>
                <td height="25">
                    <input type="submit" value="��ӹ���Ա" name="B1" class="Button" id="Submit2" onserverclick="Submit1_ServerClick"
                        runat="server" onclick="return Submit2_onclick()">
                    <input type="reset" name="Submit2" value="����">
                </td>
            </tr>
        </table>
        <br />
        <br />
        <br />
        <%--    <uc1:session ID="Session1" runat="server" />
    <uc2:IsAdmin ID="IsAdmin1" runat="server" />--%>
    </form>
</body>
</html>
