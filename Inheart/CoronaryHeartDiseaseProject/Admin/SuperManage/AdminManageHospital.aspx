<%@ Page Language="C#" AutoEventWireup="true" Inherits="CoronaryHeartDiseaseProject.Admin.SuperManage.AdminManageHospital" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>修改资料</title>
    <link rel="stylesheet" href="/Content/bootstrap.min.css">
    <script src="/Scripts/bootstrap.min.js"></script>
    <script src="/Scripts/jquery-1.9.1.min.js"></script>
    <link href="../../Styles/admin.css" rel="stylesheet" type="text/css" />
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
    <table width="100%" border="0" align="center" cellpadding="3" cellspacing="1">
        <tr>
            <td>
                <table width="98%%" border="0" align="center" cellpadding="3" cellspacing="1">
                    <tr>
                        <td height="25" colspan="2">网站导航: &nbsp;<a href="AddHospital.aspx">添加医院</a> &nbsp;|&nbsp; <a href="AdminManageHospital.aspx">
                            <b>管理医院</b></a>&nbsp; |
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    <form id="Form1" name="listform" runat="server" onsubmit="return confirm('确认要执行此操作？');">
        <asp:Label ID="Label1" runat="server"></asp:Label>&nbsp;
    <asp:DataList ID="DataListHospital" runat="server" Width="100%">
        <HeaderTemplate>
            <table width="100%" border="0" align="center" cellpadding="3" cellspacing="1" class="tableborder">
                <tr class="header">
                    <%--      <td width="10%" height="25">
                        <div align="center">
                            ID</div>
                    </td>--%>
                    <td width="40%" height="25">
                        <div align="center">
                            医院
                        </div>
                    </td>
                    <td width="80px" height="25">
                        <div align="center">
                            所属地区
                        </div>
                    </td>
                    <td width="20%" height="25">
                        <div align="center">
                            操作
                        </div>
                    </td>
                </tr>
            </table>
        </HeaderTemplate>
        <ItemTemplate>
            <table width="100%" border="0" align="center" cellpadding="3" cellspacing="1" class="tableborder">
                <tr bgcolor="#ffffff" id="news<%#Eval("ID") %>">
                    <%--   <td height="25" width="10%">
                        <div align="center">
                            <%#Eval("ID")%>
                        </div>
                    </td>--%>
                    <td height="25" width="40%">
                        <div align="center">
                            <%#Eval("HospitalName")%>
                        </div>
                    </td>
                    <td height="25" width="80px">
                        <div align="center">
                            <%#ShowRegionName(Eval("RegionID").ToString())%>
                        </div>
                    </td>
                    <td height="25" width="20%">
                        <div align="center">
                            <%#ShowTxt(Eval("ID").ToString())%>
                        </div>
                    </td>
                </tr>
            </table>
        </ItemTemplate>
        <FooterTemplate>
            <table width="100%" border="0" align="center" cellpadding="3" cellspacing="1" class="tableborder">
                <tr bgcolor="#ffffff">
                    <td height="25" colspan="4">
                        <div align="right">
                            <input type="submit" name="Submit3" value="将所选医院删除" id="Submit1" onserverclick="Submit1_ServerClick"
                                runat="server">
                            &nbsp;&nbsp;
                            <input type="button" name="Submit822" value="添加医院" onclick="javascript: window.location = 'AddHospital.aspx';">&nbsp;
                            <%--  <input type="button" name="Submit8222" value="返回后台首页" onclick="javascript:window.location='../SuperAdmin.aspx';">
                            &nbsp;&nbsp;--%>
                            <input type="checkbox" name="chkall" value="on" onclick="CheckAll(this.form)">选中全部
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
                </td>
            </tr>
        </table>
    </form>
    <%#Eval("ID")%>
</body>
</html>
