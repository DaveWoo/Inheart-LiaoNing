namespace CoronaryHeartDiseaseProject
{
	using System;
	using System.Web.UI.WebControls;
	using DreamWork.BussinessLogic;
	using DreamWork.ObjectModel;

	/// <summary>
	/// 病例录入类
	/// </summary>
	public partial class MessageInput
	{
		#region 初始化病例数据

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
		private static bool isLocked = false;
		private static int reportID = -1;

		public static Report_Summation reportSummation = null;

		#endregion 初始化病例数据

		#region 设置病例的各种数据

		/// <summary>
		/// 设置设定报告数据
		/// </summary>
		private void SetReportSummation()
		{
			if (reportSummation == null)
			{
				reportSummation = new Report_Summation();
			}

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

			// 病人基本信息
			SetPerson();

			// 临床症状
			SetReportLinChuangZhengZhuang();

			// 既往病史
			SetReportJiWangBingShi();

			// 初步诊断
			SetReportChuBuZhengDuan();

			// 疾病伴随状态
			SetReportBinLiBanSuiZhuangTai();

			// 静脉溶栓
			SetReportJinMaiRongShuan();

			// 辅助用药
			SetReportFuZhuYongYao();

			// 介入治疗
			SetReportJieRuZhiLiao();

			// 临床转归
			SetReportLinChuangZhuanGui();

			// 静脉溶栓理由
			SetReportJingMaiRongSuanLiYou();

			// 介入治疗
			SetReportJieRuZhiliao();

			// 数据绑定
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

		/// <summary>
		/// 设置病人基本信息
		/// </summary>
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

		/// <summary>
		/// 设置临床症状
		/// </summary>
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

			reportZhuSuAndXianBingShi.RelievingFactorsCaRivalry = chkRelievingFactorsCaRivalry.Checked;
			reportZhuSuAndXianBingShi.RelievingFactorsLastRespond = chkRelievingFactorsLastRespond.Checked;
			reportZhuSuAndXianBingShi.RelievingFactorsNitrate = chkRelievingFactorsNitrate.Checked;
			reportZhuSuAndXianBingShi.RelievingFactorsOther = chkRelievingFactorsOther.Checked;
			reportZhuSuAndXianBingShi.RelievingFactorsRest = chkRelievingFactorsRest.Checked;
		}

		/// <summary>
		/// 设置既往病史
		/// </summary>
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

		/// <summary>
		/// 初步诊断
		/// </summary>
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

		/// <summary>
		/// 设置疾病伴随状态
		/// </summary>
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

		/// <summary>
		/// 设置静脉溶栓
		/// </summary>
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

		/// <summary>
		/// 设置辅助用药
		/// </summary>
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

		/// <summary>
		/// 设置介入治疗
		/// </summary>
		private void SetReportJieRuZhiLiao()
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

		/// <summary>
		/// 设置临床转归
		/// </summary>
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
		}

		/// <summary>
		/// 介入治疗
		/// </summary>
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

		/// <summary>
		/// 静脉溶栓理由
		/// </summary>
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

		#endregion 设置病例的各种数据

		#region 初始化病例的各种数据

		/// <summary>
		/// 初始化报告数据
		/// </summary>
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

		/// <summary>
		///  初始化病人基本信息
		/// </summary>
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

		/// <summary>
		///  初始化临床症状
		/// </summary>
		private void InitReportLinChuangZhengZhuang()
		{
			SetRadioButtonListValue(reportZhuSuAndXianBingShi.ChestPainExist, rblChestPainExist);
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
			SetCheckBox(reportZhuSuAndXianBingShi.RelievingFactorsCaRivalry, chkRelievingFactorsCaRivalry);
			SetCheckBox(reportZhuSuAndXianBingShi.RelievingFactorsLastRespond, chkRelievingFactorsLastRespond);
			SetCheckBox(reportZhuSuAndXianBingShi.RelievingFactorsNitrate, chkRelievingFactorsNitrate);
			SetCheckBox(reportZhuSuAndXianBingShi.RelievingFactorsOther, chkRelievingFactorsOther);
			SetCheckBox(reportZhuSuAndXianBingShi.RelievingFactorsRest, chkRelievingFactorsRest);
		}

		/// <summary>
		/// 初始化既往病史
		/// </summary>
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

		/// <summary>
		/// 初始化初步诊断
		/// </summary>
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

		/// <summary>
		///  初始化疾病伴随状态
		/// </summary>
		private void InitReportBinLiBanSuiZhuangTai()
		{
			SetRadioButtonListValue(reportBinLiBanSuiZhuangTai.HypotensionExist, ddlHypotensionExist);
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

		/// <summary>
		/// 初始化静脉溶栓
		/// </summary>
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

		/// <summary>
		/// 初始化辅助用药
		/// </summary>
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

		/// <summary>
		/// 初始化介入治疗
		/// </summary>
		private void InitReportJieRuZhiLiao()
		{
			txtD2BTime.Text = reportJieRuZhiLiao.D2BTime;
			SetRadioButtonListValue(reportJieRuZhiLiao.Succeed, rblSucceed);
		}

		/// <summary>
		/// 初始化诊断结果
		/// </summary>
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

		#endregion 初始化病例的各种数据

		#region 公共方法

		/// <summary>
		/// 获得RadioButton的值
		/// </summary>
		/// <param name="radioButtonList">RadioButton列表</param>
		/// <returns>返回RadioButton的值</returns>
		private string GetRadioButtonListValue(RadioButtonList radioButtonList)
		{
			string value = string.Empty;
			if (radioButtonList.SelectedItem != null)
			{
				value = radioButtonList.SelectedItem.Text.Trim().ToString();
			}
			return value;
		}

		/// <summary>
		/// 设置RadioButton的值
		/// </summary>
		/// <param name="value">值</param>
		/// <param name="radioButtonList">RadioButton列表</param>
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

		/// <summary>
		/// 设定时间
		/// </summary>
		/// <param name="dateTime">时间</param>
		/// <returns>返回时间</returns>
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

		/// <summary>
		/// 将string类型转化为datatime类型
		/// </summary>
		/// <param name="dateTime">string类型时间</param>
		/// <returns>返回datatime类型类型时间</returns>
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

		/// <summary>
		/// 获得下拉框值
		/// </summary>
		/// <param name="dropDownList">下拉框</param>
		/// <returns>下拉框值</returns>
		private string GetDropDownListValue(DropDownList dropDownList)
		{
			string value = string.Empty;
			if (dropDownList.SelectedItem != null)
			{
				value = dropDownList.SelectedItem.Text.Trim().ToString();
			}
			return value;
		}

		/// <summary>
		/// 设置下拉框
		/// </summary>
		/// <param name="value">值</param>
		/// <param name="dropDownList">下拉框</param>
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

		/// <summary>
		/// 设置数字下拉框
		/// </summary>
		/// <param name="value">值</param>
		/// <param name="dropDownList">下拉框</param>
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

		/// <summary>
		/// 设置复选框值
		/// </summary>
		/// <param name="value">值</param>
		/// <param name="checkBox">复选框</param>
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

		/// <summary>
		/// 获得时间
		/// </summary>
		/// <param name="ddlYear">年</param>
		/// <param name="ddlMonth">月</param>
		/// <param name="ddlDay">日</param>
		/// <returns>时间</returns>
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

			dt = new DateTime(valYear, valMonth, valDay, valHour, valMinute, valSecond);

			return dt;
		}

		/// <summary>
		/// 获得时间
		/// </summary>
		/// <param name="ddlYear">年</param>
		/// <param name="ddlMonth">月</param>
		/// <param name="ddlDay">日</param>
		/// <param name="dateTime">时间控件值</param>
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

		/// <summary>
		/// 获得时间
		/// </summary>
		/// <param name="ddlYear">年</param>
		/// <param name="ddlMonth">月</param>
		/// <param name="ddlDay">日</param>
		/// <param name="ddlHour">时</param>
		/// <param name="ddlMinute">分</param>
		/// <returns>时间</returns>
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

		/// <summary>
		/// 设置时间
		/// </summary>
		/// <param name="ddlYear">年</param>
		/// <param name="ddlMonth">月</param>
		/// <param name="ddlDay">日</param>
		/// <param name="ddlHour">时</param>
		/// <param name="ddlMinute">分</param>
		/// <param name="dateTime">时间控件值</param>
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

		#endregion 公共方法

		/// <summary>
		/// 病例保存
		/// </summary>
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
					lblErrorMessage.Text = ex.Message + ex.InnerException;
				}
			}
		}

		/// <summary>
		/// 病例提交
		/// </summary>
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

		/// <summary>
		/// 保存病例
		/// </summary>
		/// <param name="isSubmit">是否提交</param>
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
		}

		/// <summary>
		/// 病例重置
		/// </summary>
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

		/// <summary>
		/// 初始化病例
		/// </summary>
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

			if (isLocked || (SiteUser)Session["user"] == null)
			{
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

		/// <summary>
		/// 设定控件集合的初始显示
		/// </summary>
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

			this.rblTreatResult_SelectedIndexChanged(null, null);

			this.rblTransUpHospitalConfirm_SelectedIndexChanged(null, null);

			this.rblCPR_SelectedIndexChanged(null, null);

			this.chkBlood_CheckedChanged(null, null);

			this.rblLoadStatinUsed_SelectedIndexChanged(null, null);
		}
	}
}