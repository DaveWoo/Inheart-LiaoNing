using System;
using System.Web.UI.WebControls;
using DreamWork.BussinessLogic;
using DreamWork.ObjectModel;
using System.Text;

namespace CoronaryHeartDiseaseProject
{
    public partial class MessageInput
    {
        #region ReportSummation

        private Person person = null;
        public static Report_ZhuSuAndXianBingShi reportZhuSuAndXianBingShi = null;
        public static Report_JiWangBingShi reportJiWangBingShi = null;
        public static Report_ChuBuZhenDuan reportChuBuZhenDuan = null;
        public static Report_JiBingBanSuiZhuangTai reportBinLiBanSuiZhuangTai = null;
        public static Report_JingMaiRongShuan reportJinMaiRongShuan = null;
        public static Report_FuZhuYongYao reportFuZhuYongYao = null;
        public static Report_LinChuangZhuanGui reportLinChuangZhuanGui = null;
        public static Report_WeiJinXingJiZhenGuanMaiJieRuZhiLiao reportWeiJinXingJiZhenGuanMaiJieRuZhiLiao = null;
        public static Report_WeiJinXingJingMaiRongSuanLiYou reportWeiJinXingJingMaiRongSuanLiYou = null;
        public static Report_JieRuZhiLiao reportJieRuZhiLiao = null;
        static bool isLocked = false;
        static int reportID = -1;

        public static Report_Summation reportSummation = null;

        #region Set Report_Summation

        private void SetReportSummation()
        {
            if (reportSummation == null)
            {
                reportSummation = new Report_Summation();
            }

            //reportSummation.DiseaseTimeState = GetDropDownListValue(ddlDiseaseTimeState);
            //reportSummation.DiseaseTime = GetDateTimeValue(ddlYearDiseaseStartTime, ddlMonthDiseaseStartTime, ddlDayDiseaseStartTime, ddlHourDiseaseStartTime, ddlMinutesDiseaseStartTime);
            reportSummation.TreatDate = ConvertToDateTime(txbTreatTime.Text.ToString());
            if (!string.IsNullOrEmpty(txtDiseaseHour.Text))
            {
                reportSummation.DiseaseHour = int.Parse(txtDiseaseHour.Text.ToString());
            }

            reportSummation.TrafficWay = GetDropDownListValue(ddlTrafficWay);
            reportSummation.DiseaseDescriber = GetDropDownListValue(ddlDiseaseDescriber);
            reportSummation.Reliability = GetDropDownListValue(ddlReliability);

            SiteUser user = (SiteUser)Session["user"];
            reportSummation.UserID = user.ID;
            reportSummation.HospitalID = user.Hospital.ID;
            if (reportSummation.CreateDate == null || reportSummation.CreateDate == DateTime.MinValue)
            {
                reportSummation.CreateDate = DateTime.UtcNow;
            }
            reportSummation.LastUpdateDate = DateTime.UtcNow;

            SetPerson();
            SetReportLinChuangZhengZhuang();
            SetReportJiWangBingShi();
            SetReportChuBuZhengDuan();
            //疾病伴随状态:
            SetReportBinLiBanSuiZhuangTai();
            //静脉溶栓
            SetReportJinMaiRongShuan();
            //辅助用药
            SetReportFuZhuYongYao();

            //介入治疗
            SetReportJieRuZhiLiao2();

            // 介入治疗
            SetReportLinChuangZhuanGui();

            SetReportJingMaiRongSuanLiYou();

            SetReportJieRuZhiliao();

            //Set the SubTable ID
            reportSummation.PersonID = person.ID;
            reportSummation.ReportLinChuangZhengZhuangID = reportZhuSuAndXianBingShi.ID;
            reportSummation.ReportJiWangBingShiID = reportJiWangBingShi.ID;
            reportSummation.ReportChunBuZhengDuanID = reportChuBuZhenDuan.ID;
            reportSummation.ReportBinLiBanSuiZhuangTaiID = reportBinLiBanSuiZhuangTai.ID;
            reportSummation.ReportJinMaiRongShuanID = reportJinMaiRongShuan.ID;
            reportSummation.ReportFuZhuYongYaoID = reportFuZhuYongYao.ID;
            reportSummation.ReportTreatResultID = reportLinChuangZhuanGui.ID;
            reportSummation.JieRuZhiLiaoID = reportJieRuZhiLiao.ID;
            reportSummation.WeiJinXingJingMaiRongSuanLiYouID = reportWeiJinXingJingMaiRongSuanLiYou.ID;
            reportSummation.WeiJinXingJiZhenGuanMaiJieRuZhiLiaoID = reportWeiJinXingJiZhenGuanMaiJieRuZhiLiao.ID;
            reportSummation.ZhuSuAndXianBingShiID = reportZhuSuAndXianBingShi.ID;
            reportSummation.LinChuangZhuanGuiID = reportLinChuangZhuanGui.ID;
        }

        private void SetPerson()
        {
            if (person == null)
            {
                person = new Person();
            }
            if (person.ID == Guid.Empty)
            {
                person.ID = Guid.NewGuid();
            }
            person.Name = txtPatientName.Text.Trim().ToString();
            person.Sex = GetDropDownListValue(dropDownSex);
            person.Nationality = GetDropDownListValue(dropNationality);
            person.Birthday = ConvertToDateTime(txbBirthDay.Text.ToString());// GetDateTimeValue(ddlYear, ddlMonth, ddlday);
            person.Occupation = GetDropDownListValue(DropDownListJob);
        }

        private void SetReportLinChuangZhengZhuang()
        {
            if (reportZhuSuAndXianBingShi == null)
            {
                reportZhuSuAndXianBingShi = new Report_ZhuSuAndXianBingShi();
            }
            if (reportZhuSuAndXianBingShi.ID == Guid.Empty)
            {
                reportZhuSuAndXianBingShi.ID = Guid.NewGuid();
            }

            reportZhuSuAndXianBingShi.ChestPainExist = GetRadioButtonListValue(rblChestPainExist);
            //  reportLinChuangZhengZhuang.ChestPainType = GetRadioButtonListValue(rblChestPainType);
            reportZhuSuAndXianBingShi.IncentiveExist = GetRadioButtonListValue(rblIncentiveExist);
            reportZhuSuAndXianBingShi.IncentiveTypeColdStimulation = chkIncentiveTypeColdStimulation.Checked;
            reportZhuSuAndXianBingShi.IncentiveTypeDefecate = chkIncentiveTypeDefecate.Checked;
            reportZhuSuAndXianBingShi.IncentiveTypeEatMuch = chkIncentiveTypeEatMuch.Checked;
            reportZhuSuAndXianBingShi.IncentiveTypeExcite = chkIncentiveTypeExcite.Checked;
            reportZhuSuAndXianBingShi.IncentiveTypeOther = chkIncentiveTypeOther.Checked;
            reportZhuSuAndXianBingShi.IncentiveTypePhysical = chkIncentiveTypePhysical.Checked;

            reportZhuSuAndXianBingShi.PositionExist = GetRadioButtonListValue(rblPositionExist);
            reportZhuSuAndXianBingShi.PositionTypeBelowXiphoid = chkPositionTypeBelowXiphoid.Checked;
            reportZhuSuAndXianBingShi.PositionTypeChest = chkPositionTypeChest.Checked;
            reportZhuSuAndXianBingShi.PositionTypeOther = chkPositionTypeOther.Checked;
            reportZhuSuAndXianBingShi.PositionTypePrecordium = chkPositionTypePrecordium.Checked;
            reportZhuSuAndXianBingShi.PositionTypeShoulder = chkPositionTypeShoulder.Checked;

            reportZhuSuAndXianBingShi.PropertiesTypeChestCut = chkPropertiesTypeChestCut.Checked;
            reportZhuSuAndXianBingShi.PropertiesTypeChestPain = chkPropertiesTypeChestPain.Checked;
            reportZhuSuAndXianBingShi.PropertiesTypeOther = chkPropertiesTypeOther.Checked;
            reportZhuSuAndXianBingShi.PropertiesTypePharyngeal = chkPropertiesTypePharyngeal.Checked;



            reportZhuSuAndXianBingShi.RadiationPainExist = GetRadioButtonListValue(rblRadiationPainExist);
            reportZhuSuAndXianBingShi.RadiationPainTypeEpigastralgia = chkRadiationPainTypeEpigastralgia.Checked;
            reportZhuSuAndXianBingShi.RadiationPainTypeLeftShoulder = chkRadiationPainTypeLeftShoulder.Checked;
            reportZhuSuAndXianBingShi.RadiationPainTypeOther = chkRadiationPainTypeOther.Checked;
            reportZhuSuAndXianBingShi.RadiationPainTypePharyngeal = chkRadiationPainTypePharyngeal.Checked;

            reportZhuSuAndXianBingShi.ConcomitantSymptomExist = GetRadioButtonListValue(rblConcomitantSymptomExist);
            reportZhuSuAndXianBingShi.ConcomitantSymptomTypeAmaurosis = chkConcomitantSymptomTypeAmaurosis.Checked;
            reportZhuSuAndXianBingShi.ConcomitantSymptomTypeOther = chkConcomitantSymptomTypeOther.Checked;
            reportZhuSuAndXianBingShi.ConcomitantSymptomTypePalpitation = chkConcomitantSymptomTypePalpitation.Checked;
            reportZhuSuAndXianBingShi.ConcomitantSymptomTypeSyncope = chkConcomitantSymptomTypeSyncope.Checked;
            reportZhuSuAndXianBingShi.ConcomitantSymptomTypeTiredBreath = chkConcomitantSymptomTypeTiredBreath.Checked;

            //     reportZhuSuAndXianBingShi.RelievingFactorsBlackCa = chkRelievingFactorsBlackCa.Checked;
            reportZhuSuAndXianBingShi.RelievingFactorsCaRivalry = chkRelievingFactorsCaRivalry.Checked;
            reportZhuSuAndXianBingShi.RelievingFactorsLastRespond = chkRelievingFactorsLastRespond.Checked;
            reportZhuSuAndXianBingShi.RelievingFactorsNitrate = chkRelievingFactorsNitrate.Checked;
            reportZhuSuAndXianBingShi.RelievingFactorsOther = chkRelievingFactorsOther.Checked;
            reportZhuSuAndXianBingShi.RelievingFactorsRest = chkRelievingFactorsRest.Checked;

            //reportLinChuangZhengZhuang.LastedTime = txtLastedTime.Text.Trim().ToString();
            //reportLinChuangZhengZhuang.LastedMinutes = txtLastedTimeMinutes.Text.Trim().ToString();
        }

