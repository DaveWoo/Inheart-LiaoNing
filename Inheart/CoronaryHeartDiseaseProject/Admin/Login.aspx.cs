namespace CoronaryHeartDiseaseProject
{
    using System;
    using DreamWork.BussinessLogic;

    /// <summary>
    /// 管理员登陆类
    /// </summary>
    public partial class AdminLogin : System.Web.UI.Page
    {
        /// <summary>
        /// 页面加载
        /// </summary>
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void Submit1_ServerClick(object sender, EventArgs e)
        {
            string verfiy = Request.Form["verify"];
            string username = Request.Form["username"].Trim();
            string password = Request.Form["password"].Trim();

            //string username = "超级管理员1";
            //string password = "111111";

            // 判断验证码是否正确
            if (Session["CheckCode"] != null)
            {
                if (!SiteManagement.IsLogon(username, password))
                {
                    this.Response.Write(BaseSystem.ShowWindow("对不起，你输入的用户名或密码不正确！！", "login.aspx"));
                }
                else
                {
                    string message = string.Empty;
                    SiteUser siteUser = SiteManagement.GetUser(username, ref message);
                    if (siteUser.Role.RoleID == 2)
                    {
                        Session["admin"] = siteUser;
                        this.Response.Redirect("Default.aspx");
                    }
                    else if (siteUser.Role.RoleID == 1)
                    {
                        Session["sa"] = siteUser;
                        this.Response.Redirect("SuperAdmin.aspx");
                    }
                    else
                    {
                        this.Response.Write(BaseSystem.ShowWindow("对不起，您不是管理员，您不能登录此系统！！"));
                    }
                }
            }
            else
            {
                this.Response.Write(BaseSystem.ShowWindow("对不起，验证码已超时失效，为了保障您的网站后台的安全，请重新登录！！", "login.aspx"));
                this.Response.Redirect("Login.aspx");
            }
        }
    }
}