<%@ Page Language="C#" AutoEventWireup="true" Inherits="CoronaryHeartDiseaseProject.UserCenter" %>

<%@ Register src="Admin/inc/User.ascx" tagname="User" tagprefix="uc1" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <link rel="stylesheet" href="/Content/bootstrap.min.css" />
    <script type="text/javascript" src="/Scripts/bootstrap.min.js"></script>
    <script type="text/javascript" src="/Scripts/jquery-1.9.1.min.js"></script>
    <title>�޸�����</title>
    <link href="../../Styles/admin.css" rel="stylesheet" type="text/css" />
    <%--������֤--%>
    <script type="text/javascript" language="javascript">
        function check() {
            if (document.myform.oldpass.value == "") {
                alert("ԭ���벻��Ϊ�գ���");
                return false;
            }
            if (document.myform.newpass.value.length < 6) {
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
        function Submit2_onclick() {

        }

    </script>
</head>
<body>
    <form id="myform" runat="server" onsubmit="return check()">
        <table width="98%%" border="0" align="center" cellpadding="3" cellspacing="1" class="tableborder">
            <tr class="header">
                <td height="25" colspan="2">�޸�����&nbsp;
                </td>
            </tr>
            <tr bgcolor="#FFFFFF">
                <td width="25%" height="25">ԭ����</td>
                <td width="75%" height="25">
                    <input type="password" class="form-control" placeholder="������ԭ����" name="oldpass" size="35">
                </td>
            </tr>
            <tr bgcolor="#FFFFFF">
                <td height="25">������</td>
                <td height="25">
                    <input type="password" class="form-control" placeholder="����������" name="newpass" size="35" />
                </td>
            </tr>
            <tr bgcolor="#FFFFFF">
                <td height="25">ȷ������</td>
                <td height="25">
                    <input type="password"  class="form-control" placeholder="�����ٴ���������" name="repass" size="35">
                </td>
            </tr>
            <tr bgcolor="#FFFFFF">
                <td height="25">&nbsp;
                </td>
                <td height="25">
                    <input type="submit" value="��������" name="B1" class="btn btn-info" id="Submit2" onserverclick="Submit1_ServerClick"
                        runat="server" onclick="return Submit2_onclick()">
                    <input type="reset" name="Submit2" class="btn btn-info" value="����">
                </td>
            </tr>
        </table>
        <uc1:User ID="User1" runat="server" />
    </form>
</body>
</html>
