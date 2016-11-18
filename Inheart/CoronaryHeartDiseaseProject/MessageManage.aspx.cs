namespace CoronaryHeartDiseaseProject
{
	using System;
	using System.Collections.Generic;
	using System.Data;
	using System.Linq;
	using System.Web.UI.WebControls;
	using DreamWork.BussinessLogic;

	public partial class MessageManage : System.Web.UI.Page
	{
		#region 私有变量

		private const string conditionDefault = "请选择";
		private const string conditionDoctor = "医生";
		private const string conditionPatient = "患者姓名";
		private static SiteUser user;
		private int MaxPages;
		private int PagePageID;
		private int PageSize = 10;
		private int PageStartIndex;
		private int TotalNums;

		#endregion 私有变量

		/// <summary>
		/// 进入病例
		/// </summary>
		/// <param name="Num">第几页</param>
		/// <param name="IsLocked">是否锁定</param>
		/// <param name="ReportID">病例ID</param>
		public string EnterCase(string Num, string IsLocked, string ReportID)
		{
			string htmlstring = string.Empty;
			bool isSuccess = false;
			if (bool.TryParse(IsLocked, out isSuccess))
			{
				if (isSuccess)
				{
					htmlstring = "MessageInputDetail.aspx?IsLocked=";
				}
				else
				{
					htmlstring = "MessageInput.aspx?IsLocked=";
				}
			}
			else
			{
				htmlstring = "MessageInput.aspx?IsLocked=";
			}
			htmlstring = string.Format("{0}{1}&ReportID={2}", htmlstring, IsLocked, ReportID);
			return htmlstring;
		}

		/// <summary>
		/// 获得最大页数
		/// </summary>
		/// <returns>最大页数</returns>
		public int GetMaxPages()
		{
			int MaxPages;
			if (this.TotalNums % this.PageSize == 0)
			{
				MaxPages = this.TotalNums / this.PageSize;
			}
			else
			{
				MaxPages = this.TotalNums / this.PageSize + 1;
			}
			return MaxPages;
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

			if (this.TotalNums != 0)
			{
				if (this.PagePageID == 1)
				{
					HtmlFirstString = "&nbsp;&nbsp;首页";
				}
				else
				{
					HtmlFirstString = "&nbsp;&nbsp;<a href='?PageID=1'>首页</a>";
				}
				if (this.PagePageID > 1)
				{
					HtmlPrevString = string.Format("&nbsp;&nbsp;<a href='?PageID={0}'>上一页</a>", this.PagePageID - 1);
				}
				else
				{
					HtmlPrevString = "&nbsp;&nbsp;上一页";
				}
				if (this.PagePageID < this.MaxPages)
				{
					HtmlNextString = string.Format("&nbsp;&nbsp;<a href='?PageID={0}'>下一页</a>", this.PagePageID + 1);
				}
				else
				{
					HtmlNextString = "&nbsp;&nbsp;下一页";
				}
				if (this.PagePageID != this.MaxPages)
				{
					HtmlLastString = string.Format("&nbsp;&nbsp;<a href='?PageID={0}'>尾页</a>&nbsp;&nbsp;", this.MaxPages);
				}
				else
				{
					HtmlLastString = "&nbsp;&nbsp;尾页&nbsp;&nbsp;";
				}
				HtmlSelectString = "<select onchange=\"javascript:window.location=this.value\">";
				for (int i = 1; i <= this.MaxPages; i++)
				{
					if (i == this.PagePageID)
					{
						HtmlSelectString += string.Format("<option value=?PageID={0} selected>第{1}页</option>", i, i);
					}
					else
					{
						HtmlSelectString += string.Format("<option value=?PageID={0}>第{1}页</option>", i, i);
					}
				}
				HtmlSelectString += "</select>";
				if (this.PagePageID == 0)
				{
					this.PagePageID = 1;
				}
				this.Label1.Text = string.Format("共有<span class=badge><b>{0}</b></span>条记录 每页显示<span class=badge><b>{1}</b></span> 条 共<span class=badge><b>{2}</b></span class=badge>页 当前页 <font color=red><b>{3}</b></font>/{4}页{5}{6}{7}{8}{9}", this.TotalNums, this.PageSize, this.MaxPages, this.PagePageID, this.MaxPages, HtmlFirstString, HtmlPrevString, HtmlNextString, HtmlLastString, HtmlSelectString);
			}
			else
			{
				this.Label1.Text = "<font color=red><b>对不起，没有找到相应记录.</b></font>";
			}
		}

		/// <summary>
		/// 显示锁的图标
		/// </summary>
		/// <param name="isLock">是否显示锁的图标</param>
		/// <returns>isLock：true，显示锁定状态；其他情况显示不锁定</returns>
		public string ShowLock(string isLock)
		{
			bool locked = Boolean.Parse(isLock);
			string htmlstring = string.Empty;

			if (locked)
			{
				htmlstring += "<img src=\"../images/lock.png\" alt='锁' title='已锁' border=\"0\">&nbsp;";
			}
			else
			{
				htmlstring += "<img src=\"../images/unlock.png\" alt='锁' title='未锁' border=\"0\">&nbsp;";
			}
			return htmlstring;
		}

		/// <summary>
		/// 显示操作内容信息
		/// </summary>
		/// <param name="Num">第几条记录</param>
		/// <param name="isLocked">是否锁定</param>
		/// <param name="ReportID">病例ID</param>
		/// <returns>操作内容html</returns>
		public string ShowTxt(string Num, string isLocked, string ReportID)
		{
			string htmlstring1 = "";
			if (bool.Parse(isLocked))
			{
			}
			else
			{
				htmlstring1 = string.Format("<a href=\"?action=del&ReportID={0}\" onclick=\"return confirm('确认要删除？');\">", ReportID);
				htmlstring1 += "<span class=\"glyphicon glyphicon-trash\"></a>&nbsp;";
			}

			return htmlstring1;
		}

		/// <summary>
		/// 查询
		/// </summary>
		protected void Search_Click(object sender, EventArgs e)
		{
			if (this.ddlCondition.SelectedItem.Text.Trim() == conditionDefault)
			{
				this.Response.Write(BaseSystem.ShowWindow("请选择查询条件!"));
				this.txtCondition.Focus();
				return;
			}
			SiteUser user = (SiteUser)this.Session["user"];
			if (user == null)
			{
				user = (SiteUser)this.Session["admin"];
			}

			// 根据查询条件进行检索
			List<MedicalReportSource> medicalReportSourceList = new List<MedicalReportSource>();
			MedicalReportBLO medicalReportBLO = new MedicalReportBLO();
			if (string.IsNullOrEmpty(this.txtCondition.Text))
			{
				medicalReportSourceList = this.GetAllReportSummation();
			}
			else
			{
				string strCondition = this.txtCondition.Text.Trim().ToString();
				if (this.ddlCondition.SelectedItem.Text.Trim() == conditionPatient)
				{
					medicalReportSourceList = medicalReportBLO.GetReportSummationByPatientName(strCondition, user.ID);
				}
				else if (this.ddlCondition.SelectedItem.Text.Trim() == conditionDoctor)
				{
					medicalReportSourceList = medicalReportBLO.GetReportSummationByUser(strCondition);
				}
			}
			this.TotalNums = medicalReportSourceList.Count();
			this.MaxPages = this.GetMaxPages();

			this.BindProduceData(medicalReportSourceList, PageStartIndex, PageStartIndex, PageSize);

			// 绑定数据
			this.SetDataSource(medicalReportSourceList);
		}

		// 页面初始化
		protected void Page_Load(object sender, EventArgs e)
		{
			if (!this.Page.IsPostBack)
			{
				this.ddlCondition.Items.Clear();
				user = (SiteUser)this.Session["user"];
				//初始化查询条件
				List<string> conditionList = new List<string>();
				conditionList.Add(conditionDefault);
				conditionList.Add(conditionPatient);

				if (user != null)
				{
					conditionList.Add(conditionDoctor);
					this.btnAddMedical.Visible = true;
				}
				else
				{
					user = (SiteUser)this.Session["admin"];
					this.btnAddMedical.Visible = false;
				}
				// 将初始化的查询条件绑定到前台
				foreach (var conditon in conditionList)
				{
					ListItem item = new ListItem();
					item.Text = conditon;
					this.ddlCondition.Items.Add(item);
				}
				if (this.Request.QueryString["action"] != null)
				{
					string DelItem;
					int resultID = 0;
					DelItem = this.Request.QueryString["ReportID"];
					if (!string.IsNullOrEmpty(DelItem))
					{
						// 删除数据
						bool isSucess = Int32.TryParse(DelItem, out resultID);
						if (isSucess)
						{
							string[] reportIdArray = new string[] { DelItem };
							this.DeleteCheckedReport(reportIdArray);
						}
					}
				}
				else
				{
					this.PagePageID = Convert.ToInt32(this.Request.QueryString["PageID"]);
					if (this.Request.QueryString["PageID"] == null)
					{
						this.PagePageID = 1;
						this.PageStartIndex = 1;
					}
					this.PageStartIndex = Convert.ToInt32(this.PagePageID - 1);
					// 绑定数据
					List<MedicalReportSource> medicalReportSourceList = this.GetAllReportSummation();
					this.TotalNums = medicalReportSourceList.Count();
					this.MaxPages = this.GetMaxPages();
					this.BindProduceData(medicalReportSourceList, PageStartIndex, PageStartIndex, PageSize);
				}
			}
		}

		/// <summary>
		/// 绑定病例集合数据
		/// </summary>
		/// <param name="medicalReportSourceList">病例集合</param>
		/// <param name="DataStartIndex">开始index</param>
		/// <param name="PageStartIndex">页面开始index</param>
		/// <param name="PageSize">页面显示数目</param>
		private void BindProduceData(List<MedicalReportSource> medicalReportSourceList, int DataStartIndex, int PageStartIndex, int PageSize)
		{
			List<MedicalReportSource> bindingList = new List<MedicalReportSource>();
			if (medicalReportSourceList != null)
			{
				for (int i = PageStartIndex * PageSize; i < medicalReportSourceList.Count; i++)
				{
					if (medicalReportSourceList[i] == null || bindingList.Count >= PageSize)
					{
						break;
					}
					bindingList.Add(medicalReportSourceList[i]);
				}
				this.SetDataSource(bindingList);
			}
			this.ShowBottomUrl();
		}

		/// <summary>
		/// 删除病例
		/// </summary>
		/// <param name="arr">病例集合</param>
		private void DeleteCheckedReport(string[] arr)
		{
			MedicalReportBLO medicalReportBLO = new MedicalReportBLO();
			bool deleteResult = medicalReportBLO.RemoveReportSummationByReportID(arr);
			if (deleteResult)
			{
				this.Response.Redirect("MessageManage.aspx");
			}
			else
			{
				this.Response.Write(BaseSystem.ShowWindow("信息提示：出现未知错误，删除失败！！"));
			}
		}

		/// <summary>
		/// 获得所有病例
		/// </summary>
		/// <returns>获得所有病例</returns>
		private List<MedicalReportSource> GetAllReportSummation()
		{
			List<MedicalReportSource> medicalReportSourceList = new List<MedicalReportSource>();
			MedicalReportBLO medicalReportBLO = new MedicalReportBLO();
			if (user != null)
			{
				medicalReportSourceList = medicalReportBLO.GetAllReportSummationByUserID(user.ID);
			}
			return medicalReportSourceList;
		}

		/// <summary>
		/// 设定模板的基本数据
		/// </summary>
		/// <param name="medicalReportSourceList">病例信息集合</param>
		private void SetDataSource(List<MedicalReportSource> medicalReportSourceList)
		{
			#region 设定模板

			DataTable dtSource = new DataTable();
			DataColumn colID = new DataColumn("ID", typeof(string));
			DataColumn colPatientID = new DataColumn("PatientID", typeof(Guid));
			DataColumn colPatientName = new DataColumn("PatientName", typeof(string));
			DataColumn colCreater = new DataColumn("Creater", typeof(string));
			DataColumn colHospital = new DataColumn("Hospital", typeof(string));
			DataColumn colSimplyTreate = new DataColumn("SimplyTreate", typeof(string));
			DataColumn colTreatDate = new DataColumn("TreatDate", typeof(string));
			DataColumn colCreateDate = new DataColumn("CreateDate", typeof(string));
			DataColumn colLastUpdateDate = new DataColumn("LastUpdateDate", typeof(string));
			DataColumn colReportID = new DataColumn("ReportID", typeof(int));
			DataColumn colAge = new DataColumn("Age", typeof(int));
			DataColumn colSex = new DataColumn("Sex", typeof(string));
			DataColumn colLock = new DataColumn("IsLocked", typeof(bool));
			DataColumn colSubmit = new DataColumn("IsSubmit", typeof(string));

			dtSource.Columns.Add(colID);
			dtSource.Columns.Add(colPatientID);
			dtSource.Columns.Add(colPatientName);
			dtSource.Columns.Add(colCreater);
			dtSource.Columns.Add(colHospital);
			dtSource.Columns.Add(colSimplyTreate);
			dtSource.Columns.Add(colTreatDate);
			dtSource.Columns.Add(colCreateDate);
			dtSource.Columns.Add(colLastUpdateDate);
			dtSource.Columns.Add(colReportID);
			dtSource.Columns.Add(colAge);
			dtSource.Columns.Add(colSex);
			dtSource.Columns.Add(colLock);
			dtSource.Columns.Add(colSubmit);

			#endregion 设定模板

			#region 绑定数据

			int i = 1;
			foreach (MedicalReportSource item in medicalReportSourceList)
			{
				DataRow row = dtSource.NewRow();
				row[colID] = item.ID;
				row[colPatientID] = item.Person.ID;
				row[colPatientName] = item.PersonName;
				if (item.Person.Birthday != null)
				{
					string age = (DateTime.Now.Year - DateTime.Parse(item.Person.Birthday.ToString()).Year).ToString();
					row[colAge] = age;
				}

				// 设定列值
				row[colSex] = item.Person.Sex.Trim();
				row[colCreater] = item.Creater;
				row[colHospital] = item.HospitalName;
				row[colSimplyTreate] = item.ReportSummation.DiseaseDescriber;
				row[colTreatDate] = item.ReportSummation.TreatDate.ToString();
				row[colCreateDate] = item.ReportSummation.CreateDate.ToString("yyyy-MM-dd");
				row[colLastUpdateDate] = item.ReportSummation.LastUpdateDate.ToString("yyyy-MM-dd");
				row[colReportID] = item.ReportSummation.ID;
				switch (item.ReportSummation.IsSubmit)
				{
					case true:
						row[colSubmit] = "是";
						break;

					case false:
						row[colSubmit] = "否";
						break;
					default:
						break;
				}
				;
				if (this.Session["user"] == null)
				{
					row[colLock] = true;
				}
				else
				{
					row[colLock] = item.IsLocked;
				}

				i++;
				dtSource.Rows.Add(row);
			}
			this.dgMessage.DataSource = dtSource;
			this.dgMessage.DataBind();

			#endregion 绑定数据
		}
	}
}