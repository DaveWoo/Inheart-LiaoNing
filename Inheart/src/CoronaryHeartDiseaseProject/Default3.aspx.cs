using System;
using DreamWork.BussinessLogic;

/// <summary>
/// 病例首页
/// </summary>
public partial class index : System.Web.UI.Page
{
	public string UserName = string.Empty;
	public string UserRole = string.Empty;
	public string HospitalName = string.Empty;

	/// <summary>
	/// 页面加载
	/// </summary>
	protected void Page_Load(object sender, EventArgs e)
	{
		SiteUser user = (SiteUser)Session["user"];

		if (user != null)
		{
			UserName = user.UserName;
			UserRole = user.Role.RoleName;
			HospitalName = user.Hospital.HospitalName;

			Session["user"] = user;
		}
		else
		{
			this.Response.Redirect("Login.aspx");
		}
	}
}