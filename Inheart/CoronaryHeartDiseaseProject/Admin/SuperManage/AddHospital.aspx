<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddHospital.aspx.cs" Inherits="CoronaryHeartDiseaseProject.Admin.SuperManage.AddHospital" %>

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
        }
    </script>
    <script type="text/javascript" language="javascript">
        function check() {
            if (document.myform.hospitalname.value.trim() == "") {
                alert("医院名称名不能为空！！");
                return false;
            }

            if (document.myform.hospitalname.value.length > 16) {
                alert("医院名称长度不能长于16个汉字或者字符！！");
                return false;
            }
            if (document.myform.comment.value.trim() == "") {
                alert("备注不能为空！！");
                return false;
            }
            if (document.myform.comment.value.length > 32) {
                alert("备注长度不能长于32个汉字！！");
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
                        <td height="25" colspan="2">网站导航: &nbsp;<a href="AddHospital.aspx"><b>添加医院</b></a> &nbsp;|&nbsp; <a href="AdminManageHospital.aspx">管理医院</a>&nbsp; |
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    <form id="myform" runat="server" onsubmit="return check()">
        <table width="98%%" border="0" align="center" cellpadding="5" cellspacing="1" class="tableborder">
            <tr class="header">
                <td height="25" colspan="2">添加医院&nbsp;
                </td>
            </tr>
            <tr bgcolor="#FFFFFF">
                <td width="25%" height="25">所在地区
                </td>
                <td width="75%" height="25">
                    <asp:DropDownList ID="Region" runat="server" Height="19px" Width="250px" />
                </td>
            </tr>
            <tr bgcolor="#FFFFFF">
                <td width="25%" height="25">医院名称
                </td>
                <td height="25" colspan="2">
                    <input type="text" name="hospitalname" style="width: 250px" />
                </td>
            </tr>
            <tr bgcolor="#FFFFFF">
                <td height="25">备注
                </td>
                <td height="25">
                    <input type="text" name="comment" style="width: 250px" />
                </td>
            </tr>
            <tr bgcolor="#FFFFFF">
                <td height="25">&nbsp;
                </td>
                <td height="25">
                    <input type="submit" value="添加" name="B1" class="Button" id="Submit2" onserverclick="Submit1_ServerClick" style="width: 100px;"
                        runat="server" />
                    <input type="reset" name="Submit2" value="重置" style="width: 100px;" onclick="return Submit2_onclick()" />
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
