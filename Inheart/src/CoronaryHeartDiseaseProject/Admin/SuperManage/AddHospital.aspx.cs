namespace CoronaryHeartDiseaseProject.Admin.SuperManage
{
	using System;
	using System.Collections.Generic;
	using DreamWork.BussinessLogic;
	using DreamWork.ObjectModel;

	/// <summary>
	/// 添加医院类
	/// </summary>
	public partial class AddHospital : System.Web.UI.Page
	{
		public string MenuListCheckBox;

		/// <summary>
		/// 页面加载
		/// </summary>
		protected void Page_Load(object sender, EventArgs e)
		{
			List<Region> regions = SiteManagement.GetRegion();
			this.Region.Items.Add("请选择");
			foreach (var item in regions)
			{
				this.Region.Items.Add(item.RegionName);
			}
		}

		/// <summary>
		/// 添加新新医院事件
		/// </summary>
		protected void Submit1_ServerClick(object sender, EventArgs e)
		{
			if (this.Region.SelectedIndex == 0)
			{
				this.Response.Write(BaseSystem.ShowWindow("信息提示：请选择医院所在地区！！"));
				return;
			}
			string hospitalname = Request.Form["hospitalname"].Trim();
			string comment = Request.Form["comment"].Trim();

			string message = string.Empty;
			bool isSuccess = SiteManagement.CreateHospital(hospitalname, this.Region.Text, comment, out message);

			if (!isSuccess)
			{
				if (!string.IsNullOrEmpty(message))
				{
					this.Response.Write(BaseSystem.ShowWindow(message));
				}
				else
				{
					this.Response.Write(BaseSystem.ShowWindow("信息提示：医院已经添加！！"));
				}
			}
			else
			{
				this.Response.Write(BaseSystem.ShowWindow("信息提示：医院添加成功！！"));
			}
		}
	}
}