        private void SetReportJiWangBingShi()
        {
            if (reportJiWangBingShi == null)
            {
                reportJiWangBingShi = new Report_JiWangBingShi();
            }
            if (reportJiWangBingShi.ID == Guid.Empty)
            {
                reportJiWangBingShi.ID = Guid.NewGuid();
            }
            reportJiWangBingShi.MIConfirm = GetRadioButtonListValue(rblMIConfirm);
            reportJiWangBingShi.HypertensionConfirm = GetRadioButtonListValue(rblHypertensionConfirm);
            reportJiWangBingShi.HypertensionLasted = GetDropDownListValue(ddlHypertensionLasted);
            reportJiWangBingShi.HypertensionTreatedState = GetDropDownListValue(ddlHypertensionTreatedState);
            reportJiWangBingShi.GlycuresisConfirm = GetRadioButtonListValue(rblGlycuresisConfirm);
            reportJiWangBingShi.GlycuresisLasted = GetDropDownListValue(ddlGlycuresisLasted);
            reportJiWangBingShi.GlycuresisTreatedState = GetDropDownListValue(ddlGlycuresisTreatedState);
            reportJiWangBingShi.CerebralHemorrhageConfirm = GetRadioButtonListValue(rblCerebralHemorrhageConfirm);
            reportJiWangBingShi.CerebralHemorrhageTreateLasted = GetRadioButtonListValue(rblCerebralHemorrhageTreateLasted);
            reportJiWangBingShi.PeripheralVascularConfirm = GetRadioButtonListValue(rblPeripheralVascularConfirm);
            reportJiWangBingShi.AnemiaOrOtherConfirm = GetRadioButtonListValue(rblAnemiaOrOtherConfirm);
        }

        private void SetReportChuBuZhengDuan()
        {
            if (reportChuBuZhenDuan == null)
            {
                reportChuBuZhenDuan = new Report_ChuBuZhenDuan();
            }
            if (reportChuBuZhenDuan.ID == Guid.Empty)
            {
                reportChuBuZhenDuan.ID = Guid.NewGuid();
            }
            reportChuBuZhenDuan.FirstTimeHeartRate = txtFirstTimeHeartRate.Text.Trim().ToString();
            reportChuBuZhenDuan.FirstTimeXinDianTu = ConvertToDateTime(txtFirstTimeXinDianTu.Text.ToString());
            reportChuBuZhenDuan.FirstTimeBlood = ConvertToDateTime(txtFirstTimeBlood.Text.ToString());
            reportChuBuZhenDuan.FisrtTimeReturn = ConvertToDateTime(txtFisrtTimeReturn.Text.ToString());

            reportChuBuZhenDuan.CNTResult = txtCNTResult.Text.Trim().ToString();
            reportChuBuZhenDuan.RegularCNT = txtRegularCNT.Text.Trim().ToString();

            string strAcuteST = string.Empty;
            if (rdAcuteST.Checked)
            {
                strAcuteST = rdAcuteST.Text.Trim().ToString();
            }

            reportChuBuZhenDuan.AcuteST = strAcuteST;

            reportChuBuZhenDuan.Anteroseptal = chkAnteroseptal.Checked;
            reportChuBuZhenDuan.Antetheca = chkAntetheca.Checked;
            reportChuBuZhenDuan.Extensive = chkExtensive.Checked;
            reportChuBuZhenDuan.HighWall = chkHighWall.Checked;
            reportChuBuZhenDuan.HeartWall = chkHeartWall.Checked;
            reportChuBuZhenDuan.InteriorWall = chkInteriorWall.Checked;
            reportChuBuZhenDuan.BackWall = chkBackWall.Checked;
            reportChuBuZhenDuan.RightVentricular = chkRightVentricular.Checked;
            reportChuBuZhenDuan.BloodPressure = txtBloodPressure.Text.Trim().ToString();
            reportChuBuZhenDuan.DiastolicPressure = txtDiastolicPressure.Text.Trim().ToString();
        }

        private void SetReportBinLiBanSuiZhuangTai()
        {
            if (reportBinLiBanSuiZhuangTai == null)
            {
                reportBinLiBanSuiZhuangTai = new Report_JiBingBanSuiZhuangTai();
            }
            if (reportBinLiBanSuiZhuangTai.ID == Guid.Empty)
            {
                reportBinLiBanSuiZhuangTai.ID = Guid.NewGuid();
            }

            reportBinLiBanSuiZhuangTai.HypotensionExist = GetRadioButtonListValue(ddlHypotensionExist);
            // reportBinLiBanSuiZhuangTai.CardiogenicShockExist = GetRadioButtonListValue(ddlCardiogenicShockExist);
            reportBinLiBanSuiZhuangTai.ArrhythmiaExist = GetRadioButtonListValue(ddlArrhythmiaExist);

            reportBinLiBanSuiZhuangTai.VPB = chkVPB.Checked;
            reportBinLiBanSuiZhuangTai.VT = chkVT.Checked;
            reportBinLiBanSuiZhuangTai.VF = chkVF.Checked;
            reportBinLiBanSuiZhuangTai.Ats = chmAts.Checked;
            reportBinLiBanSuiZhuangTai.AFS1 = chkAFS1.Checked;
            reportBinLiBanSuiZhuangTai.AF = chkAF.Checked;
            reportBinLiBanSuiZhuangTai.APB = chkAPB.Checked;
            reportBinLiBanSuiZhuangTai.AVBI = chkAVBI.Checked;
            reportBinLiBanSuiZhuangTai.AVBII = chkAVBII.Checked;
            reportBinLiBanSuiZhuangTai.AVBIII = chkAVBIII.Checked;
            reportBinLiBanSuiZhuangTai.AFS = chkAFS.Checked;
            reportBinLiBanSuiZhuangTai.RBBB = chkRBBB.Checked;
            reportBinLiBanSuiZhuangTai.AVBOther = chkAVBOther.Checked;

            reportBinLiBanSuiZhuangTai.MitralValveProlapseOrBreakExist = GetRadioButtonListValue(ddlMitralValveProlapseOrBreakExist);
            reportBinLiBanSuiZhuangTai.PerforationofVentricularSeptumConfirm = GetRadioButtonListValue(rblPerforationofVentricularSeptumConfirm);
            reportBinLiBanSuiZhuangTai.StrokeExist = GetRadioButtonListValue(ddlStrokeExist);
            reportBinLiBanSuiZhuangTai.OGLBExist = GetRadioButtonListValue(ddlOGLBExist);

            reportBinLiBanSuiZhuangTai.KilipLevel = GetRadioButtonListValue(ddlKilipLever);
        }

