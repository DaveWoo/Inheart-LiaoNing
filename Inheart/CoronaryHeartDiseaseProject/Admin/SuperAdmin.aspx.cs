using System;
using DreamWork.BussinessLogic;

public partial class SuperAdmin : System.Web.UI.Page
{
	public string UserName = string.Empty;
	public string UserRole = string.Empty;

	protected void Page_Load(object sender, EventArgs e)
	{
		SiteUser user = (SiteUser)Session["sa"];

		if (user != null)
		{
			UserName = user.UserName;
			UserRole = user.Role.RoleName;
		}
		else
		{
			this.Response.Redirect("Login.aspx");
		}
	}
}