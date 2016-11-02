using DreamWork.ObjectModel;

namespace DreamWork.BussinessLogic
{
	/// <summary>
	/// 病例的基础类
	/// </summary>
	public class MedicalReportSource
	{
		/// <summary>
		/// 患者ID
		/// </summary>
		public string ID { get; set; }

		/// <summary>
		/// 患者姓名
		/// </summary>
		public string PersonName { get; set; }

		/// <summary>
		/// 患者职业
		/// </summary>
		public string Creater { get; set; }

		/// <summary>
		/// 患者就医方式
		/// </summary>
		public string Occupation { get; set; }

		/// <summary>
		/// 患者就诊医院名称
		/// </summary>
		public string HospitalName { get; set; }

		/// <summary>
		/// 患者的个人基本信息
		/// </summary>
		public Person Person { get; set; }

		/// <summary>
		/// 患者的初步诊断信息
		/// </summary>
		public Report_ChuBuZhenDuan ReportChuBuZhenDuan { get; set; }

		/// <summary>
		/// 患者的辅助用药信息
		/// </summary>
		public Report_FuZhuYongYao ReportFuZhuYongYao { get; set; }

		/// <summary>
		/// 患者的静脉溶栓信息
		/// </summary>
		public Report_JingMaiRongShuan ReportJingMaiRongShuan { get; set; }

		/// <summary>
		/// 患者的既往病史信息
		/// </summary>
		public Report_JiWangBingShi ReportJiWangBingShi { get; set; }

		/// <summary>
		/// 患者的主诉和现病史信息
		/// </summary>
		public Report_ZhuSuAndXianBingShi ReportZhuSuAndXianBingShi { get; set; }

		/// <summary>
		/// 患者的介入治疗信息
		/// </summary>
		public Report_JieRuZhiLiao ReportJieRuZhiLiao { get; set; }

		/// <summary>
		/// 患者未进行急诊冠脉介入治疗的原因
		/// </summary>
		public Report_WeiJinXingJiZhenGuanMaiJieRuZhiLiao ReportWeiJinXingJiZhenGuanMaiJieRuZhiLiao { get; set; }

		/// <summary>
		/// 患者的未进行静脉溶栓的原因
		/// </summary>
		public Report_WeiJinXingJingMaiRongSuanLiYou ReportWeiJinXingJingMaiRongSuanLiYou { get; set; }

		/// <summary>
		/// 患者的临床转归信息
		/// </summary>
		public Report_LinChuangZhuanGui ReportLinChuangZhuanGui { get; set; }

		/// <summary>
		/// 患者的疾病伴随状态信息
		/// </summary>
		public Report_JiBingBanSuiZhuangTai ReportJiBingBanSuiZhuangTai { get; set; }

		/// <summary>
		/// 患者的基本信息
		/// </summary>
		public Report_Summation ReportSummation { get; set; }

		/// <summary>
		/// 患者的简单处理信息
		/// </summary>
		public string SimplyTreate { get; set; }

		/// <summary>
		/// 是否对此条记录加锁
		/// </summary>
		public bool IsLocked { get; set; }
	}
}