        private void SetReportJinMaiRongShuan()
        {
            if (reportJinMaiRongShuan == null)
            {
                reportJinMaiRongShuan = new Report_JingMaiRongShuan();
            }
            if (reportJinMaiRongShuan.ID == Guid.Empty)
            {
                reportJinMaiRongShuan.ID = Guid.NewGuid();
            }

            reportJinMaiRongShuan.Urokinase = GetRadioButtonListValue(rblUrokinase);
            reportJinMaiRongShuan.UrokinaseOther = txtUrokinaseOther.Text.Trim().ToString();
            reportJinMaiRongShuan.Alteplase = GetRadioButtonListValue(rblAlteplase);
            reportJinMaiRongShuan.Reteplase = GetRadioButtonListValue(rblReteplase);
            reportJinMaiRongShuan.Pass = GetRadioButtonListValue(rblPass);
            reportJinMaiRongShuan.Anaphylaxis = chkAnaphylaxis.Checked;
            reportJinMaiRongShuan.Bleed = GetRadioButtonListValue(rblBleed);
            reportJinMaiRongShuan.ReperfusionArrhythmia = chkReperfusionArrhythmia.Checked;
            reportJinMaiRongShuan.TreatTime = GetRadioButtonListValue(rblTreatTime);
        }

        private void SetReportFuZhuYongYao()
        {
            if (reportFuZhuYongYao == null)
            {
                reportFuZhuYongYao = new Report_FuZhuYongYao();
            }
            if (reportFuZhuYongYao.ID == Guid.Empty)
            {
                reportFuZhuYongYao.ID = Guid.NewGuid();
            }

            reportFuZhuYongYao.AspirinDosage = GetRadioButtonListValue(rblAspirinDosage);
            reportFuZhuYongYao.ClopidogrelDosage = GetRadioButtonListValue(rblClopidogrelDosage);
            reportFuZhuYongYao.LoadStatinUsed = GetRadioButtonListValue(rblLoadStatinUsed);
            reportFuZhuYongYao.Simvastatin = chkSimvastatin.Checked;
            reportFuZhuYongYao.Pitavastatin = chkPravastatin.Checked;
            reportFuZhuYongYao.Fluvastatin = chkFluvastatin.Checked;
            reportFuZhuYongYao.Atorvastatin = chkAtorvastatin.Checked;
            reportFuZhuYongYao.Rosuvastatin = chkRosuvastatin.Checked;
            reportFuZhuYongYao.Pitavastatin = chkPitavastatin.Checked;
            reportFuZhuYongYao.ACEIConfirm = GetRadioButtonListValue(rblACEIConfirm);
            reportFuZhuYongYao.BRBConfrim = GetRadioButtonListValue(rblBRBConfrim);
        }

        private void SetReportJieRuZhiLiao2()
        {
            if (reportJieRuZhiLiao == null)
            {
                reportJieRuZhiLiao = new Report_JieRuZhiLiao();
            }
            if (reportJieRuZhiLiao.ID == Guid.Empty)
            {
                reportJieRuZhiLiao.ID = Guid.NewGuid();
            }

            reportJieRuZhiLiao.D2BTime = txtD2BTime.Text.Trim().ToString();
            reportJieRuZhiLiao.Succeed = GetRadioButtonListValue(rblSucceed);
        }

        private void SetReportLinChuangZhuanGui()
        {
            if (reportLinChuangZhuanGui == null)
            {
                reportLinChuangZhuanGui = new Report_LinChuangZhuanGui();
            }
            if (reportLinChuangZhuanGui.ID == Guid.Empty)
            {
                reportLinChuangZhuanGui.ID = Guid.NewGuid();
            }

            reportLinChuangZhuanGui.CPR = GetRadioButtonListValue(rblCPR);
            reportLinChuangZhuanGui.CPRTimes = txtCPRTimes.Text.Trim().ToString();
            reportLinChuangZhuanGui.TreatResult = GetRadioButtonListValue(rblTreatResult);

            reportLinChuangZhuanGui.IntroduceThrombolysisSuggestionConfirm = GetRadioButtonListValue(rdbIntroduceThrombolysisSuggestion);
            reportLinChuangZhuanGui.IntroduceThrombolysisSuggestionDate = ConvertToDateTime(txbIntroduceThrombolysisSuggestionDate.Text.ToString());
            reportLinChuangZhuanGui.ThrombolysisTreateConfirm = GetRadioButtonListValue(rdbThrombolysisTreateConfirm);

            reportLinChuangZhuanGui.DeadTime = txtDeadTime.Text.Trim().ToString();
            reportLinChuangZhuanGui.DeadForVentriclarArrhythmias = chkDeadForVentriclarArrhythmias.Checked;
            reportLinChuangZhuanGui.DeadForCardiogenicShock = chkDeadForCardiacArrest.Checked;
            reportLinChuangZhuanGui.DeadForCardiogenicShock = chkDeadForCardiogenicShock.Checked;
            reportLinChuangZhuanGui.DeadForACVD = chkDeadForACVD.Checked;
            reportLinChuangZhuanGui.DeadForGIH = chkDeadForGIH.Checked;
            reportLinChuangZhuanGui.DeadForOther = chkDeadForOther.Checked;

            reportLinChuangZhuanGui.IntroduceEmergencyCoronaryConfirm = GetRadioButtonListValue(rblIntroduceEmergencyCoronaryConfirm);
            reportLinChuangZhuanGui.IntroduceEmergencyCoronaryDate = ConvertToDateTime(txtIntroduceEmergencyCoronaryDate.Text.ToString());

            reportLinChuangZhuanGui.AgreeEmergencyCoronaryConfirm = GetRadioButtonListValue(rblAgreeEmergencyCoronaryConfirm);
            reportLinChuangZhuanGui.EmergencyCoronaryTreateConfirm = GetRadioButtonListValue(rdbEmergencyCoronaryTreateConfirm);

            reportLinChuangZhuanGui.ThrombolyticForDisagree = chkThrombolyticForDisagree.Checked;
            reportLinChuangZhuanGui.ThrombolyticForEconomicReason = chkThrombolyticForEconomicReason.Checked;
            reportLinChuangZhuanGui.ThrombolyticForDream = chkThrombolyticForDream.Checked;
            reportLinChuangZhuanGui.ThrombolyticForTimeLimited = chkThrombolyticForTimeLimited.Checked;

            reportLinChuangZhuanGui.TransUpHospitalConfirm = GetRadioButtonListValue(rblTransUpHospitalConfirm);
            reportLinChuangZhuanGui.TransUpHospitalLever = GetRadioButtonListValue(rblTransUpHospitalLever);
            reportLinChuangZhuanGui.TransUpHospitalDate = ConvertToDateTime(txbTransUpHospitalDate.Text.ToString());
            reportLinChuangZhuanGui.ConnectUpHospitalConfirm = GetRadioButtonListValue(rblConnectUpHospitalConfirm);
            //reportTreatResult.UpHospitalLaboratory = GetRadioButtonListValue(rblUpHospitalLaboratory);
            //reportTreatResult.CheckOutDate = ConvertToDateTime(txbCheckOutDate.Text.ToString());
        }

