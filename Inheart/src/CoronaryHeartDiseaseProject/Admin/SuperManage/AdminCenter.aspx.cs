﻿namespace CoronaryHeartDiseaseProject.Admin.SuperManage
{
	using System;
	using DreamWork.BussinessLogic;

	/// <summary>
	/// 管理中心类
	/// </summary>
	public partial class AdminCenter : System.Web.UI.Page
	{
		/// <summary>
		/// 页面加载
		/// </summary>
		protected void Page_Load(object sender, EventArgs e)
		{
		}

		/// <summary>
		/// 管理员密码管理
		/// </summary>
		protected void Submit1_SavePassword_ServerClick(object sender, EventArgs e)
		{
			// 获取当前管理员的用户名和密码
			if (Session["sa"] != null)
			{
				// string userName = Session["admin"].ToString();
				string userName = Session["sa"].ToString();
				string passWord = this.Request.Form["oldpass"].Trim();
				string newPassWord = this.Request.Form["newpass"].Trim();

				// 检验原密码是否正确
				if (SiteManagement.IsLogon(userName, passWord))
				{
					// 开始修改管理员的密码
					if (SiteManagement.UpdateUserPassword(userName, newPassWord))
					{
						this.Response.Write(BaseSystem.ShowWindow("密码修改成功!!"));
					}
					else
					{
						this.Response.Write(BaseSystem.ShowWindow("出现异常错误,密码修改失败!!"));
					}
				}
				else
				{
					this.Response.Write(BaseSystem.ShowWindow("对不起,你的原密码不正确!!"));
				}
			}
			else
			{
				this.Response.Write("登录已超时!!");
			}
		}
	}
}