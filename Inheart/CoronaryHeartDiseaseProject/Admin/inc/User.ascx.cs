using System;

namespace CoronaryHeartDiseaseProject
{
    public partial class UserSession : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["user"] == null)
            {
                this.Response.Write("<script>alert('对不起，您已登录超时，请重新登录！！');top.location.href='../../Login.aspx';</script>");
            }
        }
    }
}