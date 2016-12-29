public partial class AdminLogout : System.Web.UI.Page
{
	/// <summary>
	/// 页面加载
	/// </summary>
	protected void Page_Load(object sender, System.EventArgs e)
	{
		var user = Session["user"];
		if (user != null)
		{
			// 普通用户
			Session["user"] = null;
			this.Response.Write("<script>top.location.href='../Login.aspx';</script>");
		}
		else
		{
			// 管理员
			Session["sa"] = null;
			Session["admin"] = null;
			this.Response.Write("<script>top.location.href='Login.aspx';</script>");
		}
	}
}