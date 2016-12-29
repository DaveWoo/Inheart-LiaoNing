namespace CoronaryHeartDiseaseProject.Admin
{
	using System;
	using System.Collections.Generic;
	using System.Web;
	using DreamWork.BussinessLogic;
	using DreamWork.ObjectModel;

	/// <summary>
	/// 登陆日志类
	/// </summary>
	public partial class ViewLogs : System.Web.UI.Page
	{
		public int PageSize = 12;
		public int AdminPagePageID;
		public int MaxAdminPages;
		public int TotalNums;
		public int PageStartIndex;
		private static SiteUser userAdmin;

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
						this.Response.Redirect("ViewLogs.aspx");
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
					List<Log_Login> userLogList = SiteManagement.GetLogLogin(userAdmin.Hospital.ID);
					BaseSystem.BindProduceData(this.DataListUserLog, userLogList, PageStartIndex, PageStartIndex, PageSize);
					this.ShowBottomUrl();
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
			if (SiteManagement.GetLogLogin(userAdmin.Hospital.ID) == null)
			{
				return 0;
			}

			TotalNums = SiteManagement.GetLogLogin(userAdmin.Hospital.ID).Count;
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
				this.Label1.Text = "<font color=red><b>对不起，暂时还没有管理员</b></font>";
			}
		}

		/// <summary>
		/// 显示医院名称
		/// </summary>
		/// <param name="hospitalID">医院ID</param>
		/// <returns>医院名称</returns>
		public string ShowHospitalName(string hospitalID)
		{
			if (SiteManagement.GetHospital(uint.Parse(hospitalID)) != null)
			{
				return SiteManagement.GetHospital(uint.Parse(hospitalID)).HospitalName;
			}
			else
			{
				return null;
			}
		}

		/// <summary>
		/// 显示用户名
		/// </summary>
		/// <param name="userID">用户ID</param>
		/// <returns>用户名</returns>
		public string ShowUserName(string userID)
		{
			string message = null;
			if (SiteManagement.GetUser(int.Parse(userID), ref message) != null)
			{
				return SiteManagement.GetUser(int.Parse(userID), ref message).UserName;
			}
			else
			{
				return null;
			}
		}
	}
}