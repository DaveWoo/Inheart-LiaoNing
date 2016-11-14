<%@ Page Language="C#" AutoEventWireup="true" Inherits="CoronaryHeartDiseaseProject.MessageManageSupperAdmin" %>

<%@ Register Src="../inc/IsSuperAdmin.ascx" TagName="IsSuperAdmin" TagPrefix="uc1" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <%--设置编码--%>
    <meta charset="utf-8" />
    <%--页面首次由浏览器加载时的初始缩放级别。--%>
    <meta name="viewport" content="width=device-width, initial-scale=1" />

    <%--引用bootstrap和相关的Jquery--%>
    <link rel="stylesheet" href="/Content/bootstrap.min.css" />
    <script type="text/javascript" src="/Scripts/jquery-1.9.1.min.js"></script>
    <script type="text/javascript" src="/Scripts/bootstrap.min.js"></script>

    <link rel="stylesheet" href="/Styles/main.css" />
    <%--管理页面相关的样式--%>
    <link rel="stylesheet" href="/Styles/admin.css" />
    <%--输入框检查--%>
    <script type="text/javascript" src="/Scripts/check.js"></script>

    <title>病例管理</title>
</head>
<body>
    <form id="myform" runat="server">
        <div class="input-group" id="search-bar">
            <span class="glyphicon glyphicon-search" style="font-size: 25px; vertical-align: middle"></span>&nbsp;
               
            <asp:DropDownList ID="ddlCondition" runat="server" Height="30px" Style="vertical-align: middle; width: 150px;">
                <asp:ListItem>请选择</asp:ListItem>
            </asp:DropDownList>
            <asp:TextBox ID="txtCondition" runat="server" Height="30px" Style="vertical-align: middle" placeholder="请输入"></asp:TextBox>
            <asp:Button runat="server" ID="Button1" Text="查询" OnClick="Search_Click" CssClass="btn btn-info" Height="30px" />
            <asp:Label ID="lblMessage" runat="server" ForeColor="Red" />
        </div>
        <div>
            <asp:Label ID="Label1" runat="server"></asp:Label>&nbsp;       
           
            <asp:DataList ID="dgMessage" runat="server" Width="100%">
                <FooterTemplate>
                </FooterTemplate>
                <HeaderTemplate>
                    <table width="100%" border="0" align="left" cellpadding="3" cellspacing="1" class="tableborder">
                        <tr class="header">
                            <td width="15%" class="tableTDCell">录入时间</td>
                            <td width="10%" class="tableTDCell">患者姓名</td>
                            <td width="5%" class="tableTDCell">性别</td>
                            <td width="5%" class="tableTDCell">年龄</td>
                            <td width="10%" class="tableTDCell">医生</td>
                            <td width="5%" align="center">状态</td>
                        </tr>
                    </table>
                </HeaderTemplate>
                <ItemTemplate>
                    <table width="100%" border="1" align="center" cellpadding="3" cellspacing="1" class="tableborder">
                        <tr bgcolor="#ffffff" id="news<%#Eval("ReportID") %>">
                            <td width="15%" class="tableTDCell">
                                <%#Eval("CreateDate")%>
                            </td>
                            <td width="10%" class="tableTDCell">
                                <a href='<%#EnterCase(Eval("ID").ToString(),Eval("IsLocked").ToString(),Eval("ReportID").ToString())%>'
                                    title="进入病例">
                                    <%#Eval("PatientName")%></a>
                            </td>
                            <td width="5%" class="tableTDCell">
                                <%#Eval("Sex")%>
                            </td>
                            <td width="5%" class="tableTDCell">
                                <%#Eval("Age")%>
                            </td>
                            <td width="10%" class="tableTDCell">
                                <%#Eval("Creater")%>
                            </td>
                            <td width="5%" align="center">
                                <%#ShowLock(Eval("IsLocked").ToString())%>
                            </td>
                        </tr>
                    </table>
                </ItemTemplate>
            </asp:DataList>
            <table align="left" border="0" cellpadding="3" cellspacing="1" class="tableborder"
                width="100%">
                <tr bgcolor="#ffffff">
                    <td colspan="4">
                        <div align="left">
                            <input id="btnImportExcel" name="Submit822" type="button" value="导出Excel" runat="server"
                                align="left" class="btn btn-info" onserverclick="ImportExcel_Click" />&nbsp;&nbsp;                           
                       
                        </div>
                    </td>
                </tr>
            </table>
        </div>
    </form>

    <uc1:IsSuperAdmin ID="IsSuperAdmin1" runat="server" />
</body>
</html>
