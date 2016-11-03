<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MessageInput.aspx.cs" Inherits="CoronaryHeartDiseaseProject.MessageInput" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <link href="Styles/main.css" type="text/css" rel="stylesheet" />
    <script src="Scripts/My97DatePicker/WdatePicker.js" type="text/javascript"></script>
    <script src="Scripts\Calendar3.js" type="text/javascript"></script>
    <script type="text/javascript">
        // fix for deprecated method in Chrome 37
        if (!window.showModalDialog) {
            window.showModalDialog = function (arg1, arg2, arg3) {

                var w;
                var h;
                var resizable = "no";
                var scroll = "no";
                var status = "no";

                // get the modal specs
                var mdattrs = arg3.split(";");
                for (i = 0; i < mdattrs.length; i++) {
                    var mdattr = mdattrs[i].split(":");

                    var n = mdattr[0];
                    var v = mdattr[1];
                    if (n) { n = n.trim().toLowerCase(); }
                    if (v) { v = v.trim().toLowerCase(); }

                    if (n == "dialogheight") {
                        h = v.replace("px", "");
                    } else if (n == "dialogwidth") {
                        w = v.replace("px", "");
                    } else if (n == "resizable") {
                        resizable = v;
                    } else if (n == "scroll") {
                        scroll = v;
                    } else if (n == "status") {
                        status = v;
                    }
                }

                var left = window.screenX + (window.outerWidth / 2) - (w / 2);
                var top = window.screenY + (window.outerHeight / 2) - (h / 2);
                var targetWin = window.open(arg1, arg2, 'toolbar=no, location=no, directories=no, status=' + status + ', menubar=no, scrollbars=' + scroll + ', resizable=' + resizable + ', copyhistory=no, width=' + w + ', height=' + h + ', top=' + top + ', left=' + left);
                targetWin.document.write(arg2);
                targetWin.focus();
            };
        }
    </script>
    <script language="javaScript">

        function alert(msg, title, fontColor, width, height) {
            var content;
            content = "<html><head><title>" + title + "</title></head>";
            content += "<body   bgcolor='#f0fafc'>";
            content += "<font   color='" + fontColor + "'; padding:5px>" + msg + "</font>";
            content += "<br><center><button   style='width:80px; margin-top:20px'   onclick='window.close();'>确   定</button></center>";
            content += "</body></html>";
            var x = window.showModalDialog("alert.htm", content, "dialogWidth:" + width + "px;dialogHeight:" + height + "px;status:no;help:no");
        }
    </script>
    <script language="javascript" src="Scripts/Preview.js" type="text/javascript">
        var pb_strConfirmCloseMessage;
        var pb_blnCloseWindow = false;
        pb_strConfirmCloseMessage = "确实要离开该页面吗?您的文章内容还没有进行保存！按“提交”继续，或按“取消”留在当前页面。";
        function ConfirmClose() {
            if (pb_blnCloseWindow == false) {
                window.event.returnValue = pb_strConfirmCloseMessage;
                pb_blnCloseWindow = true;
            }
        }

        function ShowConfirmClose(blnValue) {
            if (blnValue) {
                document.body.onbeforeunload = ConfirmClose;
            } else {
                document.body.onbeforeunload = null;
            }
        }

        if (window.print) {
            document.write('<form><input type=button name=print value="Print" onClick="window.print()"></form>');
        }

    </script>
    <script language="javascript" type="text/javascript">
        function ST1() {
            alert("急性ST段抬高性心肌梗死（STEMI） <br\>满足（1）或（2）任一项：  <br\>（1）缺血症状(静息时发作疼痛，气短，压榨样不适；或逐渐加重的上述症状；研究者确认症状继发于缺血)；   <br\>（2）ECG变化与心肌梗死改变一致：   <br\>    在没有既往左室高电压或传导异常的情况下在2个连续导联新出现显著的Q波(或V1-V2出现显著增高的R波)；<br\>≥2个连续导联有ST段抬高0.1mV以上; <br\>    出现新的左束支传导阻滞； <br\>（3）心肌标志物：<br\>    肌钙蛋白：定量检测位于心肌坏死的诊断范围内，否则至少其他的心肌标志物之一必须>2倍ULN； CK-MB ≥ULN。 ", "急性ST段抬高性心肌梗死（STEMI）", "#000000", 600, 300);
        }

        function NonST() {
            alert("急性非ST段抬高性心肌梗死（NSTEMI） <br\>（1）缺血症状(静息时发作疼痛，气短，压榨样不适；<br\>或逐渐加重的上述症状；研究者确认症状继发于缺血)；<br\>（2）ECG一过性ST段抬高，或ST段压低，或与心肌缺血相符的T波改变；  <br\>（3）伴有心肌坏死的生物标记物升高（CK和CK-MB或肌钙蛋白）,达到心肌梗死诊断标准。", "急性非ST段抬高性心肌梗死（NSTEMI）", "#000000", 600, 250);
        }

        function Other() {
            alert("不稳定型心绞痛： <br\>（1） 缺血症状(静息时发作疼痛，气短，压榨样不适；<br\>        或逐渐加重的上述症状；研究者确认症状继发于缺血)；  <br\>（2） ECG在一个或多个导联上有一过性或持久性ST段偏移0.1mV或0.1mV以上； <br\>（3） 不伴有心肌坏死的生物标记物升高（CK和CK-MB或肌钙蛋白）或心肌坏死的生物标记物升高但未达到心肌梗死诊断标准。 ", "不稳定型心绞痛", "#000000", 600, 250);
        }
    </script>
    <style type="text/css">
        .style14 {
            width: 458px;
        }
    </style>
    <title>病例表单</title>
