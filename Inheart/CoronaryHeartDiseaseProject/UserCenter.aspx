<%@ Page Language="C#" AutoEventWireup="true" CodeFile="UserCenter.aspx.cs" Inherits="CoronaryHeartDiseaseProject.UserCenter" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <title>修改资料</title>
    <link href="../../Styles/admin.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" language="javascript">
        function check() {
            if (document.myform.oldpass.value == "") {
                alert("原密码不能为空！！");
                return false;
            }
            if (document.myform.newpass.value.length < 6) {
                alert("密码长度不能小于6位！！");
                return false;
            }
            if (document.myform.newpass.value == "") {
                alert("新密码不能为空！！");
                return false;
            }
            if (document.myform.repass.value != document.myform.newpass.value) {
                alert("两次密码输入不一样！！");
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
                <td height="25" colspan="2">修改密码&nbsp;
                </td>
            </tr>
            <tr bgcolor="#FFFFFF">
                <td width="25%" height="25">原密码
                </td>
                <td width="75%" height="25">
                    <input type="password" name="oldpass" size="35">
                </td>
            </tr>
            <tr bgcolor="#FFFFFF">
                <td height="25">新密码
                </td>
                <td height="25">
                    <input type="password" name="newpass" size="35" />
                </td>
            </tr>
            <tr bgcolor="#FFFFFF">
                <td height="25">确认密码
                </td>
                <td height="25">
                    <input type="password" name="repass" size="35">
                </td>
            </tr>
            <tr bgcolor="#FFFFFF">
                <td height="25">&nbsp;
                </td>
                <td height="25">
                    <input type="submit" value="保存密码" name="B1" class="Button" id="Submit2" onserverclick="Submit1_ServerClick"
                        runat="server" onclick="return Submit2_onclick()">
                    <input type="reset" name="Submit2" value="重置">
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
