namespace CoronaryHeartDiseaseProject
{
	using System;
	using System.Web.UI.WebControls;
	using DreamWork.BussinessLogic;
	using DreamWork.ObjectModel;

	/// <summary>
	/// 病例显示类
	/// </summary>
	public partial class MessageDetail
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
		public static Report_Summation reportSummation = null;

		#endregion 初始化病例数据

		#region 设置设定报告数据

		/// <summary>
		/// 初始化设定报告数据
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
			SetLabelValueNonEmpty(reportSummation.TrafficWay, ddlTrafficWay);
			SetLabelValueNonEmpty(reportSummation.DiseaseDescriber, ddlDiseaseDescriber);
			SetLabelValueNonEmpty(reportSummation.Reliability, ddlReliability);
		}

		/// <summary>
		/// 初始化病人基本信息
		/// </summary>
		private void InitPerson()
		{
			txtPatientName.Text = person.Name;
			SetLabelValueNonEmpty(person.Sex, dropDownSex);
			SetLabelValueNonEmpty(person.Nationality, dropNationality);
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

			SetLabelValueNonEmpty(person.Occupation, DropDownListJob);
		}

		/// <summary>
		/// 初始化临床症状
		/// </summary>
		private void InitReportLinChuangZhengZhuang()
		{
			SetLabelValue(reportZhuSuAndXianBingShi.ChestPainExist, rblChestPainExist);
			SetLabelValue(reportZhuSuAndXianBingShi.IncentiveExist, rblIncentiveExist);
			SetCheckBox(reportZhuSuAndXianBingShi.IncentiveTypeColdStimulation, chkIncentiveTypeColdStimulation);
			SetCheckBox(reportZhuSuAndXianBingShi.IncentiveTypeDefecate, chkIncentiveTypeDefecate);
			SetCheckBox(reportZhuSuAndXianBingShi.IncentiveTypeEatMuch, chkIncentiveTypeEatMuch);
			SetCheckBox(reportZhuSuAndXianBingShi.IncentiveTypeExcite, chkIncentiveTypeExcite);
			SetCheckBox(reportZhuSuAndXianBingShi.IncentiveTypeOther, chkIncentiveTypeOther);
			SetCheckBox(reportZhuSuAndXianBingShi.IncentiveTypePhysical, chkIncentiveTypePhysical);
			SetLabelValue(reportZhuSuAndXianBingShi.PositionExist, rblPositionExist);
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
			SetLabelValue(reportZhuSuAndXianBingShi.RadiationPainExist, rblRadiationPainExist);
			SetCheckBox(reportZhuSuAndXianBingShi.RadiationPainTypeEpigastralgia, chkRadiationPainTypeEpigastralgia);
			SetCheckBox(reportZhuSuAndXianBingShi.RadiationPainTypeLeftShoulder, chkRadiationPainTypeLeftShoulder);
			SetCheckBox(reportZhuSuAndXianBingShi.RadiationPainTypeOther, chkRadiationPainTypeOther);
			SetCheckBox(reportZhuSuAndXianBingShi.RadiationPainTypePharyngeal, chkRadiationPainTypePharyngeal);
			SetLabelValue(reportZhuSuAndXianBingShi.ConcomitantSymptomExist, rblConcomitantSymptomExist);
			SetCheckBox(reportZhuSuAndXianBingShi.ConcomitantSymptomTypeAmaurosis, chkConcomitantSymptomTypeAmaurosis);
			SetCheckBox(reportZhuSuAndXianBingShi.ConcomitantSymptomTypeOther, chkConcomitantSymptomTypeOther);
			SetCheckBox(reportZhuSuAndXianBingShi.ConcomitantSymptomTypePalpitation, chkConcomitantSymptomTypePalpitation);
			SetCheckBox(reportZhuSuAndXianBingShi.ConcomitantSymptomTypeSyncope, chkConcomitantSymptomTypeSyncope);
			SetCheckBox(reportZhuSuAndXianBingShi.ConcomitantSymptomTypeTiredBreath, chkConcomitantSymptomTypeTiredBreath);
			SetCheckBox(reportZhuSuAndXianBingShi.RelievingFactorsBlackCa, chkRelievingFactorsBlackCa);
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
			SetLabelValue(reportJiWangBingShi.HypertensionConfirm, rblHypertensionConfirm);
			SetLabelValue(reportJiWangBingShi.MIConfirm, rblMIConfirm);
			SetLabelValueNonEmpty(reportJiWangBingShi.HypertensionLasted, ddlHypertensionLasted);
			SetLabelValueNonEmpty(reportJiWangBingShi.HypertensionTreatedState, ddlHypertensionTreatedState);
			SetLabelValueNonEmpty(reportJiWangBingShi.GlycuresisConfirm, rblGlycuresisConfirm);
			SetLabelValueNonEmpty(reportJiWangBingShi.GlycuresisLasted, ddlGlycuresisLasted);
			SetLabelValueNonEmpty(reportJiWangBingShi.GlycuresisTreatedState, ddlGlycuresisTreatedState);
			SetLabelValueNonEmpty(reportJiWangBingShi.CerebralHemorrhageConfirm, rblCerebralHemorrhageConfirm);
			SetLabelValue(reportJiWangBingShi.CerebralHemorrhageTreateLasted, rblCerebralHemorrhageTreateLasted);
			SetLabelValue(reportJiWangBingShi.PeripheralVascularConfirm, rblPeripheralVascularConfirm);
			SetLabelValue(reportJiWangBingShi.AnemiaOrOtherConfirm, rblAnemiaOrOtherConfirm);
		}

		/// <summary>
		/// 初步诊断
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
			lbChubuzhenduan.Text = strAcuteST;
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
		/// 初始化疾病伴随状态
		/// </summary>
		private void InitReportBinLiBanSuiZhuangTai()
		{
			SetLabelValue(reportBinLiBanSuiZhuangTai.HypotensionExist, ddlHypotensionExist);
			SetLabelValue(reportBinLiBanSuiZhuangTai.CardiogenicShockExist, ddlCardiogenicShockExist);
			SetLabelValue(reportBinLiBanSuiZhuangTai.ArrhythmiaExist, ddlArrhythmiaExist);

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

			SetLabelValue(reportBinLiBanSuiZhuangTai.MitralValveProlapseOrBreakExist, ddlMitralValveProlapseOrBreakExist);
			SetLabelValue(reportBinLiBanSuiZhuangTai.PerforationofVentricularSeptumConfirm, rblPerforationofVentricularSeptumConfirm);
			SetLabelValue(reportBinLiBanSuiZhuangTai.StrokeExist, ddlStrokeExist);
			SetLabelValue(reportBinLiBanSuiZhuangTai.OGLBExist, ddlOGLBExist);
			SetLabelValue(reportBinLiBanSuiZhuangTai.KilipLevel, ddlKilipLever);
		}

		/// <summary>
		/// 初始化静脉溶栓
		/// </summary>
		private void InitReportJinMaiRongShuan()
		{
			SetLabelValue(reportJinMaiRongShuan.Urokinase, rblUrokinase);
			txtUrokinaseOther.Text = reportJinMaiRongShuan.UrokinaseOther;
			SetLabelValue(reportJinMaiRongShuan.Alteplase, rblAlteplase);
			SetLabelValue(reportJinMaiRongShuan.Reteplase, rblReteplase);
			SetLabelValue(reportJinMaiRongShuan.Pass, rblPass);
			SetCheckBox(reportJinMaiRongShuan.Anaphylaxis, chkAnaphylaxis);
			SetLabelValue(reportJinMaiRongShuan.Bleed, rblBleed);
			SetCheckBox(reportJinMaiRongShuan.ReperfusionArrhythmia, chkReperfusionArrhythmia);
			SetLabelValue(reportJinMaiRongShuan.TreatTime, rblTreatTime);
		}

		/// <summary>
		/// 初始化辅助用药
		/// </summary>
		private void InitReportFuZhuYongYao()
		{
			SetLabelValue(reportFuZhuYongYao.AspirinDosage, rblAspirinDosage);
			SetLabelValue(reportFuZhuYongYao.ClopidogrelDosage, rblClopidogrelDosage);
			SetLabelValue(reportFuZhuYongYao.LoadStatinUsed, rblLoadStatinUsed);

			SetCheckBox(reportFuZhuYongYao.Simvastatin, chkSimvastatin);
			SetCheckBox(reportFuZhuYongYao.Pitavastatin, chkPravastatin);
			SetCheckBox(reportFuZhuYongYao.Fluvastatin, chkFluvastatin);
			SetCheckBox(reportFuZhuYongYao.Atorvastatin, chkAtorvastatin);
			SetCheckBox(reportFuZhuYongYao.Rosuvastatin, chkRosuvastatin);
			SetCheckBox(reportFuZhuYongYao.Pitavastatin, chkPitavastatin);

			SetLabelValue(reportFuZhuYongYao.ACEIConfirm, rblACEIConfirm);
			SetLabelValue(reportFuZhuYongYao.BRBConfrim, rblBRBConfrim);
		}

		/// <summary>
		/// 初始化介入治疗
		/// </summary>
		private void InitReportJieRuZhiLiao()
		{
			txtD2BTime.Text = reportJieRuZhiLiao.D2BTime;
			SetLabelValue(reportJieRuZhiLiao.Succeed, rblSucceed);
		}

		/// <summary>
		/// 初始化诊断结果
		/// </summary>
		private void InitReportTreatResult()
		{
			SetLabelValue(reportLinChuangZhuanGui.CPR, rblCPR);
			txtCPRTimes.Text = reportLinChuangZhuanGui.CPRTimes;
			SetLabelValue(reportLinChuangZhuanGui.TreatResult, rblTreatResult);
			SetLabelValue(reportLinChuangZhuanGui.IntroduceThrombolysisSuggestionConfirm, rdbIntroduceThrombolysisSuggestion);
			txbIntroduceThrombolysisSuggestionDate.Text = reportLinChuangZhuanGui.IntroduceThrombolysisSuggestionDate.ToString();
			SetLabelValue(reportLinChuangZhuanGui.ThrombolysisTreateConfirm, rdbThrombolysisTreateConfirm);
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

			SetLabelValue(reportLinChuangZhuanGui.IntroduceEmergencyCoronaryConfirm, rblIntroduceEmergencyCoronaryConfirm);
			txtIntroduceEmergencyCoronaryDate.Text = reportLinChuangZhuanGui.IntroduceEmergencyCoronaryDate.ToString();
			SetLabelValue(reportLinChuangZhuanGui.EmergencyCoronaryTreateConfirm, rdbEmergencyCoronaryTreateConfirm);
			SetCheckBox(reportWeiJinXingJiZhenGuanMaiJieRuZhiLiao.UnEmergencyCoronaryTreateForContraindication, chkUnEmergencyCoronaryTreateForContraindication);
			SetCheckBox(reportWeiJinXingJiZhenGuanMaiJieRuZhiLiao.UnEmergencyCoronaryTreateForEmergency, chkUnEmergencyCoronaryTreateForEmergency);
			SetCheckBox(reportWeiJinXingJiZhenGuanMaiJieRuZhiLiao.UnEmergencyCoronaryTreateForHospitalUnable, chkUnEmergencyCoronaryTreateForHospitalUnable);
			SetCheckBox(reportWeiJinXingJiZhenGuanMaiJieRuZhiLiao.UnEmergencyCoronaryTreateForOverTreateTime, chkUnEmergencyCoronaryTreateForOverTreateTime);
			SetCheckBox(reportWeiJinXingJiZhenGuanMaiJieRuZhiLiao.UnEmergencyCoronaryTreateForPatientDisagree, chkUnEmergencyCoronaryTreateForPatientDisagree);

			SetLabelValue(reportLinChuangZhuanGui.AgreeEmergencyCoronaryConfirm, rblAgreeEmergencyCoronaryConfirm);
			SetCheckBox(reportLinChuangZhuanGui.ThrombolyticForDisagree, chkThrombolyticForDisagree);
			SetCheckBox(reportLinChuangZhuanGui.ThrombolyticForEconomicReason, chkThrombolyticForEconomicReason);
			SetCheckBox(reportLinChuangZhuanGui.ThrombolyticForDream, chkThrombolyticForDream);
			SetCheckBox(reportLinChuangZhuanGui.ThrombolyticForTimeLimited, chkThrombolyticForTimeLimited);

			SetLabelValue(reportLinChuangZhuanGui.TransUpHospitalConfirm, rblTransUpHospitalConfirm);
			SetLabelValue(reportLinChuangZhuanGui.TransUpHospitalLever, rblTransUpHospitalLever);
			txbTransUpHospitalDate.Text = reportLinChuangZhuanGui.TransUpHospitalDate.ToString();

			SetLabelValue(reportLinChuangZhuanGui.EmergencyCoronaryTreateConfirm, rdbEmergencyCoronaryTreateConfirm);
			//SetCheckBox(reportWeiJinXingJiZhenGuanMaiJieRuZhiLiao.UnEmergencyCoronaryTreateForContraindication, chkUnEmergencyCoronaryTreateForContraindication);
			//SetCheckBox(reportWeiJinXingJiZhenGuanMaiJieRuZhiLiao.UnEmergencyCoronaryTreateForEmergency, chkUnEmergencyCoronaryTreateForEmergency);
			//SetCheckBox(reportWeiJinXingJiZhenGuanMaiJieRuZhiLiao.UnEmergencyCoronaryTreateForHospitalUnable, chkUnEmergencyCoronaryTreateForHospitalUnable);
			//SetCheckBox(reportWeiJinXingJiZhenGuanMaiJieRuZhiLiao.UnEmergencyCoronaryTreateForOverTreateTime, chkUnEmergencyCoronaryTreateForOverTreateTime);
			//SetCheckBox(reportWeiJinXingJiZhenGuanMaiJieRuZhiLiao.UnEmergencyCoronaryTreateForPatientDisagree, chkUnEmergencyCoronaryTreateForPatientDisagree);
			SetLabelValue(reportLinChuangZhuanGui.ConnectUpHospitalConfirm, rblConnectUpHospitalConfirm);
			//SetRadioButtonListValue(reportTreatResult.UpHospitalLaboratory, rblUpHospitalLaboratory);
			//txbCheckOutDate.Text = reportTreatResult.CheckOutDate.ToString();
		}

		#endregion 设置设定报告数据

		#region 公共方法

		/// <summary>
		/// 设置label值
		/// </summary>
		/// <param name="value">值</param>
		/// <param name="label">label名</param>
		private void SetLabelValueNonEmpty(string value, Label label)
		{
			if (string.IsNullOrEmpty(value))
			{
				return;
			}
			label.Text = value;
		}

		/// <summary>
		/// 设置label值--可为空置
		/// </summary>
		/// <param name="value">值</param>
		/// <param name="label">label名</param>
		private void SetLabelValue(string value, Label radioButtonList)
		{
			radioButtonList.Text = value;
		}

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
		/// <summary>
		/// 设置RadioButton的值
		/// </summary>
		/// <param name="value">值</param>
		/// <param name="radioButtonList">RadioButton列表</param>
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
		/// 设置下拉框
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
		/// 设置数字下拉框
		/// </summary>
		/// <param name="value">值</param>
		/// <param name="dropDownList">下拉框</param>
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
		/// 设置复选框值
		/// </summary>
		/// <param name="value">值</param>
		/// <param name="checkBox">复选框</param>
		private void SetCheckBox(bool? value, Label checkBox)
		{
			if (value == null)
			{
			}
			else
			{
				checkBox.Visible = Boolean.Parse(value.ToString());
			}
		}

		#endregion Common Method


		/// <summary>
		/// 初始化病例
		/// </summary>
		private void InitReport()
		{
			bool isLocked = bool.Parse(Request.QueryString["IsLocked"]);
			int reportID = int.Parse(Request.QueryString["ReportID"]);

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
			}
		}

		/// <summary>
		/// 设定控件集合的初始显示
		/// </summary>
		protected void SetControlVisible()
		{
			if (!string.IsNullOrWhiteSpace(lbChubuzhenduan.Text))
			{
				PanelrdAcuteST.Visible = true;
			}

			if (string.IsNullOrWhiteSpace(txtUrokinaseOther.Text))
			{
				this.qitaNiaoJiMei.Visible = false;
			}
			else
			{
				this.qitaNiaoJiMei.Visible = true;
			}
			if (rblCPR.Text == "有")
			{
				this.panetxtCPRTimes.Visible = true;
			}
			else
			{
				this.panetxtCPRTimes.Visible = false;
			}

			if (rblTreatResult.Text == "死亡")
			{
				this.panelrblTreatResult.Visible = true;
			}
			else
			{
				this.panelrblTreatResult.Visible = false;
			}

			if (rblTransUpHospitalConfirm.Text == "是")
			{
				this.PanelpanelrblTreatResult.Visible = true;
			}
			else
			{
				this.PanelpanelrblTreatResult.Visible = false;
			}

			if (rblPositionExist.Text == "有")
			{
				this.PanelrblPositionType.Visible = true;
			}
			else
			{
				this.PanelrblPositionType.Visible = false;
			}

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
	}
}