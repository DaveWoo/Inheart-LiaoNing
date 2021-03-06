﻿<%@ Page Language="C#" AutoEventWireup="true" Inherits="CoronaryHeartDiseaseProject.Admin.SummaryReport" %>

<%@ Register Src="../inc/IsSuperAdmin.ascx" TagName="IsSuperAdmin" TagPrefix="uc1" %>

<!DOCTYPE html>
<html>
<head id="Head1" runat="server">
        <%--设置编码--%>
    <meta charset="utf-8" />
    <%--页面首次由浏览器加载时的初始缩放级别。--%>

    <link rel="stylesheet" href="/Styles/main.css" />
    <link rel="stylesheet" href="/Content/bootstrap.min.css" />
    
     <%--管理页面相关的样式--%>
    <link rel="stylesheet" href="/Styles/admin.css" />
    <script type="text/javascript" src="/Scripts/bootstrap.min.js"></script>
    <script type="text/javascript" src="/Scripts/jquery-1.9.1.min.js"></script>
    <script type="text/javascript" src="/Scripts/Calendar3.js"></script>

    <title>数据统计</title>
</head>
<body style="padding-left: 10px;">
    <form id="form1" runat="server">
        <asp:Panel runat="server" ID="panelQuery" Visible="false">
            <div style="color: Red; font-size: 20px;" align="left">请选择统计时期，不选择则统计全部！</div>
            <div class="form-horizontal">
                <label class="control-label col-sm-1 ">开始:</label>
                <div class="col-sm-2">
                    <asp:TextBox name="control_date" type="text" ID="controldate" size="10" MaxLength="10"
                        onclick="new Calendar().show(this);" runat="server" class="form-control" />
                </div>

                <label class="control-label col-sm-1">结束:</label>
                <div class="col-sm-2">
                    <asp:TextBox name="control_date2" type="text" ID="controldate2" size="10" MaxLength="10"
                        onclick="new Calendar().show(this);" runat="server" class="form-control" />
                </div>
                <div class="col-sm-1">
                    <asp:Button runat="server" ID="Button1" Text="查询" OnClick="Go_Click" CssClass="btn btn-info" />
                </div>

            </div>

        </asp:Panel>
        <asp:Panel runat="server" ID="paneOverView" Visible="false">
            <table cellpadding="0" cellspacing="0" class="table-condensed" align="left" style="margin-top: 30px;">
                <tr class="row1Summary">
                    <td colspan="2" style="text-align: center; font-weight: bold; font-size: 16px">2016年上报统计
                    </td>
                </tr>
                <tr style="background-color:#ccc">
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
                <tr style="background-color:#ccc">
                    <td class="tableOverview1">患者年龄
                    </td>
                    <td class="tableOverview2">
                        <%=AvaAge%>
                    </td>
                </tr>
                <tr class="row1Summary">
                    <td class="tableOverview1">溶栓人数
                    </td>
                    <td class="tableOverview2">
                        <%=TotalRongShuan%>
                    </td>
                </tr>
                <tr style="background-color:#ccc">
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
                <tr style="background-color:#f1f1f1">
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
