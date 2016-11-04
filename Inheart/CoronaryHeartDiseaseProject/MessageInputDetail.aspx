<%@ Page Language="C#" AutoEventWireup="true" Inherits="CoronaryHeartDiseaseProject.MessageDetail" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <link href="Styles/messageDetail.css" type="text/css" rel="stylesheet" />
    <script src="Scripts/My97DatePicker/WdatePicker.js" type="text/javascript"></script>
    <script src="Scripts\Calendar3.js" type="text/javascript"></script>
    <script language="javaScript">
        function setPrintTemplate() {
            factory.printing.templateURL = "MeadCo://IE7";
        }
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
    <style type="text/css">
        .style9 {
            background-color: #f7f7f7;
            height: 12px;
        }
        <!-- media=print 这个属性可以在打印时有效-- >
    </style>
    <style media="print">
        {
            .Noprint;

        {
            display: none;
        }

        .PageNext {
            page-break-after: always;
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
                        <asp:Label ID="lblMessage" runat="server" Width="750px" ForeColor="Red"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="THTitle">电子病历
                    </td>
                </tr>
                <%-- 一般资料--%>
                <tr>
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
                                            <td class="Column1JiBing">姓名:
                                            </td>
                                            <td class="zhusuSubject">
                                                <asp:TextBox ID="txtPatientName" runat="server" TabIndex="10" />
                                            </td>
                                            <td class="Column3">性别：
                                            </td>
                                            <td class="Column4">
                                                <asp:Label ID="dropDownSex" runat="server" TabIndex="12" Width="166px" />
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <table cellpadding="0" cellspacing="0" border="0">
                                        <tr>
                                            <td class="Column1JiBing">民族（国籍）：
                                            </td>
                                            <td class="zhusuSubject">
                                                <asp:Label ID="dropNationality" runat="server" TabIndex="16" Width="166px" />
                                            </td>
                                            <td class="Column3">职业：
                                            </td>
                                            <td class="Column4">
                                                <asp:Label ID="DropDownListJob" runat="server" CssClass="TextBoxSyle" TabIndex="16" />
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <table cellpadding="0" cellspacing="0" border="0">
                                        <script>
                                            function PopCalendar(obj) {
                                                showx = event.screenX - event.offsetX;  // + deltaX;
                                                showy = event.screenY - event.offsetY - 168; // + deltaY;
                                                window.showModalDialog("calendar.htm", obj, "dialogWidth:180px; dialogHeight:230px; dialogTop:" + showy + "px; status:no; directories:yes;scrollbars:no;Resizable=no; ");
                                            }
                                        </script>
                                        <tr>
                                            <td class="Column1JiBing">出生日期:
                                            </td>
                                            <td class="zhusuSubject">
                                                <asp:Label ID="txbBirthDay" runat="server" Width="150px" />
                                            </td>
                                            <td class="Column3">年龄：
                                            </td>
                                            <td class="Column4">
                                                <asp:Label ID="txtAge" runat="server" Enabled="false" Text="..." Width="148px" Height="20px" />
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <table cellpadding="0" cellspacing="0" border="0">
                                        <tr>
                                            <td>
                                                <table cellpadding="0" cellspacing="0" border="0">
                                                    <tr>
                                                        <td class="Column1JiBing">就诊日期:
                                                        </td>
                                                        <td class="zhusuSubject">
                                                            <asp:Label ID="txbTreatTime" runat="server" />
                                                        </td>
                                                        <td class="Column3">发病时间:
                                                        </td>
                                                        <td class="Column4">
                                                            <asp:Label ID="txtDiseaseHour" runat="server" Width="80px" />
                                                            小时
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <table cellpadding="0" cellspacing="0" border="0">
                                                    <tr>
                                                        <td class="Column1JiBing">病史叙述者:
                                                        </td>
                                                        <td class="zhusuSubject">
                                                            <asp:Label ID="ddlDiseaseDescriber" runat="server" TabIndex="12" Width="166px" />
                                                        </td>
                                                        <td class="Column3">来院方式:
                                                        </td>
                                                        <td class="Column4">
                                                            <asp:Label ID="ddlTrafficWay" runat="server" TabIndex="12" Width="166px" />
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <table cellpadding="0" cellspacing="0" border="0">
                                                    <tr>
                                                        <td class="Column1JiBing">可靠程度:
                                                        </td>
                                                        <td>
                                                            <asp:Label ID="ddlReliability" runat="server" TabIndex="12" Width="166px" />
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <%-- 主诉和现病史--%>
                <tr>
                    <td>
                        <table cellpadding="0" cellspacing="0" border="0" class="category-item">
                            <tr>
                                <td class="subTitle">主诉和现病史
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <table cellpadding="0" cellspacing="0" border="0">
                                        <tr>
                                            <td class="Column1JiBing">胸痛（闷）:
                                            </td>
                                            <td class="zhusuSubject">
                                                <asp:Label AutoPostBack="true" ID="rblChestPainExist" runat="server" />
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <table cellpadding="0" cellspacing="0" border="0">
                                        <tr>
                                            <td class="Column1JiBing">诱因:
                                            </td>
                                            <td class="zhusuSubject">
                                                <asp:Label AutoPostBack="true" ID="rblIncentiveExist" runat="server" />
                                            </td>
                                            <td>
                                                <asp:Panel runat="server" ID="PanelrblIncentiveType">
                                                    <asp:Label runat="server" Text="体力活动," ID="chkIncentiveTypePhysical" />
                                                    <asp:Label runat="server" Text="情绪激动," ID="chkIncentiveTypeExcite" />
                                                    <asp:Label runat="server" Text="饱餐," ID="chkIncentiveTypeEatMuch" />
                                                    <asp:Label runat="server" Text="排便," ID="chkIncentiveTypeDefecate" />
                                                    <asp:Label runat="server" Text="寒冷刺激," ID="chkIncentiveTypeColdStimulation" />
                                                    <asp:Label runat="server" Text="其他," ID="chkIncentiveTypeOther" />
                                                </asp:Panel>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <table cellpadding="0" cellspacing="0" border="0">
                                        <tr>
                                            <td class="Column1JiBing">部位:
                                            </td>
                                            <td class="zhusuSubject">
                                                <asp:Label AutoPostBack="true" ID="rblPositionExist" runat="server" />
                                            </td>
                                            <td>
                                                <asp:Panel runat="server" ID="PanelrblPositionType">
                                                    <asp:Label runat="server" Text="心前区或胸骨后," ID="chkPositionTypePrecordium" />
                                                    <asp:Label runat="server" Text="咽颈部," ID="chkPositionTypeChest" />
                                                    <asp:Label runat="server" Text="剑突下或上腹部," ID="chkPositionTypeBelowXiphoid" />
                                                    <asp:Label runat="server" Text="肩背部," ID="chkPositionTypeShoulder" />
                                                    <asp:Label runat="server" Text="其他," ID="chkPositionTypeOther" />
                                                </asp:Panel>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <table cellpadding="0" cellspacing="0" border="0">
                                        <tr>
                                            <td class="Column1JiBing">性质:
                                            </td>
                                            <td>
                                                <asp:Label runat="server" Text="胸闷痛或压缩感," ID="chkPropertiesTypeChestPain" />
                                                <asp:Label runat="server" Text="咽部痛或紧缩感," ID="chkPropertiesTypePharyngeal" />
                                                <asp:Label runat="server" Text="胸部刀割或烧心感," ID="chkPropertiesTypeChestCut" />
                                                <asp:Label runat="server" Text="其他," ID="chkPropertiesTypeOther" />
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <table cellpadding="0" cellspacing="0" border="0">
                                        <tr>
                                            <td class="Column1JiBing">放射痛部位:
                                            </td>
                                            <td class="zhusuSubject">
                                                <asp:Label AutoPostBack="true" ID="rblRadiationPainExist" runat="server" />
                                            </td>
                                            <td>
                                                <asp:Panel runat="server" ID="PanelrblRadiationPainType">
                                                    <asp:Label runat="server" Text="左肩臂部," ID="chkRadiationPainTypeLeftShoulder" />
                                                    <asp:Label runat="server" Text="咽部痛咽颈颌面部或紧缩感," ID="chkRadiationPainTypePharyngeal" />
                                                    <asp:Label runat="server" Text="上腹部," ID="chkRadiationPainTypeEpigastralgia" />
                                                    <asp:Label runat="server" Text="其他," ID="chkRadiationPainTypeOther" />
                                                </asp:Panel>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <table cellpadding="0" cellspacing="0" border="0">
                                        <tr>
                                            <td class="Column1JiBing">伴随症状:
                                            </td>
                                            <td class="zhusuSubject">
                                                <asp:Label AutoPostBack="true" ID="rblConcomitantSymptomExist" runat="server" />
                                            </td>
                                            <td>
                                                <asp:Panel runat="server" ID="PanelrblConcomitantSymptomType">
                                                    <asp:Label runat="server" Text="心悸," ID="chkConcomitantSymptomTypePalpitation" />
                                                    <asp:Label runat="server" Text="劳力性呼吸困难," ID="chkConcomitantSymptomTypeTiredBreath" />
                                                    <asp:Label runat="server" Text="黑朦," ID="chkConcomitantSymptomTypeAmaurosis" />
                                                    <asp:Label runat="server" Text="晕厥," ID="chkConcomitantSymptomTypeSyncope" />
                                                    <asp:Label runat="server" Text="其他," ID="chkConcomitantSymptomTypeOther" />
                                                </asp:Panel>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <table cellpadding="0" cellspacing="0" border="0">
                                        <tr>
                                            <td class="Column1JiBing">缓解因素:
                                            </td>
                                            <td>
                                                <asp:Label runat="server" Text="休息," ID="chkRelievingFactorsRest" />
                                                <asp:Label runat="server" Text="硝酸酯类药物," ID="chkRelievingFactorsNitrate" />
                                                <asp:Label runat="server" Text="黑钙拮抗剂朦," ID="chkRelievingFactorsBlackCa" />
                                                <asp:Label runat="server" Text="钙拮抗剂," ID="chkRelievingFactorsCaRivalry" />
                                                <asp:Label runat="server" Text="持续不缓解," ID="chkRelievingFactorsLastRespond" />
                                                <asp:Label runat="server" Text="其他," ID="chkRelievingFactorsOther" />
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <%-- 既往病史：--%>
                <tr>
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
                                            <td class="Column1JiBing">心肌梗死：
                                            </td>
                                            <td>
                                                <asp:Label AutoPostBack="false" ID="rblMIConfirm" runat="server" RepeatDirection="Horizontal"
                                                    RepeatLayout="Flow" TabIndex="61" />
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <table cellpadding="0" cellspacing="0" border="0">
                                        <tr>
                                            <td class="Column1JiBing">高血压：
                                            </td>
                                            <td class="zhusuSubject">
                                                <asp:Label AutoPostBack="true" ID="rblHypertensionConfirm" runat="server" RepeatDirection="Horizontal"
                                                    RepeatLayout="Flow" TabIndex="61" OnSelectedIndexChanged="rblHypertensionConfirm_SelectedIndexChanged" />
                                            </td>
                                            <td>
                                                <asp:Panel runat="server" ID="PanelddlHypertensionLasted">
                                                    病程（年）:
                                                <asp:Label ID="ddlHypertensionLasted" runat="server" RepeatDirection="Horizontal"
                                                    Width="40px" />治疗状况:
                                                <asp:Label ID="ddlHypertensionTreatedState" runat="server" RepeatDirection="Horizontal"
                                                    RepeatLayout="Flow" TabIndex="61" Width="80px" />
                                                </asp:Panel>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <table cellpadding="0" cellspacing="0" border="0">
                                        <tr>
                                            <td class="Column1JiBing">糖尿病：
                                            </td>
                                            <td class="zhusuSubject">
                                                <asp:Label AutoPostBack="true" ID="rblGlycuresisConfirm" runat="server" />
                                            </td>
                                            <td>
                                                <asp:Panel runat="server" ID="PanelddlGlycuresisLasted">
                                                    病程（年）:
                                                <asp:Label ID="ddlGlycuresisLasted" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow"
                                                    TabIndex="61" Width="40px" />
                                                    &nbsp;治疗状况:
                                                <asp:Label ID="ddlGlycuresisTreatedState" runat="server" RepeatDirection="Horizontal"
                                                    RepeatLayout="Flow" TabIndex="61" Width="80px" />
                                                </asp:Panel>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <table cellpadding="0" cellspacing="0" border="0">
                                        <tr>
                                            <td class="Column1JiBing">脑卒中：
                                            </td>
                                            <td class="zhusuSubject">
                                                <asp:Label AutoPostBack="true" ID="rblCerebralHemorrhageConfirm" runat="server" />
                                            </td>
                                            <td>
                                                <asp:Panel runat="server" ID="PanelrblCerebralHemorrhageTreateLasted">
                                                    发病距此次就诊时间 &nbsp;:<asp:Label AutoPostBack="true" ID="rblCerebralHemorrhageTreateLasted"
                                                        runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow" />
                                                </asp:Panel>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <table cellpadding="0" cellspacing="0" border="0">
                                        <tr>
                                            <td class="Column1JiBing">外围血管病：
                                            </td>
                                            <td class="zhusuSubject">
                                                <asp:Label AutoPostBack="false" ID="rblPeripheralVascularConfirm" runat="server"
                                                    RepeatDirection="Horizontal" RepeatLayout="Flow" />
                                            </td>
                                            <td style="width: 200px">贫血或其它出血性疾病：
                                            </td>
                                            <td>
                                                <asp:Label AutoPostBack="false" ID="rblAnemiaOrOtherConfirm" runat="server" RepeatDirection="Horizontal"
                                                    RepeatLayout="Flow" />
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <%-- 初步诊断--%>
                <tr>
                    <td>
                        <table cellpadding="0" cellspacing="0" border="0" class="category-item">
                            <tr>
                                <td class="subTitle">初步诊断
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <table cellpadding="0" cellspacing="0" border="0">
                                        <tr>
                                            <td style="width: 210px;">
                                                <asp:Label ID="lbChubuzhenduan" runat="server" AutoPostBack="true" />
                                            </td>
                                            <td>
                                                <asp:Panel runat="server" ID="PanelrdAcuteST">
                                                    <asp:Label ID="chkAnteroseptal" Text="前间壁," runat="server" />
                                                    <asp:Label ID="chkAntetheca" Text="前壁," runat="server" />
                                                    <asp:Label ID="chkExtensive" Text="广泛前壁," runat="server" />
                                                    <asp:Label ID="chkHeartWall" Text="侧壁," runat="server" />
                                                    <asp:Label ID="chkHighWall" Text="高侧壁," runat="server" />
                                                    <asp:Label ID="chkInteriorWall" Text="下壁," runat="server" />
                                                    <asp:Label ID="chkBackWall" Text="后壁," runat="server" />
                                                    <asp:Label ID="chkRightVentricular" Text="右室," runat="server" />
                                                </asp:Panel>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <%-- 疾病伴随状态--%>
                <tr>
                    <td>
                        <table cellpadding="0" cellspacing="0" border="0" class="category-item">
                            <tr>
                                <td class="subTitle">疾病伴随状态
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <table cellpadding="0" cellspacing="0" border="0" style="width: 730px">
                                        <tr>
                                            <td class="Column1JiBing">心律失常:
                                            </td>
                                            <td>
                                                <table cellpadding="0" cellspacing="0" border="0">
                                                    <tr>
                                                        <td style="width: 80px;">
                                                            <asp:Label AutoPostBack="true" ID="ddlArrhythmiaExist" runat="server" />
                                                        </td>
                                                        <td>
                                                            <asp:Panel runat="server" ID="PanelddlArrhythmiaExist">
                                                                <asp:Label ID="chkVPB" Text="室早," runat="server" />
                                                                <asp:Label ID="chkVT" Text="室速," runat="server" />
                                                                <asp:Label ID="chkVF" Text="室颤," runat="server" />
                                                                <asp:Label ID="chmAts" Text="室上性早搏," runat="server" />
                                                                <asp:Label ID="chkAFS1" Text="房速," runat="server" />
                                                                <asp:Label ID="chkAF" Text="房颤," runat="server" />
                                                                <asp:Label ID="chkAPB" Text="窦性心动过缓," runat="server" />
                                                                <asp:Label ID="chkAVBI" Text="房室传导阻滞 I度," runat="server" />
                                                                <asp:Label ID="chkAVBII" Text="房室传导阻滞 II度," runat="server" />
                                                                <asp:Label ID="chkAVBIII" Text="房室传导阻滞 III度," runat="server" />
                                                                <asp:Label ID="chkAFS" Text="左束支传导阻滞," runat="server" />
                                                                <asp:Label ID="chkRBBB" Text="右束支传导阻滞," runat="server" />
                                                                <asp:Label ID="chkAVBOther" Text="其他," runat="server" />
                                                            </asp:Panel>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <table cellpadding="0" cellspacing="0" border="0">
                                        <tr>
                                            <td class="Column1JiBing">低血压状态:
                                            </td>
                                            <td class="Column2JiBing">
                                                <asp:Label AutoPostBack="false" ID="ddlHypotensionExist" runat="server" />
                                            </td>
                                            <td class="Column3JiBing">心源性休克:
                                            </td>
                                            <td class="Column4JiBing">
                                                <asp:Label AutoPostBack="false" ID="ddlCardiogenicShockExist" runat="server" />
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <table cellpadding="0" cellspacing="0" border="0">
                                        <tr>
                                            <td class="Column1JiBing">二尖瓣脱垂或断裂:
                                            </td>
                                            <td class="Column2JiBing">
                                                <asp:Label AutoPostBack="false" ID="ddlMitralValveProlapseOrBreakExist" runat="server" />
                                            </td>
                                            <td class="Column3JiBing">心室间隔穿孔:
                                            </td>
                                            <td class="Column4JiBing">
                                                <asp:Label AutoPostBack="false" ID="rblPerforationofVentricularSeptumConfirm" runat="server" />
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <table cellpadding="0" cellspacing="0" border="0">
                                        <tr>
                                            <td class="Column1JiBing">脑卒中:
                                            </td>
                                            <td class="Column2JiBing">
                                                <asp:Label AutoPostBack="false" ID="ddlStrokeExist" runat="server" RepeatDirection="Horizontal" />
                                            </td>
                                            <td class="Column3JiBing">消化道出血:
                                            </td>
                                            <td class="Column4JiBing">
                                                <asp:Label AutoPostBack="false" ID="ddlOGLBExist" runat="server" />
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td>心功能分级:
                                <asp:Label AutoPostBack="false" ID="ddlKilipLever" runat="server" />
                                    &nbsp;
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <%--  诊断治疗过程--%>
                <tr>
                    <td>
                        <table cellpadding="0" cellspacing="0" border="0" class="category-item">
                            <tr>
                                <td class="subTitle">诊断治疗过程
                                </td>
                            </tr>
                            <tr>
                                <td>就诊后首次血压: 收缩压
                                <asp:Label ID="txtBloodPressure" runat="server" Width="80px" CssClass="TextBoxSyle"></asp:Label>
                                    &nbsp;&nbsp;舒张压
                                <asp:Label ID="txtDiastolicPressure" runat="server" Width="80px" CssClass="TextBoxSyle"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <table cellpadding="0" cellspacing="0" border="0">
                                        <tr>
                                            <td class="Column1JiBing">首次心率：
                                            </td>
                                            <td>
                                                <asp:Label ID="txtFirstTimeHeartRate" runat="server" Width="40px" Height="18px" />
                                                &nbsp;次/分
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <table cellpadding="0" cellspacing="0" border="0">
                                        <tr>
                                            <td class="Column1JiBing">首次心电图时间:
                                            </td>
                                            <td>
                                                <asp:Label ID="txtFirstTimeXinDianTu" runat="server" />
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <table cellpadding="0" cellspacing="0" border="0">
                                        <tr>
                                            <td class="Column1JiBing">首次抽血时间：
                                            </td>
                                            <td>
                                                <asp:Label ID="txtFirstTimeBlood" runat="server" />
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <table cellpadding="0" cellspacing="0" border="0">
                                        <tr>
                                            <td class="Column1JiBing">化验结果回报时间：<br />
                                            </td>
                                            <td>
                                                <asp:Label ID="txtFisrtTimeReturn" runat="server" />
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <table cellpadding="0" cellspacing="0" border="0">
                                        <tr>
                                            <td class="Column1JiBing">首次cTNT结果：
                                            </td>
                                            <td>
                                                <asp:Label ID="txtCNTResult" runat="server" />
                                                正常值：<asp:Label ID="txtRegularCNT" runat="server" />
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td>是否向患者或家属提出静脉溶栓的建议:&nbsp;
                                <asp:Label AutoPostBack="false" ID="rdbIntroduceThrombolysisSuggestion" runat="server" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <table cellpadding="0" cellspacing="0" border="0">
                                        <tr>
                                            <td>向患者或家属提出静脉溶栓建议的时间:
                                            </td>
                                            <td>&nbsp;
                                            <asp:Label ID="txbIntroduceThrombolysisSuggestionDate" runat="server" />
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td>是否进行了静脉溶栓治疗:&nbsp;
                                <asp:Label ID="rdbThrombolysisTreateConfirm" runat="server" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <fieldset>
                                        <legend>未进行静脉溶栓的原因</legend>
                                        <div class="styleLeft">
                                            <asp:Label ID="chkUnThrombolysisReasonForUnSute" runat="server" Text="不适合静脉溶栓或已超过静脉溶栓的时间窗," />
                                            <asp:Label ID="chkUnThrombolysisReasonForPatientDisagree" runat="server" Text="患者或家属不同意," />
                                            <asp:Label ID="chkUnThrombolyticForEconomicReason" runat="server" Text="患者经济方面的原因," />
                                            <asp:Label ID="chkUnThrombolyticForHospitalCanNotDid" runat="server" Text="本院不能进行静脉溶栓治疗," />
                                            <asp:Label ID="chkUnThrombolyticForContraindication" runat="server" Text="有溶栓治疗禁忌症," />
                                        </div>
                                    </fieldset>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <fieldset>
                                        <legend>溶栓理由</legend>
                                        <div class="styleLeft">
                                            <asp:Label ID="chkThrombolyticForDisagree" runat="server" Text="不同意进行介入治疗," />
                                            <asp:Label ID="chkThrombolyticForEconomicReason" runat="server" Text="因经济原因不能进行介入治疗," />
                                            <asp:Label ID="chkThrombolyticForDream" runat="server" Text="有介入治疗的禁忌证," />
                                            <asp:Label ID="chkThrombolyticForTimeLimited" runat="server" Text="不能在3小时内到达有介入资质的医院," />
                                        </div>
                                    </fieldset>
                                </td>
                            </tr>
                            <tr>
                                <td>开始静脉溶栓距离就诊时间（D2N）:
                                <asp:Label ID="rblTreatTime" runat="server" />
                                </td>
                            </tr>
                            <%--    静脉溶栓--%>
                            <tr>
                                <td>
                                    <fieldset>
                                        <legend>静脉溶栓</legend>
                                        <table border="0" cellpadding="0" cellspacing="0" class="tableWidth2">
                                            <tr>
                                                <td>
                                                    <table border="0" cellpadding="0" cellspacing="0" class="styleLeft">
                                                        <tr>
                                                            <td class="Column1JiBing">尿激酶: &nbsp;&nbsp;
                                                            <asp:Label ID="rblUrokinase" runat="server" />
                                                                &nbsp;&nbsp;&nbsp;&nbsp;
                                                            <asp:Panel ID="qitaNiaoJiMei" runat="server">
                                                                其他：<asp:Label ID="txtUrokinaseOther" runat="server" />
                                                                &nbsp;万U
                                                            </asp:Panel>
                                                            </td>
                                                            <td class="Column2JiBing">阿替普酶:
                                                            <asp:Label ID="rblAlteplase" runat="server" />
                                                            </td>
                                                            <td>瑞替普酶:
                                                            <asp:Label ID="rblReteplase" runat="server" />
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>是否再通:&nbsp;<asp:Label ID="rblPass" runat="server" />
                                                            </td>
                                                            <td>并发症:
                                                            <asp:Label ID="chkReperfusionArrhythmia" runat="server" Text="再灌注心律失常," />&nbsp;
                                                            <asp:Label ID="chkAnaphylaxis" runat="server" Text="过敏反应 " />&nbsp;
                                                            </td>
                                                            <td>是否出血：<asp:Label ID="chkBlood" AutoPostBack="true" runat="server" Text="出血 " />
                                                                --<asp:Label ID="rblBleed" runat="server" />
                                                            </td>
                                                        </tr>
                                                    </table>
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
                                        <table border="0" cellpadding="0" cellspacing="0" class="styleLeft" class="tableWidth2">
                                            <tr>
                                                <td>阿斯匹林:<asp:Label ID="rblAspirinDosage" runat="server" />
                                                </td>
                                                <td>氯吡格雷:<asp:Label ID="rblClopidogrelDosage" runat="server" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td colspan="2">
                                                    <table border="0" cellpadding="0" cellspacing="0">
                                                        <tr>
                                                            <td>是否应用他汀类药物:<asp:Label ID="rblLoadStatinUsed" runat="server" AutoPostBack="true" />
                                                            </td>
                                                            <td>
                                                                <asp:Panel ID="PanelRadioButtonList" runat="server">
                                                                    <asp:Label ID="chkSimvastatin" runat="server" Text="辛伐他汀, " />
                                                                    <asp:Label ID="chkPravastatin" runat="server" Text="普伐他汀," />
                                                                    <asp:Label ID="chkFluvastatin" runat="server" Text="氟伐他汀," />
                                                                    <asp:Label ID="chkAtorvastatin" runat="server" Text="阿托伐他汀," />
                                                                    <asp:Label ID="chkRosuvastatin" runat="server" Text="瑞舒伐他汀," />
                                                                    <asp:Label ID="chkPitavastatin" runat="server" Text="匹伐他汀" />
                                                                </asp:Panel>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>是否应用血管紧张素转换酶抑制剂（ACEI）:
                                                <asp:Label ID="rblACEIConfirm" runat="server" />
                                                </td>
                                                <td>是否应用β-受体阻滞剂:
                                                <asp:Label ID="rblBRBConfrim" runat="server" />
                                                </td>
                                            </tr>
                                        </table>
                                    </fieldset>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <table border="0" cellpadding="0" cellspacing="0" class="tableWidth2">
                                        <tr>
                                            <td>是否向患者或家属介绍急诊冠脉介入治疗:&nbsp;&nbsp;
                                            </td>
                                            <td>
                                                <asp:Label ID="rblIntroduceEmergencyCoronaryConfirm" runat="server" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>向患者或家属介绍急诊冠脉介入治疗的时间:
                                            </td>
                                            <td>
                                                <asp:Label ID="txtIntroduceEmergencyCoronaryDate" runat="server" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>患者或家属是否已同意接受冠脉介入治疗:&nbsp;&nbsp;
                                            </td>
                                            <td>
                                                <asp:Label ID="rblAgreeEmergencyCoronaryConfirm" runat="server" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>是否在本医院实施了急诊冠脉介入治疗:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                            </td>
                                            <td>
                                                <asp:Label ID="rdbEmergencyCoronaryTreateConfirm" runat="server" />
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <fieldset>
                                        <legend>未进行急诊冠脉介入治疗的原因</legend>
                                        <table border="0" cellpadding="0" cellspacing="0" class="styleLeft" style="width: auto;">
                                            <tr>
                                                <td>
                                                    <asp:Label ID="chkUnEmergencyCoronaryTreateForHospitalUnable" runat="server" Text="本院不能开展," />
                                                    <asp:Label ID="chkUnEmergencyCoronaryTreateForOverTreateTime" runat="server" Text="已超过介入治疗有效时间窗," />
                                                    <asp:Label ID="chkUnEmergencyCoronaryTreateForPatientDisagree" runat="server" Text="患者或家属不同意," />
                                                    <asp:Label ID="chkUnEmergencyCoronaryTreateForEmergency" runat="server" Text="患者经济原因," />
                                                    <asp:Label ID="chkUnEmergencyCoronaryTreateForContraindication" runat="server" Text="有介入治疗禁忌症," />
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
                                                <td class="Column1JiBing">是否成功:
                                                </td>
                                                <td class="Column2JiBing">
                                                    <asp:Label ID="rblSucceed" runat="server" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>D2B时间:
                                                </td>
                                                <td>
                                                    <asp:Label ID="txtD2BTime" runat="server" />
                                                    分钟
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
                <tr>
                    <td>
                        <table cellpadding="0" cellspacing="0" border="0" class="category-item">
                            <tr>
                                <td class="subTitle">临床转归
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <table border="0" cellpadding="0" cellspacing="0">
                                        <tr>
                                            <td class="Column1JiBing11">在院24h内是否进行了心肺复苏:
                                            <asp:Label ID="rblCPR" runat="server" />
                                            </td>
                                            <td>
                                                <asp:Panel ID="panetxtCPRTimes" runat="server">
                                                    &nbsp; 次数:
                                                <asp:Label ID="txtCPRTimes" runat="server" />
                                                </asp:Panel>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <table border="0" cellpadding="0" cellspacing="0">
                                        <tr>
                                            <td class="Column1JiBing11">在院24h内的转归:
                                            <asp:Label ID="rblTreatResult" runat="server" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:Panel ID="panelrblTreatResult" runat="server">
                                                    <table border="0" cellpadding="0" cellspacing="0" class="tableWidth2">
                                                        <tr>
                                                            <td style="width: 90px;">死亡时间：
                                                            </td>
                                                            <td>
                                                                <asp:Label ID="txtDeadTime" runat="server" />
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td class="tdTopBottomLine">死亡原因:
                                                            </td>
                                                            <td>
                                                                <asp:Label ID="chkDeadForVentriclarArrhythmias" runat="server" Text="室性心律失常（室速，室颤）," />&nbsp;
                                                            <asp:Label ID="chkDeadForCardiacArrest" runat="server" Text="心跳骤停/电机械分离," />&nbsp;
                                                            <asp:Label ID="chkDeadForCardiogenicShock" runat="server" Text="心源性休克," />&nbsp;
                                                            <asp:Label ID="chkDeadForACVD" runat="server" Text="急性脑血管病, " />
                                                                <asp:Label ID="chkDeadForGIH" runat="server" Text="消化道大出血, " />&nbsp;
                                                            <asp:Label ID="chkDeadForOther" runat="server" Text="其它," />
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </asp:Panel>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <table border="0" cellpadding="0" cellspacing="0">
                                        <tr>
                                            <td class="Column1JiBing11">转上级医院:
                                            <asp:Label ID="rblTransUpHospitalConfirm" runat="server" />
                                            </td>
                                            <td>
                                                <asp:Panel ID="PanelpanelrblTreatResult" runat="server">
                                                    <table border="0" cellpadding="0" cellspacing="0">
                                                        <tr>
                                                            <td>
                                                                <asp:Label ID="rblTransUpHospitalLever" runat="server" />
                                                            </td>
                                                            <td></td>
                                                        </tr>
                                                    </table>
                                                </asp:Panel>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <table border="0" cellpadding="0" cellspacing="0">
                                        <tr>
                                            <td>患者转院前是否已与上级医院联系准备下一步的治疗:
                                            <asp:Label ID="rblConnectUpHospitalConfirm" runat="server" />
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <table border="0" cellpadding="0" cellspacing="0">
                                        <tr>
                                            <td class="Column1JiBing11">患者转上级医院时间:
                                            </td>
                                            <td>&nbsp;
                                            <asp:Label ID="txbTransUpHospitalDate" runat="server" />
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td>
                        <h1 />
                    </td>
                </tr>
                <tr>
                    <td style="padding-bottom: 100px;">&nbsp;
                    </td>
                </tr>
                <tr>
                    <td align="center" class="userfont3">
                        <input id="Button1" onclick="window.print()" type="button" value="打印" name="Button"
                            class="ButtonSave1" class="NOPRINT" />
                    </td>
                </tr>
                <tr>
                    <td style="padding-bottom: 160px;">&nbsp;
                    </td>
                </tr>
            </table>
        </asp:Panel>
        <object classid="CLSID:8856F961-340A-11D0-A96B-00C04FD705A2" height="0" id="WebBrowser"
            width="0">
        </object>
    </form>
</body>
</html>
