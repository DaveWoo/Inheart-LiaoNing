namespace CoronaryHeartDiseaseProject
{
	using System.Collections.Generic;
	using System.Linq;
	using System.Web.UI.WebControls;
	using DreamWork.BussinessLogic;

	public class Report
	{
		private static Dictionary<string, string> fieldList = new Dictionary<string, string>();

		public static Dictionary<string, string> SetInitSource()
		{
			#region 基本信息

			Dictionary<string, string> HeaderList = new Dictionary<string, string>();
			HeaderList.Add("ID", "序号");
			HeaderList.Add("PersonName", "姓名");
			HeaderList.Add("Sex", "性别");
			HeaderList.Add("Nationality", "民族");
			HeaderList.Add("Occupation", "职业");
			HeaderList.Add("Birthday", "出生日期");
			HeaderList.Add("TreatDate", "就诊日期");
			HeaderList.Add("TrafficWay", "来院方式");
			HeaderList.Add("DiseaseDescriber", "病史叙述者");
			HeaderList.Add("Reliability", "可靠程度");

			#endregion 基本信息

			#region 主诉和现病史

			HeaderList.Add("ChestPainExist", "胸痛（闷）");
			HeaderList.Add("IncentiveExist", "是否存在诱因");
			HeaderList.Add("IncentiveType", "诱因");
			HeaderList.Add("PositionExist", "是否存在部位");
			HeaderList.Add("PositionType", "部位");
			HeaderList.Add("PropertiesType", "性质");
			HeaderList.Add("RadiationPainExist", "是否存在放射痛部位");
			HeaderList.Add("RadiationPainType", "放射痛部位");
			HeaderList.Add("ConcomitantSymptomExist", "是否存在伴随症状");
			HeaderList.Add("ConcomitantSymptomType", "伴随症状");
			HeaderList.Add("RelievingFactors", "缓解因素");

			#endregion 主诉和现病史

			#region 既往病史 [ReportJiWangBingShi]

			HeaderList.Add("MIConfirm", "心肌梗死");
			HeaderList.Add("HypertensionConfirm", "高血压");
			HeaderList.Add("HypertensionLasted", "高血压病程(年)");
			HeaderList.Add("HypertensionTreatedState", "高血压治疗状况");
			HeaderList.Add("GlycuresisConfirm", "糖尿病");
			HeaderList.Add("GlycuresisLasted", "糖尿病病程(年)");
			HeaderList.Add("GlycuresisTreatedState", "糖尿病治疗状况");
			HeaderList.Add("CerebralHemorrhageConfirm", "脑卒中");
			HeaderList.Add("CerebralHemorrhageTreateLasted", "脑卒中发病距此次就诊时间");
			HeaderList.Add("PeripheralVascularConfirm", "外围血管病");
			HeaderList.Add("AnemiaOrOtherConfirm", "贫血或其它出血性疾病");

			#endregion 既往病史 [ReportJiWangBingShi]

			#region 初步诊断

			HeaderList.Add("AcuteST", "急性ST段抬高性心肌梗死");
			HeaderList.Add("Anteroseptal", "前间壁");
			HeaderList.Add("Antetheca", "前壁");
			HeaderList.Add("Extensive", "广泛前壁");
			HeaderList.Add("HeartWall", "侧壁");
			HeaderList.Add("HighWall", "高侧壁");
			HeaderList.Add("InteriorWall", "下壁");
			HeaderList.Add("BackWall", "后壁");
			HeaderList.Add("RightVentricular", "右室");
			HeaderList.Add("PrtreatOther", "初步诊断其它");

			#endregion 初步诊断

			#region 疾病伴随状态

			HeaderList.Add("ArrhythmiaExist", "心律失常");
			HeaderList.Add("VPB", "室早");
			HeaderList.Add("VT", "室速");
			HeaderList.Add("VF", "室颤");
			HeaderList.Add("Ats", "室上性早搏");
			HeaderList.Add("AFS1", "房速");
			HeaderList.Add("AF", "房颤");
			HeaderList.Add("APB", "窦性心动过缓");
			HeaderList.Add("AVBI", "I度");
			HeaderList.Add("AVBII", "II度");
			HeaderList.Add("AVBIII", "III度");
			HeaderList.Add("AFS", "左束支传导阻滞");
			HeaderList.Add("RBBB", "右束支传导阻滞");
			HeaderList.Add("AVBOther", "其他");
			HeaderList.Add("HypotensionExist", "低血压状态");
			HeaderList.Add("CardiogenicShockExist", "心源性休克");
			HeaderList.Add("MitralValveProlapseOrBreakExist", "二尖瓣脱垂或断裂");
			HeaderList.Add("PerforationofVentricularSeptumConfirm", "心室间隔穿孔");
			HeaderList.Add("StrokeExist", "脑卒中");
			HeaderList.Add("OGLBExist", "消化道出血");
			HeaderList.Add("KilipLevel", "心功能分级");

			#endregion 疾病伴随状态

			#region 诊断治疗过程

			//ReportChuBuZhengDuan without column [FirstTimeImage]
			HeaderList.Add("BloodPressure", "就诊后首次收缩压");
			HeaderList.Add("DiastolicPressure", "就诊后首次舒张压");
			HeaderList.Add("FirstTimeHeartRate", "首次心率");
			HeaderList.Add("FirstTimeXinDianTu", "首次心电图时间");
			HeaderList.Add("FirstTimeBlood", "首次抽血时间");
			HeaderList.Add("FisrtTimeReturn", "化验结果回报时间");
			HeaderList.Add("CNTResult", "首次cTNT结果");
			HeaderList.Add("RegularCNT", "cTNT正常值");
			HeaderList.Add("IntroduceThrombolysisSuggestion", "是否向患者或家属提出静脉溶栓的建议");
			HeaderList.Add("IntroduceThrombolysisSuggestionDate", "向患者或家属提出静脉溶栓建议的时间");
			HeaderList.Add("ThrombolysisTreateConfirm", "是否进行了静脉溶栓治疗");

			#endregion 诊断治疗过程

			#region 未进行静脉溶栓的原因

			HeaderList.Add("UnThrombolysisReasonForUnSute", "不适合静脉溶栓或已超过静脉溶栓的时间窗");
			HeaderList.Add("UnThrombolysisReasonForPatientDisagree", "患者或家属不同意");
			HeaderList.Add("UnThrombolyticForEconomicReason", "患者经济方面的原因");
			HeaderList.Add("UnThrombolyticForHospitalCanNotDid", "本院不能进行静脉溶栓治疗");
			HeaderList.Add("UnThrombolyticForContraindication", "有溶栓治疗禁忌症");

			#endregion 未进行静脉溶栓的原因

			#region 溶栓理由

			HeaderList.Add("ThrombolyticForDisagree", "不同意进行介入治疗");
			HeaderList.Add("ThrombolyticForEconomicReason", "因经济原因不能进行介入治疗");
			HeaderList.Add("ThrombolyticForDream", "有介入治疗的禁忌证");
			HeaderList.Add("ThrombolyticForTimeLimited", "不能在3小时内到达有介入资质的医院");
			HeaderList.Add("TreatTime", "开始静脉溶栓距离就诊时间:（D2N）");

			#endregion 溶栓理由

			#region 辅助用药

			HeaderList.Add("Urokinase", "尿激酶");
			HeaderList.Add("UrokinaseOther", "尿激酶其他");
			HeaderList.Add("Alteplase", "阿替普酶");
			HeaderList.Add("Reteplase", "瑞替普酶");
			HeaderList.Add("Pass", "静脉溶栓是否再通");
			HeaderList.Add("Anaphylaxis", "并发症");
			HeaderList.Add("ReperfusionArrhythmia", "并发症");
			HeaderList.Add("Bleed", "出血");

			#endregion 辅助用药

			#region 辅助用药

			//Table ReportFuZhuYongYao
			HeaderList.Add("AspirinDosage", "阿斯匹林");
			HeaderList.Add("ClopidogrelDosage", "氯吡格雷");
			HeaderList.Add("LoadStatinUsed", "是否应用他汀类药物");
			HeaderList.Add("Simvastatin", "辛伐他汀");
			HeaderList.Add("Pravastatin", "普伐他汀");
			HeaderList.Add("Fluvastatin", "氟伐他汀");
			HeaderList.Add("Atorvastatin", "阿托伐他汀");
			HeaderList.Add("Rosuvastatin", "瑞舒伐他汀");
			HeaderList.Add("Pitavastatin", "匹伐他汀");
			HeaderList.Add("ACEIConfirm", "ACEI");
			HeaderList.Add("BRBConfrim", "β-受体阻滞剂");
			//Table [ReportJinMaiRongShuan]
			HeaderList.Add("IntroduceEmergencyCoronaryConfirm", "是否向患者或家属介绍急诊冠脉介入治疗");
			HeaderList.Add("IntroduceEmergencyCoronaryDate", "向患者或家属介绍急诊冠脉介入治疗的时间");
			HeaderList.Add("AgreeEmergencyCoronaryConfirm", "患者或家属是否已同意接受冠脉介入治疗");
			HeaderList.Add("EmergencyCoronaryTreateConfirm", "是否在本医院实施了急诊冠脉介入治疗");

			#endregion 辅助用药

			#region 未进行急诊冠脉介入治疗的原因

			HeaderList.Add("UnEmergencyCoronaryTreateForHospitalUnable", "本院不能开展");
			HeaderList.Add("UnEmergencyCoronaryTreateForOverTreateTime", "已超过介入治疗有效时间窗");
			HeaderList.Add("UnEmergencyCoronaryTreateForPatientDisagree", "患者或家属不同意");
			HeaderList.Add("UnEmergencyCoronaryTreateForEmergency", "患者经济原因");
			HeaderList.Add("UnEmergencyCoronaryTreateForContraindication", "有介入治疗禁忌症");

			#endregion 未进行急诊冠脉介入治疗的原因

			#region 在本医院急诊介入治疗

			HeaderList.Add("Succeed", "急诊介入治疗是否成功");
			HeaderList.Add("D2BTime", "D2B时间");

			#endregion 在本医院急诊介入治疗

			#region 临床转归

			HeaderList.Add("CPR", "在院24h内是否进行了心肺复苏");
			HeaderList.Add("CPRTimes", "在院24h内是否进行了心肺复苏次数");
			HeaderList.Add("TreatResult", "在院24h内的转归");
			HeaderList.Add("DeadTime", "死亡时间");
			HeaderList.Add("DeadForVentriclarArrhythmias", "室性心律失常");
			HeaderList.Add("DeadForCardiacArrest", "心跳骤停/电机械分离");
			HeaderList.Add("DeadForCardiogenicShock", "心源性休克");
			HeaderList.Add("DeadForACVD", "急性脑血管病");
			HeaderList.Add("DeadForGIH", "消化道大出血");
			HeaderList.Add("DeadForOther", "其它");
			HeaderList.Add("TransUpHospitalConfirm", "是否转上级医院");
			HeaderList.Add("TransUpHospitalLevel", "转上级医院");
			HeaderList.Add("ConnectUpHospitalConfirm", "患者转院前是否已与上级医院联系准备下一步的治疗");
			HeaderList.Add("TransUpHospitalDate", "患者转上级医院时间");

			#endregion 临床转归

			//Table [ReportJinMaiRongShuan]
			//HeaderList.Add("TreatTime", "就诊日期");

			//HeaderList.Add("DiseaseTimeState", "");
			//HeaderList.Add("DiseaseTime", "");
			//HeaderList.Add("DiseaseHour", "");

			//HeaderList.Add("UserID", "");
			//HeaderList.Add("HospitalID", "");
			HeaderList.Add("CreateDate", "创建时间");
			HeaderList.Add("LastUpdateDate", "最后更新日期");
			HeaderList.Add("Creater", "病例录入者");
			HeaderList.Add("HospitalName", "所在医院名称");

			return HeaderList;
		}

		public static void BindingData(GridView gridView, SiteUser user, ref GridView gridView2)
		{
			gridView.AllowPaging = false;
			List<MedicalReportSource> medicalReportSourceList = GetAllReportSummation(user);

			GetProperty(medicalReportSourceList.FirstOrDefault(), string.Empty);
			Dictionary<string, string> headerList = SetInitSource();
			SetDataBind(gridView, headerList);
			gridView.DataSource = medicalReportSourceList;
			gridView2 = gridView;
			gridView.AllowPaging = true;
			gridView.DataBind();
		}

		public static void BindingData(GridView gridView, SiteUser user)
		{
			gridView.AllowPaging = false;
			List<MedicalReportSource> medicalReportSourceList = GetAllReportSummation(user);

			GetProperty(medicalReportSourceList.FirstOrDefault(), string.Empty);
			Dictionary<string, string> headerList = SetInitSource();
			SetDataBind(gridView, headerList);
			gridView.DataSource = medicalReportSourceList;
			gridView.DataBind();
		}

		public static List<MedicalReportSource> GetAllReportSummation(SiteUser user)
		{
			List<MedicalReportSource> medicalReportSourceList = new List<MedicalReportSource>();
			MedicalReportBLO medicalReportBLO = new MedicalReportBLO();
			if (user != null)
			{
				medicalReportSourceList = medicalReportBLO.GetAllReportSummationByUserID(user.ID);
			}
			return medicalReportSourceList;
		}

		public static void GetProperty(object item, string parentName)
		{
			foreach (var property in item.GetType().GetProperties())
			{
				if (property.PropertyType.BaseType.Name == "Enum"
					|| property.PropertyType.Name == "Module"
					|| property.PropertyType.Name == "Guid"
					|| property.PropertyType.Name == "EntityKey")
				{
					continue;
				}
				if (property.PropertyType.BaseType.Name == "EntityObject"
					&& property.Name != parentName
					&& !item.GetType().Equals(property.PropertyType)
					&& parentName != "ReportSummation")
				{
					object newOne = property.GetValue(item, null);
					GetProperty(newOne, property.Name);
				}
				else if (property.PropertyType.BaseType.Name == "Object"
					|| property.PropertyType.IsValueType)
				{
					SetListItems(property, parentName);
				}
			}
		}

		public static void SetListItems(System.Reflection.PropertyInfo property, string parentName)
		{
			string fieldName = string.Empty;
			if (string.IsNullOrEmpty(parentName))
			{
				fieldName = property.Name.Trim();
			}
			else
			{
				fieldName = (parentName + "." + property.Name).Trim();
			}
			if (!fieldList.ContainsKey(property.Name))
			{
				if (property.Name == "Occupation")
				{
					fieldList.Add(property.Name, "Person." + fieldName);
				}
				else
				{
					fieldList.Add(property.Name, fieldName);
				}
			}
		}

		public static void SetDataBind(GridView gridView, Dictionary<string, string> HeaderList)
		{
			foreach (var key in HeaderList.Keys)
			{
				TemplateField boundField = new TemplateField();
				boundField.HeaderStyle.Wrap = false;
				boundField.HeaderStyle.HorizontalAlign = HorizontalAlign.Left;
				boundField.ItemStyle.Wrap = false;
				string headerText = HeaderList[key];
				string fieldName = string.Empty;
				if (fieldList.ContainsKey(key))
				{
					fieldName = fieldList[key];
				}

				boundField.ItemTemplate = new GridViewTemplate(DataControlRowType.DataRow, headerText, fieldName, null);
				boundField.HeaderTemplate = new GridViewTemplate(DataControlRowType.Header, headerText, fieldName, null);
				gridView.Columns.Add(boundField);
			}
		}
	}
}