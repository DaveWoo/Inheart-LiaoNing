namespace CoronaryHeartDiseaseProject
{
	using System;
	using DreamWork.BussinessLogic;
	using DreamWork.ObjectModel;
	using System.Collections.Generic;
	/// <summary>
	/// 
	/// </summary>
	public partial class Login : System.Web.UI.Page
	{
		public static string HospitalRegion = string.Empty;
		string hospitialRegion;
		string hospitialName;
		protected void Page_Load(object sender, EventArgs e)
		{
			hospitialRegion = Request.QueryString["hr"];
			hospitialName = Request.QueryString["hn"];

			Region region = SiteManagement.GetRegionByShortName(hospitialRegion);
			if (region == null)
			{
				return;
			}
			HospitalRegion = region.RegionName;
			List<Hospital> hospitialList = SiteManagement.GetAllHospital(hospitialRegion);
			foreach (var item in hospitialList)
			{
				this.Hospitial.Items.Add(item.HospitalName);
			}

			if (!string.IsNullOrWhiteSpace(hospitialName))
			{
				this.Hospitial.Text = hospitialName;
			}
		}
		/// <summary>
		/// 
		/// </summary>
		/// <param name="sender"></param>
		/// <param name="e"></param>
		protected void Submit_ServerClick(object sender, EventArgs e)
		{
			string verfiy = Request.Form["verify"];
			string username = Request.Form["username"].Trim();
			string password = Request.Form["password"].Trim();

			// 判断验证码是否正确
			if (Session["CheckCode"] != null)
			{
				if (Session["CheckCode"].ToString() != verfiy)
				{
					this.Response.Write(BaseSystem.ShowWindow("对不起，你输入的验证码不正确！！", "Login.aspx?hr=" + hospitialRegion + "&&hn=" + this.Hospitial.Text));
				}
				else
				{
					// 判断用户名或密码是否正确
					if (!SiteManagement.IsLogon(username, password, this.Hospitial.Text))
					{
						this.Response.Write(BaseSystem.ShowWindow("对不起，你输入的用户名或密码不正确！！", "Login.aspx?hr=" + hospitialRegion + "&&hn=" + this.Hospitial.Text));
					}
					else
					{
						string message = string.Empty;
						SiteUser siteUser = SiteManagement.GetUser(username, ref message);

						if (siteUser.Role.RoleID == 3)
						{
							Session["user"] = siteUser;
							this.Response.Redirect("default3.aspx?hr=" + hospitialRegion);
						}
						else if (siteUser.Role.RoleID == 2)
						{
							Session["admin"] = siteUser;
							this.Response.Redirect(@"Admin\Admin.aspx");
						}
						else if (siteUser.Role.RoleID == 1)
						{
							Session["sa"] = siteUser;
							this.Response.Redirect(@"Admin\SuperAdmin.aspx");
						}
						else
						{
							this.Response.Write(BaseSystem.ShowWindow("对不起，您不是管理员，您不能登录此系统！！"));
						}
					}
				}
			}
			else
			{
				this.Response.Write(BaseSystem.ShowWindow("对不起，验证码已超时失效，为了保障您的网站后台的安全，请重新登录！！", "login.aspx"));
				this.Response.Redirect("Login.aspx");
			}
		}
	}
}