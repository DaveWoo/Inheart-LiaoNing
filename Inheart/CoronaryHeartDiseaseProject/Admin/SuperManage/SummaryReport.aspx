<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SummaryReport.aspx.cs"
    Inherits="CoronaryHeartDiseaseProject.Admin.SummaryReport" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <link href="../../Styles/main.css" type="text/css" rel="stylesheet" />
    <title></title>
    <script src="../../Scripts/calendar3.js" type="text/javascript"></script>
    <style>
        body
        {
            font-size: 14px;
        }
        .header
        {
            font: 9pt Tahoma, Verdana;
            font-weight: bold;
        }
        .headerCell
        {
            font: 9pt Tahoma, Verdana;
            color: #333;
            font-weight: bold;
            background-color: #c7d1e0;
        }
        .ButtonSave1
        {
            background: #24B1DC;
            filter: progid:DXImageTransform.Microsoft.Gradient(startColorstr='#84B0DC',endColorstr='#ffffff', gradientType='0')progid:DXImageTransform.Microsoft.dropshadow(OffX=2, OffY=2, Color='#8b9b99', Positive='true');
            color: black;
            font-family: Comic Sans MS;
            font-size: 18px;
            font-weight: bold;
            cursor: pointer;
            text-align: center;
            vertical-align: middle;
        }
        .style12
        {
            width: 228px;
        }
        #query
        {
            margin-left: 23px;
        }
        .tableOverview1
        {
            width: 200px;
            text-align: center;
        }
        .tableOverview2
        {
            width: 200px;
            text-align: center;
        }
        .row1
        {
            text-align: center;
            width: 33%;
            height: 25px;
            background-image: url('/Images/bj.jpg');
        }
        .table1
        {
            width: 80%;
            border-color: #C2BCBE;
            border: 1px;
            vertical-align: middle;
        }
        
        .row2
        {
            text-align: center;
            height: 25px;
            background-color: #F2F9FF;
        }
        .Column5
        {
            text-align: center;
        }
    </style>
