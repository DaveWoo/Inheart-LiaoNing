<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MessageManage.aspx.cs"
    Inherits="CoronaryHeartDiseaseProject.MessageManage" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="Styles/main.css" type="text/css" rel="stylesheet" />
    <script language="javascript" type="text/javascript">
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
    <title></title>
    <style type="text/css">
        .tableborder
        {
            background: #D6E0EF;
            border: 1px solid #698CC3;
        }
        .header
        {
            font: 9pt Tahoma, Verdana;
            color: #FFFFFF;
            font-weight: bold;
            background-color: #66aadb;
        }
        .Button
        {
            border: groove inset 1px #000000;
            background: #84B0DC;
            filter: progid:DXImageTransform.Microsoft.Gradient(startColorstr='#84B0DC',endColorstr='#ffffff', gradientType='0')progid:DXImageTransform.Microsoft.dropshadow(OffX=2, OffY=2, Color='#8b9b99', Positive='true');
            color: black;
            font-family: Comic Sans MS;
            font-size: 18px;
            font-weight: bold;
            cursor: pointer;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div style="height: 20px;">
        <asp:Label Text="条件" runat="server" Height="20" Style="vertical-align: middle; text-align: center" />&nbsp;
        <asp:DropDownList ID="ddlCondition" runat="server" Height="20" Style="vertical-align: middle">
            <asp:ListItem>请选择</asp:ListItem>
        </asp:DropDownList>
        &nbsp;
        <asp:TextBox ID="txtCondition" runat="server" Height="20" Style="vertical-align: middle"></asp:TextBox>
        &nbsp;<asp:ImageButton ID="ibtnSearch" runat="server" ImageUrl="~/Images/Search.png"
            Width="16px" Height="16px" OnClick="Search_Click" />
        <asp:Label ID="lblMessage" runat="server" ForeColor="Red" />
    </div>
    <div>
        <br />
        <asp:Label ID="Label1" runat="server"></asp:Label>&nbsp;
        <asp:DataList ID="dgMessage" runat="server" Width="100%">
            <FooterTemplate>
            </FooterTemplate>
            <HeaderTemplate>
                <table width="100%" border="0" align="center" cellpadding="3" cellspacing="1" class="tableborder">
                    <tr class="header">
                        <%--    <td width="80" height="25">
                            <div align="center">
                                序号</div>
                        </td>--%>
                        <td width="80" height="25">
                            <div align="center">
                                录入时间</div>
                        </td>
                        <td width="80" height="25">
                            <div align="center">
                                患者姓名</div>
                        </td>
                        <td width="60" height="25">
                            <div align="center">
                                性别</div>
                        </td>
                        <td width="40" height="25">
                            <div align="center">
                                年龄</div>
                        </td>
                        <td width="80" height="25">
                            <div align="center">
                                录入医生</div>
                        </td>
                        <td width="80" height="25">
                            <div align="center">
                                是否上报</div>
                        </td>
                        <td width="40" height="25">
                            <div align="center">
                                操作</div>
                        </td>
                        <td width="40" height="25">
                            <div align="center">
                                状态</div>
                        </td>
                    </tr>
                </table>
            </HeaderTemplate>
            <ItemTemplate>
                <table width="100%" border="1" align="center" cellpadding="3" cellspacing="1" class="tableborder">
                    <tr bgcolor="#ffffff" id="news<%#Eval("ReportID") %>">
                        <%--       <td height="25" width="80">
                            <div align="center">
                                <%#Eval("ID")%>
                            </div>
                        </td>--%>
                        <td height="25" width="80">
                            <div align="center">
                                <%#Eval("CreateDate")%>
                            </div>
                        </td>
                        <td height="25" width="80">
                            <div align="center">
                                <a href='<%#EnterCase(Eval("ID").ToString(),Eval("IsLocked").ToString(),Eval("ReportID").ToString())%>'
                                    title="进入病例">
                                    <%#Eval("PatientName")%></a>
                            </div>
                        </td>
                        <td height="25" width="60">
                            <div align="center">
                                <%#Eval("Sex")%>
                            </div>
                        </td>
                        <td height="25" width="40">
                            <div align="center">
                                <%#Eval("Age")%>
                            </div>
                        </td>
                        <td height="25" width="80">
                            <div align="center">
                                <%#Eval("Creater")%>
                            </div>
                        </td>
                        <td height="25" width="80">
                            <div align="center">
                                <%#Eval("IsSubmit")%>
                            </div>
                        </td>
                        <td height="25" width="40">
                            <div align="center">
                                <%#ShowTxt(Eval("ID").ToString(), Eval("IsLocked").ToString(), Eval("ReportID").ToString())%>
                            </div>
                        </td>
                        <td height="25" width="40">
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
                <%-- <td height="25" colspan="4">
                备注：<span style="color: #ff0000"> 1.多选框背景色为蓝色代表已选中信息,所有操作均为不可恢复，在操作时请管理员慎重。
                
                </span>
            </td>--%>
                <td colspan="4" height="25">
                    <div align="right">
                        <%--<asp:Button ID="Button1" runat="server" OnClick="Submit1_ServerClick" Visible="false" />--%>
                        <%--<input type="button" name="Submit3" value="将所选病例删除" id="Submit3" runat="server" onserverclick="Submit1_ServerClick" />
                                &nbsp;&nbsp;--%>
                        <input id="btnAddMedical" name="Submit822" onclick="javascript:window.location='MessageInput.aspx';"
                            type="button" value="添加病例" runat="server" align="right" class="Button" />
                        &nbsp;
                    </div>
                </td>
            </tr>
        </table>
    </div>
    </form>
</body>
</html>
