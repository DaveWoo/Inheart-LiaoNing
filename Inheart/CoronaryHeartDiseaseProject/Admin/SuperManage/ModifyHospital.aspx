<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ModifyHospital.aspx.cs" Inherits="CoronaryHeartDiseaseProject.Admin.SuperManage.ModifyHospital" %>

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
            if (document.myform.hospitalname.value.trim() == "") {
                alert("医院名称名不能为空！！");
                return false;
            }
            if (document.myform.comment.value.trim() == "") {
                alert("备注不能为空！！");
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
                        <td height="25" colspan="2">网站导航: &nbsp;<a href="AddAdmin.aspx">添加医院</a> &nbsp;|&nbsp; <a href="AddHospital.aspx">管理医院</a>&nbsp; |
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    <form id="myform" runat="server" onsubmit="return check()">
        <table width="98%%" border="0" align="center" cellpadding="3" cellspacing="1" class="tableborder">
            <tr class="header">
                <td height="25" colspan="2">管理医院&nbsp;
                </td>
            </tr>
            <tr bgcolor="#FFFFFF">
                <td width="25%" height="25">医院名称
                </td>
                <td width="75%" height="25">
                    <input type="text" name="hospitalname" size="35" value="<%=hospitalNameOriginal %>" />
                </td>
            </tr>
            <tr bgcolor="#FFFFFF">
                <td height="25">备注
                </td>
                <td height="25">
                    <input type="text" name="comment" size="35" value="<%=comment %>" />
                </td>
            </tr>
            <tr bgcolor="#FFFFFF">
                <td height="25">&nbsp;
                </td>
                <td height="25">
                    <input type="submit" value="修改" name="B1" class="Button" id="Submit2" onserverclick="Submit1_ServerClick"
                        runat="server" />
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
