<%@ Page Language="C#" AutoEventWireup="true" Inherits="CoronaryHeartDiseaseProject.Admin.SuperManage.AdminManage" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link rel="stylesheet" href="/Content/bootstrap.min.css">
    <script src="/Scripts/bootstrap.min.js"></script>
    <script src="/Scripts/jquery-1.9.1.min.js"></script>
    <title>修改资料</title>
    <link href="../../Styles/admin.css" rel="stylesheet" type="text/css" />
    <style>
        body {
            word-break: break-all;
            word-wrap: break-word;
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
    <div style="margin-left: 10px">
        <table width="100%" border="0" align="center" cellpadding="3" cellspacing="1">
            <tr>
                <td>
                    <table width="100%" border="0" align="center" cellpadding="3" cellspacing="1">
                        <tr>
                            <td height="25" colspan="2">网站导航: &nbsp;<a href="AddAdmin.aspx">添加管理员</a> &nbsp;|&nbsp; <a href="AdminManage.aspx">
                                <b>管理管理员</b></a>&nbsp; | <a href="AdminCenter.aspx">修改密码</a> |
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
        <form id="Form1" name="listform" runat="server" onsubmit="return confirm('确认要执行此操作？');">
            <asp:Label ID="Label1" runat="server"></asp:Label>&nbsp;
   
        <asp:DataList ID="DataListUser" runat="server" Width="100%">
            <HeaderTemplate>
                <table width="100%" border="0" align="left" cellpadding="1" cellspacing="1" class="tableborder">
                    <tr class="header">
                        <td width="100" height="25">
                            <div align="left">
                                管理员ID
                       
                            </div>
                        </td>
                        <td width="100" height="25">
                            <div align="left">
                                所属医院
                       
                            </div>
                        </td>
                        <td width="100" height="25">
                            <div align="left">
                                所属地区
                       
                            </div>
                        </td>
                        <td width="100" height="25">
                            <div align="left">
                                操作
                       
                            </div>
                        </td>
                    </tr>
                </table>
            </HeaderTemplate>
            <ItemTemplate>
                <table width="100%" border="0" align="left" cellpadding="1" cellspacing="1" class="tableborder">
                    <tr bgcolor="#ffffff" id="news<%#Eval("ID") %>">
                        <%--    <td height="25" width="10%">
                        <div align="center">
                            <%#Eval("OrderID")%>
                        </div>
                    </td>--%>
                        <td height="25" width="100">
                            <div align="left">
                                <%#Eval("UserName")%>
                            </div>
                        </td>
                        <td height="25" width="100">
                            <div align="left">
                                <%#Eval("Hospital.HospitalName")%>
                            </div>
                        </td>
                        <td height="25" width="100">
                            <div align="left">
                                <%#ShowRegionName(Eval("Hospital.RegionID").ToString())%>
                            </div>
                        </td>
                        <td height="25" width="100">
                            <div align="left">
                                <%#ShowTxt(Eval("ID").ToString())%>
                            </div>
                        </td>
                    </tr>
                </table>
            </ItemTemplate>
            <FooterTemplate>
                <table width="100%" border="0" align="left" cellpadding="3" cellspacing="1" class="tableborder">
                    <tr bgcolor="#ffffff">
                        <td height="25" colspan="4">
                            <div align="left">
                                <input type="button" class="btn btn-info widthButton" name="Submit822" value="添加管理员" onclick="javascript: window.location = 'AddAdmin.aspx';">&nbsp;
                       
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
                    <br />
                    </span>
                    </td>
                </tr>
            </table>
        </form>
        <%#Eval("ID")%>
    </div>
</body>
</html>
