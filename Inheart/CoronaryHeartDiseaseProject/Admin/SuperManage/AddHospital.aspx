<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddHospital.aspx.cs" Inherits="CoronaryHeartDiseaseProject.Admin.SuperManage.AddHospital" %>

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
        }
    </script>
    <script type="text/javascript" language="javascript">
        function check() {
            if (document.myform.hospitalname.value.trim() == "") {
                alert("ҽԺ����������Ϊ�գ���");
                return false;
            }

            if (document.myform.hospitalname.value.length > 16) {
                alert("ҽԺ���Ƴ��Ȳ��ܳ���16�����ֻ����ַ�����");
                return false;
            }
            if (document.myform.comment.value.trim() == "") {
                alert("��ע����Ϊ�գ���");
                return false;
            }
            if (document.myform.comment.value.length > 32) {
                alert("��ע���Ȳ��ܳ���32�����֣���");
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
                        <td height="25" colspan="2">
                            ��վ����: &nbsp;<a href="AddHospital.aspx"><b>���ҽԺ</b></a> &nbsp;|&nbsp; <a href="AdminManageHospital.aspx">
                                ����ҽԺ</a>&nbsp; |
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    <form id="myform" runat="server" onsubmit="return check()">
    <table width="98%%" border="0" align="center" cellpadding="5" cellspacing="1" class="tableborder">
        <tr class="header">
            <td height="25" colspan="2">
                ���ҽԺ&nbsp;
            </td>
        </tr>
        <tr bgcolor="#FFFFFF">
            <td width="25%" height="25">
                ���ڵ���
            </td>
            <td width="75%" height="25">
                <asp:DropDownList ID="Region" runat="server" Height="19px" Width="250px" />
            </td>
        </tr>
        <tr bgcolor="#FFFFFF">
            <td width="25%" height="25">
                ҽԺ����
            </td>
            <td height="25" colspan="2">
                <input type="text" name="hospitalname" style="width: 250px" />
            </td>
        </tr>
        <tr bgcolor="#FFFFFF">
            <td height="25">
                ��ע
            </td>
            <td height="25">
                <input type="text" name="comment" style="width:250px"/>
            </td>
        </tr>
        <tr bgcolor="#FFFFFF">
            <td height="25">
                &nbsp;
            </td>
            <td height="25">
                <input type="submit" value="���" name="B1" class="Button" id="Submit2" onserverclick="Submit1_ServerClick" style="width:100px;"
                    runat="server" />
                <input type="reset" name="Submit2" value="����" style="width:100px;" onclick="return Submit2_onclick()" />
            </td>
        </tr>
    </table>
    <br />
    <br />
    <br />
    </form>
    <%--    <uc1:session ID="Session1" runat="server" />
    <uc2:IsAdmin ID="IsAdmin1" runat="server" />--%>
</body>
</html>
