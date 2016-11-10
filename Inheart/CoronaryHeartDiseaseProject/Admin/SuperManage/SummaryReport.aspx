<%@ Page Language="C#" AutoEventWireup="true" Inherits="CoronaryHeartDiseaseProject.Admin.SummaryReport" %>

<%@ Register Src="../inc/IsSuperAdmin.ascx" TagName="IsSuperAdmin" TagPrefix="uc1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <link rel="stylesheet" href="../../Styles/main.css" />
    <link rel="stylesheet" href="/Content/bootstrap.min.css" />
    <link rel="stylesheet" href="../../Styles/admin.css" />
    <script type="text/javascript" src="/Scripts/bootstrap.min.js"></script>
    <script type="text/javascript" src="/Scripts/jquery-1.9.1.min.js"></script>
    <title>数据统计</title>
</head>
<body style="padding-left: 10px;">
    <form id="form1" runat="server">
        <asp:Panel runat="server" ID="panelQuery" Visible="false">
            <div style="margin-bottom: 50px;">
                <table border="0" cellpadding="0" cellspacing="0" style="margin-top: 10px;">
                    <tr style="height: 60px;">
                        <td style="color: Red; font-size: 20px;" colspan="4" align="left">请选择统计时期，不选择则统计全部！
                        </td>
                    </tr>
                    <tr style="height: 60px;">
                        <td>按时间段查询：
                        </td>
                        <td>起                       
                            <asp:TextBox name="control_date" type="text" ID="controldate" size="10" MaxLength="10"
                                onclick="new Calendar().show(this);" runat="server" Width="182px" />
                        </td>
                        <td>止<asp:TextBox name="control_date2" type="text" ID="controldate2" size="10" MaxLength="10"
                            onclick="new Calendar().show(this);" runat="server" Width="182px" />
                        </td>
                        <td>
                            <span class="glyphicon glyphicon-search"></span>
                            <asp:Button runat="server" ID="Button1" Text="查询" OnClick="Go_Click" CssClass="btn btn-info widthButton "
                                Height="35px" />
                        </td>
                    </tr>
                </table>
            </div>
        </asp:Panel>
        <asp:Panel runat="server" ID="paneOverView" Visible="false">
            <table cellpadding="0" cellspacing="0" class="tableSummary" align="left" style="margin-top: 50px;">
                <tr class="row1Summary">
                    <td colspan="2" style="text-align: center; font-weight: bold; font-size: 16px">2016年上报统计
                    </td>
                </tr>
                <tr>
                    <td class="tableOverview1">患者总人数
                    </td>
                    <td class="tableOverview2">
                        <%=Total%>
                    </td>
                </tr>
                <tr class="row1Summary">
                    <td class="tableOverview1">患者性别
                    </td>
                    <td class="tableOverview2">
                        <table border="0" cellpadding="0" cellspacing="0" style="width: 200px" align="center">
                            <tr>
                                <td>男 （<%=Male%>)&nbsp;&nbsp;|&nbsp;&nbsp; 女 （<%=Female%>）
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td class="tableOverview1">患者年龄
                    </td>
                    <td class="tableOverview2">
                        <%=Equation%>
                    </td>
                </tr>
                <tr class="row1Summary">
                    <td class="tableOverview1">溶栓人数
                    </td>
                    <td class="tableOverview2">
                        <%=TotalRongShuan%>
                    </td>
                </tr>
                <tr>
                    <td class="tableOverview1">急诊介入人数
                    </td>
                    <td class="tableOverview2">
                        <%=TotalJiZhen%>
                    </td>
                </tr>
                <tr class="row1Summary">
                    <td class="tableOverview1">死亡人数
                    </td>
                    <td class="tableOverview2">
                        <%=TotalDeath%>
                    </td>
                </tr>
                <tr>
                    <td class="tableOverview1">转上级医院患者数
                    </td>
                    <td class="tableOverview2">
                        <%=TotalTransfer%>
                    </td>
                </tr>
            </table>
        </asp:Panel>
        <asp:Panel runat="server" ID="panelSum" Visible="false">
            <table cellpadding="0" cellspacing="0" class="tableSummary" align="center">
                <tr>
                    <td class="row1Summary">
                        <strong>总数</strong>
                    </td>
                </tr>
                <tr>
                    <td class="row2Summary">
                        <%=Total%>
                    </td>
                </tr>
            </table>
        </asp:Panel>
        <asp:Panel runat="server" ID="panelSex" Visible="false">
            <table cellpadding="0" cellspacing="0" class="tableSummary" align="center">
                <tr>
                    <td class="row1Summary">
                        <strong>男</strong>
                    </td>
                    <td class="row1Summary">
                        <strong>女</strong>
                    </td>
                </tr>
                <tr>
                    <td class="row2Summary">
                        <%=Female%>
                    </td>
                    <td class="row2Summary">
                        <%=Male%>
                    </td>
                </tr>
            </table>
        </asp:Panel>
        <asp:Panel runat="server" ID="panelAge" Visible="false">
            <table cellpadding="0" cellspacing="0" class="tableSummary" align="center">
                <tr>
                    <td colspan="5" style="text-align: center; font-size: 16px; font-weight: bold">年龄分布图</td>
                </tr>
                <tr class="row1Summary">
                    <td class="columnAge">
                        <strong>40岁以下</strong>
                    </td>
                    <td class="columnAge">
                        <strong>41～50岁</strong>
                    </td>
                    <td class="columnAge">
                        <strong>51～60岁</strong>
                    </td>
                    <td class="columnAge">
                        <strong>61～70岁</strong>
                    </td>
                    <td class="columnAge">
                        <strong>70岁以上</strong>
                    </td>
                </tr>
                <tr>
                    <td class="columnAge">
                        <%=BelowForty%>
                    </td>
                    <td class="columnAge">
                        <%=FortyFifty%>
                    </td>
                    <td class="columnAge">
                        <%=FiftySixty%>
                    </td>
                    <td class="columnAge">
                        <%=SixtySeventy%>
                    </td>
                    <td class="columnAge">
                        <%=SeventyOldeer%>
                    </td>
                </tr>
            </table>
        </asp:Panel>
        <asp:Panel runat="server" ID="panelThrombolysis" Visible="false">
            <table cellpadding="0" cellspacing="0" class="tableSummary" align="center">
                <tr>
                    <td class="row1Summary">
                        <strong>溶栓人数</strong>
                    </td>
                </tr>
                <tr>
                    <td class="row2Summary">
                        <%=TotalRongShuan%>
                    </td>
                </tr>
            </table>
        </asp:Panel>
        <asp:Panel runat="server" ID="panelEmergencyTreate" Visible="false">
            <table cellpadding="0" cellspacing="0" class="tableSummary" align="center">
                <tr>
                    <td class="row1Summary">
                        <strong>急诊介入治疗</strong>
                    </td>
                </tr>
                <tr>
                    <td class="row2Summary">
                        <%=TotalJiZhen%>
                    </td>
                </tr>
            </table>
        </asp:Panel>
        <asp:Panel runat="server" ID="panelDeathCount" Visible="false">
            <table cellpadding="0" cellspacing="0" class="tableSummary" align="center">
                <tr>
                    <td class="row1Summary">
                        <strong>死亡人数</strong>
                    </td>
                </tr>
                <tr>
                    <td class="row2Summary">
                        <%=TotalDeath%>
                    </td>
                </tr>
            </table>
        </asp:Panel>
        <asp:Panel runat="server" ID="panelTransferUpHospitalCount" Visible="false">
            <table cellpadding="0" cellspacing="0" class="tableSummary" align="center">
                <tr>
                    <td class="row1Summary">
                        <strong>转上级医院人数</strong>
                    </td>
                </tr>
                <tr>
                    <td class="row2Summary">
                        <%=TotalTransfer%>
                    </td>
                </tr>
            </table>
        </asp:Panel>
        <uc1:IsSuperAdmin ID="IsSuperAdmin1" runat="server" />
    </form>
</body>
</html>
