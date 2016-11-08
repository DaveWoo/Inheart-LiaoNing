using System;
using DreamWork.BussinessLogic;
/// <summary>
/// 
/// </summary>
public partial class Admin : System.Web.UI.Page
{
	public string UserName = string.Empty;
	public string UserRole = string.Empty;
	public string Hospital = string.Empty;
	/// <summary>
	/// 
	/// </summary>
	/// <param name="sender"></param>
	/// <param name="e"></param>
	protected void Page_Load(object sender, EventArgs e)
	{
		SiteUser user = (SiteUser)Session["admin"];

		if (user != null)
		{
			UserName = user.UserName;
			UserRole = user.Role.RoleName;
			Hospital = user.Hospital.HospitalName;
		}
		else
		{
			this.Response.Redirect("Login.aspx");
		}
	}
}