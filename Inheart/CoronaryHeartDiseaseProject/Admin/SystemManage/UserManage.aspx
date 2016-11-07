<%@ Page Language="C#" AutoEventWireup="true" Inherits="CoronaryHeartDiseaseProject.Admin.UserManage" %>

<%@ Register src="../inc/IsAdmin.ascx" tagname="IsAdmin" tagprefix="uc1" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>修改资料</title>
    <link rel="stylesheet" href="../../Styles/admin.css" />
    <link rel="stylesheet" href="/Content/bootstrap.min.css"/>
    <script type="text/javascript" src="/Scripts/bootstrap.min.js"></script>
    <script type="text/javascript" src="/Scripts/jquery-1.9.1.min.js"></script>
    <style>
        .co1-1 {
            width: 30%;
        }

        .co1-2 {
            width: 30%;
        }

        .co1-3 {
            width: 30%;
        }

            .co1-3 input {
                width: 30px;
            }

            .co1-3 img {
                width: 12px;
                vertical-align: baseline;
            }
    </style>
    <script type="text/javascript" language="javascript">
        function CheckAll(form) {
            for (var i = 0; i < form.elements.length; i++) {
                var e = form.elements[i];
                if (e.name != 'chkall')
                    if (e.disabled == 0) {
                        e.checked = form.chkall.checked;
                    }
            }
        }
    </script>
</head>
<body>
    <div style="margin-left:10px">
    <table border="0" width="100%" align="center" cellpadding="3" cellspacing="1">
        <tr>
            <td>
                <table width="100%" border="0" align="center" cellpadding="3" cellspacing="1">
                    <tr>
                        <td height="25" colspan="2">网站导航: &nbsp;<a href="AddUser.aspx">添加新用户</a> &nbsp;|&nbsp; <a href="UserManage.aspx">
                            <b>用户管理</b></a>&nbsp; | <a href="UserCenter.aspx">修改管理员密码 </a>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    <form id="Form1" name="listform" runat="server" onsubmit="return confirm('确认要执行此操作？');">
        <table border="0" width="100%" align="center" cellpadding="3" cellspacing="1">
            <tr>
                <td>
                    <asp:Label ID="Label1"  runat="server"></asp:Label>&nbsp;   
                </td>
            </tr>
        </table>
        <asp:DataList ID="DataListUser" runat="server" Width="100%">
            <HeaderTemplate>
                <table width="100%" border="0" align="center" cellpadding="3" cellspacing="1" class="tableborder">
                    <tr class="header">
                        <td class="co1-1">用户ID</td>
                        <td class="co1-2">所属医院</td>
                        <td class="co1-3">操作</td>
                    </tr>
                </table>
            </HeaderTemplate>
            <ItemTemplate>
                <table width="100%" border="0" align="center" cellpadding="3" cellspacing="1" class="tableborder">
                    <tr bgcolor="#ffffff" id="news<%#Eval("ID") %>">
                        <td class="co1-1">
                            <%#Eval("UserName")%>
                        </td>
                        <td class="co1-2">
                            <%#Eval("Hospital.HospitalName")%>
                        </td>
                        <td class="co1-3">
                            <%#ShowTxt(Eval("ID").ToString())%>
                        </td>
                    </tr>
                </table>
            </ItemTemplate>
            <FooterTemplate>
                <table width="100%" border="0" align="center" cellpadding="3" cellspacing="1" class="tableborder">
                    <tr bgcolor="#ffffff">
                        <td height="25" colspan="4">
                            <div align="left">
                                <input type="button" Class="btn btn-info" name="Submit822" value="添加新用户" onclick="javascript: window.location = 'AddUser.aspx';">
                                <input type="submit" Class="btn btn-info" name="Submit3" value="将所选用户删除" id="Submit1" onserverclick="Submit1_ServerClick"
                                    runat="server" style="width: 150px;" />
                            </div>
                        </td>
                    </tr>
                </table>
            </FooterTemplate>
        </asp:DataList>
        <table width="100%" border="0" align="center" cellpadding="3" cellspacing="1" class="tableborder">
            <tr bgcolor="#ffffff">
                <td height="25" colspan="4">
                    <div align="left">
                        &nbsp;&nbsp;
                   
                    </div>
                </td>
            </tr>
        </table>
        <table width="100%" border="0" cellpadding="0" cellspacing="0">
            <tr bgcolor="#ffffff">
                <td height="25" colspan="4">备注：<span style="color: #ff0000"> 1.多选框背景色为蓝色代表已选中信息,所有操作均为不可恢复，在操作时请管理员慎重。<br />
                    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;                   
                    <!--2.放入回收站的文章可以恢复,清空回收站文章彻底删除。-->
                    <br />
                </span>
                    <uc1:IsAdmin ID="IsAdmin1" runat="server" />
                </td>
            </tr>
        </table>
    </form>
    <%#Eval("ID")%>
        </div>
</body>
</html>