</head>
<body style="padding-left: 10px;">
    <form id="form1" runat="server">
    <asp:Panel runat="server" ID="panelQuery" Visible="false">
        <div style="margin-bottom: 50px;">
            <table border="0" cellpadding="0" cellspacing="0" style="margin-top: 10px;" align="center">
                <tr style="height: 60px;">
                    <td style="color: Red; font-size: 20px;" colspan="3" align="center">
                        请选择统计时期，不选择则统计全部！
                    </td>
                </tr>
                <tr style="height: 60px;">
                    <td>
                        按时间段查询：
                    </td>
                    <td class="style12">
                        起
                        <asp:TextBox name="control_date" type="text" ID="controldate" size="10" MaxLength="10"
                            onclick="new Calendar().show(this);" runat="server" Width="182px" />
                    </td>
                    <td>
                        止
                        <asp:TextBox name="control_date2" type="text" ID="controldate2" size="10" MaxLength="10"
                            onclick="new Calendar().show(this);" runat="server" Width="182px" />
                    </td>
                </tr>
                <tr style="height: 60px;">
                    <td colspan="3" align="center">
                        <asp:Button runat="server" ID="Button1" Text="查询" OnClick="Go_Click" CssClass="ButtonSave1"
                            Height="35px" />
                    </td>
                </tr>
            </table>
        </div>
    </asp:Panel>
    <asp:Panel runat="server" ID="paneOverView" Visible="false">
        <table cellpadding="0" cellspacing="0" class="table1" align="center" style="margin-top: 100px;">
            <tr class="row1">
                <td colspan="2" style="text-align: center; font-weight: bold;">
                    2012年上报统计
                </td>
            </tr>
            <tr>
                <td class="tableOverview1">
                    患者总人数
                </td>
                <td class="tableOverview2">
                    <%=Total%>
                </td>
            </tr>
            <tr class="row1">
                <td class="tableOverview1">
                    患者性别
                </td>
                <td class="tableOverview2">
                    <table border="0" cellpadding="0" cellspacing="0" style="width: 200px" align="center">
                        <tr>
                            <td>
                                男 （<%=Male%>)&nbsp;&nbsp;|&nbsp;&nbsp; 女 （<%=Female%>）
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td class="tableOverview1">
                    患者年龄
                </td>
                <td class="tableOverview2">
                    <%=Equation%>
                </td>
            </tr>
            <tr class="row1">
                <td class="tableOverview1">
                    溶栓人数
                </td>
                <td class="tableOverview2">
                    <%=TotalRongShuan%>
                </td>
            </tr>
            <tr>
                <td class="tableOverview1">
                    急诊介入人数
                </td>
                <td class="tableOverview2">
                    <%=TotalJiZhen%>
                </td>
            </tr>
            <tr class="row1">
                <td class="tableOverview1">
                    死亡人数
                </td>
                <td class="tableOverview2">
                    <%=TotalDeath%>
                </td>
            </tr>
            <tr>
                <td class="tableOverview1">
                    转上级医院患者数
                </td>
                <td class="tableOverview2">
                    <%=TotalTransfer%>
                </td>
            </tr>
        </table>
    </asp:Panel>
    <asp:Panel runat="server" ID="panelSum" Visible="false">
        <table cellpadding="0" cellspacing="0" class="table1" align="center">
            <tr>
                <td class="row1">
                    <strong>总数</strong>
                </td>
            </tr>
            <tr>
                <td class="row2">
                    <%=Total%>
                </td>
            </tr>
        </table>
    </asp:Panel>
    <asp:Panel runat="server" ID="panelSex" Visible="false">
        <table cellpadding="0" cellspacing="0" class="table1" align="center">
            <tr>
                <td class="row1">
                    <strong>男</strong>
                </td>
                <td class="row1">
                    <strong>女</strong>
                </td>
            </tr>
            <tr>
                <td class="row2">
                    <%=Total%>
                </td>
                <td class="row2">
                    <%=Male%>
                </td>
            </tr>
        </table>
    </asp:Panel>
    <asp:Panel runat="server" ID="panelAge" Visible="false">
        <table cellpadding="0" cellspacing="0" class="table1" align="center">
            <tr class="row1">
                <td class="Column5">
                    <strong>40岁以下</strong>
                </td>
                <td class="Column5">
                    <strong>41～50岁</strong>
                </td>
                <td class="Column5">
                    <strong>51～60岁</strong>
                </td>
                <td class="Column5">
                    <strong>61～70岁</strong>
                </td>
                <td class="Column5">
                    <strong>70岁以上</strong>
                </td>
            </tr>
            <tr>
                <td class="Column5">
                    <%=BelowForty%>
                </td>
                <td class="Column5">
                    <%=FortyFifty%>
                </td>
                <td class="Column5">
                    <%=FiftySixty%>
                </td>
                <td class="Column5">
                    <%=SixtySeventy%>
                </td>
                <td class="Column5">
                    <%=SeventyOldeer%>
                </td>
            </tr>
        </table>
    </asp:Panel>
    <asp:Panel runat="server" ID="panelThrombolysis" Visible="false">
        <table cellpadding="0" cellspacing="0" class="table1" align="center">
            <tr>
                <td class="row1">
                    <strong>溶栓人数</strong>
                </td>
            </tr>
            <tr>
                <td class="row2">
                    <%=TotalRongShuan%>
                </td>
            </tr>
        </table>
    </asp:Panel>
    <asp:Panel runat="server" ID="panelEmergencyTreate" Visible="false">
        <table cellpadding="0" cellspacing="0" class="table1" align="center">
            <tr>
                <td class="row1">
                    <strong>急诊介入治疗</strong>
                </td>
            </tr>
            <tr>
                <td class="row2">
                    <%=TotalJiZhen%>
                </td>
            </tr>
        </table>
    </asp:Panel>
    <asp:Panel runat="server" ID="panelDeathCount" Visible="false">
        <table cellpadding="0" cellspacing="0" class="table1" align="center">
            <tr>
                <td class="row1">
                    <strong>死亡人数</strong>
                </td>
            </tr>
            <tr>
                <td class="row2">
                    <%=TotalDeath%>
                </td>
            </tr>
        </table>
    </asp:Panel>
    <asp:Panel runat="server" ID="panelTransferUpHospitalCount" Visible="false">
        <table cellpadding="0" cellspacing="0" class="table1" align="center">
            <tr>
                <td class="row1">
                    <strong>转上级医院人数</strong>
                </td>
            </tr>
            <tr>
                <td class="row2">
                    <%=TotalTransfer%>
                </td>
            </tr>
        </table>
    </asp:Panel>
    </form>
</body>
</html>