        private void SetReportJieRuZhiliao()
        {
            if (reportWeiJinXingJiZhenGuanMaiJieRuZhiLiao == null)
            {
                reportWeiJinXingJiZhenGuanMaiJieRuZhiLiao = new Report_WeiJinXingJiZhenGuanMaiJieRuZhiLiao();
            }
            if (reportWeiJinXingJiZhenGuanMaiJieRuZhiLiao.ID == Guid.Empty)
            {
                reportWeiJinXingJiZhenGuanMaiJieRuZhiLiao.ID = Guid.NewGuid();
            }

            reportWeiJinXingJiZhenGuanMaiJieRuZhiLiao.UnEmergencyCoronaryTreateForHospitalUnable = chkUnEmergencyCoronaryTreateForHospitalUnable.Checked;
            reportWeiJinXingJiZhenGuanMaiJieRuZhiLiao.UnEmergencyCoronaryTreateForOverTreateTime = chkUnEmergencyCoronaryTreateForOverTreateTime.Checked;
            reportWeiJinXingJiZhenGuanMaiJieRuZhiLiao.UnEmergencyCoronaryTreateForPatientDisagree = chkUnEmergencyCoronaryTreateForPatientDisagree.Checked;
            reportWeiJinXingJiZhenGuanMaiJieRuZhiLiao.UnEmergencyCoronaryTreateForEmergency = chkUnEmergencyCoronaryTreateForEmergency.Checked;
            reportWeiJinXingJiZhenGuanMaiJieRuZhiLiao.UnEmergencyCoronaryTreateForContraindication = chkUnEmergencyCoronaryTreateForContraindication.Checked;
        }

        private void SetReportJingMaiRongSuanLiYou()
        {
            if (reportWeiJinXingJingMaiRongSuanLiYou == null)
            {
                reportWeiJinXingJingMaiRongSuanLiYou = new Report_WeiJinXingJingMaiRongSuanLiYou();
            }
            if (reportWeiJinXingJingMaiRongSuanLiYou.ID == Guid.Empty)
            {
                reportWeiJinXingJingMaiRongSuanLiYou.ID = Guid.NewGuid();
            }

            reportWeiJinXingJingMaiRongSuanLiYou.UnThrombolysisReasonForUnSute = chkUnThrombolysisReasonForUnSute.Checked;
            reportWeiJinXingJingMaiRongSuanLiYou.UnThrombolysisReasonForPatientDisagree = chkUnThrombolysisReasonForPatientDisagree.Checked;
            reportWeiJinXingJingMaiRongSuanLiYou.UnThrombolyticForContraindication = chkUnThrombolyticForContraindication.Checked;
            reportWeiJinXingJingMaiRongSuanLiYou.UnThrombolyticForEconomicReason = chkUnThrombolyticForEconomicReason.Checked;
            reportWeiJinXingJingMaiRongSuanLiYou.UnThrombolyticForHospitalCanNotDid = chkUnThrombolyticForHospitalCanNotDid.Checked;
        }

        #endregion Set Report_Summation

        #region Init ReportSummation

        private void InitReportSummation()
        {
            InitPerson();
            InitReportLinChuangZhengZhuang();
            InitReportJiWangBingShi();
            InitReportChuBuZhengDuan();
            InitReportBinLiBanSuiZhuangTai();
            InitReportJinMaiRongShuan();
            InitReportFuZhuYongYao();
            InitReportJieRuZhiLiao();
            InitReportTreatResult();

            //SetDropDownListValue(reportSummation.DiseaseTimeState, ddlDiseaseTimeState);
            //SetDateTimeValue(ddlYearDiseaseStartTime, ddlMonthDiseaseStartTime, ddlDayDiseaseStartTime, ddlHourDiseaseStartTime, ddlMinutesDiseaseStartTime, reportSummation.DiseaseTime);
            //SetDateTimeValue(ddlYearVisit, ddlMonthVisit, ddlDayVisit, ddlHourVisit, ddlMinutesVisit, reportSummation.TreatDate);
            txtDiseaseHour.Text = reportSummation.DiseaseHour.ToString();
            txbTreatTime.Text = SetDateTime(reportSummation.TreatDate);
            txtDiseaseHour.Text = reportSummation.DiseaseHour.ToString();
            SetDropDownListValue(reportSummation.TrafficWay, ddlTrafficWay);
            SetDropDownListValue(reportSummation.DiseaseDescriber, ddlDiseaseDescriber);
            SetDropDownListValue(reportSummation.Reliability, ddlReliability);

            if (!string.IsNullOrEmpty(reportJinMaiRongShuan.Bleed))
            {
                this.chkBlood.Checked = true;
            }
        }

        private void InitPerson()
        {
            txtPatientName.Text = person.Name;
            SetDropDownListValue(person.Sex, dropDownSex);
            SetDropDownListValue(person.Nationality, dropNationality);
            if (person.Birthday != null)
            {
                txbBirthDay.Text = person.Birthday.Value.ToString("yyyy-MM-dd");
            }
            else
            {
                txbBirthDay.Text = null;
            }
            if (!string.IsNullOrEmpty(txbBirthDay.Text))
            {
                this.txtAge.Text = (DateTime.Now.Year - Convert.ToDateTime(txbBirthDay.Text).Year).ToString();
            }

            SetDropDownListValue(person.Occupation, DropDownListJob);
        }

        private void InitReportLinChuangZhengZhuang()
        {
            SetRadioButtonListValue(reportZhuSuAndXianBingShi.ChestPainExist, rblChestPainExist);
            // SetRadioButtonListValue(reportLinChuangZhengZhuang.ChestPainType, rblChestPainType);
            SetRadioButtonListValue(reportZhuSuAndXianBingShi.IncentiveExist, rblIncentiveExist);
            SetCheckBox(reportZhuSuAndXianBingShi.IncentiveTypeColdStimulation, chkIncentiveTypeColdStimulation);
            SetCheckBox(reportZhuSuAndXianBingShi.IncentiveTypeDefecate, chkIncentiveTypeDefecate);
            SetCheckBox(reportZhuSuAndXianBingShi.IncentiveTypeEatMuch, chkIncentiveTypeEatMuch);
            SetCheckBox(reportZhuSuAndXianBingShi.IncentiveTypeExcite, chkIncentiveTypeExcite);
            SetCheckBox(reportZhuSuAndXianBingShi.IncentiveTypeOther, chkIncentiveTypeOther);
            SetCheckBox(reportZhuSuAndXianBingShi.IncentiveTypePhysical, chkIncentiveTypePhysical);

            SetRadioButtonListValue(reportZhuSuAndXianBingShi.PositionExist, rblPositionExist);
            SetCheckBox(reportZhuSuAndXianBingShi.PositionTypeBelowXiphoid, chkPositionTypeBelowXiphoid);
            SetCheckBox(reportZhuSuAndXianBingShi.PositionTypeChest, chkPositionTypeChest);
            SetCheckBox(reportZhuSuAndXianBingShi.PositionTypeOther, chkPositionTypeOther);
            SetCheckBox(reportZhuSuAndXianBingShi.PositionTypePrecordium, chkPositionTypePrecordium);
            SetCheckBox(reportZhuSuAndXianBingShi.PositionTypeShoulder, chkPositionTypeShoulder);

            SetCheckBox(reportZhuSuAndXianBingShi.IncentiveTypeColdStimulation, chkIncentiveTypeColdStimulation);
            SetCheckBox(reportZhuSuAndXianBingShi.IncentiveTypeColdStimulation, chkIncentiveTypeColdStimulation);

            //txtLastedTime.Text = reportLinChuangZhengZhuang.LastedTime;
            //txtLastedTimeMinutes.Text = reportLinChuangZhengZhuang.LastedMinutes;

            SetCheckBox(reportZhuSuAndXianBingShi.PropertiesTypeChestCut, chkPropertiesTypeChestCut);
            SetCheckBox(reportZhuSuAndXianBingShi.PropertiesTypeChestPain, chkPropertiesTypeChestPain);
            SetCheckBox(reportZhuSuAndXianBingShi.PropertiesTypeOther, chkPropertiesTypeOther);
            SetCheckBox(reportZhuSuAndXianBingShi.PropertiesTypePharyngeal, chkPropertiesTypePharyngeal);

            SetRadioButtonListValue(reportZhuSuAndXianBingShi.RadiationPainExist, rblRadiationPainExist);
            SetCheckBox(reportZhuSuAndXianBingShi.RadiationPainTypeEpigastralgia, chkRadiationPainTypeEpigastralgia);
            SetCheckBox(reportZhuSuAndXianBingShi.RadiationPainTypeLeftShoulder, chkRadiationPainTypeLeftShoulder);
            SetCheckBox(reportZhuSuAndXianBingShi.RadiationPainTypeOther, chkRadiationPainTypeOther);
            SetCheckBox(reportZhuSuAndXianBingShi.RadiationPainTypePharyngeal, chkRadiationPainTypePharyngeal);

            SetRadioButtonListValue(reportZhuSuAndXianBingShi.ConcomitantSymptomExist, rblConcomitantSymptomExist);
            SetCheckBox(reportZhuSuAndXianBingShi.ConcomitantSymptomTypeAmaurosis, chkConcomitantSymptomTypeAmaurosis);
            SetCheckBox(reportZhuSuAndXianBingShi.ConcomitantSymptomTypeOther, chkConcomitantSymptomTypeOther);
            SetCheckBox(reportZhuSuAndXianBingShi.ConcomitantSymptomTypePalpitation, chkConcomitantSymptomTypePalpitation);
            SetCheckBox(reportZhuSuAndXianBingShi.ConcomitantSymptomTypeSyncope, chkConcomitantSymptomTypeSyncope);
            SetCheckBox(reportZhuSuAndXianBingShi.ConcomitantSymptomTypeTiredBreath, chkConcomitantSymptomTypeTiredBreath);

            //     SetCheckBox(reportZhuSuAndXianBingShi.RelievingFactorsBlackCa, chkRelievingFactorsBlackCa);
            SetCheckBox(reportZhuSuAndXianBingShi.RelievingFactorsCaRivalry, chkRelievingFactorsCaRivalry);
            SetCheckBox(reportZhuSuAndXianBingShi.RelievingFactorsLastRespond, chkRelievingFactorsLastRespond);
            SetCheckBox(reportZhuSuAndXianBingShi.RelievingFactorsNitrate, chkRelievingFactorsNitrate);
            SetCheckBox(reportZhuSuAndXianBingShi.RelievingFactorsOther, chkRelievingFactorsOther);
            SetCheckBox(reportZhuSuAndXianBingShi.RelievingFactorsRest, chkRelievingFactorsRest);

        }

