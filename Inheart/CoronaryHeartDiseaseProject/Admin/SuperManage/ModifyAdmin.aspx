<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ModifyAdmin.aspx.cs" Inherits="CoronaryHeartDiseaseProject.Admin.SuperManage.ModifyAdmin" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <title>�޸�����</title>
    <link href="../../Styles/admin.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" language="javascript">
        String.prototype.trim = function () {
            return this.replace(/(^\s*)|(\s*$)/g, '');
        }

        String.prototype.ltrim = function () {
            return this.replace(/(^\s*)/g, '');
        }

        String.prototype.rtrim = function () {
            return this.replace(/(\s*$)/g, '');
        }</script>
    <script type="text/javascript" language="javascript">
        function check() {
            if (document.myform.username.value.trim() == "") {
                alert("�û�������Ϊ�գ���");
                return false;
            }

            if (document.myform.username.value.length > 12) {
                alert("�û������ܲ��ܳ���12����");
                return false;
            }

            if (document.myform.newpass.value.length < 6) {
                alert("�������볤��С��6λ");
                return false;
            }
            if (document.myform.newpass.value.trim() != "") {

                if (document.myform.repass.value != document.myform.newpass.value) {
                    alert("�����������벻һ������");
                    return false;
                }
            }

            if (document.myform.newpass.value.length > 11) {
                alert("���볤�Ȳ��ܳ���12����");
                return false;
            }
        }

        function HiddenMenu() {
            document.getElementById("tbl_menu").style.display = "none";
        }

        function ShowMenu() {
            document.getElementById("tbl_menu").style.display = "";
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
                                �������Ա</a>&nbsp; | <a href="AdminCenter.aspx">�޸Ĺ���Ա����</a> |
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
                �޸Ĺ���Ա&nbsp;
                <asp:TextBox ID="TextBox1" runat="server" Width="61px" Visible="false"></asp:TextBox>
            </td>
        </tr>
        <tr bgcolor="#FFFFFF">
            <td width="25%" height="25">
                ����Ա�û���
            </td>
            <td width="75%" height="25">
                <input type="text" name="username" size="35" readonly value="<%=UserName %>" />
            </td>
        </tr>
        <tr bgcolor="#FFFFFF">
            <td height="25">
                ����Ա����
            </td>
            <td height="25">
                <input type="password" name="newpass" size="35" value="" />
            </td>
        </tr>
        <tr bgcolor="#FFFFFF">
            <td height="25">
                ȷ������
            </td>
            <td height="25">
                <input type="password" name="repass" size="35" value="">
            </td>
        </tr>
        <tr bgcolor="#FFFFFF">
            <td height="25">
                &nbsp;
            </td>
            <td height="25">
                <input type="submit" value="�޸Ĺ���Ա" name="B1" class="Button" id="Submit2" onserverclick="Submit1_ServerClick"
                    runat="server" />
                <input type="reset" name="Submit2" value="����" />
            </td>
        </tr>
    </table>
    <br />
    <br />
    </form>
    <%--   <uc1:session ID="Session1" runat="server" />
    <uc2:IsAdmin ID="IsAdmin1" runat="server" />--%>
</body>
</html>