<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AdminCenter.aspx.cs" Inherits="CoronaryHeartDiseaseProject.Admin.SuperManage.AdminCenter" %>

<%--<%@ Register Src="../inc/session.ascx" TagName="session" TagPrefix="uc1" %>--%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <title>�޸�����</title>
    <link href="../../Styles/admin.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" language="javascript">
        function check() {
            if (document.myform.oldpass.value == "") {
                alert("ԭ���벻��Ϊ�գ���");
                return false;
            }
            if (document.myform.newpass.value.length < 7) {
                alert("���볤�Ȳ���С��6λ����");
                return false;
            }
            if (document.myform.newpass.value == "") {
                alert("�����벻��Ϊ�գ���");
                return false;
            }
            if (document.myform.repass.value != document.myform.newpass.value) {
                alert("�����������벻һ������");
                return false;
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
                        <td height="25" colspan="2">
                            ��վ����: &nbsp;<a href="AddAdmin.aspx">��ӹ���Ա</a> &nbsp;|&nbsp; <a href="AdminManage.aspx">
                                �������Ա</a>&nbsp; | <a href="AdminCenter.aspx"><b>�޸�����</b></a> |
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    <form id="myform" runat="server" onsubmit="return check()">
    <table width="98%%" border="0" align="center" cellpadding="3" cellspacing="1" class="tableborder">
        <tr class="header">
            <td height="25" colspan="2">
                �޸ĳ�������Ա����&nbsp;
            </td>
        </tr>
        <tr bgcolor="#FFFFFF">
            <td width="25%" height="25">
                ԭ����
            </td>
            <td width="75%" height="25">
                <input type="password" name="oldpass" style="width:250px" />
            </td>
        </tr>
        <tr bgcolor="#FFFFFF">
            <td height="25">
                ������
            </td>
            <td height="25">
                <input type="password" name="newpass" style="width:250px" />
            </td>
        </tr>
        <tr bgcolor="#FFFFFF">
            <td height="25">
                ȷ������
            </td>
            <td height="25">
                <input type="password" name="repass" style="width:250px"/>
            </td>
        </tr>
        <tr bgcolor="#FFFFFF">
            <td height="25">
                &nbsp;
            </td>
            <td height="25">
                <input type="submit" value="��������" name="B1" class="Button" id="Submit2" onserverclick="Submit1_SavePassword_ServerClick"
                    runat="server">
                <input type="reset" name="Submit2" value="����">
            </td>
        </tr>
    </table>
    </form>
    <%--<uc1:session ID="Session1" runat="server" />--%>
</body>
</html>