        private void InitReportJiWangBingShi()
        {
            SetRadioButtonListValue(reportJiWangBingShi.HypertensionConfirm, rblHypertensionConfirm);
            SetRadioButtonListValue(reportJiWangBingShi.MIConfirm, rblMIConfirm);
            SetDropDownListValue(reportJiWangBingShi.HypertensionLasted, ddlHypertensionLasted);
            SetDropDownListValue(reportJiWangBingShi.HypertensionTreatedState, ddlHypertensionTreatedState);
            SetRadioButtonListValue(reportJiWangBingShi.GlycuresisConfirm, rblGlycuresisConfirm);
            SetDropDownListValue(reportJiWangBingShi.GlycuresisLasted, ddlGlycuresisLasted);
            SetDropDownListValue(reportJiWangBingShi.GlycuresisTreatedState, ddlGlycuresisTreatedState);
            SetRadioButtonListValue(reportJiWangBingShi.CerebralHemorrhageConfirm, rblCerebralHemorrhageConfirm);
            SetRadioButtonListValue(reportJiWangBingShi.CerebralHemorrhageTreateLasted, rblCerebralHemorrhageTreateLasted);
            SetRadioButtonListValue(reportJiWangBingShi.PeripheralVascularConfirm, rblPeripheralVascularConfirm);
            SetRadioButtonListValue(reportJiWangBingShi.AnemiaOrOtherConfirm, rblAnemiaOrOtherConfirm);
        }

        private void InitReportChuBuZhengDuan()
        {
            txtFirstTimeHeartRate.Text = reportChuBuZhenDuan.FirstTimeHeartRate;
            txtFirstTimeXinDianTu.Text = reportChuBuZhenDuan.FirstTimeXinDianTu.ToString();
            txtFirstTimeBlood.Text = reportChuBuZhenDuan.FirstTimeBlood.ToString();
            txtFisrtTimeReturn.Text = reportChuBuZhenDuan.FisrtTimeReturn.ToString();
            txtCNTResult.Text = reportChuBuZhenDuan.CNTResult;
            txtRegularCNT.Text = reportChuBuZhenDuan.RegularCNT;

            string strAcuteST = reportChuBuZhenDuan.AcuteST;
            if (rdAcuteST.Text.Equals(strAcuteST, StringComparison.CurrentCultureIgnoreCase))
            {
                rdAcuteST.Checked = true;
            }


            SetCheckBox(reportChuBuZhenDuan.Anteroseptal, chkAnteroseptal);
            SetCheckBox(reportChuBuZhenDuan.Antetheca, chkAntetheca);
            SetCheckBox(reportChuBuZhenDuan.Extensive, chkExtensive);
            SetCheckBox(reportChuBuZhenDuan.HighWall, chkHighWall);
            SetCheckBox(reportChuBuZhenDuan.HeartWall, chkHeartWall);
            SetCheckBox(reportChuBuZhenDuan.InteriorWall, chkInteriorWall);
            SetCheckBox(reportChuBuZhenDuan.BackWall, chkBackWall);
            SetCheckBox(reportChuBuZhenDuan.RightVentricular, chkRightVentricular);


            txtBloodPressure.Text = reportChuBuZhenDuan.BloodPressure;
            txtDiastolicPressure.Text = reportChuBuZhenDuan.DiastolicPressure;
        }

        private void InitReportBinLiBanSuiZhuangTai()
        {
            SetRadioButtonListValue(reportBinLiBanSuiZhuangTai.HypotensionExist, ddlHypotensionExist);
            // SetRadioButtonListValue(reportBinLiBanSuiZhuangTai.CardiogenicShockExist, ddlCardiogenicShockExist);
            SetRadioButtonListValue(reportBinLiBanSuiZhuangTai.ArrhythmiaExist, ddlArrhythmiaExist);

            SetCheckBox(reportBinLiBanSuiZhuangTai.VPB, chkVPB);
            SetCheckBox(reportBinLiBanSuiZhuangTai.VT, chkVT);
            SetCheckBox(reportBinLiBanSuiZhuangTai.VF, chkVF);
            SetCheckBox(reportBinLiBanSuiZhuangTai.Ats, chmAts);
            SetCheckBox(reportBinLiBanSuiZhuangTai.AFS1, chkAFS1);
            SetCheckBox(reportBinLiBanSuiZhuangTai.AF, chkAF);
            SetCheckBox(reportBinLiBanSuiZhuangTai.APB, chkAPB);
            SetCheckBox(reportBinLiBanSuiZhuangTai.AVBI, chkAVBI);
            SetCheckBox(reportBinLiBanSuiZhuangTai.AVBII, chkAVBII);
            SetCheckBox(reportBinLiBanSuiZhuangTai.AVBIII, chkAVBIII);
            SetCheckBox(reportBinLiBanSuiZhuangTai.AFS, chkAFS);
            SetCheckBox(reportBinLiBanSuiZhuangTai.RBBB, chkRBBB);
            SetCheckBox(reportBinLiBanSuiZhuangTai.AVBOther, chkAVBOther);

            SetRadioButtonListValue(reportBinLiBanSuiZhuangTai.MitralValveProlapseOrBreakExist, ddlMitralValveProlapseOrBreakExist);
            SetRadioButtonListValue(reportBinLiBanSuiZhuangTai.PerforationofVentricularSeptumConfirm, rblPerforationofVentricularSeptumConfirm);
            SetRadioButtonListValue(reportBinLiBanSuiZhuangTai.StrokeExist, ddlStrokeExist);
            SetRadioButtonListValue(reportBinLiBanSuiZhuangTai.OGLBExist, ddlOGLBExist);
            SetRadioButtonListValue(reportBinLiBanSuiZhuangTai.KilipLevel, ddlKilipLever);
        }

