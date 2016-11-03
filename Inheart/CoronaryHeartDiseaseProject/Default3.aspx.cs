using System;
using DreamWork.BussinessLogic;

public partial class index : System.Web.UI.Page
{
	public string UserName = string.Empty;
	public string UserRole = string.Empty;
	public string HospitalName = string.Empty;

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