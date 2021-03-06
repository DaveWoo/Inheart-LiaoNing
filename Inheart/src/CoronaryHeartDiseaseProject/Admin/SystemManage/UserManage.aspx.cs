namespace CoronaryHeartDiseaseProject.Admin
{
	using System;
	using System.Collections.Generic;
	using System.Web.UI;
	using DreamWork.BussinessLogic;

	/// <summary>
	/// 用户管理中心类
	/// </summary>
	public partial class UserManage : System.Web.UI.Page
	{
		public int PageSize = 12;
		public int AdminPagePageID;
		public int MaxAdminPages;
		public int TotalNums;
		public int PageStartIndex;
		private static SiteUser userAdmin;
		private List<SiteUser> userList;

		/// <summary>
		/// 页面加载
		/// </summary>
		protected void Page_Load(object sender, EventArgs e)
		{
			if (!Page.IsPostBack)
			{
				userAdmin = (SiteUser)Session["admin"];

				if (this.Request.QueryString["action"] != null)
				{
					string DelItem;
					int resultID = 0;
					DelItem = this.Request.QueryString["ID"];
					if (!string.IsNullOrEmpty(DelItem))
					{
						bool isSucess = int.TryParse(DelItem, out resultID);
					}
					if (SiteManagement.DeleteUser(resultID))
					{
						this.Response.Redirect("UserManage.aspx");
					}
					else
					{
						this.Response.Write(BaseSystem.ShowWindow("出现异常,对不起,删除用户操作失败!!"));
					}
				}
				else
				{
					AdminPagePageID = Convert.ToInt32(Request.QueryString["PageID"]);
					if (Request.QueryString["PageID"] == null)
					{
						AdminPagePageID = 1;
						PageStartIndex = 0;
					}
					PageStartIndex = Convert.ToInt32(AdminPagePageID - 1);
					MaxAdminPages = this.GetMaxUserPages();
					userList = SiteManagement.GetAllUserByHospitalID(userAdmin.Hospital.ID);
					BaseSystem.BindProduceData(this.DataListUser, userList, PageStartIndex, PageStartIndex, PageSize);
					ShowBottomUrl();
				}
			}
		}

		/// <summary>
		/// 获得最大页面数
		/// </summary>
		/// <returns>返回最大页面数</returns>
		public int GetMaxUserPages()
		{
			int MaxAdminPages;
			if (userList == null)
			{
				userList = SiteManagement.GetAllUserByHospitalID(userAdmin.Hospital.ID);
			}
			TotalNums = userList.Count;
			if (TotalNums % PageSize == 0)
			{
				MaxAdminPages = TotalNums / PageSize;
			}
			else
			{
				MaxAdminPages = TotalNums / PageSize + 1;
			}
			return MaxAdminPages;
		}

		/// <summary>
		/// 显示文章列表的页码
		/// </summary>
		public void ShowBottomUrl()
		{
			string HtmlFirstString = "";
			string HtmlPrevString = "";
			string HtmlNextString = "";
			string HtmlLastString = "";
			string HtmlSelectString = "";

			if (TotalNums != 0)
			{
				if (AdminPagePageID == 1)
				{
					HtmlFirstString = "&nbsp;&nbsp;首页";
				}
				else
				{
					HtmlFirstString = "&nbsp;&nbsp;<a href='?PageID=1'>首页</a>";
				}
				if (AdminPagePageID > 1)
				{
					HtmlPrevString = "&nbsp;&nbsp;<a href='?PageID=" + (AdminPagePageID - 1) + "'>上一页</a>";
				}
				else
				{
					HtmlPrevString = "&nbsp;&nbsp;上一页";
				}
				if (AdminPagePageID < MaxAdminPages)
				{
					HtmlNextString = "&nbsp;&nbsp;<a href='?PageID=" + (AdminPagePageID + 1) + "'>下一页</a>";
				}
				else
				{
					HtmlNextString = "&nbsp;&nbsp;下一页";
				}
				if (AdminPagePageID != MaxAdminPages)
				{
					HtmlLastString = "&nbsp;&nbsp;<a href='?PageID=" + MaxAdminPages + "'>尾页</a>&nbsp;&nbsp;";
				}
				else
				{
					HtmlLastString = "&nbsp;&nbsp;尾页&nbsp;&nbsp;";
				}
				HtmlSelectString = "<select onchange=\"javascript:window.location=this.value\">";
				for (int i = 1; i <= MaxAdminPages; i++)
				{
					if (i == AdminPagePageID)
					{
						HtmlSelectString += "<option value=?PageID=" + i + " selected>第" + i + "页</option>";
					}
					else
					{
						HtmlSelectString += "<option value=?PageID=" + i + ">第" + i + "页</option>";
					}
				}
				HtmlSelectString += "</select>";
				this.Label1.Text = "共有<span class=badge><b>" + TotalNums + "</b></span>条记录 每页显示<span class=badge><b>" + PageSize + "</b></span> 条 共<span class=badge><b>" + MaxAdminPages + "</b></span>页 当前页 <span class=badge><b>" + AdminPagePageID + "/" + MaxAdminPages + "</b></span>" +
					"页" + HtmlFirstString + HtmlPrevString + HtmlNextString + HtmlLastString + HtmlSelectString;
			}
			else
			{
				this.Label1.Text = "<font color=red><b>对不起，暂时还没有用户</b></font>";
			}
		}

		/// <summary>
		/// 提交删除操作
		/// </summary>
		protected void Submit1_ServerClick(object sender, EventArgs e)
		{
			string AllDelItems;
			AllDelItems = this.Request.Form["Pid"];
			if (AllDelItems != null)
			{
				string[] arr = AllDelItems.Split(',');
				foreach (var item in arr)
				{
					int resultID = 0;
					bool isSucess = false;
					if (!string.IsNullOrEmpty(item))
					{
						isSucess = int.TryParse(item, out resultID);
					}
					if (isSucess)
					{
						if (SiteManagement.DeleteUser(resultID))
						{
						}
						else
						{
							this.Response.Write(BaseSystem.ShowWindow("出现异常,对不起,删除管理员操作失败!!"));
							break;
						}
					}
				}
				this.Response.Redirect("UserManage.aspx");
			}
			else
			{
				this.Response.Write(BaseSystem.ShowWindow("信息提示：请先选择要删除的医院！！"));
			}
		}

		/// <summary>
		/// 显示操作信息
		/// </summary>
		/// <param name="ID">病例ID</param>
		/// <returns>返回可操作的html</returns>
		public string ShowTxt(string ID)
		{
			string htmlstring = "";

			htmlstring = "<a href=\"ModifyUser.aspx?ID=" + ID + "\">";
			htmlstring += "<span class=\"glyphicon glyphicon-edit\"></a>&nbsp; <a href=\"?action=del&ID=" + ID + "\" onclick=\"return confirm('确认要删除？');\">";
			htmlstring += "<span class=\"glyphicon glyphicon-trash\"></a>&nbsp;";

			return htmlstring += "<input name=\"Pid\" type=\"checkbox\" id=\"Checkbox24\"  onclick=\"if(this.checked){news" + ID + ".style.backgroundColor='#DBEAF5';}else{news" + ID + ".style.backgroundColor='#ffffff';}\" value=\"" + ID + "\">";
		}
	}
}