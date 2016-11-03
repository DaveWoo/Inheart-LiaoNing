public partial class AdminLogout : System.Web.UI.Page
{
	protected void Page_Load(object sender, System.EventArgs e)
	{
		Session["user"] = null;
		Session["admin"] = null;
		Session["sa"] = null;
		this.Response.Write("<script>top.location.href='../Login.aspx';</script>");
	}
}