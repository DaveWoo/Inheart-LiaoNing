<%@ Page Language="C#" AutoEventWireup="true" Inherits="CoronaryHeartDiseaseProject.MessageManageAdmin" %>

<%@ Register Src="../inc/IsAdmin.ascx" TagName="IsAdmin" TagPrefix="uc1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="stylesheet" href="../../Styles/main.css" />
    <link rel="stylesheet" href="/Content/bootstrap.min.css" />
    <link rel="stylesheet" href="../../Styles/admin.css" />
    <script type="text/javascript" src="/Scripts/bootstrap.min.js"></script>
    <script type="text/javascript" src="/Scripts/jquery-1.9.1.min.js"></script>
    <script type="text/javascript" src="/Scripts/check.js"></script>
    <title>新增管理员</title>
</head>
<body>
    <form id="myform" runat="server">

        <div style="height: 20px;" class="input-group" id="search-bar">
            <span class="glyphicon glyphicon-search" style="font-size: 25px; vertical-align: middle"></span>&nbsp;
               
            <asp:DropDownList ID="ddlCondition" runat="server" Height="30px" Style="vertical-align: middle">
                <asp:ListItem>请选择</asp:ListItem>
            </asp:DropDownList>
            <asp:TextBox ID="txtCondition" runat="server" Height="30px" Style="vertical-align: middle" placeholder="请输入"></asp:TextBox>
            <asp:Button runat="server" ID="Button1" Text="查询" OnClick="ibtnSearch_Click" CssClass="btn btn-info widthButton "
                Height="30px" />
            <asp:Label ID="lblMessage" runat="server" ForeColor="Red" />
        </div>
        <div>
            <asp:Label ID="Label1" runat="server"></asp:Label>&nbsp;       
           
            <asp:DataList ID="dgMessage" runat="server" Width="100%">
                <FooterTemplate>
                </FooterTemplate>
                <HeaderTemplate>
                    <table width="100%" border="0" align="center" cellpadding="3" cellspacing="1" class="tableborder">
                        <tr class="header">
                            <td width="10%" class="tableTDCell">序号</td>
                            <td width="10%" class="tableTDCell">患者姓名</td>
                            <td width="5%" class="tableTDCell">性别</td>
                            <td width="5%" class="tableTDCell">年龄</td>
                            <td width="10%" class="tableTDCell">医生</td>
                            <td width="15%" class="tableTDCell">就诊时间</td>
                            <td width="15%" class="tableTDCell">创建时间</td>
                            <td width="5%" align="center">状态</td>
                        </tr>
                    </table>
                </HeaderTemplate>
                <ItemTemplate>
                    <table width="100%" border="1" align="center" cellpadding="3" cellspacing="1" class="tableborder">
                        <tr bgcolor="#ffffff" id="news<%#Eval("ReportID") %>" class="tableBody">
                            <td width="10%" class="tableTDCell">
                                <%#Eval("ID" )%>
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
                            <td width="15%" class="tableTDCell">
                                <%#Eval("TreatDate")%>
                            </td>
                            <td width="15%" class="tableTDCell">
                                <%#Eval("CreateDate")%>
                            </td>
                            <td width="5%" align="center">
                                <%#ShowLock(Eval("IsLocked").ToString())%>
                            </td>
                        </tr>
                    </table>
                </ItemTemplate>
            </asp:DataList>
            <table align="center" border="0" cellpadding="3" cellspacing="1" class="tableborder"
                width="100%">
                <tr>
                    <td colspan="4">
                        <%--     <div align="right">
                        <div align="right">
                            <input id="btnImportExcel" name="Submit822" type="button" value="导出Excel" runat="server"
                                align="left" class="Button" onserverclick="ImportExcel_Click" />&nbsp;&nbsp;
                        </div>
                    </div>--%>
                    </td>
                </tr>
            </table>
        </div>
    </form>

    <uc1:IsAdmin ID="IsAdmin1" runat="server" />
</body>
</html>
