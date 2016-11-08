namespace CoronaryHeartDiseaseProject
{
	using System;
	using System.Web.UI.WebControls;
	using DreamWork.BussinessLogic;
	using DreamWork.ObjectModel;

	/// <summary>
	///
	/// </summary>
	public partial class MessageDetail
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

		public static Report_Summation reportSummation = null;

		#region Init ReportSummation

		/// <summary>
		///
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

			//SetDropDownListValue(reportSummation.DiseaseTimeState, ddlDiseaseTimeState);
			//SetDateTimeValue(ddlYearDiseaseStartTime, ddlMonthDiseaseStartTime, ddlDayDiseaseStartTime, ddlHourDiseaseStartTime, ddlMinutesDiseaseStartTime, reportSummation.DiseaseTime);
			//SetDateTimeValue(ddlYearVisit, ddlMonthVisit, ddlDayVisit, ddlHourVisit, ddlMinutesVisit, reportSummation.TreatDate);
			txtDiseaseHour.Text = reportSummation.DiseaseHour.ToString();
			txbTreatTime.Text = SetDateTime(reportSummation.TreatDate);
			txtDiseaseHour.Text = reportSummation.DiseaseHour.ToString();
			SetLabelValue(reportSummation.TrafficWay, ddlTrafficWay);
			SetLabelValue(reportSummation.DiseaseDescriber, ddlDiseaseDescriber);
			SetLabelValue(reportSummation.Reliability, ddlReliability);

			if (!string.IsNullOrEmpty(reportJinMaiRongShuan.Bleed))
			{
				// this.chkBlood.Checked = true;
			}
		}

		/// <summary>
		///
		/// </summary>
		/// <param name="value"></param>
		/// <param name="label"></param>
		private void SetLabelValue(string value, Label label)
		{
			if (string.IsNullOrEmpty(value))
			{
				return;
			}
			label.Text = value;
		}

		/// <summary>
		///
		/// </summary>
		private void InitPerson()
		{
			txtPatientName.Text = person.Name;
			SetLabelValue(person.Sex, dropDownSex);
			SetLabelValue(person.Nationality, dropNationality);
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

			SetLabelValue(person.Occupation, DropDownListJob);
		}

		/// <summary>
		///
		/// </summary>
		private void InitReportLinChuangZhengZhuang()
		{
			SetLabelValue2(reportZhuSuAndXianBingShi.ChestPainExist, rblChestPainExist);
			// SetRadioButtonListValue(reportLinChuangZhengZhuang.ChestPainType, rblChestPainType);
			SetLabelValue2(reportZhuSuAndXianBingShi.IncentiveExist, rblIncentiveExist);
			SetCheckBox(reportZhuSuAndXianBingShi.IncentiveTypeColdStimulation, chkIncentiveTypeColdStimulation);
			SetCheckBox(reportZhuSuAndXianBingShi.IncentiveTypeDefecate, chkIncentiveTypeDefecate);
			SetCheckBox(reportZhuSuAndXianBingShi.IncentiveTypeEatMuch, chkIncentiveTypeEatMuch);
			SetCheckBox(reportZhuSuAndXianBingShi.IncentiveTypeExcite, chkIncentiveTypeExcite);
			SetCheckBox(reportZhuSuAndXianBingShi.IncentiveTypeOther, chkIncentiveTypeOther);
			SetCheckBox(reportZhuSuAndXianBingShi.IncentiveTypePhysical, chkIncentiveTypePhysical);

			SetLabelValue2(reportZhuSuAndXianBingShi.PositionExist, rblPositionExist);
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

			SetLabelValue2(reportZhuSuAndXianBingShi.RadiationPainExist, rblRadiationPainExist);
			SetCheckBox(reportZhuSuAndXianBingShi.RadiationPainTypeEpigastralgia, chkRadiationPainTypeEpigastralgia);
			SetCheckBox(reportZhuSuAndXianBingShi.RadiationPainTypeLeftShoulder, chkRadiationPainTypeLeftShoulder);
			SetCheckBox(reportZhuSuAndXianBingShi.RadiationPainTypeOther, chkRadiationPainTypeOther);
			SetCheckBox(reportZhuSuAndXianBingShi.RadiationPainTypePharyngeal, chkRadiationPainTypePharyngeal);

			SetLabelValue2(reportZhuSuAndXianBingShi.ConcomitantSymptomExist, rblConcomitantSymptomExist);
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
		///
		/// </summary>
		private void InitReportJiWangBingShi()
		{
			SetLabelValue2(reportJiWangBingShi.HypertensionConfirm, rblHypertensionConfirm);
			SetLabelValue2(reportJiWangBingShi.MIConfirm, rblMIConfirm);
			SetLabelValue(reportJiWangBingShi.HypertensionLasted, ddlHypertensionLasted);
			SetLabelValue(reportJiWangBingShi.HypertensionTreatedState, ddlHypertensionTreatedState);
			SetLabelValue(reportJiWangBingShi.GlycuresisConfirm, rblGlycuresisConfirm);
			SetLabelValue(reportJiWangBingShi.GlycuresisLasted, ddlGlycuresisLasted);
			SetLabelValue(reportJiWangBingShi.GlycuresisTreatedState, ddlGlycuresisTreatedState);
			SetLabelValue(reportJiWangBingShi.CerebralHemorrhageConfirm, rblCerebralHemorrhageConfirm);
			SetLabelValue2(reportJiWangBingShi.CerebralHemorrhageTreateLasted, rblCerebralHemorrhageTreateLasted);
			SetLabelValue2(reportJiWangBingShi.PeripheralVascularConfirm, rblPeripheralVascularConfirm);
			SetLabelValue2(reportJiWangBingShi.AnemiaOrOtherConfirm, rblAnemiaOrOtherConfirm);
		}

		/// <summary>
		///
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
		///
		/// </summary>
		private void InitReportBinLiBanSuiZhuangTai()
		{
			SetLabelValue2(reportBinLiBanSuiZhuangTai.HypotensionExist, ddlHypotensionExist);
			SetLabelValue2(reportBinLiBanSuiZhuangTai.CardiogenicShockExist, ddlCardiogenicShockExist);
			SetLabelValue2(reportBinLiBanSuiZhuangTai.ArrhythmiaExist, ddlArrhythmiaExist);

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

			SetLabelValue2(reportBinLiBanSuiZhuangTai.MitralValveProlapseOrBreakExist, ddlMitralValveProlapseOrBreakExist);
			SetLabelValue2(reportBinLiBanSuiZhuangTai.PerforationofVentricularSeptumConfirm, rblPerforationofVentricularSeptumConfirm);
			SetLabelValue2(reportBinLiBanSuiZhuangTai.StrokeExist, ddlStrokeExist);
			SetLabelValue2(reportBinLiBanSuiZhuangTai.OGLBExist, ddlOGLBExist);
			SetLabelValue2(reportBinLiBanSuiZhuangTai.KilipLevel, ddlKilipLever);
		}

		/// <summary>
		///
		/// </summary>
		private void InitReportJinMaiRongShuan()
		{
			SetLabelValue2(reportJinMaiRongShuan.Urokinase, rblUrokinase);
			txtUrokinaseOther.Text = reportJinMaiRongShuan.UrokinaseOther;
			SetLabelValue2(reportJinMaiRongShuan.Alteplase, rblAlteplase);
			SetLabelValue2(reportJinMaiRongShuan.Reteplase, rblReteplase);
			SetLabelValue2(reportJinMaiRongShuan.Pass, rblPass);
			SetCheckBox(reportJinMaiRongShuan.Anaphylaxis, chkAnaphylaxis);
			SetLabelValue2(reportJinMaiRongShuan.Bleed, rblBleed);
			SetCheckBox(reportJinMaiRongShuan.ReperfusionArrhythmia, chkReperfusionArrhythmia);
			SetLabelValue2(reportJinMaiRongShuan.TreatTime, rblTreatTime);
		}

		/// <summary>
		///
		/// </summary>
		private void InitReportFuZhuYongYao()
		{
			SetLabelValue2(reportFuZhuYongYao.AspirinDosage, rblAspirinDosage);
			SetLabelValue2(reportFuZhuYongYao.ClopidogrelDosage, rblClopidogrelDosage);
			SetLabelValue2(reportFuZhuYongYao.LoadStatinUsed, rblLoadStatinUsed);

			SetCheckBox(reportFuZhuYongYao.Simvastatin, chkSimvastatin);
			SetCheckBox(reportFuZhuYongYao.Pitavastatin, chkPravastatin);
			SetCheckBox(reportFuZhuYongYao.Fluvastatin, chkFluvastatin);
			SetCheckBox(reportFuZhuYongYao.Atorvastatin, chkAtorvastatin);
			SetCheckBox(reportFuZhuYongYao.Rosuvastatin, chkRosuvastatin);
			SetCheckBox(reportFuZhuYongYao.Pitavastatin, chkPitavastatin);

			SetLabelValue2(reportFuZhuYongYao.ACEIConfirm, rblACEIConfirm);
			SetLabelValue2(reportFuZhuYongYao.BRBConfrim, rblBRBConfrim);
		}

		/// <summary>
		///
		/// </summary>
		private void InitReportJieRuZhiLiao()
		{
			txtD2BTime.Text = reportJieRuZhiLiao.D2BTime;
			SetLabelValue2(reportJieRuZhiLiao.Succeed, rblSucceed);
		}

		/// <summary>
		///
		/// </summary>
		private void InitReportTreatResult()
		{
			SetLabelValue2(reportLinChuangZhuanGui.CPR, rblCPR);
			txtCPRTimes.Text = reportLinChuangZhuanGui.CPRTimes;
			SetLabelValue2(reportLinChuangZhuanGui.TreatResult, rblTreatResult);
			SetLabelValue2(reportLinChuangZhuanGui.IntroduceThrombolysisSuggestionConfirm, rdbIntroduceThrombolysisSuggestion);
			txbIntroduceThrombolysisSuggestionDate.Text = reportLinChuangZhuanGui.IntroduceThrombolysisSuggestionDate.ToString();
			SetLabelValue2(reportLinChuangZhuanGui.ThrombolysisTreateConfirm, rdbThrombolysisTreateConfirm);
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

			SetLabelValue2(reportLinChuangZhuanGui.IntroduceEmergencyCoronaryConfirm, rblIntroduceEmergencyCoronaryConfirm);
			txtIntroduceEmergencyCoronaryDate.Text = reportLinChuangZhuanGui.IntroduceEmergencyCoronaryDate.ToString();
			SetLabelValue2(reportLinChuangZhuanGui.EmergencyCoronaryTreateConfirm, rdbEmergencyCoronaryTreateConfirm);
			SetCheckBox(reportWeiJinXingJiZhenGuanMaiJieRuZhiLiao.UnEmergencyCoronaryTreateForContraindication, chkUnEmergencyCoronaryTreateForContraindication);
			SetCheckBox(reportWeiJinXingJiZhenGuanMaiJieRuZhiLiao.UnEmergencyCoronaryTreateForEmergency, chkUnEmergencyCoronaryTreateForEmergency);
			SetCheckBox(reportWeiJinXingJiZhenGuanMaiJieRuZhiLiao.UnEmergencyCoronaryTreateForHospitalUnable, chkUnEmergencyCoronaryTreateForHospitalUnable);
			SetCheckBox(reportWeiJinXingJiZhenGuanMaiJieRuZhiLiao.UnEmergencyCoronaryTreateForOverTreateTime, chkUnEmergencyCoronaryTreateForOverTreateTime);
			SetCheckBox(reportWeiJinXingJiZhenGuanMaiJieRuZhiLiao.UnEmergencyCoronaryTreateForPatientDisagree, chkUnEmergencyCoronaryTreateForPatientDisagree);

			SetLabelValue2(reportLinChuangZhuanGui.AgreeEmergencyCoronaryConfirm, rblAgreeEmergencyCoronaryConfirm);
			SetCheckBox(reportLinChuangZhuanGui.ThrombolyticForDisagree, chkThrombolyticForDisagree);
			SetCheckBox(reportLinChuangZhuanGui.ThrombolyticForEconomicReason, chkThrombolyticForEconomicReason);
			SetCheckBox(reportLinChuangZhuanGui.ThrombolyticForDream, chkThrombolyticForDream);
			SetCheckBox(reportLinChuangZhuanGui.ThrombolyticForTimeLimited, chkThrombolyticForTimeLimited);

			SetLabelValue2(reportLinChuangZhuanGui.TransUpHospitalConfirm, rblTransUpHospitalConfirm);
			SetLabelValue2(reportLinChuangZhuanGui.TransUpHospitalLever, rblTransUpHospitalLever);
			txbTransUpHospitalDate.Text = reportLinChuangZhuanGui.TransUpHospitalDate.ToString();

			SetLabelValue2(reportLinChuangZhuanGui.EmergencyCoronaryTreateConfirm, rdbEmergencyCoronaryTreateConfirm);
			//SetCheckBox(reportWeiJinXingJiZhenGuanMaiJieRuZhiLiao.UnEmergencyCoronaryTreateForContraindication, chkUnEmergencyCoronaryTreateForContraindication);
			//SetCheckBox(reportWeiJinXingJiZhenGuanMaiJieRuZhiLiao.UnEmergencyCoronaryTreateForEmergency, chkUnEmergencyCoronaryTreateForEmergency);
			//SetCheckBox(reportWeiJinXingJiZhenGuanMaiJieRuZhiLiao.UnEmergencyCoronaryTreateForHospitalUnable, chkUnEmergencyCoronaryTreateForHospitalUnable);
			//SetCheckBox(reportWeiJinXingJiZhenGuanMaiJieRuZhiLiao.UnEmergencyCoronaryTreateForOverTreateTime, chkUnEmergencyCoronaryTreateForOverTreateTime);
			//SetCheckBox(reportWeiJinXingJiZhenGuanMaiJieRuZhiLiao.UnEmergencyCoronaryTreateForPatientDisagree, chkUnEmergencyCoronaryTreateForPatientDisagree);
			SetLabelValue2(reportLinChuangZhuanGui.ConnectUpHospitalConfirm, rblConnectUpHospitalConfirm);
			//SetRadioButtonListValue(reportTreatResult.UpHospitalLaboratory, rblUpHospitalLaboratory);
			//txbCheckOutDate.Text = reportTreatResult.CheckOutDate.ToString();
		}

		#endregion Init ReportSummation

		#region Common Method

		/// <summary>
		///
		/// </summary>
		/// <param name="radioButtonList"></param>
		/// <returns></returns>
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
		///
		/// </summary>
		/// <param name="dropDownList"></param>
		/// <returns></returns>
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
		///
		/// </summary>
		/// <param name="dateTime"></param>
		/// <returns></returns>
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
		///
		/// </summary>
		/// <param name="dateTime"></param>
		/// <returns></returns>
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
		///
		/// </summary>
		/// <param name="value"></param>
		/// <param name="radioButtonList"></param>
		private void SetLabelValue2(string value, Label radioButtonList)
		{
			radioButtonList.Text = value;
		}

		/// <summary>
		///
		/// </summary>
		/// <param name="value"></param>
		/// <param name="dropDownList"></param>
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
		///
		/// </summary>
		/// <param name="value"></param>
		/// <param name="dropDownList"></param>
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
		///
		/// </summary>
		/// <param name="value"></param>
		/// <param name="checkBox"></param>
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
		///
		/// </summary>
		/// <param name="value"></param>
		/// <param name="checkBox"></param>
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
		///
		/// </summary>
		/// <param name="sender"></param>
		/// <param name="e"></param>
		protected void btnSave_Click(object sender, EventArgs e)
		{
		}

		/// <summary>
		///
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
		///
		/// </summary>
		private void InitReport()
		{
			bool isLocked = bool.Parse(Request.QueryString["IsLocked"]);
			int reportID = int.Parse(Request.QueryString["ReportID"]);

			//bool isLocked = true;
			//int reportID = 49;
			if (isLocked || (SiteUser)Session["user"] == null)
			{
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
			}
		}

		/// <summary>
		///
		/// </summary>
		protected void SetControlVisible1()
		{
			if (!string.IsNullOrWhiteSpace(lbChubuzhenduan.Text))
			{
				PanelrdAcuteST.Visible = true;
			}
			else
			{
				//PanelrdAcuteST.Visible = false;
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

		#endregion ReportSummation
	}
}