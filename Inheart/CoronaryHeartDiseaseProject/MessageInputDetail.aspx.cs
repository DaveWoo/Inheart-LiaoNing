namespace CoronaryHeartDiseaseProject
{
	using System;
	using System.Web.UI;
	using DreamWork.BussinessLogic;
	using DreamWork.ObjectModel;

	/// <summary>
	/// 病例信息类
	/// </summary>
	public partial class MessageDetail : System.Web.UI.Page
	{
		private MedicalReportBLO medicalReportBLO = new MedicalReportBLO();

		/// <summary>
		/// 頁面初始化
		/// </summary>
		protected void Page_Load(object sender, EventArgs e)
		{
			if (!Page.IsPostBack)
			{
				if (Request.QueryString.Count != 0)
				{
					InitReport();
				}
				SetControlVisible1();
			}
		}
	}
}