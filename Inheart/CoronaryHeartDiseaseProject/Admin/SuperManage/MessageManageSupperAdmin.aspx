<%@ Page Language="C#" AutoEventWireup="true" Inherits="CoronaryHeartDiseaseProject.MessageManageSupperAdmin" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="../../Styles/main.css" type="text/css" rel="stylesheet" />
    <link rel="stylesheet" href="/Content/bootstrap.min.css">
    <script src="/Scripts/bootstrap.min.js"></script>
    <script src="/Scripts/jquery-1.9.1.min.js"></script>
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
        .tableborder {
            background: #D6E0EF;
            border: 1px solid #698CC3;
        }

        .header {
            font: 9pt Tahoma, Verdana;
            color: #FFFFFF;
            font-weight: bold;
            background-color: #66aadb;
        }
    </style>
</head>
<body>
    <div style="margin-left: 10px;margin-right:10px">
        <form id="form1" runat="server">
            <div>
                <span class="label label-default" style="height: 30px; width: 60px">条件</span>
                <asp:DropDownList ID="ddlCondition" runat="server" Height="35" Style="vertical-align: middle; width: 150px;">
                    <asp:ListItem>请选择</asp:ListItem>
                </asp:DropDownList>
                <asp:TextBox ID="txtCondition" runat="server" Height="35"></asp:TextBox>
                <span class="glyphicon glyphicon-search"></span>
                <asp:Button runat="server" ID="Button1" Text="查询" OnClick="ibtnSearch_Click" CssClass="btn btn-info widthButton "
                    Height="35px" />
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
                            <%--  <td width="10%" height="25">
                            <div align="center">
                                序号</div>
                        </td>--%>
                            <td width="15%" height="25">
                                <div align="center">
                                    录入时间
                           
                                </div>
                            </td>
                            <td width="10%" height="25">
                                <div align="center">
                                    患者姓名
                           
                                </div>
                            </td>
                            <td width="5%" height="25">
                                <div align="center">
                                    性别
                           
                                </div>
                            </td>
                            <td width="5%" height="25">
                                <div align="center">
                                    年龄
                           
                                </div>
                            </td>
                            <td width="10%" height="25">
                                <div align="center">
                                    医生
                           
                                </div>
                            </td>
                            <%--  <td width="15%" height="25">
                            <div align="center">
                                就诊时间</div>
                        </td>
                            <td width="15%" height="25">
                            <div align="center">
                                最后更新时间</div>
                        </td>--%>
                            <td width="5%" height="25">
                                <div align="center">
                                    状态
                           
                                </div>
                            </td>
                        </tr>
                    </table>
                </HeaderTemplate>
                <ItemTemplate>
                    <table width="100%" border="1" align="center" cellpadding="3" cellspacing="1" class="tableborder">
                        <tr bgcolor="#ffffff" id="news<%#Eval("ReportID") %>">
                            <%--  <td height="25" width="10%">
                            <div align="center">
                                <%#Eval("ID")%>
                            </div>
                        </td>--%>
                            <td height="25" width="15%">
                                <div align="center">
                                    <%#Eval("CreateDate")%>
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
                            <%--   <td height="25" width="15%">
                            <div align="center">
                                <%#Eval("TreatDate")%>
                            </div>
                        </td>--%>
                            <%--           <td height="25" width="15%">
                            <div align="center">
                                <%#Eval("LastUpdateDate")%>
                            </div>
                        </td>--%>
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
                            <div align="right">
                                <div align="right">
                                    <input id="btnImportExcel" name="Submit822" type="button" value="导出Excel" runat="server"
                                        align="left" class="btn btn-info" onserverclick="ImportExcel_Click" />&nbsp;&nbsp;
                           
                                </div>
                            </div>
                        </td>
                    </tr>
                </table>
            </div>
        </form>
    </div>
</body>
</html>
