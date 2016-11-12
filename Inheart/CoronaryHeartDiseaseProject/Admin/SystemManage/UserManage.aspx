<%@ Page Language="C#" AutoEventWireup="true" Inherits="CoronaryHeartDiseaseProject.Admin.UserManage" %>

<%@ Register Src="../inc/IsAdmin.ascx" TagName="IsAdmin" TagPrefix="uc1" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>修改资料</title>
    <link rel="stylesheet" href="../../Styles/admin.css" />
    <link rel="stylesheet" href="/Content/bootstrap.min.css" />
    <script type="text/javascript" src="/Scripts/bootstrap.min.js"></script>
    <script type="text/javascript" src="/Scripts/jquery-1.9.1.min.js"></script>
</head>
<body>
    <form id="myform" name="listform" runat="server" onsubmit="return confirm('确认要执行此操作？');">
        <table border="0" width="100%" align="center" cellpadding="3" cellspacing="1">
            <tr>
                <td>
                    <asp:Label ID="Label1" runat="server"></asp:Label>&nbsp;   
                </td>
            </tr>
        </table>
        <asp:DataList ID="DataListUser" runat="server" Width="100%">
            <HeaderTemplate>
                <table width="100%" border="1" align="center" cellpadding="3" cellspacing="1" class="tableborder">
                    <tr class="header">
                        <td class="c1">用户ID</td>
                        <td class="c2">所属医院</td>
                        <td class="c3">操作</td>
                    </tr>
                </table>
            </HeaderTemplate>
            <ItemTemplate>
                <table width="100%" border="10" align="center" cellpadding="3" cellspacing="1" class="tableborder">
                    <tr bgcolor="#ffffff"  id="news<%#Eval("ID") %>">
                        <td class="c1">
                            <%#Eval("UserName")%>
                        </td>
                        <td class="c2">
                            <%#Eval("Hospital.HospitalName")%>
                        </td>
                        <td class="c3">
                            <%#ShowTxt(Eval("ID").ToString())%>
                        </td>
                    </tr>
                </table>
            </ItemTemplate>
            <FooterTemplate>
                <table width="100%" border="0" align="center" cellpadding="3" cellspacing="1" class="tableborder">
                    <tr >
                        <td  colspan="4">
                            <div align="left">
                                <input type="button" class="btn btn-info" name="Submit822" value="添加新用户" onclick="javascript: window.location = 'AddUser.aspx';">
                                <input type="submit" class="btn btn-info" name="Submit3" value="将所选用户删除" id="Submit1" onserverclick="Submit1_ServerClick"
                                    runat="server" style="width: 150px;" />
                            </div>
                        </td>
                    </tr>
                </table>
            </FooterTemplate>
        </asp:DataList>
        <table width="100%" border="0" align="center" cellpadding="3" cellspacing="1" class="tableborder">
            <tr >
                <td  colspan="4">
                    <div align="left">
                        &nbsp;&nbsp;    
                    </div>
                </td>
            </tr>
        </table>
        <table width="100%" border="0" cellpadding="0" cellspacing="0">
            <tr >
                <td  colspan="4">备注：<span style="color: #ff0000"> 1.多选框背景色为蓝色代表已选中信息,所有操作均为不可恢复，在操作时请管理员慎重。<br />
                    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;     
                    <!--2.放入回收站的文章可以恢复,清空回收站文章彻底删除。-->
                    <br />
                </span>
                    <uc1:IsAdmin ID="IsAdmin1" runat="server" />
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
