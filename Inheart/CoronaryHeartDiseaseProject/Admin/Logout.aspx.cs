public partial class AdminLogout : System.Web.UI.Page
{
    protected void Page_Load(object sender, System.EventArgs e)
    {
        var user = Session["user"];
        if (user != null)
        {
            Session["user"] = null;
            this.Response.Write("<script>top.location.href='../Login.aspx';</script>");
        }
        else
        {
            Session["admin"] = null;
            Session["admin"] = null;
            this.Response.Write("<script>top.location.href='Login.aspx';</script>");
        }
    }
}