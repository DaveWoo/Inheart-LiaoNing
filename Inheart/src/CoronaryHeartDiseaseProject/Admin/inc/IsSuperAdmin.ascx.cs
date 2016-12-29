using System;

namespace CoronaryHeartDiseaseProject
{
	public partial class IsSuperAdmin : System.Web.UI.UserControl
	{
		protected void Page_Load(object sender, EventArgs e)
		{
			// 判断是否是超级管理员的身份
			if (Session["sa"] == null)
			{
                this.Response.Write("<script>swal('对不起，您已登录超时，请重新登录！！');top.location.href='../Login.aspx';</script>");
			}
		}
	}
}