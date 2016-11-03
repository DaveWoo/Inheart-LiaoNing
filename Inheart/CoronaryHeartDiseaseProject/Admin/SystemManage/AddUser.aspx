<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AddUser.aspx.cs" Inherits="CoronaryHeartDiseaseProject.Admin.AddUser" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <title>修改资料</title>
    <link href="../../Styles/admin.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" language="javascript">
        function check() {
            if (document.myform.username.value == "") {
                alert("用户名不能为空！！");
                return false;
            }

            if (document.myform.username.value.length > 12) {
                alert("用户名不能不能长于12！！");
                return false;
            }

            if (document.myform.newpass.value == "") {
                alert("密码不能为空！！");
                return false;
            }

            if (document.myform.newpass.value.length < 6) {
                alert("密码长度不能小于6位！！");
                return false;
            }

            if (document.myform.repass.value != document.myform.newpass.value) {
                alert("两次密码输入不一样！！");
                return false;
            }

            if (document.myform.newpass.value.length > 12) {
                alert("密码长度不能长于12！！");
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
                        <td height="25" colspan="2">网站导航: &nbsp;<a href="AddUser.aspx"><b>添加新用户</b></a> &nbsp;|&nbsp; <a href="UserManage.aspx">用户管理</a>&nbsp; | <a href="UserCenter.aspx">修改管理员密码 </a>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    <form id="myform" runat="server" onsubmit="return check()">
        <table width="98%%" border="0" align="center" cellpadding="3" cellspacing="1" class="tableborder">
            <tr class="header">
                <td height="25" colspan="2">添加新用户
                </td>
            </tr>
            <tr bgcolor="#FFFFFF">
                <td width="25%" height="25">新用户用名
                </td>
                <td width="75%" height="25">
                    <input type="text" name="username" class="tableWidth" />
                </td>
            </tr>
            <tr bgcolor="#FFFFFF">
                <td height="25">用户密码
                </td>
                <td height="25">
                    <input type="password" name="newpass" class="tableWidth" />
                </td>
            </tr>
            <tr bgcolor="#FFFFFF">
                <td height="25">确认密码
                </td>
                <td height="25">
                    <input type="password" name="repass" class="tableWidth" />
                </td>
            </tr>
            <tr bgcolor="#FFFFFF">
                <td height="25">&nbsp;
                </td>
                <td height="25">
                    <input type="submit" value="添加新用户" name="B1" class="Button" id="Submit2" onserverclick="Submit1_ServerClick"
                        runat="server" onclick="return Submit2_onclick()" />
                    <input type="reset" name="Submit2" value="重置" />
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
