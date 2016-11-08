namespace CoronaryHeartDiseaseProject.Admin
{
	using System;
	using DreamWork.BussinessLogic;

	/// <summary>
	/// 添加用户类
	/// </summary>
	public partial class AddUser : System.Web.UI.Page
	{
		public string MenuListCheckBox;
		private static SiteUser userAdmin;

		/// <summary>
		/// 页面加载
		/// </summary>
		protected void Page_Load(object sender, EventArgs e)
		{
		}

		/// <summary>
		/// 添加新用户事件
		/// </summary>
		protected void Submit1_ServerClick(object sender, EventArgs e)
		{
			string userName = Request.Form["username"].Trim();
			string password = Request.Form["newpass"].Trim();

			userAdmin = (SiteUser)Session["admin"];
			string message = string.Empty;
			if (userAdmin != null)
			{
				bool isSuccess = SiteManagement.CreateUser(userName, password, userAdmin.Hospital.ID, 3, ref message);

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
					this.Response.Write(BaseSystem.ShowWindow("新用户添加成功！！"));
				}
			}
		}
	}
}