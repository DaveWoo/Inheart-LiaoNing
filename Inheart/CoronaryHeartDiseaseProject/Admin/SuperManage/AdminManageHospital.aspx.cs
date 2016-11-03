namespace CoronaryHeartDiseaseProject.Admin.SuperManage
{
	using System;
	using System.Collections.Generic;
	using DreamWork.BussinessLogic;
	using DreamWork.ObjectModel;

	public partial class AdminManageHospital : System.Web.UI.Page
	{
		public int PageSize = 12;
		public int AdminPagePageID;
		public int MaxAdminPages;
		public int TotalNums;
		public int PageStartIndex;

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
					DeleteBLO deleteBLO = new DeleteBLO();
					if (deleteBLO.DeleteHospitalByHospitalID(resultID))
					{
						this.Response.Redirect("AdminManageHospital.aspx");
					}
					else
					{
						this.Response.Write(BaseSystem.ShowWindow("出现异常,对不起,删除医院操作失败!!"));
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
					MaxAdminPages = GetMaxHospitalPages();
					SiteUser user = (SiteUser)Session["sa"];
					if (user != null)
					{
						List<Hospital> hosList = SiteManagement.GetHospitals(user.ID);
						BaseSystem.BindProduceData<Hospital>(this.DataListHospital, hosList, PageStartIndex, PageStartIndex, PageSize);
						ShowBottomUrl();
					}
					ShowBottomUrl();
				}
			}
		}

		public int GetMaxHospitalPages()
		{
			int MaxAdminPages;
			TotalNums = SiteManagement.GetTotalHospitalRecord();
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
				this.Label1.Text = "共有<font color=red><b>" + TotalNums + "</b></font>条记录 每页显示<font color=red><b>" + PageSize + "</b></font> 条 共<font color=red><b>" + MaxAdminPages + "</b></font>页 当前页 <font color=red><b>" + AdminPagePageID + "</b></font>/" + MaxAdminPages +
					"页" + HtmlFirstString + HtmlPrevString + HtmlNextString + HtmlLastString + HtmlSelectString;
			}
			else
			{
				this.Label1.Text = "<font color=red><b>对不起，暂时还没有管理员</b></font>";
			}
		}

		protected void Submit1_ServerClick(object sender, EventArgs e)
		{
			DeleteBLO deleteBLO = new DeleteBLO();
			// Delete all selected hospital
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
						if (deleteBLO.DeleteHospitalByHospitalID(resultID))
						{
						}
						else
						{
							this.Response.Write(BaseSystem.ShowWindow("出现异常,对不起,删除管理员操作失败!!"));
							break;
						}
					}
				}
				this.Response.Redirect("AdminManageHospital.aspx");
			}
			else
			{
				this.Response.Write(BaseSystem.ShowWindow("信息提示：请先选择要删除的医院！！"));
			}
		}

		public string ShowTxt(string ID)
		{
			string htmlstring = "";
			string htmlstring1 = "";

			htmlstring += "<img src=\"../../images/EditNews.png\" alt='修改' title='修改' border=\"0\">&nbsp;";

			htmlstring += "<img src=\"../../images/DelNews.png\" alt='删除' title='删除' border=\"0\">&nbsp;";

			htmlstring1 = "<a href=\"ModifyHospital.aspx?ID=" + ID + "\">";
			htmlstring1 += "<img src=\"../../images/EditNews.png\" alt='修改' title='修改' border=\"0\"></a>&nbsp; <a href=\"?action=del&ID=" + ID + "\" onclick=\"return confirm('确认要删除？');\">";
			htmlstring1 += "<img src=\"../../images/DelNews.png\" alt='删除' title='删除' border=\"0\"></a>&nbsp;";

			// return htmlstring += "<input disabled name=\"Pid\" type=\"checkbox\" id=\"Checkbox24\"  onclick=\"if(this.checked){news" + AdminID + ".style.backgroundColor='#DBEAF5';}else{news" + AdminID + ".style.backgroundColor='#ffffff';}\" value=\"" + AdminID + "\">";
			return htmlstring1 += "<input name=\"Pid\" type=\"checkbox\" id=\"Checkbox24\"  onclick=\"if(this.checked){news" + ID + ".style.backgroundColor='#DBEAF5';}else{news" + ID + ".style.backgroundColor='#ffffff';}\" value=\"" + ID + "\">";
		}

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
	}
}