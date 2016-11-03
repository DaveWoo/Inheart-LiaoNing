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
		//user = new SiteUser();
		//user.ID = 11;
		//user.Hospital = new DreamWork.ObjectModel.Hospital();
		//user.Hospital.ID = 1;
		if (user != null)
		{
			UserName = user.UserName;
			UserRole = user.Role.RoleName;
			HospitalName = user.Hospital.HospitalName;

			//UserName = "用户11";
			//UserRole = "用户";
			//HospitalName = "辽宁省冠心病AAA医院";

			Session["user"] = user;
		}
		else
		{
			this.Response.Redirect("Login.aspx");
		}
	}
}