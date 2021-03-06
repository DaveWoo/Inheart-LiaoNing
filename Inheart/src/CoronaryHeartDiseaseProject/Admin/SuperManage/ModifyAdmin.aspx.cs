﻿namespace CoronaryHeartDiseaseProject.Admin.SuperManage
{
	using System;
	using DreamWork.BussinessLogic;

	/// <summary>
	/// 修改管理员密码类
	/// </summary>
	public partial class ModifyAdmin : System.Web.UI.Page
	{
		public string Username, Password, MenuListCheckBox;
		public string UserName = string.Empty;
		private static SiteUser userNormal;

		/// <summary>
		/// 页面加载
		/// </summary>
		protected void Page_Load(object sender, EventArgs e)
		{
			if (!Page.IsPostBack)
			{
				string id = this.Request.QueryString["ID"];
				int userID = 0;

				if (!string.IsNullOrEmpty(id))
				{
					bool isSucess = int.TryParse(id, out userID);
				}
				string message = string.Empty;
				userNormal = SiteManagement.GetUser(userID, ref message);
				if (userNormal != null)
				{
					UserName = userNormal.UserName;
				}
			}
		}

		/// <summary>
		/// 提交管理员密码修改
		/// </summary>
		protected void Submit1_ServerClick(object sender, EventArgs e)
		{
			string username = Request.Form["username"].Trim();
			string password = Request.Form["newpass"].Trim();

			// Modify user's password
			if (SiteManagement.UpdateUserPassword(username, password))
			{
				this.Response.Write(BaseSystem.ShowWindow("修改管理员密码成功!!"));
			}
			else
			{
				this.Response.Write(BaseSystem.ShowWindow("出现异常错误,修改管理员失败!!"));
			}
		}
	}
}