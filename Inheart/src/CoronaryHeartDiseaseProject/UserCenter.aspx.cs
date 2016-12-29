namespace CoronaryHeartDiseaseProject
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
            SiteUser user = (SiteUser)Session["user"];
            if (user != null)
            {
                string passWord = this.Request.Form["oldpass"].Trim();
                string newPassWord = this.Request.Form["newpass"].Trim();
                // 检验原密码是否正确
                if (SiteManagement.IsLogon(user.UserName, passWord))
                {
                    // 开始修用户的密码
                    if (SiteManagement.UpdateUserPassword(user.UserName, newPassWord))
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