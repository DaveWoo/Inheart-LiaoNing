<%@ Page Language="C#" AutoEventWireup="true" Inherits="CoronaryHeartDiseaseProject.MessageManageAdmin" %>

<%@ Register Src="../inc/IsAdmin.ascx" TagName="IsAdmin" TagPrefix="uc1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="stylesheet" href="../../Styles/main.css" />
    <link rel="stylesheet" href="/Content/bootstrap.min.css" />
    <script type="text/javascript" src="/Scripts/bootstrap.min.js"></script>
    <script type="text/javascript" src="/Scripts/jquery-1.9.1.min.js"></script>
    <script type="text/javascript" src="/Scripts/check.js"></script>
    <title>新增管理员</title>
</head>
<body>
    <div id="div-body">
        <form id="form1" runat="server">
            <div style="height: 20px;" class="input-group" id="search-bar">
                <span class="glyphicon glyphicon-search" style="font-size: 25px; vertical-align: middle"></span>&nbsp;
                <asp:DropDownList ID="ddlCondition" runat="server" Height="35" Style="vertical-align: middle">
                    <asp:ListItem>请选择</asp:ListItem>
                </asp:DropDownList>
                <asp:TextBox ID="txtCondition" runat="server" Height="35" Style="vertical-align: middle" placeholder="请输入"></asp:TextBox>
                <asp:Button runat="server" ID="Button1" Text="查询" OnClick="ibtnSearch_Click" CssClass="btn btn-info widthButton "
                    Height="35px" />
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
                            <td width="10%" height="25">
                                <div align="center">序号</div>
                            </td>
                            <td width="10%" height="25">
                                <div align="center">患者姓名</div>
                            </td>
                            <td width="5%" height="25">
                                <div align="center">性别</div>
                            </td>
                            <td width="5%" height="25">
                                <div align="center">年龄</div>
                            </td>
                            <td width="10%" height="25">
                                <div align="center">医生</div>
                            </td>
                            <td width="15%" height="25">
                                <div align="center">就诊时间</div>
                            </td>
                            <td width="15%" height="25">
                                <div align="center">创建时间</div>
                            </td>
                            <td width="5%" height="25">
                                <div align="center">状态</div>
                            </td>
                        </tr>
                    </table>
                </HeaderTemplate>
                <ItemTemplate>
                    <table width="100%" border="1" align="center" cellpadding="3" cellspacing="1" class="tableborder">
                        <tr bgcolor="#ffffff" id="news<%#Eval("ReportID") %>">
                            <td height="25" width="10%">
                                <div align="center">
                                    <%#Eval("ID")%>
                                </div>
                            </td>
                            <td height="25" width="10%">
                                <div align="center">
                                    <a href='<%#EnterCase(Eval("ID").ToString(),Eval("IsLocked").ToString(),Eval("ReportID").ToString())%>'
                                        title="进入病例">
                                        <%#Eval("PatientName")%></a>
                                </div>
                            </td>
                            <td height="25" width="5%">
                                <div align="center">
                                    <%#Eval("Sex")%>
                                </div>
                            </td>
                            <td height="25" width="5%">
                                <div align="center">
                                    <%#Eval("Age")%>
                                </div>
                            </td>
                            <td height="25" width="10%">
                                <div align="center">
                                    <%#Eval("Creater")%>
                                </div>
                            </td>
                            <td height="25" width="15%">
                                <div align="center">
                                    <%#Eval("TreatDate")%>
                                </div>
                            </td>
                            <td height="25" width="15%">
                                <div align="center">
                                    <%#Eval("CreateDate")%>
                                </div>
                            </td>
                            <td height="25" width="5%">
                                <div align="center">
                                    <%#ShowLock(Eval("IsLocked").ToString())%>
                                </div>
                            </td>
                        </tr>
                    </table>
                </ItemTemplate>
            </asp:DataList>
                <table align="center" border="0" cellpadding="3" cellspacing="1" class="tableborder"
                    width="100%">
                    <tr bgcolor="#ffffff">
                        <td colspan="4" height="25">
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
    </div>
    <uc1:IsAdmin ID="IsAdmin1" runat="server" />
</body>
</html>