        private void InitReportJinMaiRongShuan()
        {
            SetRadioButtonListValue(reportJinMaiRongShuan.Urokinase, rblUrokinase);
            txtUrokinaseOther.Text = reportJinMaiRongShuan.UrokinaseOther;
            SetRadioButtonListValue(reportJinMaiRongShuan.Alteplase, rblAlteplase);
            SetRadioButtonListValue(reportJinMaiRongShuan.Reteplase, rblReteplase);
            SetRadioButtonListValue(reportJinMaiRongShuan.Pass, rblPass);
            SetCheckBox(reportJinMaiRongShuan.Anaphylaxis, chkAnaphylaxis);
            SetRadioButtonListValue(reportJinMaiRongShuan.Bleed, rblBleed);
            SetCheckBox(reportJinMaiRongShuan.ReperfusionArrhythmia, chkReperfusionArrhythmia);
            SetRadioButtonListValue(reportJinMaiRongShuan.TreatTime, rblTreatTime);
        }

        private void InitReportFuZhuYongYao()
        {
            SetRadioButtonListValue(reportFuZhuYongYao.AspirinDosage, rblAspirinDosage);
            SetRadioButtonListValue(reportFuZhuYongYao.ClopidogrelDosage, rblClopidogrelDosage);
            SetRadioButtonListValue(reportFuZhuYongYao.LoadStatinUsed, rblLoadStatinUsed);

            SetCheckBox(reportFuZhuYongYao.Simvastatin, chkSimvastatin);
            SetCheckBox(reportFuZhuYongYao.Pitavastatin, chkPravastatin);
            SetCheckBox(reportFuZhuYongYao.Fluvastatin, chkFluvastatin);
            SetCheckBox(reportFuZhuYongYao.Atorvastatin, chkAtorvastatin);
            SetCheckBox(reportFuZhuYongYao.Rosuvastatin, chkRosuvastatin);
            SetCheckBox(reportFuZhuYongYao.Pitavastatin, chkPitavastatin);

            SetRadioButtonListValue(reportFuZhuYongYao.ACEIConfirm, rblACEIConfirm);
            SetRadioButtonListValue(reportFuZhuYongYao.BRBConfrim, rblBRBConfrim);
        }

        private void InitReportJieRuZhiLiao()
        {
            txtD2BTime.Text = reportJieRuZhiLiao.D2BTime;
            SetRadioButtonListValue(reportJieRuZhiLiao.Succeed, rblSucceed);
        }

        private void InitReportTreatResult()
        {
            SetRadioButtonListValue(reportLinChuangZhuanGui.CPR, rblCPR);
            txtCPRTimes.Text = reportLinChuangZhuanGui.CPRTimes;
            SetRadioButtonListValue(reportLinChuangZhuanGui.TreatResult, rblTreatResult);
            SetRadioButtonListValue(reportLinChuangZhuanGui.IntroduceThrombolysisSuggestionConfirm, rdbIntroduceThrombolysisSuggestion);
            txbIntroduceThrombolysisSuggestionDate.Text = reportLinChuangZhuanGui.IntroduceThrombolysisSuggestionDate.ToString();
            SetRadioButtonListValue(reportLinChuangZhuanGui.ThrombolysisTreateConfirm, rdbThrombolysisTreateConfirm);
            SetCheckBox(reportWeiJinXingJingMaiRongSuanLiYou.UnThrombolysisReasonForPatientDisagree, chkUnThrombolysisReasonForPatientDisagree);
            SetCheckBox(reportWeiJinXingJingMaiRongSuanLiYou.UnThrombolysisReasonForUnSute, chkUnThrombolysisReasonForUnSute);
            SetCheckBox(reportWeiJinXingJingMaiRongSuanLiYou.UnThrombolyticForContraindication, chkUnThrombolyticForContraindication);
            SetCheckBox(reportWeiJinXingJingMaiRongSuanLiYou.UnThrombolyticForEconomicReason, chkUnThrombolyticForEconomicReason);
            SetCheckBox(reportWeiJinXingJingMaiRongSuanLiYou.UnThrombolyticForHospitalCanNotDid, chkUnThrombolyticForHospitalCanNotDid);

            txtDeadTime.Text = reportLinChuangZhuanGui.DeadTime;
            SetCheckBox(reportLinChuangZhuanGui.DeadForVentriclarArrhythmias, chkDeadForVentriclarArrhythmias);
            SetCheckBox(reportLinChuangZhuanGui.DeadForCardiogenicShock, chkDeadForCardiacArrest);
            SetCheckBox(reportLinChuangZhuanGui.DeadForCardiogenicShock, chkDeadForCardiogenicShock);
            SetCheckBox(reportLinChuangZhuanGui.DeadForACVD, chkDeadForACVD);
            SetCheckBox(reportLinChuangZhuanGui.DeadForGIH, chkDeadForGIH);
            SetCheckBox(reportLinChuangZhuanGui.DeadForOther, chkDeadForOther);

            SetRadioButtonListValue(reportLinChuangZhuanGui.IntroduceEmergencyCoronaryConfirm, rblIntroduceEmergencyCoronaryConfirm);
            txtIntroduceEmergencyCoronaryDate.Text = reportLinChuangZhuanGui.IntroduceEmergencyCoronaryDate.ToString();
            SetRadioButtonListValue(reportLinChuangZhuanGui.EmergencyCoronaryTreateConfirm, rdbEmergencyCoronaryTreateConfirm);
            SetCheckBox(reportWeiJinXingJiZhenGuanMaiJieRuZhiLiao.UnEmergencyCoronaryTreateForContraindication, chkUnEmergencyCoronaryTreateForContraindication);
            SetCheckBox(reportWeiJinXingJiZhenGuanMaiJieRuZhiLiao.UnEmergencyCoronaryTreateForEmergency, chkUnEmergencyCoronaryTreateForEmergency);
            SetCheckBox(reportWeiJinXingJiZhenGuanMaiJieRuZhiLiao.UnEmergencyCoronaryTreateForHospitalUnable, chkUnEmergencyCoronaryTreateForHospitalUnable);
            SetCheckBox(reportWeiJinXingJiZhenGuanMaiJieRuZhiLiao.UnEmergencyCoronaryTreateForOverTreateTime, chkUnEmergencyCoronaryTreateForOverTreateTime);
            SetCheckBox(reportWeiJinXingJiZhenGuanMaiJieRuZhiLiao.UnEmergencyCoronaryTreateForPatientDisagree, chkUnEmergencyCoronaryTreateForPatientDisagree);

            SetRadioButtonListValue(reportLinChuangZhuanGui.AgreeEmergencyCoronaryConfirm, rblAgreeEmergencyCoronaryConfirm);
            SetCheckBox(reportLinChuangZhuanGui.ThrombolyticForDisagree, chkThrombolyticForDisagree);
            SetCheckBox(reportLinChuangZhuanGui.ThrombolyticForEconomicReason, chkThrombolyticForEconomicReason);
            SetCheckBox(reportLinChuangZhuanGui.ThrombolyticForDream, chkThrombolyticForDream);
            SetCheckBox(reportLinChuangZhuanGui.ThrombolyticForTimeLimited, chkThrombolyticForTimeLimited);

            SetRadioButtonListValue(reportLinChuangZhuanGui.TransUpHospitalConfirm, rblTransUpHospitalConfirm);
            SetRadioButtonListValue(reportLinChuangZhuanGui.TransUpHospitalLever, rblTransUpHospitalLever);
            txbTransUpHospitalDate.Text = reportLinChuangZhuanGui.TransUpHospitalDate.ToString();

            SetRadioButtonListValue(reportLinChuangZhuanGui.EmergencyCoronaryTreateConfirm, rdbEmergencyCoronaryTreateConfirm);
            SetRadioButtonListValue(reportLinChuangZhuanGui.ConnectUpHospitalConfirm, rblConnectUpHospitalConfirm);
        }

