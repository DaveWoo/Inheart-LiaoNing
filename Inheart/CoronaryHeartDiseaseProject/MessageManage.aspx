<%@ Page Language="C#" AutoEventWireup="true" Inherits="CoronaryHeartDiseaseProject.MessageManage" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <%--设置编码--%>
    <meta charset="utf-8" />
    <%--页面首次由浏览器加载时的初始缩放级别。--%>

    <%--引用bootstrap和相关的Jquery--%>
    <link rel="stylesheet" href="./Content/bootstrap.min.css" />
    <script type="text/javascript" src="./Scripts/jquery-1.9.1.min.js"></script>
    <script type="text/javascript" src="./Scripts/bootstrap.min.js"></script>

    <link rel="stylesheet" href="./Styles/main.css" />

    <%--输入框检查--%>
    <script type="text/javascript" src="./Scripts/check.js"></script>

    <!--font-awesome字体库-->
    <link href="./Content/font-awesome.min.css" rel="stylesheet" />

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
            <asp:Label ID="Label1" runat="server"></asp:Label>
            <asp:DataList ID="dgMessage" runat="server" Width="100%" class="table table-striped table-bordered table-list">
                <HeaderTemplate>
                    <table width="100%">
                        <thead>
                            <tr class="header">
                                <td width="80">录入时间</td>
                                <td width="80" align="center">患者姓名</td>
                                <td width="40" align="center">性别</td>
                                <td width="40" align="center">年龄</td>
                                <td width="80" align="center">录入医生</td>
                                <td width="80" align="center">是否上报</td>
                                <td width="40" align="center">操作</td>
                                <td width="40" align="center">状态</td>
                            </tr>
                        </thead>
                    </table>
                </HeaderTemplate>
                <ItemTemplate>
                    <table width="100%">
                        <tbody>
                            <tr id="news<%#Eval("ReportID") %>">
                                <td width="80">
                                    <%#Eval("CreateDate")%>
                                </td>
                                <td width="80" align="center">
                                    <a href='<%#EnterCase(Eval("ID").ToString(),Eval("IsLocked").ToString(),Eval("ReportID").ToString())%>'
                                        title="进入病例">
                                        <%#Eval("PatientName")%></a>
                                    </div>
                                </td>
                                <td width="40" align="center">
                                    <%#Eval("Sex")%>
                                </td>
                                <td width="40" align="center">
                                    <%#Eval("Age")%>
                                </td>
                                <td width="80" align="center">
                                    <%#Eval("Creater")%>
                                </td>
                                <td width="80" align="center">
                                    <%#Eval("IsSubmit")%>
                                </td>
                                <td width="40" align="center">
                                    <%#ShowTxt(Eval("ID").ToString(), Eval("IsLocked").ToString(), Eval("ReportID").ToString())%>                                   
                                </td>
                                <td width="40" align="center">
                                    <%#ShowLock(Eval("IsLocked").ToString())%>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </ItemTemplate>
                <FooterTemplate>
                 
                </FooterTemplate>
            </asp:DataList>

        </div>
    </form>
</body>
</html>
