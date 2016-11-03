<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ModifyAdmin.aspx.cs" Inherits="CoronaryHeartDiseaseProject.Admin.SuperManage.ModifyAdmin" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <title>修改资料</title>
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
                alert("用户名不能为空！！");
                return false;
            }

            if (document.myform.username.value.length > 12) {
                alert("用户名不能不能长于12！！");
                return false;
            }

            if (document.myform.newpass.value.length < 6) {
                alert("您的密码长度小于6位");
                return false;
            }
            if (document.myform.newpass.value.trim() != "") {

                if (document.myform.repass.value != document.myform.newpass.value) {
                    alert("两次密码输入不一样！！");
                    return false;
                }
            }

            if (document.myform.newpass.value.length > 11) {
                alert("密码长度不能长于12！！");
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
                        <td height="25" colspan="2">网站导航: &nbsp;<a href="AddAdmin.aspx">添加管理员</a> &nbsp;|&nbsp; <a href="AdminManage.aspx">管理管理员</a>&nbsp; | <a href="AdminCenter.aspx">修改管理员密码</a> |
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    <form id="myform" runat="server" onsubmit="return check()">
        <table width="98%%" border="0" align="center" cellpadding="3" cellspacing="1" class="tableborder">
            <tr class="header">
                <td height="25" colspan="2">修改管理员&nbsp;
                <asp:TextBox ID="TextBox1" runat="server" Width="61px" Visible="false"></asp:TextBox>
                </td>
            </tr>
            <tr bgcolor="#FFFFFF">
                <td width="25%" height="25">管理员用户名
                </td>
                <td width="75%" height="25">
                    <input type="text" name="username" size="35" readonly value="<%=UserName %>" />
                </td>
            </tr>
            <tr bgcolor="#FFFFFF">
                <td height="25">管理员密码
                </td>
                <td height="25">
                    <input type="password" name="newpass" size="35" value="" />
                </td>
            </tr>
            <tr bgcolor="#FFFFFF">
                <td height="25">确认密码
                </td>
                <td height="25">
                    <input type="password" name="repass" size="35" value="">
                </td>
            </tr>
            <tr bgcolor="#FFFFFF">
                <td height="25">&nbsp;
                </td>
                <td height="25">
                    <input type="submit" value="修改管理员" name="B1" class="Button" id="Submit2" onserverclick="Submit1_ServerClick"
                        runat="server" />
                    <input type="reset" name="Submit2" value="重置" />
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