        #endregion Init ReportSummation

        #region Common Method

        private string GetRadioButtonListValue(RadioButtonList radioButtonList)
        {
            string value = string.Empty;
            if (radioButtonList.SelectedItem != null)
            {
                value = radioButtonList.SelectedItem.Text.Trim().ToString();
            }
            return value;
        }

        private string GetDropDownListValue(DropDownList dropDownList)
        {
            string value = string.Empty;
            if (dropDownList.SelectedItem != null)
            {
                value = dropDownList.SelectedItem.Text.Trim().ToString();
            }
            return value;
        }

        private string SetDateTime(DateTime? dateTime)
        {
            if (dateTime == null)
            {
                return string.Empty;
            }
            else
            {
                return dateTime.ToString();
            }
        }

        private DateTime? ConvertToDateTime(string dateTime)
        {
            try
            {
                return Convert.ToDateTime(dateTime);
            }
            catch (Exception)
            {
                return null;
            }
        }

        private void SetRadioButtonListValue(string value, RadioButtonList radioButtonList)
        {
            if (string.IsNullOrEmpty(value))
            {
                return;
            }
            for (int i = 0; i < radioButtonList.Items.Count; i++)
            {
                ListItem item = radioButtonList.Items[i];
                if (item.Text.Trim().Equals(value.Trim(), StringComparison.CurrentCultureIgnoreCase))
                {
                    radioButtonList.SelectedIndex = i;

                    break;
                }
            }
        }

        private void SetDropDownListValue(string value, DropDownList dropDownList)
        {
            if (string.IsNullOrEmpty(value))
            {
                return;
            }
            for (int i = 0; i < dropDownList.Items.Count; i++)
            {
                ListItem item = dropDownList.Items[i];
                if (item.Text.Equals(value.Trim(), StringComparison.CurrentCultureIgnoreCase))
                {
                    dropDownList.SelectedIndex = i;
                    break;
                }
            }
        }

        private void SetNummeralDropDownList(string value, DropDownList dropDownList)
        {
            for (int i = 0; i < dropDownList.Items.Count; i++)
            {
                ListItem item = dropDownList.Items[i];
                if (item.Value.Equals(value.Trim(), StringComparison.CurrentCultureIgnoreCase))
                {
                    dropDownList.SelectedIndex = i;
                    break;
                }
            }
        }

        private void SetCheckBox(bool? value, CheckBox checkBox)
        {
            if (value == null)
            {
                checkBox.Checked = false;
            }
            else
            {
                checkBox.Checked = Boolean.Parse(value.ToString());
            }
        }

        private DateTime GetDateTimeValue(DropDownList ddlYear, DropDownList ddlMonth, DropDownList ddlDay)
        {
            DateTime dt;

            if (ddlYear == null
                || ddlMonth == null
                || ddlDay == null)
            {
                throw new ArgumentException("At least one of the dropdown list is null.");
            }
            int valYear = DateTime.Today.Year;
            int valMonth = DateTime.Today.Month;
            int valDay = DateTime.Today.Day;
            int valHour = DateTime.Today.Hour;
            int valMinute = DateTime.Today.Minute;
            int valSecond = 0;

            int val;
            if (ddlYear.SelectedItem != null
                && int.TryParse(ddlYear.SelectedValue, out val))
            {
                valYear = val;
            }

            if (ddlMonth.SelectedItem != null
                && int.TryParse(ddlMonth.SelectedValue, out val))
            {
                valMonth = val;
            }
            //if (ddlday.SelectedItem != null
            //    && int.TryParse(ddlDay.SelectedValue, out val))
            //{
            //    valDay = val;
            //}

            dt = new DateTime(valYear, valMonth, valDay, valHour, valMinute, valSecond);

            return dt;
        }

        private void SetDateTimeValue(DropDownList ddlYear, DropDownList ddlMonth, DropDownList ddlDay, DateTime? dateTime)
        {
            DateTime dt = new DateTime();
            if (dateTime == null)
            {
                return;
            }
            else
            {
                dt = Convert.ToDateTime(dateTime);
            }
            if (ddlYear == null
               || ddlMonth == null
               || ddlDay == null)
            {
                throw new ArgumentException("At least one of the dropdown list is null.");
            }
            int valYear = dt.Year;
            int valMonth = dt.Month;
            int valDay = dt.Day;

            SetNummeralDropDownList(valYear.ToString(), ddlYear);
            SetNummeralDropDownList(valMonth.ToString(), ddlMonth);

            BindDateForDays(ddlYear, ddlMonth, ddlDay);

            SetNummeralDropDownList(valDay.ToString(), ddlDay);
        }

        private DateTime GetDateTimeValue(DropDownList ddlYear, DropDownList ddlMonth, DropDownList ddlDay, DropDownList ddlHour, DropDownList ddlMinute)
        {
            DateTime dt;

            if (ddlYear == null
                || ddlMonth == null
                || ddlDay == null
                || ddlHour == null
                || ddlMinute == null)
            {
                throw new ArgumentException("At least one of the dropdown list is null.");
            }
            int valYear = DateTime.Today.Year;
            int valMonth = DateTime.Today.Month;
            int valDay = DateTime.Today.Day;
            int valHour = DateTime.Today.Hour;
            int valMinute = DateTime.Today.Minute;
            int valSecond = 0;

            int val;
            if (ddlYear.SelectedItem != null
                && int.TryParse(ddlYear.SelectedValue, out val))
            {
                valYear = val;
            }

            if (ddlMonth.SelectedItem != null
                && int.TryParse(ddlMonth.SelectedValue, out val))
            {
                valMonth = val;
            }
            //if (ddlday.SelectedItem != null
            //    && int.TryParse(ddlDay.SelectedValue, out val))
            //{
            //    valDay = val;
            //}

            if (ddlHour.SelectedItem != null
                && int.TryParse(ddlHour.SelectedValue, out val))
            {
                valHour = val;
            }
            if (ddlMinute.SelectedItem != null
                && int.TryParse(ddlMinute.SelectedValue, out val))
            {
                valMinute = val;
            }

            dt = new DateTime(valYear, valMonth, valDay, valHour, valMinute, valSecond);

            return dt;
        }

        private void SetDateTimeValue(DropDownList ddlYear, DropDownList ddlMonth, DropDownList ddlDay, DropDownList ddlHour, DropDownList ddlMinute, DateTime? dateTime)
        {
            DateTime dt = new DateTime();
            if (dateTime == null)
            {
                return;
            }
            else
            {
                dt = Convert.ToDateTime(dateTime);
            }
            if (ddlYear == null
                || ddlMonth == null
                || ddlDay == null
                || ddlHour == null
                || ddlMinute == null)
            {
                throw new ArgumentException("At least one of the dropdown list is null.");
            }
            int valYear = dt.Year;
            int valMonth = dt.Month;
            int valDay = dt.Day;
            int valHour = dt.Hour;
            int valMinute = dt.Minute;

            SetNummeralDropDownList(valYear.ToString(), ddlYear);
            SetNummeralDropDownList(valMonth.ToString(), ddlMonth);

            BindDateForDays(ddlYear, ddlMonth, ddlDay);

            SetNummeralDropDownList(valDay.ToString(), ddlDay);
            SetNummeralDropDownList(valHour.ToString(), ddlHour);
            SetNummeralDropDownList(valMinute.ToString(), ddlMinute);
        }

        #endregion Common Method