</head>
<body onunload="return '你确实要关闭吗?'">
    <form id="form1" runat="server">
        <asp:Panel ID="Panel1" runat="server" Enabled="true">
            <asp:ScriptManager ID="sc" runat="server">
            </asp:ScriptManager>
            <asp:UpdateProgress ID="UpdateProgress1" runat="server" DisplayAfter="5" DynamicLayout="true">
                <ProgressTemplate>
                    <%-- <span style="color: Red; position: absolute; font-size: 14px; padding: 5px; width: auto;
					top: 70%; left: 50%;">Loading.....</span>--%>
                </ProgressTemplate>
            </asp:UpdateProgress>
            <table class="UserTableBorder" cellspacing="0" cellpadding="0" align="left" border="0">
                <tr>
                    <td class="style9" style="display: none">
                        <asp:Label ID="lblMessage" runat="server" Width="700px" ForeColor="Red"></asp:Label>
                    </td>
                </tr>
                <tr onmouseover="this.className='highlight'" onmouseout="this.className='normal'">
                    <td class="THTitle">电子病历
                    </td>
                </tr>
                <%-- 一般资料--%>
                <tr onmouseover="this.className='highlight'" onmouseout="this.className='normal'">
                    <td>
                        <table cellpadding="0" cellspacing="0" border="0" class="category-item">
                            <tr>
                                <td class="subTitleTip">提示：<br />
                                    1、请在收治10天内录入病例；提交10天后将不允许修改。
                                <asp:Label ID="lblErrorMessage" runat="server" Text="" ForeColor="Red"></asp:Label>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <%-- 一般资料--%>
                <tr onmouseover="this.className='highlight'" onmouseout="this.className='normal'">
                    <td>
                        <table cellpadding="0" cellspacing="0" border="0" class="category-item">
                            <tr>
                                <td class="subTitle">一般资料
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <table cellpadding="0" cellspacing="0" border="0">
                                        <tr>
                                            <td class="Column1JiBing1">姓名:
                                            </td>
                                            <td class="Column2ZhuSuXianBingShi">
                                                <asp:TextBox ID="txtPatientName" runat="server" TabIndex="10" ToolTip="姓名不能为空."></asp:TextBox>
                                            </td>
                                            <td class="Column3">性别：
                                            </td>
                                            <td class="Column4">
                                                <asp:DropDownList ID="dropDownSex" runat="server" TabIndex="12" Width="166px" ToolTip="请选择性别.">
                                                    <asp:ListItem Selected="True">请选择</asp:ListItem>
                                                    <asp:ListItem>男</asp:ListItem>
                                                    <asp:ListItem>女</asp:ListItem>
                                                </asp:DropDownList>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <table cellpadding="0" cellspacing="0" border="0">
                                        <tr>
                                            <td class="Column1JiBing1">民族（国籍）：
                                            </td>
                                            <td class="Column2ZhuSuXianBingShi">
                                                <asp:DropDownList ID="dropNationality" runat="server" TabIndex="16" Width="166px"
                                                    ToolTip="不能为空">
                                                    <asp:ListItem Selected="True" Text="请选择" Value="-1"></asp:ListItem>
                                                    <asp:ListItem Text="汉族" Value="1"></asp:ListItem>
                                                    <asp:ListItem Text="满族" Value="2"></asp:ListItem>
                                                    <asp:ListItem Text="朝鲜族" Value="3"></asp:ListItem>
                                                    <asp:ListItem Text="回族" Value="4"></asp:ListItem>
                                                    <asp:ListItem Text="蒙古族" Value="5"></asp:ListItem>
                                                    <asp:ListItem Text="其他" Value="55"></asp:ListItem>
                                                    <asp:ListItem Text="外籍" Value="56"></asp:ListItem>
                                                </asp:DropDownList>
                                            </td>
                                            <td class="Column3">职业：
                                            </td>
                                            <td class="Column4">
                                                <asp:DropDownList ID="DropDownListJob" runat="server" CssClass="TextBoxSyle" TabIndex="16"
                                                    ToolTip="不能为空" Width="166px">
                                                    <asp:ListItem Selected="True" Text="请选择" Value="-1"></asp:ListItem>
                                                    <asp:ListItem Text="工人" Value="1"></asp:ListItem>
                                                    <asp:ListItem Text="农民" Value="2"></asp:ListItem>
                                                    <asp:ListItem Text="军人" Value="3"></asp:ListItem>
                                                    <asp:ListItem Text="学生" Value="4"></asp:ListItem>
                                                    <asp:ListItem Text="专业技术人员" Value="5"></asp:ListItem>
                                                    <asp:ListItem Text="商业从业人员" Value="55"></asp:ListItem>
                                                    <asp:ListItem Text="职员" Value="55"></asp:ListItem>
                                                    <asp:ListItem Text="其他" Value="55"></asp:ListItem>
                                                </asp:DropDownList>
                                            </td>
                                        </tr>
                                        <script>
                                            function PopCalendar(obj) {
                                                showx = event.screenX - event.offsetX;  // + deltaX;
                                                showy = event.screenY - event.offsetY - 168; // + deltaY;
                                                window.showModalDialog("calendar.htm", obj, "dialogWidth:180px; dialogHeight:230px; dialogTop:" + showy + "px; status:no; directories:yes;scrollbars:no;Resizable=no; ");
                                            }
                                        </script>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <table cellpadding="0" cellspacing="0" border="0">
                                        <tr>
                                            <td class="Column1JiBing1">出生日期:
                                            </td>
                                            <td class="Column2ZhuSuXianBingShi">
                                                <asp:TextBox ID="txbBirthDay" runat="server" Width="150px" AutoPostBack="true" onfocus="new Calendar().show(this);"
                                                    OnTextChanged="txbBirthDay_TextChanged" ToolTip="出生日期不能为空."></asp:TextBox>
                                            </td>
                                            <td class="Column3">年龄：
                                            </td>
                                            <td class="Column4">
                                                <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
                                                    <ContentTemplate>
                                                        <asp:TextBox ID="txtAge" runat="server" Enabled="false" Text="..." Width="148px"
                                                            Height="20px" />
                                                    </ContentTemplate>
                                                    <Triggers>
                                                        <%-- <asp:AsyncPostBackTrigger ControlID="txbBirthDay" EventName="TextChanged" />--%>
                                                    </Triggers>
                                                </asp:UpdatePanel>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <table cellpadding="0" cellspacing="0" border="0">
                                        <tr style="border: solid;">
                                            <td class="Column1JiBing1">就诊时间:
                                            </td>
                                            <td class="Column2ZhuSuXianBingShi">
                                                <asp:TextBox ID="txbTreatTime" runat="server" CssClass="Wdate" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm'})"
                                                    Width="151px" ToolTip="就诊时间不能为空."></asp:TextBox>
                                            </td>
                                            <td class="Column3">发病时间:
                                            </td>
                                            <td class="Column4">
                                                <asp:TextBox ID="txtDiseaseHour" runat="server" Width="99px" ToolTip="不能为空" />
                                                小时
                                            <asp:CustomValidator ID="cusValidatorAge" runat="server" ControlToValidate="txtDiseaseHour"
                                                Display="Dynamic" ErrorMessage="无效时间." OnServerValidate="ServerValidation" ValidateEmptyText="false"></asp:CustomValidator>
                                                <script runat="server">

                                                    void ServerValidation(object source, ServerValidateEventArgs args)
                                                    {
                                                        try
                                                        {
                                                            int i = int.Parse(args.Value);
                                                            args.IsValid = true;
                                                        }
                                                        catch (Exception ex)
                                                        {
                                                            args.IsValid = false;
                                                        }
                                                    }
                                                </script>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <table cellpadding="0" cellspacing="0" border="0">
                                        <tr>
                                            <td class="Column1JiBing1">病史叙述者:
                                            </td>
                                            <td class="Column2ZhuSuXianBingShi">
                                                <asp:DropDownList ID="ddlDiseaseDescriber" runat="server" TabIndex="12" Width="166px"
                                                    ToolTip="不能为空">
                                                    <asp:ListItem Selected="True">请选择</asp:ListItem>
                                                    <asp:ListItem>患者本人</asp:ListItem>
                                                    <asp:ListItem>患者家属</asp:ListItem>
                                                </asp:DropDownList>
                                            </td>
                                            <td class="Column3">来院方式:
                                            </td>
                                            <td class="Column4">
                                                <asp:DropDownList ID="ddlTrafficWay" runat="server" TabIndex="12" Width="166px" ToolTip="不能为空">
                                                    <asp:ListItem Selected="True">请选择</asp:ListItem>
                                                    <asp:ListItem>乘救护车</asp:ListItem>
                                                    <asp:ListItem>乘其它交通工具</asp:ListItem>
                                                    <asp:ListItem>步行</asp:ListItem>
                                                </asp:DropDownList>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <table cellpadding="0" cellspacing="0" border="0">
                                        <tr>
                                            <td class="Column1JiBing1">可靠程度:
                                            </td>
                                            <td class="Column2ZhuSuXianBingShi">
                                                <asp:DropDownList ID="ddlReliability" runat="server" TabIndex="12" Width="166px"
                                                    ToolTip="不能为空">
                                                    <asp:ListItem Selected="True">请选择</asp:ListItem>
                                                    <asp:ListItem>可靠</asp:ListItem>
                                                    <asp:ListItem>不可靠</asp:ListItem>
                                                </asp:DropDownList>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <%-- 主诉和现病史--%>
                <tr onmouseover="this.className='highlight'" onmouseout="this.className='normal'">
                    <td>
                        <table cellpadding="0" cellspacing="0" class="category-item">
                            <tr>
                                <td class="subTitle">主诉和现病史
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:UpdatePanel runat="server" ID="UpdatePanel29">
                                        <ContentTemplate>
                                            <table cellpadding="0" cellspacing="0" border="0">
                                                <tr>
                                                    <td class="Column1JiBing1">胸痛（闷）:
                                                    </td>
                                                    <td>
                                                        <asp:RadioButtonList ToolTip="不能为空" AutoPostBack="true" ID="rblChestPainExist" runat="server"
                                                            RepeatDirection="Horizontal" RepeatLayout="Flow">
                                                            <asp:ListItem>无</asp:ListItem>
                                                            <asp:ListItem>有</asp:ListItem>
                                                        </asp:RadioButtonList>
                                                    </td>
                                                </tr>
                                            </table>
                                        </ContentTemplate>
                                        <Triggers>
                                            <asp:AsyncPostBackTrigger ControlID="rblChestPainExist" EventName="SelectedIndexChanged" />
                                        </Triggers>
                                    </asp:UpdatePanel>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:UpdatePanel runat="server" ID="UpdatePanel18">
                                        <ContentTemplate>
                                            <table cellpadding="0" cellspacing="0" border="0">
                                                <tr>
                                                    <td class="Column1JiBing1">诱因:
                                                    </td>
                                                    <td class="Column2ZhuSuXianBingShi">
                                                        <asp:RadioButtonList ToolTip="不能为空" AutoPostBack="true" ID="rblIncentiveExist" runat="server"
                                                            RepeatDirection="Horizontal" RepeatLayout="Flow" OnSelectedIndexChanged="rblIncentiveExist_SelectedIndexChanged">
                                                            <asp:ListItem>无</asp:ListItem>
                                                            <asp:ListItem>有</asp:ListItem>
                                                        </asp:RadioButtonList>
                                                    </td>
                                                    <td>
                                                        <asp:Panel runat="server" ID="PanelrblIncentiveType">
                                                            <asp:CheckBox runat="server" Text="体力活动" ID="chkIncentiveTypePhysical" />
                                                            <asp:CheckBox runat="server" Text="情绪激动" ID="chkIncentiveTypeExcite" />
                                                            <asp:CheckBox runat="server" Text="饱餐" ID="chkIncentiveTypeEatMuch" />
                                                            <asp:CheckBox runat="server" Text="排便" ID="chkIncentiveTypeDefecate" /><br />
                                                            <asp:CheckBox runat="server" Text="寒冷刺激" ID="chkIncentiveTypeColdStimulation" />
                                                            <asp:CheckBox runat="server" Text="其他" ID="chkIncentiveTypeOther" />
                                                        </asp:Panel>
                                                    </td>
                                                </tr>
                                            </table>
                                        </ContentTemplate>
                                        <Triggers>
                                            <asp:AsyncPostBackTrigger ControlID="rblIncentiveExist" EventName="SelectedIndexChanged" />
                                        </Triggers>
                                    </asp:UpdatePanel>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:UpdatePanel runat="server" ID="UpdatePanel19">
                                        <ContentTemplate>
                                            <table cellpadding="0" cellspacing="0" border="0">
                                                <tr>
                                                    <td class="Column1JiBing1">部位:
                                                    </td>
                                                    <td class="Column2ZhuSuXianBingShi">
                                                        <asp:RadioButtonList ToolTip="不能为空" AutoPostBack="true" ID="rblPositionExist" runat="server"
                                                            RepeatDirection="Horizontal" RepeatLayout="Flow" OnSelectedIndexChanged="rblPositionExist_SelectedIndexChanged">
                                                            <asp:ListItem>无</asp:ListItem>
                                                            <asp:ListItem>有</asp:ListItem>
                                                        </asp:RadioButtonList>
                                                    </td>
                                                    <td>
                                                        <asp:Panel runat="server" ID="PanelrblPositionType">
                                                            <asp:CheckBox runat="server" Text="心前区或胸骨后" ID="chkPositionTypePrecordium" />
                                                            <asp:CheckBox runat="server" Text="咽颈部" ID="chkPositionTypeChest" /><br />
                                                            <asp:CheckBox runat="server" Text="剑突下或上腹部" ID="chkPositionTypeBelowXiphoid" />
                                                            <asp:CheckBox runat="server" Text="肩背部" ID="chkPositionTypeShoulder" />
                                                            <asp:CheckBox runat="server" Text="其他" ID="chkPositionTypeOther" />
                                                        </asp:Panel>
                                                    </td>
                                                </tr>
                                            </table>
                                        </ContentTemplate>
                                        <Triggers>
                                            <asp:AsyncPostBackTrigger ControlID="rblPositionExist" EventName="SelectedIndexChanged" />
                                        </Triggers>
                                    </asp:UpdatePanel>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <table cellpadding="0" cellspacing="0" border="0">
                                        <tr>
                                            <td class="Column1JiBing1">性质:
                                            </td>
                                            <td>
                                                <asp:CheckBox runat="server" Text="胸闷痛或压缩感" ID="chkPropertiesTypeChestPain" />
                                                <asp:CheckBox runat="server" Text="咽部痛或紧缩感" ID="chkPropertiesTypePharyngeal" />
                                                <asp:CheckBox runat="server" Text="胸部刀割或烧心感" ID="chkPropertiesTypeChestCut" />
                                                <asp:CheckBox runat="server" Text="其他" ID="chkPropertiesTypeOther" />
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:UpdatePanel runat="server" ID="UpdatePanel20">
                                        <ContentTemplate>
                                            <table cellpadding="0" cellspacing="0" border="0">
                                                <tr>
                                                    <td class="Column1JiBing1">放射痛部位:
                                                    </td>
                                                    <td class="Column2ZhuSuXianBingShi">
                                                        <asp:RadioButtonList ToolTip="不能为空" AutoPostBack="true" ID="rblRadiationPainExist"
                                                            runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow" OnSelectedIndexChanged="rblRadiationPainExist_SelectedIndexChanged">
                                                            <asp:ListItem>无</asp:ListItem>
                                                            <asp:ListItem>有</asp:ListItem>
                                                        </asp:RadioButtonList>
                                                    </td>
                                                    <td>
                                                        <asp:Panel runat="server" ID="PanelrblRadiationPainType">
                                                            <asp:CheckBox runat="server" Text="左肩臂部" ID="chkRadiationPainTypeLeftShoulder" />
                                                            <asp:CheckBox runat="server" Text="咽部痛咽颈颌面部或紧缩感" ID="chkRadiationPainTypePharyngeal" />
                                                            <br />
                                                            <asp:CheckBox runat="server" Text="上腹部" ID="chkRadiationPainTypeEpigastralgia" />
                                                            <asp:CheckBox runat="server" Text="其他" ID="chkRadiationPainTypeOther" />
                                                        </asp:Panel>
                                                    </td>
                                                </tr>
                                            </table>
                                        </ContentTemplate>
                                        <Triggers>
                                            <asp:AsyncPostBackTrigger ControlID="rblRadiationPainExist" EventName="SelectedIndexChanged" />
                                        </Triggers>
                                    </asp:UpdatePanel>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:UpdatePanel runat="server" ID="UpdatePanel21">
                                        <ContentTemplate>
                                            <table cellpadding="0" cellspacing="0" border="0">
                                                <tr>
                                                    <td class="Column1JiBing1">伴随症状:
                                                    </td>
                                                    <td class="Column2ZhuSuXianBingShi">
                                                        <asp:RadioButtonList ToolTip="不能为空" AutoPostBack="true" ID="rblConcomitantSymptomExist"
                                                            runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow" OnSelectedIndexChanged="rblConcomitantSymptomExist_SelectedIndexChanged">
                                                            <asp:ListItem>无</asp:ListItem>
                                                            <asp:ListItem>有</asp:ListItem>
                                                        </asp:RadioButtonList>
                                                    </td>
                                                    <td>
                                                        <asp:Panel runat="server" ID="PanelrblConcomitantSymptomType">
                                                            <asp:CheckBox runat="server" Text="心悸" ID="chkConcomitantSymptomTypePalpitation" />
                                                            <asp:CheckBox runat="server" Text="劳力性呼吸困难" ID="chkConcomitantSymptomTypeTiredBreath" />
                                                            <asp:CheckBox runat="server" Text="黑朦" ID="chkConcomitantSymptomTypeAmaurosis" />
                                                            <asp:CheckBox runat="server" Text="晕厥" ID="chkConcomitantSymptomTypeSyncope" /><br />
                                                            <asp:CheckBox runat="server" Text="其他" ID="chkConcomitantSymptomTypeOther" />
                                                        </asp:Panel>
                                                    </td>
                                                </tr>
                                            </table>
                                        </ContentTemplate>
                                        <Triggers>
                                            <asp:AsyncPostBackTrigger ControlID="rblConcomitantSymptomExist" EventName="SelectedIndexChanged" />
                                        </Triggers>
                                    </asp:UpdatePanel>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <table cellpadding="0" cellspacing="0" border="0">
                                        <tr>
                                            <td class="Column1JiBing1">缓解因素:
                                            </td>
                                            <td>
                                                <asp:CheckBox runat="server" Text="休息" ID="chkRelievingFactorsRest" />
                                                <asp:CheckBox runat="server" Text="硝酸酯类药物" ID="chkRelievingFactorsNitrate" />
                                                <asp:CheckBox runat="server" Text="钙拮抗剂" ID="chkRelievingFactorsCaRivalry" />
                                                <asp:CheckBox runat="server" Text="其他" ID="chkRelievingFactorsOther" />
                                                <br />
                                                <asp:CheckBox runat="server" Text="持续不缓解" ID="chkRelievingFactorsLastRespond" />
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <%-- 既往病史：--%>
                <tr onmouseover="this.className='highlight'" onmouseout="this.className='normal'">
                    <td>
                        <table cellpadding="0" cellspacing="0" border="0" class="category-item">
                            <tr>
                                <td class="subTitle">既往病史
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <table cellpadding="0" cellspacing="0" border="0">
                                        <tr>
                                            <td class="Column1JiBing1">心肌梗死：
                                            </td>
                                            <td class="Column2JiWangBingShi">
                                                <asp:RadioButtonList ToolTip="不能为空" AutoPostBack="false" ID="rblMIConfirm" runat="server"
                                                    RepeatDirection="Horizontal" RepeatLayout="Flow" TabIndex="61">
                                                    <asp:ListItem>无</asp:ListItem>
                                                    <asp:ListItem>不肯定</asp:ListItem>
                                                    <asp:ListItem>肯定</asp:ListItem>
                                                </asp:RadioButtonList>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:UpdatePanel runat="server" ID="UpdatePanel22">
                                        <ContentTemplate>
                                            <table cellpadding="0" cellspacing="0" border="0">
                                                <tr>
                                                    <td class="Column1JiBing1">高血压：
                                                    </td>
                                                    <td class="Column2JiWangBingShi">
                                                        <asp:RadioButtonList ToolTip="不能为空" AutoPostBack="true" ID="rblHypertensionConfirm"
                                                            runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow" TabIndex="61"
                                                            OnSelectedIndexChanged="rblHypertensionConfirm_SelectedIndexChanged">
                                                            <asp:ListItem>无</asp:ListItem>
                                                            <asp:ListItem>不肯定</asp:ListItem>
                                                            <asp:ListItem>肯定</asp:ListItem>
                                                        </asp:RadioButtonList>
                                                    </td>
                                                    <td>
                                                        <asp:Panel runat="server" ID="PanelddlHypertensionLasted">
                                                            病程(年):&nbsp;
                                                        <asp:DropDownList ID="ddlHypertensionLasted" runat="server" RepeatDirection="Horizontal"
                                                            RepeatLayout="Flow" TabIndex="61" Width="120px">
                                                            <asp:ListItem>0</asp:ListItem>
                                                            <asp:ListItem>1</asp:ListItem>
                                                            <asp:ListItem>2</asp:ListItem>
                                                            <asp:ListItem>3</asp:ListItem>
                                                            <asp:ListItem>4</asp:ListItem>
                                                            <asp:ListItem>5</asp:ListItem>
                                                            <asp:ListItem>6</asp:ListItem>
                                                            <asp:ListItem>7</asp:ListItem>
                                                            <asp:ListItem>8</asp:ListItem>
                                                            <asp:ListItem>9</asp:ListItem>
                                                            <asp:ListItem>10</asp:ListItem>
                                                            <asp:ListItem>11</asp:ListItem>
                                                            <asp:ListItem>12</asp:ListItem>
                                                            <asp:ListItem>13</asp:ListItem>
                                                            <asp:ListItem>14</asp:ListItem>
                                                            <asp:ListItem>15</asp:ListItem>
                                                            <asp:ListItem>16</asp:ListItem>
                                                            <asp:ListItem>17</asp:ListItem>
                                                            <asp:ListItem>18</asp:ListItem>
                                                            <asp:ListItem>19</asp:ListItem>
                                                            <asp:ListItem>20</asp:ListItem>
                                                            <asp:ListItem>20年以上</asp:ListItem>
                                                        </asp:DropDownList>
                                                            <br />
                                                            治疗状况:
                                                        <asp:DropDownList ID="ddlHypertensionTreatedState" runat="server" RepeatDirection="Horizontal"
                                                            RepeatLayout="Flow" TabIndex="61" Width="120px">
                                                            <asp:ListItem>未治疗</asp:ListItem>
                                                            <asp:ListItem>间断用药</asp:ListItem>
                                                            <asp:ListItem>规律用药</asp:ListItem>
                                                        </asp:DropDownList>
                                                        </asp:Panel>
                                                    </td>
                                                </tr>
                                            </table>
                                        </ContentTemplate>
                                        <Triggers>
                                            <asp:AsyncPostBackTrigger ControlID="rblHypertensionConfirm" EventName="SelectedIndexChanged" />
                                        </Triggers>
                                    </asp:UpdatePanel>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:UpdatePanel runat="server" ID="UpdatePanel23">
                                        <ContentTemplate>
                                            <table cellpadding="0" cellspacing="0" border="0">
                                                <tr>
                                                    <td class="Column1JiBing1">糖尿病：
                                                    </td>
                                                    <td class="Column2JiWangBingShi">
                                                        <asp:RadioButtonList ToolTip="不能为空" AutoPostBack="true" ID="rblGlycuresisConfirm"
                                                            runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow" OnSelectedIndexChanged="rblGlycuresisConfirm_SelectedIndexChanged">
                                                            <asp:ListItem>无</asp:ListItem>
                                                            <asp:ListItem>不肯定</asp:ListItem>
                                                            <asp:ListItem>肯定</asp:ListItem>
                                                        </asp:RadioButtonList>
                                                    </td>
                                                    <td>
                                                        <asp:Panel runat="server" ID="PanelddlGlycuresisLasted">
                                                            病程(年):&nbsp;
                                                        <asp:DropDownList ID="ddlGlycuresisLasted" runat="server" RepeatDirection="Horizontal"
                                                            RepeatLayout="Flow" TabIndex="61" Width="120px">
                                                            <asp:ListItem>0</asp:ListItem>
                                                            <asp:ListItem>1</asp:ListItem>
                                                            <asp:ListItem>2</asp:ListItem>
                                                            <asp:ListItem>3</asp:ListItem>
                                                            <asp:ListItem>4</asp:ListItem>
                                                            <asp:ListItem>5</asp:ListItem>
                                                            <asp:ListItem>6</asp:ListItem>
                                                            <asp:ListItem>7</asp:ListItem>
                                                            <asp:ListItem>8</asp:ListItem>
                                                            <asp:ListItem>9</asp:ListItem>
                                                            <asp:ListItem>10</asp:ListItem>
                                                            <asp:ListItem>11</asp:ListItem>
                                                            <asp:ListItem>12</asp:ListItem>
                                                            <asp:ListItem>13</asp:ListItem>
                                                            <asp:ListItem>14</asp:ListItem>
                                                            <asp:ListItem>15</asp:ListItem>
                                                            <asp:ListItem>16</asp:ListItem>
                                                            <asp:ListItem>17</asp:ListItem>
                                                            <asp:ListItem>18</asp:ListItem>
                                                            <asp:ListItem>19</asp:ListItem>
                                                            <asp:ListItem>20</asp:ListItem>
                                                            <asp:ListItem>20年以上</asp:ListItem>
                                                        </asp:DropDownList>
                                                            <br />
                                                            治疗状况:
                                                        <asp:DropDownList ID="ddlGlycuresisTreatedState" runat="server" RepeatDirection="Horizontal"
                                                            RepeatLayout="Flow" TabIndex="61" Width="120px">
                                                            <asp:ListItem>未治疗</asp:ListItem>
                                                            <asp:ListItem>口服药治疗</asp:ListItem>
                                                            <asp:ListItem>胰岛素治疗</asp:ListItem>
                                                            <asp:ListItem>运动,饮食治疗</asp:ListItem>
                                                        </asp:DropDownList>
                                                        </asp:Panel>
                                                    </td>
                                                </tr>
                                            </table>
                                        </ContentTemplate>
                                        <Triggers>
                                            <asp:AsyncPostBackTrigger ControlID="rblGlycuresisConfirm" EventName="SelectedIndexChanged" />
                                        </Triggers>
                                    </asp:UpdatePanel>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:UpdatePanel runat="server" ID="UpdatePanel24">
                                        <ContentTemplate>
                                            <table cellpadding="0" cellspacing="0" border="0">
                                                <tr>
                                                    <td class="Column1JiBing1">脑卒中：
                                                    </td>
                                                    <td class="Column2JiWangBingShi">
                                                        <asp:RadioButtonList ToolTip="不能为空" AutoPostBack="true" ID="rblCerebralHemorrhageConfirm"
                                                            runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow" OnSelectedIndexChanged="rblCerebralHemorrhageConfirm_SelectedIndexChanged">
                                                            <asp:ListItem>无</asp:ListItem>
                                                            <asp:ListItem>不肯定</asp:ListItem>
                                                            <asp:ListItem>肯定</asp:ListItem>
                                                        </asp:RadioButtonList>
                                                    </td>
                                                    <td>
                                                        <asp:Panel runat="server" ID="PanelrblCerebralHemorrhageTreateLasted">
                                                            发病距此次就诊时间 :<asp:RadioButtonList AutoPostBack="true" ID="rblCerebralHemorrhageTreateLasted"
                                                                runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow">
                                                                <asp:ListItem>3个月内</asp:ListItem>
                                                                <asp:ListItem>3-6个月</asp:ListItem>
                                                                <asp:ListItem>6-12个月</asp:ListItem>
                                                                <asp:ListItem>12个月以上</asp:ListItem>
                                                            </asp:RadioButtonList>
                                                        </asp:Panel>
                                                    </td>
                                                </tr>
                                            </table>
                                        </ContentTemplate>
                                        <Triggers>
                                            <asp:AsyncPostBackTrigger ControlID="rblCerebralHemorrhageConfirm" EventName="SelectedIndexChanged" />
                                        </Triggers>
                                    </asp:UpdatePanel>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <table cellpadding="0" cellspacing="0" border="0">
                                        <tr>
                                            <td class="Column1JiBing1">外围血管病：
                                            </td>
                                            <td class="Column2JiWangBingShi">
                                                <asp:RadioButtonList ToolTip="不能为空" AutoPostBack="false" ID="rblPeripheralVascularConfirm"
                                                    runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow">
                                                    <asp:ListItem>无</asp:ListItem>
                                                    <asp:ListItem>不肯定</asp:ListItem>
                                                    <asp:ListItem>肯定</asp:ListItem>
                                                </asp:RadioButtonList>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td class="l">
                                    <table cellpadding="0" cellspacing="0" border="0">
                                        <tr>
                                            <td class="Column1JiBing1">贫血或其它出血性疾病：
                                            </td>
                                            <td class="Column2JiWangBingShi">
                                                <asp:RadioButtonList ToolTip="不能为空" AutoPostBack="false" ID="rblAnemiaOrOtherConfirm"
                                                    runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow">
                                                    <asp:ListItem>无</asp:ListItem>
                                                    <asp:ListItem>不肯定</asp:ListItem>
                                                    <asp:ListItem>肯定</asp:ListItem>
                                                </asp:RadioButtonList>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <%-- 初步诊断--%>
                <tr onmouseover="this.className='highlight'" onmouseout="this.className='normal'">
                    <td>
                        <table cellpadding="0" cellspacing="0" border="0" class="category-item">
                            <tr>
                                <td class="subTitle">初步诊断
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:UpdatePanel runat="server" ID="UpdatePanel25">
                                        <ContentTemplate>
                                            <table cellpadding="0" cellspacing="0" border="0">
                                                <tr>
                                                    <td class="Column1ZhuSuXianBingShi">
                                                        <asp:RadioButton ID="rdAcuteST" Text="急性ST段抬高性心肌梗死" GroupName="ST" runat="server"
                                                            Checked="true" AutoPostBack="true" OnCheckedChanged="rdAcuteST_CheckedChanged" />
                                                    </td>
                                                    <td>
                                                        <asp:Panel runat="server" ID="PanelrdAcuteST">
                                                            <asp:CheckBox ID="chkAnteroseptal" Text="前间壁" runat="server" />
                                                            <asp:CheckBox ID="chkAntetheca" Text="前壁" runat="server" />
                                                            <asp:CheckBox ID="chkExtensive" Text="广泛前壁" runat="server" />
                                                            <asp:CheckBox ID="chkHeartWall" Text="侧壁" runat="server" />
                                                            <asp:CheckBox ID="chkHighWall" Text="高侧壁" runat="server" />
                                                            <br />
                                                            <asp:CheckBox ID="chkInteriorWall" Text="下壁" runat="server" />
                                                            <asp:CheckBox ID="chkBackWall" Text="后壁" runat="server" />
                                                            <asp:CheckBox ID="chkRightVentricular" Text="右室" runat="server" />
                                                        </asp:Panel>
                                                    </td>
                                                    <td style="width: 110px;">
                                                        <button type="button" onclick="javascript:ST1()" class="treatStand">
                                                            诊断标准</button>
                                                    </td>
                                                </tr>
                                            </table>
                                        </ContentTemplate>
                                        <Triggers>
                                            <asp:AsyncPostBackTrigger ControlID="rdAcuteST" EventName="CheckedChanged" />
                                        </Triggers>
                                    </asp:UpdatePanel>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <%-- 疾病伴随状态--%>
                <tr onmouseover="this.className='highlight'" onmouseout="this.className='normal'">
                    <td>
                        <table cellpadding="0" cellspacing="0" border="0" class="category-item">
                            <tr>
                                <td class="subTitle">疾病伴随状态
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <table cellpadding="0" cellspacing="0" border="0">
                                        <tr>
                                            <td>
                                                <asp:UpdatePanel runat="server" ID="UpdatePanel26">
                                                    <ContentTemplate>
                                                        <table cellpadding="0" cellspacing="0" border="0">
                                                            <tr>
                                                                <td class="Column1JiBing1">心律失常:
                                                                </td>
                                                                <td class="Column2JiBing1">
                                                                    <asp:RadioButtonList ToolTip="不能为空" AutoPostBack="true" ID="ddlArrhythmiaExist" runat="server"
                                                                        RepeatDirection="Horizontal" RepeatLayout="Flow" OnSelectedIndexChanged="ddlArrhythmiaExist_SelectedIndexChanged">
                                                                        <asp:ListItem>无</asp:ListItem>
                                                                        <asp:ListItem>有</asp:ListItem>
                                                                    </asp:RadioButtonList>
                                                                    &nbsp;
                                                                </td>
                                                                <td>
                                                                    <fieldset>
                                                                        <asp:Panel runat="server" ID="PanelddlArrhythmiaExist">
                                                                            <asp:CheckBox ID="chkVPB" Text="室早" runat="server" />
                                                                            <asp:CheckBox ID="chkVT" Text="室速" runat="server" />
                                                                            <asp:CheckBox ID="chkVF" Text="室颤" runat="server" />
                                                                            <asp:CheckBox ID="chmAts" Text="室上性早搏" runat="server" />
                                                                            <br />
                                                                            <asp:CheckBox ID="chkAFS1" Text="房速" runat="server" />
                                                                            <asp:CheckBox ID="chkAF" Text="房颤" runat="server" />
                                                                            <asp:CheckBox ID="chkAPB" Text="窦性心动过缓" runat="server" />
                                                                            <br />
                                                                            房室传导阻滞（<asp:CheckBox ID="chkAVBI" Text="I度" runat="server" />
                                                                            <asp:CheckBox ID="chkAVBII" Text="II度" runat="server" />
                                                                            <asp:CheckBox ID="chkAVBIII" Text="III度" runat="server" />)
                                                                        <br />
                                                                            <asp:CheckBox ID="chkAFS" Text="左束支传导阻滞 " runat="server" />
                                                                            <asp:CheckBox ID="chkRBBB" Text="右束支传导阻滞 " runat="server" />
                                                                            <br />
                                                                            <asp:CheckBox ID="chkAVBOther" Text="其他" runat="server" />
                                                                        </asp:Panel>
                                                                    </fieldset>
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </ContentTemplate>
                                                    <Triggers>
                                                        <asp:AsyncPostBackTrigger ControlID="ddlArrhythmiaExist" EventName="SelectedIndexChanged" />
                                                    </Triggers>
                                                </asp:UpdatePanel>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <table cellpadding="0" cellspacing="0" border="0">
                                        <tr>
                                            <td class="Column1JiBing1">低血压状态:
                                            </td>
                                            <td class="Column2JiBing1">
                                                <asp:RadioButtonList ToolTip="不能为空" AutoPostBack="false" ID="ddlHypotensionExist"
                                                    runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow">
                                                    <asp:ListItem>无</asp:ListItem>
                                                    <asp:ListItem>有</asp:ListItem>
                                                </asp:RadioButtonList>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <table cellpadding="0" cellspacing="0" border="0">
                                        <tr>
                                            <td class="Column1JiBing1">心源性休克:
                                            </td>
                                            <td class="Column2JiBing1">
                                                <asp:RadioButtonList ToolTip="不能为空" AutoPostBack="false" ID="RadioButtonList2" runat="server"
                                                    RepeatDirection="Horizontal" RepeatLayout="Flow">
                                                    <asp:ListItem>无</asp:ListItem>
                                                    <asp:ListItem>有</asp:ListItem>
                                                    <asp:ListItem>不肯定</asp:ListItem>
                                                </asp:RadioButtonList>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <table cellpadding="0" cellspacing="0" border="0">
                                        <tr>
                                            <td class="Column1JiBing1">二尖瓣脱垂或断裂:
                                            </td>
                                            <td class="Column2JiBing1">
                                                <asp:RadioButtonList ToolTip="不能为空" AutoPostBack="false" ID="ddlMitralValveProlapseOrBreakExist"
                                                    runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow">
                                                    <asp:ListItem>无</asp:ListItem>
                                                    <asp:ListItem>有</asp:ListItem>
                                                    <asp:ListItem>不肯定</asp:ListItem>
                                                </asp:RadioButtonList>
                                            </td>
                                            <td style="width: 140px; color: Blue;">心室间隔穿孔:
                                            </td>
                                            <td class="Column4JiBing1">
                                                <asp:RadioButtonList ToolTip="不能为空" AutoPostBack="false" ID="rblPerforationofVentricularSeptumConfirm"
                                                    runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow">
                                                    <asp:ListItem>无</asp:ListItem>
                                                    <asp:ListItem>有</asp:ListItem>
                                                    <asp:ListItem>不肯定</asp:ListItem>
                                                </asp:RadioButtonList>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <table cellpadding="0" cellspacing="0" border="0">
                                        <tr>
                                            <td class="Column1JiBing1">脑卒中:
                                            </td>
                                            <td class="Column2JiBing1">
                                                <asp:RadioButtonList ToolTip="不能为空" AutoPostBack="false" ID="ddlStrokeExist" runat="server"
                                                    RepeatDirection="Horizontal" RepeatLayout="Flow">
                                                    <asp:ListItem>无</asp:ListItem>
                                                    <asp:ListItem>有</asp:ListItem>
                                                    <asp:ListItem>不肯定</asp:ListItem>
                                                </asp:RadioButtonList>
                                            </td>
                                            <td style="width: 140px; color: Blue;">消化道出血:
                                            </td>
                                            <td class="Column4JiBing1">
                                                <asp:RadioButtonList ToolTip="不能为空" AutoPostBack="false" ID="ddlOGLBExist" runat="server"
                                                    RepeatDirection="Horizontal" RepeatLayout="Flow">
                                                    <asp:ListItem>无</asp:ListItem>
                                                    <asp:ListItem>有</asp:ListItem>
                                                    <asp:ListItem>不肯定</asp:ListItem>
                                                </asp:RadioButtonList>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <table cellpadding="0" cellspacing="0" border="0">
                                        <tr>
                                            <td class="Column1JiBing1">心功能分级:
                                            </td>
                                            <td>
                                                <asp:RadioButtonList ToolTip="不能为空" AutoPostBack="false" ID="ddlKilipLever" runat="server"
                                                    TabIndex="121" RepeatDirection="Horizontal" RepeatLayout="Flow">
                                                    <asp:ListItem> Killip Ⅰ级 </asp:ListItem>
                                                    <asp:ListItem> Killip Ⅱ级 </asp:ListItem>
                                                    <asp:ListItem> Killip Ⅲ级 </asp:ListItem>
                                                    <asp:ListItem> Killip Ⅳ级 </asp:ListItem>
                                                </asp:RadioButtonList>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <%--  诊断治疗过程--%>
                <tr onmouseover="this.className='highlight'" onmouseout="this.className='normal'">
                    <td>
                        <table cellpadding="0" cellspacing="0" border="0" class="category-item">
                            <tr>
                                <td class="subTitle">诊断治疗过程
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <table cellpadding="0" cellspacing="0" border="0">
                                        <tr>
                                            <td class="Column1JiBing1">就诊后首次血压:
                                            </td>
                                            <td>收缩压
                                            <asp:TextBox ID="txtBloodPressure" runat="server" Width="80px" CssClass="TextBoxSyle"></asp:TextBox>mmHg
                                            </td>
                                            <td>舒张压
                                            <asp:TextBox ID="txtDiastolicPressure" runat="server" Width="80px" CssClass="TextBoxSyle"></asp:TextBox>mmHg
                                            <asp:CustomValidator ID="CustomValidator1" ControlToValidate="txtDiastolicPressure"
                                                runat="server" ValidateEmptyText="false" ErrorMessage="请输入数字." OnServerValidate="ServerValidation" />
                                                <asp:CustomValidator ID="CustomValidatorBloodPressure" ControlToValidate="txtBloodPressure"
                                                    runat="server" ValidateEmptyText="false" ErrorMessage="请输入数字." OnServerValidate="ServerValidation" />
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <table cellpadding="0" cellspacing="0" border="0">
                                        <tr>
                                            <td class="Column1JiBing1">首次心率：
                                            </td>
                                            <td>
                                                <asp:TextBox ToolTip="不为空" ID="txtFirstTimeHeartRate" runat="server" Width="40px" Height="18px"></asp:TextBox>
                                                &nbsp;次/分
                                            <asp:CustomValidator ID="CustomValidator8" ControlToValidate="txtFirstTimeHeartRate"
                                                runat="server" ValidateEmptyText="false" ErrorMessage="请输入数字" OnServerValidate="ServerValidation" />
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <table cellpadding="0" cellspacing="0" border="0">
                                        <tr>
                                            <td class="Column1JiBing1">首次心电图时间:
                                            </td>
                                            <td>
                                                <asp:TextBox ToolTip="不为空" ID="txtFirstTimeXinDianTu" runat="server" CssClass="Wdate" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm'})"></asp:TextBox>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <table cellpadding="0" cellspacing="0" border="0">
                                        <tr>
                                            <td class="Column1JiBing1">首次抽血时间：
                                            </td>
                                            <td>
                                                <asp:TextBox ToolTip="不为空" ID="txtFirstTimeBlood" runat="server" CssClass="Wdate" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm'})"></asp:TextBox>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <table cellpadding="0" cellspacing="0" border="0">
                                        <tr>
                                            <td class="Column1JiBing1">化验结果回报时间：<br />
                                            </td>
                                            <td>
                                                <asp:TextBox ToolTip="不为空" ID="txtFisrtTimeReturn" runat="server" CssClass="Wdate" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm'})"></asp:TextBox>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <table cellpadding="0" cellspacing="0" border="0">
                                        <tr>
                                            <td class="Column1JiBing1">首次cTNT结果：
                                            </td>
                                            <td>
                                                <asp:TextBox ID="txtCNTResult" runat="server"></asp:TextBox>
                                                <asp:CustomValidator ID="customValidator4" runat="server" ControlToValidate="txtCNTResult"
                                                    ErrorMessage="请输入数字." Display="Dynamic" ValidateEmptyText="false" OnServerValidate="ServerValidation" />
                                                （正常值：<asp:TextBox ID="txtRegularCNT" runat="server" Width="116px"></asp:TextBox>(pg/ml))
                                            <asp:CustomValidator ID="customValidator5" runat="server" ControlToValidate="txtRegularCNT"
                                                ErrorMessage="请输入数字." Display="Dynamic" ValidateEmptyText="false" OnServerValidate="ServerValidation" />
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <table cellpadding="0" cellspacing="0" border="0">
                                        <tr>
                                            <td class="Column1JiBing11">是否向患者或家属提出静脉溶栓的建议:
                                            </td>
                                            <td>
                                                <asp:RadioButtonList ToolTip="不能为空" AutoPostBack="false" ID="rdbIntroduceThrombolysisSuggestion"
                                                    runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow">
                                                    <asp:ListItem>是</asp:ListItem>
                                                    <asp:ListItem>否</asp:ListItem>
                                                </asp:RadioButtonList>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <table cellpadding="0" cellspacing="0" border="0">
                                        <tr>
                                            <td class="Column1JiBing11">向患者或家属提出静脉溶栓建议的时间:
                                            </td>
                                            <td>
                                                <asp:TextBox ToolTip="不为空" ID="txbIntroduceThrombolysisSuggestionDate" runat="server" CssClass="Wdate"
                                                    onfocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm'})"></asp:TextBox>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <table cellpadding="0" cellspacing="0" border="0">
                                        <tr>
                                            <td class="Column1JiBing11" style="color: Red; font-weight: bold">是否进行了静脉溶栓治疗:
                                            </td>
                                            <td>
                                                <asp:RadioButtonList ToolTip="是否溶栓不能为空" ID="rdbThrombolysisTreateConfirm" runat="server"
                                                    AutoPostBack="true" RepeatDirection="Horizontal" RepeatLayout="Flow" OnSelectedIndexChanged="rdbThrombolysisTreateConfirm_SelectedIndexChanged1">
                                                    <asp:ListItem>是</asp:ListItem>
                                                    <asp:ListItem>否</asp:ListItem>
                                                </asp:RadioButtonList>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:UpdatePanel runat="server" ID="UpdatePanel3">
                                        <ContentTemplate>
                                            <tr>
                                                <td>
                                                    <asp:Panel ID="panelWeiJinXingJingMaiRongShuan" AutoPostBack="true" runat="server">
                                                        <fieldset>
                                                            <legend>未进行静脉溶栓的原因</legend>
                                                            <div class="styleLeft">
                                                                <asp:CheckBox ID="chkUnThrombolysisReasonForUnSute" runat="server" Text="不适合静脉溶栓或已超过静脉溶栓的时间窗" />
                                                                <br />
                                                                <asp:CheckBox ID="chkUnThrombolysisReasonForPatientDisagree" runat="server" Text="患者或家属不同意" />
                                                                <br />
                                                                <asp:CheckBox ID="chkUnThrombolyticForEconomicReason" runat="server" Text="患者经济方面的原因" />
                                                                <br />
                                                                <asp:CheckBox ID="chkUnThrombolyticForHospitalCanNotDid" runat="server" Text="本院不能进行静脉溶栓治疗" />
                                                                <br />
                                                                <asp:CheckBox ID="chkUnThrombolyticForContraindication" runat="server" Text="有溶栓治疗禁忌症" />
                                                            </div>
                                                        </fieldset>
                                                    </asp:Panel>
                                                    <asp:Panel ID="panelRongShuanLiYou" AutoPostBack="true" runat="server">
                                                        <fieldset>
                                                            <legend>溶栓理由</legend>
                                                            <div class="styleLeft" style="text-align: left;">
                                                                <asp:CheckBox ID="chkThrombolyticForDisagree" runat="server" Text="不同意进行介入治疗" />
                                                                <br />
                                                                <asp:CheckBox ID="chkThrombolyticForEconomicReason" runat="server" Text="因经济原因不能进行介入治疗" />
                                                                <br />
                                                                <asp:CheckBox ID="chkThrombolyticForDream" runat="server" Text="有介入治疗的禁忌证" />
                                                                <br />
                                                                <asp:CheckBox ID="chkThrombolyticForTimeLimited" runat="server" Text="不能在3小时内到达有介入资质的医院" />
                                                            </div>
                                                        </fieldset>
                                                    </asp:Panel>
                                                </td>
                                            </tr>
                                        </ContentTemplate>
                                        <Triggers>
                                            <asp:AsyncPostBackTrigger ControlID="rdbThrombolysisTreateConfirm" EventName="SelectedIndexChanged" />
                                        </Triggers>
                                    </asp:UpdatePanel>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <table cellpadding="0" cellspacing="0" border="0">
                                        <tr>
                                            <td class="Column1JiBing11">开始静脉溶栓距离就诊时间:（D2N）
                                            </td>
                                            <td>
                                                <asp:RadioButtonList ToolTip="不能为空" ID="rblTreatTime" runat="server" AutoPostBack="false"
                                                    RepeatDirection="Horizontal" RepeatLayout="Flow">
                                                    <asp:ListItem>≤0.5h</asp:ListItem>
                                                    <asp:ListItem>0.5-1.0h</asp:ListItem>
                                                    <asp:ListItem>0.5-1.5h</asp:ListItem>
                                                    <asp:ListItem>1.5-2.0h</asp:ListItem>
                                                    <asp:ListItem>＞2.0h</asp:ListItem>
                                                </asp:RadioButtonList>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <%--    静脉溶栓--%>
                            <tr>
                                <td>
                                    <fieldset>
                                        <legend>静脉溶栓</legend>
                                        <table border="0" cellpadding="0" cellspacing="0">
                                            <tr>
                                                <td>
                                                    <asp:UpdatePanel runat="server" ID="updatePanel4">
                                                        <ContentTemplate>
                                                            <table border="0" cellpadding="0" cellspacing="0" class="styleLeft">
                                                                <tr>
                                                                    <td class="tableWidth2">
                                                                        <asp:RadioButton ID="niaoJiMei" runat="server" GroupName="JingMaiRongShuan" Text="尿激酶: &nbsp;&nbsp;"
                                                                            OnCheckedChanged="niaoJiMei_CheckedChanged" AutoPostBack="true" />
                                                                        <asp:RadioButtonList ID="rblUrokinase" runat="server" AutoPostBack="true"
                                                                            RepeatDirection="Horizontal" RepeatLayout="Flow" OnSelectedIndexChanged="rblUrokinase_SelectedIndexChanged">
                                                                            <asp:ListItem>50  万U</asp:ListItem>
                                                                            <asp:ListItem>100 万U</asp:ListItem>
                                                                            <asp:ListItem>150 万U</asp:ListItem>
                                                                        </asp:RadioButtonList>
                                                                        &nbsp;&nbsp;&nbsp;&nbsp;其他：<asp:TextBox ID="txtUrokinaseOther" runat="server"></asp:TextBox>
                                                                        &nbsp;(万U)
                                                                    <asp:CustomValidator ID="customValidator6" runat="server" ControlToValidate="txtUrokinaseOther"
                                                                        Display="Dynamic" ErrorMessage="请输入数字." OnServerValidate="ServerValidation" ValidateEmptyText="false" />
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td>
                                                                        <asp:RadioButton ID="aiTiPuMei" runat="server" GroupName="JingMaiRongShuan" Text="阿替普酶:"
                                                                            OnCheckedChanged="aiTiPuMei_CheckedChanged" AutoPostBack="true" />
                                                                        <asp:RadioButtonList ID="rblAlteplase" runat="server" AutoPostBack="true"
                                                                            RepeatDirection="Horizontal" RepeatLayout="Flow" OnSelectedIndexChanged="rblAlteplase_SelectedIndexChanged">
                                                                            <asp:ListItem>50  mg</asp:ListItem>
                                                                            <asp:ListItem>100 mg</asp:ListItem>
                                                                        </asp:RadioButtonList>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td>
                                                                        <asp:RadioButton ID="ruiTiPuMei" runat="server" GroupName="JingMaiRongShuan" Text="瑞替普酶:"
                                                                            OnCheckedChanged="ruiTiPuMei_CheckedChanged" AutoPostBack="true" />
                                                                        <asp:RadioButtonList ID="rblReteplase" runat="server" AutoPostBack="true"
                                                                            RepeatDirection="Horizontal" RepeatLayout="Flow" OnSelectedIndexChanged="rblReteplase_SelectedIndexChanged">
                                                                            <asp:ListItem>10MU×1次</asp:ListItem>
                                                                            <asp:ListItem>10MU×2次</asp:ListItem>
                                                                            <asp:ListItem>10MU×3次</asp:ListItem>
                                                                        </asp:RadioButtonList>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td>
                                                                        <span style="color: Red; font-weight: bold">是否再通:</span>&nbsp;<asp:RadioButtonList
                                                                            ID="rblPass" runat="server" AutoPostBack="false" RepeatDirection="Horizontal"
                                                                            RepeatLayout="Flow">
                                                                            <asp:ListItem>是</asp:ListItem>
                                                                            <asp:ListItem>否</asp:ListItem>
                                                                        </asp:RadioButtonList>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td>
                                                                        <table border="0" cellpadding="0" cellspacing="0">
                                                                            <tr>
                                                                                <td>
                                                                                    <span style="color: Red; font-weight: bold">并发症:</span>
                                                                                    <asp:CheckBox ID="chkReperfusionArrhythmia" runat="server" Text="再灌注心律失常" />&nbsp;
                                                                                <asp:CheckBox ID="chkAnaphylaxis" runat="server" Text="过敏反应 " />&nbsp;
                                                                                </td>
                                                                                <td>
                                                                                    <asp:UpdatePanel runat="server" ID="UpdatePanel2">
                                                                                        <ContentTemplate>
                                                                                            <asp:CheckBox ID="chkBlood" AutoPostBack="true" runat="server" Text="出血 " OnCheckedChanged="chkBlood_CheckedChanged" />
                                                                                            <asp:RadioButtonList ID="rblBleed" runat="server" AutoPostBack="false"
                                                                                                RepeatDirection="Horizontal" RepeatLayout="Flow">
                                                                                                <asp:ListItem>小量</asp:ListItem>
                                                                                                <asp:ListItem>中等量</asp:ListItem>
                                                                                                <asp:ListItem>大量</asp:ListItem>
                                                                                            </asp:RadioButtonList>
                                                                                        </ContentTemplate>
                                                                                        <Triggers>
                                                                                            <asp:AsyncPostBackTrigger ControlID="chkBlood" EventName="CheckedChanged" />
                                                                                        </Triggers>
                                                                                    </asp:UpdatePanel>
                                                                                </td>
                                                                            </tr>
                                                                        </table>
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </ContentTemplate>
                                                        <Triggers>
                                                            <asp:AsyncPostBackTrigger ControlID="rblUrokinase" EventName="SelectedIndexChanged" />
                                                            <asp:AsyncPostBackTrigger ControlID="rblAlteplase" EventName="SelectedIndexChanged" />
                                                            <asp:AsyncPostBackTrigger ControlID="rblReteplase" EventName="SelectedIndexChanged" />
                                                        </Triggers>
                                                    </asp:UpdatePanel>
                                                </td>
                                            </tr>
                                        </table>
                                    </fieldset>
                                </td>
                            </tr>
                            <%--    辅助用药--%>
                            <tr>
                                <td>
                                    <fieldset>
                                        <legend>辅助用药</legend>
                                        <table border="0" cellpadding="0" cellspacing="0" class="styleLeft">
                                            <tr>
                                                <td colspan="2" class="tableWidth2">阿斯匹林:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:RadioButtonList
                                                    ID="rblAspirinDosage" runat="server" AutoPostBack="false" RepeatDirection="Horizontal"
                                                    RepeatLayout="Flow">
                                                    <asp:ListItem>未用</asp:ListItem>
                                                    <asp:ListItem>100 mg</asp:ListItem>
                                                    <asp:ListItem>200 mg</asp:ListItem>
                                                    <asp:ListItem>300 mg</asp:ListItem>
                                                </asp:RadioButtonList>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td colspan="2">氯吡格雷:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:RadioButtonList
                                                    ID="rblClopidogrelDosage" runat="server" AutoPostBack="false" RepeatDirection="Horizontal"
                                                    RepeatLayout="Flow">
                                                    <asp:ListItem>未用</asp:ListItem>
                                                    <asp:ListItem>75  mg</asp:ListItem>
                                                    <asp:ListItem>300 mg</asp:ListItem>
                                                    <asp:ListItem>600 mg</asp:ListItem>
                                                </asp:RadioButtonList>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td colspan="2">
                                                    <asp:UpdatePanel ID="UpdatePanel27" runat="server">
                                                        <ContentTemplate>
                                                            <table border="0" cellpadding="0" cellspacing="0">
                                                                <tr>
                                                                    <td class="Column6">是否应用他汀类药物:
                                                                    </td>
                                                                    <td class="Column1">
                                                                        <asp:RadioButtonList ID="rblLoadStatinUsed" runat="server" AutoPostBack="true"
                                                                            OnSelectedIndexChanged="rblLoadStatinUsed_SelectedIndexChanged" RepeatDirection="Horizontal"
                                                                            RepeatLayout="Flow">
                                                                            <asp:ListItem>是</asp:ListItem>
                                                                            <asp:ListItem>否</asp:ListItem>
                                                                        </asp:RadioButtonList>
                                                                    </td>
                                                                    <td>
                                                                        <asp:Panel ID="PanelRadioButtonList" runat="server">
                                                                            <asp:CheckBox ID="chkSimvastatin" runat="server" Text="辛伐他汀 " />
                                                                            <asp:CheckBox ID="chkPravastatin" runat="server" Text="普伐他汀" />
                                                                            <asp:CheckBox ID="chkFluvastatin" runat="server" Text="氟伐他汀" />
                                                                            <asp:CheckBox ID="chkAtorvastatin" runat="server" Text="阿托伐他汀" />
                                                                            <br />
                                                                            <asp:CheckBox ID="chkRosuvastatin" runat="server" Text="瑞舒伐他汀" />
                                                                            <asp:CheckBox ID="chkPitavastatin" runat="server" Text="匹伐他汀" />
                                                                        </asp:Panel>
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </ContentTemplate>
                                                        <Triggers>
                                                            <asp:AsyncPostBackTrigger ControlID="rblLoadStatinUsed" EventName="SelectedIndexChanged" />
                                                        </Triggers>
                                                    </asp:UpdatePanel>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="width: 350px;">是否应用血管紧张素转换酶抑制剂（ACEI）或ARB:
                                                </td>
                                                <td style="width: 410px;">
                                                    <asp:RadioButtonList ToolTip="不能为空" ID="rblACEIConfirm" runat="server" AutoPostBack="false"
                                                        RepeatDirection="Horizontal" RepeatLayout="Flow">
                                                        <asp:ListItem>是</asp:ListItem>
                                                        <asp:ListItem>否</asp:ListItem>
                                                    </asp:RadioButtonList>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>是否应用β-受体阻滞剂:
                                                </td>
                                                <td>
                                                    <asp:RadioButtonList ToolTip="不能为空" ID="rblBRBConfrim" runat="server" AutoPostBack="false"
                                                        RepeatDirection="Horizontal" RepeatLayout="Flow">
                                                        <asp:ListItem>是</asp:ListItem>
                                                        <asp:ListItem>否</asp:ListItem>
                                                    </asp:RadioButtonList>
                                                </td>
                                            </tr>
                                        </table>
                                    </fieldset>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <table border="0" cellpadding="0" cellspacing="0">
                                        <tr>
                                            <td class="Column1JiBing11">是否向患者或家属介绍急诊冠脉介入治疗:
                                            </td>
                                            <td class="style14">
                                                <asp:RadioButtonList ToolTip="不能为空" ID="rblIntroduceEmergencyCoronaryConfirm" runat="server"
                                                    AutoPostBack="false" RepeatDirection="Horizontal" RepeatLayout="Flow">
                                                    <asp:ListItem>是</asp:ListItem>
                                                    <asp:ListItem>否</asp:ListItem>
                                                </asp:RadioButtonList>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="Column1JiBing11">向患者或家属介绍急诊冠脉介入治疗的时间:
                                            </td>
                                            <td class="style14">
                                                <asp:TextBox ToolTip="不为空" ID="txtIntroduceEmergencyCoronaryDate" runat="server" CssClass="Wdate"
                                                    onfocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm'})"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="Column1JiBing11">患者或家属是否已同意接受冠脉介入治疗:
                                            </td>
                                            <td class="style14">
                                                <asp:RadioButtonList ToolTip="不能为空" ID="rblAgreeEmergencyCoronaryConfirm" runat="server"
                                                    AutoPostBack="false" RepeatDirection="Horizontal" RepeatLayout="Flow">
                                                    <asp:ListItem>是</asp:ListItem>
                                                    <asp:ListItem>否</asp:ListItem>
                                                </asp:RadioButtonList>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="Column1JiBing11">是否在本医院实施了急诊冠脉介入治疗:
                                            </td>
                                            <td class="style14">
                                                <asp:RadioButtonList ToolTip="姓名不能为空" ID="rdbEmergencyCoronaryTreateConfirm" runat="server"
                                                    AutoPostBack="false" RepeatDirection="Horizontal" RepeatLayout="Flow">
                                                    <asp:ListItem>是</asp:ListItem>
                                                    <asp:ListItem>否</asp:ListItem>
                                                </asp:RadioButtonList>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <fieldset>
                                        <legend>未进行急诊冠脉介入治疗的原因</legend>
                                        <table border="0" cellpadding="0" cellspacing="0" class="styleLeft" style="width: 390px;">
                                            <tr>
                                                <td>
                                                    <asp:CheckBox ID="chkUnEmergencyCoronaryTreateForHospitalUnable" runat="server" Text="本院不能开展" />
                                                    <br />
                                                    <asp:CheckBox ID="chkUnEmergencyCoronaryTreateForOverTreateTime" runat="server" Text="已超过介入治疗有效时间窗" />
                                                    <br />
                                                    <asp:CheckBox ID="chkUnEmergencyCoronaryTreateForPatientDisagree" runat="server"
                                                        Text="患者或家属不同意" />
                                                    <br />
                                                    <asp:CheckBox ID="chkUnEmergencyCoronaryTreateForEmergency" runat="server" Text="患者经济原因" />
                                                    <br />
                                                    <asp:CheckBox ID="chkUnEmergencyCoronaryTreateForContraindication" runat="server"
                                                        Text="有介入治疗禁忌症" />
                                                </td>
                                            </tr>
                                        </table>
                                    </fieldset>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <fieldset>
                                        <legend>在本医院急诊介入治疗</legend>
                                        <table border="0" cellpadding="0" cellspacing="0" class="styleLeft" style="width: 400px;">
                                            <tr>
                                                <td class="Column1">是否成功:
                                                </td>
                                                <td>
                                                    <asp:RadioButtonList ToolTip="不能为空" ID="rblSucceed" runat="server" AutoPostBack="false"
                                                        RepeatDirection="Horizontal" RepeatLayout="Flow">
                                                        <asp:ListItem>是</asp:ListItem>
                                                        <asp:ListItem>否</asp:ListItem>
                                                    </asp:RadioButtonList>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="Column1">D2B时间:
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="txtD2BTime" runat="server"></asp:TextBox>
                                                    分钟
                                                <asp:CustomValidator ID="customValidator7" runat="server" ControlToValidate="txtD2BTime"
                                                    Display="Dynamic" ErrorMessage="请输入数字." OnServerValidate="ServerValidation" ValidateEmptyText="false" />
                                                </td>
                                            </tr>
                                        </table>
                                    </fieldset>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <%--    临床转归--%>
                <tr onmouseover="this.className='highlight'" onmouseout="this.className='normal'">
                    <td>
                        <table cellpadding="0" cellspacing="0" border="0" class="category-item">
                            <tr>
                                <td class="subTitle">临床转归
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:UpdatePanel ID="UpdatePanel31" runat="server">
                                        <ContentTemplate>
                                            <table border="0" cellpadding="0" cellspacing="0">
                                                <tr>
                                                    <td class="Column1JiBing11">在院24h内是否进行了心肺复苏:
                                                    </td>
                                                    <td>
                                                        <asp:RadioButtonList ToolTip="不能为空" ID="rblCPR" runat="server" AutoPostBack="true"
                                                            OnSelectedIndexChanged="rblCPR_SelectedIndexChanged" RepeatDirection="Horizontal"
                                                            RepeatLayout="Flow">
                                                            <asp:ListItem>是</asp:ListItem>
                                                            <asp:ListItem>否</asp:ListItem>
                                                        </asp:RadioButtonList>
                                                    </td>
                                                    <td>
                                                        <asp:Panel ID="panetxtCPRTimes" runat="server">
                                                            &nbsp; [次数:
                                                        <asp:TextBox ID="txtCPRTimes" runat="server"></asp:TextBox>
                                                            ]
                                                        <asp:CustomValidator ID="customValidator2" runat="server" ControlToValidate="txtCPRTimes"
                                                            Display="Dynamic" ErrorMessage="请输入数字." OnServerValidate="ServerValidation" ValidateEmptyText="false" />
                                                        </asp:Panel>
                                                    </td>
                                                </tr>
                                            </table>
                                        </ContentTemplate>
                                        <Triggers>
                                            <asp:AsyncPostBackTrigger ControlID="rblCPR" EventName="SelectedIndexChanged" />
                                        </Triggers>
                                    </asp:UpdatePanel>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:UpdatePanel ID="UpdatePanel28" runat="server">
                                        <ContentTemplate>
                                            <table border="0" cellpadding="0" cellspacing="0">
                                                <tr>
                                                    <td>
                                                        <span style="color: Blue">在院24h内的转归:</span>
                                                        <asp:RadioButtonList ToolTip="姓名不能为空" ID="rblTreatResult" runat="server" AutoPostBack="true"
                                                            OnSelectedIndexChanged="rblTreatResult_SelectedIndexChanged" RepeatDirection="Horizontal"
                                                            RepeatLayout="Flow">
                                                            <asp:ListItem>无变化</asp:ListItem>
                                                            <asp:ListItem>好转</asp:ListItem>
                                                            <asp:ListItem>加重</asp:ListItem>
                                                            <asp:ListItem>死亡</asp:ListItem>
                                                        </asp:RadioButtonList>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <asp:Panel ID="panelrblTreatResult" runat="server">
                                                            <fieldset>
                                                                <table border="0" cellpadding="0" cellspacing="0" class="tableWidth2">
                                                                    <tr>
                                                                        <td class="Column1">死亡时间：
                                                                        </td>
                                                                        <td>
                                                                            <asp:TextBox ID="txtDeadTime" runat="server" CssClass="Wdate" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm'})"></asp:TextBox>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td class="Column1">死亡原因:
                                                                        </td>
                                                                        <td class="tdTopBottomLine" style="border-left: 1px dashed #000;">
                                                                            <asp:CheckBox ID="chkDeadForVentriclarArrhythmias" runat="server" Text="室性心律失常（室速，室颤）" />&nbsp;
                                                                        <asp:CheckBox ID="chkDeadForCardiacArrest" runat="server" Text="心跳骤停/电机械分离" />&nbsp;
                                                                        <asp:CheckBox ID="chkDeadForCardiogenicShock" runat="server" Text="心源性休克" /><br />
                                                                            <asp:CheckBox ID="chkDeadForACVD" runat="server" Text="急性脑血管病 " />&nbsp;
                                                                        <asp:CheckBox ID="chkDeadForGIH" runat="server" Text="消化道大出血 " />&nbsp;
                                                                        <asp:CheckBox ID="chkDeadForOther" runat="server" Text="其它" />
                                                                        </td>
                                                                    </tr>
                                                                </table>
                                                            </fieldset>
                                                        </asp:Panel>
                                                    </td>
                                                </tr>
                                            </table>
                                        </ContentTemplate>
                                        <Triggers>
                                            <asp:AsyncPostBackTrigger ControlID="rblTreatResult" EventName="SelectedIndexChanged" />
                                        </Triggers>
                                    </asp:UpdatePanel>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:UpdatePanel runat="server" ID="updatePanelTransfer">
                                        <ContentTemplate>
                                            <table border="0" cellpadding="0" cellspacing="0" class="tableWidth2">
                                                <tr>
                                                    <td class="Column1JiBing11">转上级医院:
                                                    </td>
                                                    <td>
                                                        <asp:RadioButtonList ToolTip="是否转院" ID="rblTransUpHospitalConfirm" runat="server"
                                                            AutoPostBack="true" OnSelectedIndexChanged="rblTransUpHospitalConfirm_SelectedIndexChanged"
                                                            RepeatDirection="Horizontal" RepeatLayout="Flow">
                                                            <asp:ListItem>是</asp:ListItem>
                                                            <asp:ListItem>否</asp:ListItem>
                                                        </asp:RadioButtonList>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <asp:Panel runat="server" ID="panelTransfer">
                                                            <fieldset>
                                                                <legend>转院</legend>
                                                                <table border="0" cellpadding="0" cellspacing="0" class="tableWidth2">
                                                                    <tr>
                                                                        <td colspan="2">
                                                                            <asp:RadioButtonList ID="rblTransUpHospitalLever" runat="server" AutoPostBack="true"
                                                                                RepeatDirection="Horizontal" RepeatLayout="Flow">
                                                                                <asp:ListItem>市级医院</asp:ListItem>
                                                                                <asp:ListItem>省级医院</asp:ListItem>
                                                                            </asp:RadioButtonList>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td colspan="2">
                                                                            <span style="color: Blue">患者转院前是否已与上级医院联系准备下一步的治疗: </span>
                                                                            <asp:RadioButtonList ID="rblConnectUpHospitalConfirm" runat="server"
                                                                                AutoPostBack="true" OnSelectedIndexChanged="rblConnectUpHospitalConfirm_SelectedIndexChanged"
                                                                                RepeatDirection="Horizontal" RepeatLayout="Flow">
                                                                                <asp:ListItem>是</asp:ListItem>
                                                                                <asp:ListItem>否</asp:ListItem>
                                                                            </asp:RadioButtonList>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td class="Column1JiBing11">患者转上级医院时间:
                                                                        </td>
                                                                        <td>
                                                                            <asp:TextBox ID="txbTransUpHospitalDate" runat="server" CssClass="Wdate" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm'})"></asp:TextBox>
                                                                        </td>
                                                                    </tr>
                                                                </table>
                                                            </fieldset>
                                                        </asp:Panel>
                                                    </td>
                                                </tr>
                                            </table>
                                        </ContentTemplate>
                                        <Triggers>
                                            <asp:AsyncPostBackTrigger ControlID="rblTransUpHospitalConfirm" EventName="SelectedIndexChanged" />
                                        </Triggers>
                                    </asp:UpdatePanel>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td style="padding-bottom: 100px;">&nbsp;
                    </td>
                </tr>
                <tr>
                    <td align="center">
                        <asp:Button ID="btnSave" runat="server" CssClass="ButtonSave" OnClick="btnSave_Click"
                            Text="保存" />
                        &nbsp;&nbsp;
                    <asp:Button ID="btnSubmit" runat="server" Text="提交" CssClass="ButtonSave" OnClick="btnSubmit_Click" />
                        &nbsp;&nbsp;&nbsp;
                    <asp:Button ID="btnEnterPrint" Text="进入打印页面" OnClick="btnEnterPrint_Click" class="ButtonSave"
                        runat="server" Width="145px" />
                    </td>
                </tr>
                <tr>
                    <td style="padding-bottom: 160px;">&nbsp;
                    </td>
                </tr>
            </table>
        </asp:Panel>
    </form>
</body>
</html>
