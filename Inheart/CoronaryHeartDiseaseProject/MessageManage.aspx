<%@ Page Language="C#" AutoEventWireup="true" Inherits="CoronaryHeartDiseaseProject.MessageManage" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="stylesheet" href="Styles/main.css" />
    <link rel="stylesheet" href="/Content/bootstrap.min.css" />
    <script type="text/javascript" src="/Scripts/bootstrap.min.js"></script>
    <script type="text/javascript" src="/Scripts/jquery-1.9.1.min.js"></script>
    <script type="text/javascript" src="/Scripts/check.js"></script>
    <title>病例管理</title>
</head>
<body>
    <form id="myform" runat="server">
        <div style="height: 20px;" class="input-group" id="search-bar">
            <span class="glyphicon glyphicon-search" style="font-size: 25px; vertical-align: middle"></span>&nbsp;
                <asp:DropDownList ID="ddlCondition" runat="server" Height="30px" Style="vertical-align: middle">
                    <asp:ListItem>请选择</asp:ListItem>
                </asp:DropDownList>
            <asp:TextBox ID="txtCondition" runat="server" Height="30px" Style="vertical-align: middle;" placeholder="请输入"></asp:TextBox>
            <asp:Button runat="server" ID="Button1" Text="查询" OnClick="Search_Click" CssClass="btn btn-info"
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
                            <tr  class="header">
                                <td width="80" >
                                    <div align="center">录入时间</div>
                                </td>
                                <td width="80" >
                                    <div align="center">患者姓名</div>
                                </td>
                                <td width="60" >
                                    <div align="center">性别</div>
                                </td>
                                <td width="40" >
                                    <div align="center">年龄</div>
                                </td>
                                <td width="80" >
                                    <div align="center">录入医生</div>
                                </td>
                                <td width="80" >
                                    <div align="center">是否上报</div>
                                </td>
                                <td width="40" >
                                    <div align="center">操作</div>
                                </td>
                                <td width="40" >
                                    <div align="center">状态</div>
                                </td>
                            </tr>
                        </table>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <table width="100%" border="1" align="center" cellpadding="3" cellspacing="1" class="tableborder">
                            <tr id="news<%#Eval("ReportID") %>">
                                <td  width="80">
                                    <div align="center">
                                        <%#Eval("CreateDate")%>
                                    </div>
                                </td>
                                <td  width="80">
                                    <div align="center">
                                        <a href='<%#EnterCase(Eval("ID").ToString(),Eval("IsLocked").ToString(),Eval("ReportID").ToString())%>'
                                            title="进入病例">
                                            <%#Eval("PatientName")%></a>
                                    </div>
                                </td>
                                <td  width="60">
                                    <div align="center">
                                        <%#Eval("Sex")%>
                                    </div>
                                </td>
                                <td  width="40">
                                    <div align="center">
                                        <%#Eval("Age")%>
                                    </div>
                                </td>
                                <td  width="80">
                                    <div align="center">
                                        <%#Eval("Creater")%>
                                    </div>
                                </td>
                                <td  width="80">
                                    <div align="center">
                                        <%#Eval("IsSubmit")%>
                                    </div>
                                </td>
                                <td  width="40">
                                    <div align="center">
                                        <%#ShowTxt(Eval("ID").ToString(), Eval("IsLocked").ToString(), Eval("ReportID").ToString())%>
                                    </div>
                                </td>
                                <td  width="40">
                                    <div align="center">
                                        <%#ShowLock(Eval("IsLocked").ToString())%>
                                    </div>
                                </td>
                            </tr>
                        </table>
                    </ItemTemplate>
                </asp:DataList>
            <table align="center" border="0" cellpadding="3" cellspacing="1" class="tableborder"width="100%">
                <tr >
                    <td colspan="4" >
                        <div align="left">
                            <input id="btnAddMedical" name="Submit822" onclick="javascript: window.location = 'MessageInput.aspx';"
                                type="button" value="添加病例" runat="server" align="left" class="btn btn-info" />
                            &nbsp;                       
                        </div>
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