        protected void btnSave_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                try
                {
                    string errorMessage = CheckControlValue(this.Controls);
                    if (!string.IsNullOrEmpty(errorMessage))
                    {
                        lblErrorMessage.Text = "黄色项为必填项!";
                        return;
                    }

                    SaveReportSummation(false);

                    string htmlstring = string.Empty;
                    htmlstring = "MessageInput.aspx?IsLocked=false";
                    htmlstring = htmlstring + "&ReportID=" + reportID;

                    this.Response.Write(BaseSystem.ShowWindow("病例保存成功！！", htmlstring));
                }
                catch (Exception ex)
                {
                    //  lblMessage.Text = ex.Message + ex.InnerException;
                }
            }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                try
                {
                    string errorMessage = CheckControlValue(this.Controls);
                    if (!string.IsNullOrEmpty(errorMessage))
                    {
                        lblErrorMessage.Text = "黄色项为必填项!";
                        return;
                    }
                    SaveReportSummation(true);

                    string htmlstring = string.Empty;
                    htmlstring = "MessageInput.aspx?IsLocked=false";
                    htmlstring = htmlstring + "&ReportID=" + reportID;

                    this.Response.Write(BaseSystem.ShowWindow("病例提交成功！！", htmlstring));
                }
                catch (Exception ex)
                {
                    //lblMessage.Text = ex.Message + ex.InnerException;
                }
            }
        }


        private void SaveReportSummation(bool isSubmit)
        {
            SetReportSummation();
            reportSummation.IsSubmit = isSubmit;
            medicalReportBLO.InsertReportSummation(
                person,
                reportBinLiBanSuiZhuangTai,
                reportChuBuZhenDuan,
                reportFuZhuYongYao,
                reportJinMaiRongShuan,
                reportJiWangBingShi,
                reportJieRuZhiLiao,
                reportWeiJinXingJingMaiRongSuanLiYou,
                reportWeiJinXingJiZhenGuanMaiJieRuZhiLiao,
                reportZhuSuAndXianBingShi,
                reportLinChuangZhuanGui,
                reportZhuSuAndXianBingShi,
                reportSummation,
                out reportID);
            //   RestReportData();
        }

        private void RestReportData()
        {
            person = null;
            reportZhuSuAndXianBingShi = null;
            reportJiWangBingShi = null;
            reportChuBuZhenDuan = null;
            reportBinLiBanSuiZhuangTai = null;
            reportJinMaiRongShuan = null;
            reportFuZhuYongYao = null;
            reportLinChuangZhuanGui = null;
            reportSummation = null;
        }

        private void InitReport()
        {
            isLocked = bool.Parse(Request.QueryString["IsLocked"]);
            try
            {
                reportID = int.Parse(Request.QueryString["ReportID"]);
            }
            catch (Exception)
            {
                reportID = -1;
            }


            //bool isLocked = false;
            //int reportID = 49;
            if (isLocked || (SiteUser)Session["user"] == null)
            {
                //this.form1.Disabled = true;
                this.btnSave.Enabled = false;
                this.btnSubmit.Enabled = false;
            }
            reportSummation = medicalReportBLO.GetReportSummationByReportID(reportID);

            if (reportSummation != null)
            {
                person = reportSummation.Person;
                reportZhuSuAndXianBingShi = reportSummation.Report_ZhuSuAndXianBingShi;
                reportJiWangBingShi = reportSummation.Report_JiWangBingShi;
                reportChuBuZhenDuan = reportSummation.Report_ChuBuZhenDuan;
                reportBinLiBanSuiZhuangTai = reportSummation.Report_JiBingBanSuiZhuangTai;
                reportJinMaiRongShuan = reportSummation.Report_JingMaiRongShuan;
                reportFuZhuYongYao = reportSummation.Report_FuZhuYongYao;
                reportLinChuangZhuanGui = reportSummation.Report_LinChuangZhuanGui;
                reportWeiJinXingJiZhenGuanMaiJieRuZhiLiao = reportSummation.Report_WeiJinXingJiZhenGuanMaiJieRuZhiLiao;
                reportWeiJinXingJingMaiRongSuanLiYou = reportSummation.Report_WeiJinXingJingMaiRongSuanLiYou;
                reportJieRuZhiLiao = reportSummation.Report_JieRuZhiLiao;

                this.InitReportSummation();

                this.SetControlVisible();
            }
        }

        protected void SetControlVisible1()
        {
            if (rblCPR.Text == "有")
            {
                this.panetxtCPRTimes.Visible = true;
            }
            else
            {
                this.panetxtCPRTimes.Visible = false;
            }

            //if (rblChestPainExist.Text == "有")
            //{
            //    this.PanelrblChestPainType.Visible = true;
            //}
            //else
            //{
            //    this.PanelrblChestPainType.Visible = false;
            //}

            if (rblTreatResult.Text == "死亡")
            {
                this.panelrblTreatResult.Visible = true;
            }
            else
            {
                this.panelrblTreatResult.Visible = false;
            }

            //if (ddlDiseaseTimeState.Text == "已知")
            //{
            //    this.Panel1ddlYearDiseaseStartTime.Visible = true;
            //}
            //else
            //{
            //    this.Panel1ddlYearDiseaseStartTime.Visible = false;
            //}

            if (rblTransUpHospitalConfirm.Text == "是")
            {
                this.updatePanelTransfer.Visible = true;
            }
            else
            {
                this.updatePanelTransfer.Visible = false;
            }

            if (rblPositionExist.Text == "有")
            {
                this.PanelrblPositionType.Visible = true;
            }
            else
            {
                this.PanelrblPositionType.Visible = false;
            }

            //if (this.rblConnectUpHospitalConfirm.Text == "是")
            //{
            //    this.PanelrblUpHospitalLaboratory.Visible = true;
            //}
            //else
            //{
            //    this.PanelrblUpHospitalLaboratory.Visible = false;
            //}

            if (rblCPR.Text == "是")
            {
                this.panetxtCPRTimes.Visible = true;
            }
            else
            {
                this.panetxtCPRTimes.Visible = false;
            }

            if (rblIncentiveExist.Text == "有")
            {
                this.PanelrblIncentiveType.Visible = true;
            }
            else
            {
                this.PanelrblIncentiveType.Visible = false;
            }

            #region 既往病史

            if (this.rblHypertensionConfirm.Text == "肯定")
            {
                this.PanelddlHypertensionLasted.Visible = true;
            }
            else
            {
                this.PanelddlHypertensionLasted.Visible = false;
            }

            if (this.rblGlycuresisConfirm.Text == "肯定")
            {
                this.PanelddlGlycuresisLasted.Visible = true;
            }
            else
            {
                this.PanelddlGlycuresisLasted.Visible = false;
            }

            #endregion 既往病史

            #region 接诊时临床症状

            if (rblRadiationPainExist.Text == "有")
            {
                this.PanelrblRadiationPainType.Visible = true;
            }
            else
            {
                this.PanelrblRadiationPainType.Visible = false;
            }

            if (rblConcomitantSymptomExist.Text == "有")
            {
                this.PanelrblConcomitantSymptomType.Visible = true;
            }
            else
            {
                this.PanelrblConcomitantSymptomType.Visible = false;
            }

            #endregion 接诊时临床症状
        }

        protected void SetControlVisible()
        {
            this.rdbThrombolysisTreateConfirm_SelectedIndexChanged(null, null);

            this.rblIncentiveExist_SelectedIndexChanged(null, null);

            this.rblPositionExist_SelectedIndexChanged(null, null);

            this.rblRadiationPainExist_SelectedIndexChanged(null, null);

            this.rblConcomitantSymptomExist_SelectedIndexChanged(null, null);

            this.rblHypertensionConfirm_SelectedIndexChanged(null, null);

            this.rblGlycuresisConfirm_SelectedIndexChanged(null, null);

            this.rblCerebralHemorrhageConfirm_SelectedIndexChanged(null, null);

            this.rdAcuteST_CheckedChanged(null, null);

            this.rdAcuteST_UnCheckedChanged(null, null);

            this.ddlArrhythmiaExist_SelectedIndexChanged(null, null);

            this.chkThrombolyticForDisagree_CheckedChanged(null, null);

            this.rblTreatResult_SelectedIndexChanged(null, null);

            this.ddlDiseaseTime_SelectedIndexChanged(null, null);

            this.rblTransUpHospitalConfirm_SelectedIndexChanged(null, null);

            this.rblConnectUpHospitalConfirm_SelectedIndexChanged(null, null);

            this.rblCPR_SelectedIndexChanged(null, null);

            this.chkBlood_CheckedChanged(null, null);

            this.rblLoadStatinUsed_SelectedIndexChanged(null, null);
        }

        #endregion ReportSummation
    }
}