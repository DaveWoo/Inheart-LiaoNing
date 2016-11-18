/// <summary>
/// 注销类
/// </summary>
public partial class Logout : System.Web.UI.Page
{
	/// <summary>
	/// 页面加载
	/// </summary>
	/// <param name="sender"></param>
	/// <param name="e"></param>
	protected void Page_Load(object sender, System.EventArgs e)
	{
		Session["user"] = null;
		Session["admin"] = null;
		Session["sa"] = null;
		this.Response.Write("<script>top.location.href='Login.aspx?hr=" + Session["hr"].ToString() + "';</script>");
	}
}