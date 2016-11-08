namespace CoronaryHeartDiseaseProject.Admin.SuperManage
{
	using System;
	using System.Collections.Generic;
	using System.Web.UI.WebControls;
	using DreamWork.BussinessLogic;
	using DreamWork.ObjectModel;

	/// <summary>
	/// 添加管理员类
	/// </summary>
	public partial class AddAdmin : System.Web.UI.Page
	{
		public string MenuListCheckBox;

		/// <summary>
		/// 页面加载
		/// </summary>
		protected void Page_Load(object sender, EventArgs e)
		{
			if (!Page.IsPostBack)
			{
				SiteUser user = (SiteUser)Session["sa"];
				if (user != null)
				{
					List<Hospital> allHospital = SiteManagement.GetHospitals(user.ID);
					foreach (var item in allHospital)
					{
						ListItem listItem = new ListItem(item.HospitalName, item.ID.ToString());
						this.SelectHosptial.Items.Add(listItem);
					}
				}
			}
		}

		/// <summary>
		/// 添加新管理员事件
		/// </summary>
		protected void Submit1_ServerClick(object sender, EventArgs e)
		{
			string userName = Request.Form["username"].Trim();
			string password = Request.Form["newpass"].Trim();

			int hospitalID = 0;

			bool isSucess = int.TryParse(this.SelectHosptial.SelectedValue, out hospitalID);
			if (isSucess)
			{
				string message = string.Empty;
				bool isSuccess = SiteManagement.CreateUser(userName, password, hospitalID, 2, ref message);

				if (!isSuccess)
				{
					if (!string.IsNullOrEmpty(message))
					{
						this.Response.Write(BaseSystem.ShowWindow(message));
					}
					else
					{
						this.Response.Write(BaseSystem.ShowWindow("抱歉，此用户已经存在数据库中！！"));
					}
				}
				else
				{
					this.Response.Write(BaseSystem.ShowWindow("管理员添加成功！！"));
				}
			}
		}
	}
}