﻿namespace CoronaryHeartDiseaseProject.Admin.SuperManage
{
	using System;
	using System.Collections.Generic;
	using System.Web.UI;
	using DreamWork.BussinessLogic;
	using DreamWork.ObjectModel;

	/// <summary>
	/// 管理员管理类
	/// </summary>
	public partial class AdminManage : System.Web.UI.Page
	{
		public int PageSize = 12;
		public int AdminPagePageID;
		public int MaxAdminPages;
		public int PageStartIndex;
		public int TotalNums;

		/// <summary>
		/// 页面加载
		/// </summary>
		protected void Page_Load(object sender, EventArgs e)
		{
			if (!Page.IsPostBack)
			{
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
						this.Response.Redirect("AdminManage.aspx");
					}
					else
					{
						this.Response.Write(BaseSystem.ShowWindow("出现异常,对不起,删除管理员操作失败!!"));
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
					this.PageStartIndex = Convert.ToInt32(AdminPagePageID - 1);
					this.MaxAdminPages = this.GetMaxAdminPages();
					List<SiteUser> userList = SiteManagement.GetAllUser(2);
					BaseSystem.BindProduceData(this.DataListUser, userList, PageStartIndex, PageStartIndex, PageSize);
					this.ShowBottomUrl();
				}
			}
		}

		/// <summary>
		/// 获得页面数
		/// </summary>
		/// <returns>返回管理员的最多页数</returns>
		public int GetMaxAdminPages()
		{
			int MaxAdminPages;
			TotalNums = SiteManagement.GetTotalUserRecord(2);
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
				this.Label1.Text = "共有<span class=badge><b>" + TotalNums + "</b></span>条记录 每页显示<span class=badge><b>" + PageSize + "</b></span> 条 共<span class=badge><b>" + MaxAdminPages + "</b></span>页 当前页 <span class='badge'><b>" + AdminPagePageID + "/" + MaxAdminPages + "</b></span>" +
					"页" + HtmlFirstString + HtmlPrevString + HtmlNextString + HtmlLastString + HtmlSelectString;
			}
			else
			{
				this.Label1.Text = "<font color=red><b>对不起，暂时还没有管理员</b></font>";
			}
		}

		/// <summary>
		/// 管理员管理操作
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
				this.Response.Redirect("AdminManage.aspx");
			}
			else
			{
				this.Response.Write(BaseSystem.ShowWindow("信息提示：请先选择要删除的医院！！"));
			}
		}

		/// <summary>
		/// 显示地域信息
		/// </summary>
		/// <param name="ID">地域ID</param>
		/// <returns>返回地域信息</returns>
		public string ShowRegionName(string ID)
		{
			int id = int.Parse(ID);
			Region region = SiteManagement.GetRegionByID(id);
			if (region == null)
				return null;
			else
			{
				return region.RegionName;
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

			htmlstring = "<a href=\"ModifyAdmin.aspx?ID=" + ID + "\">";
			htmlstring += "<span class=\"glyphicon glyphicon-edit\"></a>&nbsp; <a href=\"?action=del&ID=" + ID + "\" onclick=\"return confirm('确认要删除？');\">";
			htmlstring += "<span class=\"glyphicon glyphicon-trash\"></a>&nbsp;";

			return htmlstring;
		}
	}
}