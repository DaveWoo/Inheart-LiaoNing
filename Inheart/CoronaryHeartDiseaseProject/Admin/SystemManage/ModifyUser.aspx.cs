namespace CoronaryHeartDiseaseProject.Admin
{
    using System;
    using System.Web.UI;
    using DreamWork.BussinessLogic;

    public partial class ModifyUser : System.Web.UI.Page
    {
        public string Username, Password, MenuListCheckBox;
        public string userName = string.Empty;
        private static SiteUser userNormal;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                string id = this.Request.QueryString["ID"];
                int userID = 0;

                if (!string.IsNullOrEmpty(id))
                {
                    bool isSucess = int.TryParse(id, out userID);
                }
                string message = string.Empty;
                userNormal = SiteManagement.GetUser(userID, ref message);
                if (userNormal != null)
                {
                    userName = userNormal.UserName;
                }
            }
        }

        protected void Submit1_ServerClick(object sender, EventArgs e)
        {
            string username = Request.Form["username"].Trim();
            string password = Request.Form["newpass"].Trim();

            // Modify user's password
            if (SiteManagement.UpdateUserPassword(username, password))
            {
                this.Response.Write(BaseSystem.ShowWindow("修改普通用户密码成功!!"));
            }
            else
            {
                this.Response.Write(BaseSystem.ShowWindow("出现异常错误,修改普通用户失败!!"));
            }
        }
    }
}