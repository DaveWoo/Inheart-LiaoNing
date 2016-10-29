namespace CoronaryHeartDiseaseProject.Admin
{
    using System;
    using DreamWork.BussinessLogic;

    public partial class UserCenter : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void Submit1_ServerClick(object sender, EventArgs e)
        {
            // 获取当前管理员的用户名和密码
            if (Session["admin"] != null)
            {
                string userName = Session["admin"].ToString();
                string passWord = this.Request.Form["oldpass"].Trim();
                string newPassWord = this.Request.Form["newpass"].Trim();
                // 检验原密码是否正确
                if (SiteManagement.IsLogon(userName, passWord))
                {
                    // 开始修改管理员的密码
                    //  string sql = "update admin set [password]='" + FormsAuthentication.HashPasswordForStoringInConfigFile(NewPassWord, "MD5").ToLower().Substring(8, 16) + "' where username='" + UserName + "'";
                    if (SiteManagement.UpdateUserPassword(userName, newPassWord))
                    {
                        this.Response.Write(BaseSystem.ShowWindow("密码修改成功!!"));
                    }
                    else
                    {
                        this.Response.Write(BaseSystem.ShowWindow("出现异常错误,密码修改失败!!"));
                    }
                }
                else
                {
                    this.Response.Write(BaseSystem.ShowWindow("对不起,你的原密码不正确!!"));
                }
            }
            else
            {
                this.Response.Write("登录已超时!!");
            }
        }
    }
}