namespace CoronaryHeartDiseaseProject
{
	using System;
	using System.Collections.Generic;
	using System.Data;
	using System.Linq;
	using System.Web.UI;
	using System.Web.UI.WebControls;
	using DreamWork.BussinessLogic;
	/// <summary>
	/// 
	/// </summary>
	public partial class MessageManageSupperAdmin : System.Web.UI.Page
	{
		private const string conditionPatient = "患者姓名";
		private const string conditionDoctor = "医生";
		private const string conditionDefault = "请选择";

		private int PageSize = 10;
		private int PagePageID;
		private int MaxPages;
		private int PageStartIndex;
		private int TotalNums;
		private static SiteUser user;
		/// <summary>
		/// 
		/// </summary>
		/// <param name="sender"></param>
		/// <param name="e"></param>
		protected void Page_Load(object sender, EventArgs e)
		{
			if (!Page.IsPostBack)
			{
				ddlCondition.Items.Clear();
				user = (SiteUser)Session["user"];
				List<string> conditionList = new List<string>();
				conditionList.Add(conditionDefault);
				conditionList.Add(conditionPatient);

				if (user != null)
				{
					conditionList.Add(conditionDoctor);
				}
				else
				{
					user = (SiteUser)Session["admin"];
				}
				if (user == null)
				{
					user = (SiteUser)Session["sa"];
				}
				foreach (var conditon in conditionList)
				{
					ListItem item = new ListItem();
					item.Text = conditon;
					ddlCondition.Items.Add(item);
				}
				if (this.Request.QueryString["action"] != null)
				{
					string DelItem;
					int resultID = 0;
					DelItem = this.Request.QueryString["ReportID"];
					if (!string.IsNullOrEmpty(DelItem))
					{
						bool isSucess = Int32.TryParse(DelItem, out resultID);
						if (isSucess)
						{
							string[] reportIdArray = new string[] { DelItem };
							DeleteCheckedReport(reportIdArray);
						}
					}
				}
				else
				{
					PagePageID = Convert.ToInt32(Request.QueryString["PageID"]);
					if (Request.QueryString["PageID"] == null)
					{
						PagePageID = 1;
						PageStartIndex = 1;
					}
					this.PageStartIndex = Convert.ToInt32(PagePageID - 1);

					List<MedicalReportSource> medicalReportSourceList = Report.GetAllReportSummation(user);
					this.TotalNums = medicalReportSourceList.Count();
					this.MaxPages = this.GetMaxPages();
					BindProduceData(medicalReportSourceList, PageStartIndex, PageStartIndex, PageSize);
				}
			}
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
				if (PagePageID == 1)
				{
					HtmlFirstString = "&nbsp;&nbsp;首页";
				}
				else
				{
					HtmlFirstString = "&nbsp;&nbsp;<a href='?PageID=1'>首页</a>";
				}
				if (PagePageID > 1)
				{
					HtmlPrevString = "&nbsp;&nbsp;<a href='?PageID=" + (PagePageID - 1) + "'>上一页</a>";
				}
				else
				{
					HtmlPrevString = "&nbsp;&nbsp;上一页";
				}
				if (PagePageID < MaxPages)
				{
					HtmlNextString = "&nbsp;&nbsp;<a href='?PageID=" + (PagePageID + 1) + "'>下一页</a>";
				}
				else
				{
					HtmlNextString = "&nbsp;&nbsp;下一页";
				}
				if (PagePageID != MaxPages)
				{
					HtmlLastString = "&nbsp;&nbsp;<a href='?PageID=" + MaxPages + "'>尾页</a>&nbsp;&nbsp;";
				}
				else
				{
					HtmlLastString = "&nbsp;&nbsp;尾页&nbsp;&nbsp;";
				}
				HtmlSelectString = "<select onchange=\"javascript:window.location=this.value\">";
				for (int i = 1; i <= MaxPages; i++)
				{
					if (i == PagePageID)
					{
						HtmlSelectString += "<option value=?PageID=" + i + " selected>第" + i + "页</option>";
					}
					else
					{
						HtmlSelectString += "<option value=?PageID=" + i + ">第" + i + "页</option>";
					}
				}
				HtmlSelectString += "</select>";
				if (PagePageID == 0)
				{
					PagePageID = 1;
				}
				this.Label1.Text = "共有<span class='badge'><b>"
					+ TotalNums
					+ "</b></span>条记录 每页显示<span class='badge'><b>"
					+ PageSize
					+ "</b></span> 条 共<span class='badge'><b>"
					+ MaxPages
					+ "</b></span>页 当前页 <font color=red><b>"
					+ PagePageID
					+ "</b></font>/"
					+ MaxPages
					+
					"页" + HtmlFirstString + HtmlPrevString + HtmlNextString + HtmlLastString + HtmlSelectString;
			}
			else
			{
				this.Label1.Text = "<font color=red><b>对不起，没有找到相应记录.</b></font>";
			}
		}
		/// <summary>
		/// 
		/// </summary>
		/// <param name="medicalReportSourceList"></param>
		/// <param name="DataStartIndex"></param>
		/// <param name="PageStartIndex"></param>
		/// <param name="PageSize"></param>
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
				SetDataSource(bindingList);
			}
			this.ShowBottomUrl();
		}
		/// <summary>
		/// 
		/// </summary>
		/// <returns></returns>
		public int GetMaxPages()
		{
			int MaxPages;
			if (TotalNums % PageSize == 0)
			{
				MaxPages = TotalNums / PageSize;
			}
			else
			{
				MaxPages = TotalNums / PageSize + 1;
			}
			return MaxPages;
		}
		/// <summary>
		/// 
		/// </summary>
		/// <param name="medicalReportSourceList"></param>
		private void SetDataSource(List<MedicalReportSource> medicalReportSourceList)
		{
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

				row[colSex] = item.Person.Sex.Trim();

				row[colCreater] = item.Creater;
				row[colHospital] = item.HospitalName;
				row[colSimplyTreate] = item.ReportSummation.DiseaseDescriber;
				row[colTreatDate] = item.ReportSummation.TreatDate.ToString();
				row[colCreateDate] = item.ReportSummation.CreateDate.ToString("yyyy-MM-dd HH:mm");
				row[colLastUpdateDate] = item.ReportSummation.LastUpdateDate;
				row[colReportID] = item.ReportSummation.ID;
				if (Session["user"] == null)
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
		}
		/// <summary>
		/// 
		/// </summary>
		/// <param name="isLock"></param>
		/// <returns></returns>
		public string ShowLock(string isLock)
		{
			bool locked = Boolean.Parse(isLock);
			string htmlstring = string.Empty;

			if (locked)
			{
				htmlstring += "<img src=\"/images/lock.png\" alt='锁' title='已锁' border=\"0\">&nbsp;";
			}
			else
			{
				htmlstring += "<img src=\"/images/unlock.png\" alt='锁' title='未锁' border=\"0\">&nbsp;";
			}
			return htmlstring;
		}
		/// <summary>
		/// 
		/// </summary>
		/// <param name="Num"></param>
		/// <param name="IsLocked"></param>
		/// <param name="ReportID"></param>
		/// <returns></returns>
		public string EnterCase(string Num, string IsLocked, string ReportID)
		{
			string htmlstring = string.Empty;
			htmlstring = "../../MessageInputDetail.aspx?IsLocked=";
			htmlstring = htmlstring + IsLocked + "&ReportID=" + ReportID;
			return htmlstring;
		}
		/// <summary>
		/// 
		/// </summary>
		/// <param name="arr"></param>
		private void DeleteCheckedReport(string[] arr)
		{
			MedicalReportBLO medicalReportBLO = new MedicalReportBLO();
			bool deleteResult = medicalReportBLO.RemoveReportSummationByReportID(arr);
			if (deleteResult)
			{
				this.Response.Redirect("../../MessageManage.aspx");
			}
			else
			{
				this.Response.Write(BaseSystem.ShowWindow("信息提示：出现未知错误，删除失败！！"));
			}
		}
		/// <summary>
		/// 
		/// </summary>
		/// <param name="sender"></param>
		/// <param name="e"></param>
		protected void Search_Click(object sender, EventArgs e)
		{
			if (ddlCondition.SelectedItem.Text.Trim() == conditionDefault)
			{
				this.Response.Write(BaseSystem.ShowWindow("请选择查询条件!"));
				txtCondition.Focus();
				return;
			}
			SiteUser user = (SiteUser)Session["user"];
			if (user == null)
			{
				user = (SiteUser)Session["admin"];
			}
			if (user == null)
			{
				user = (SiteUser)Session["sa"];
			}
			List<MedicalReportSource> medicalReportSourceList = new List<MedicalReportSource>();
			MedicalReportBLO medicalReportBLO = new MedicalReportBLO();
			if (string.IsNullOrEmpty(txtCondition.Text))
			{
				medicalReportSourceList = Report.GetAllReportSummation(user);
			}
			else
			{
				string strCondition = txtCondition.Text.Trim().ToString();
				if (ddlCondition.SelectedItem.Text.Trim() == conditionPatient)
				{
					medicalReportSourceList = medicalReportBLO.GetReportSummationByPatientName(strCondition, user.ID);
				}
				else if (ddlCondition.SelectedItem.Text.Trim() == conditionDoctor)
				{
					medicalReportSourceList = medicalReportBLO.GetReportSummationByUser(strCondition);
				}
			}
			this.TotalNums = medicalReportSourceList.Count();
			this.MaxPages = this.GetMaxPages();

			BindProduceData(medicalReportSourceList, PageStartIndex, PageStartIndex, PageSize);

			SetDataSource(medicalReportSourceList);
		}
		/// <summary>
		/// 
		/// </summary>
		/// <param name="sender"></param>
		/// <param name="e"></param>
		protected void ImportExcel_Click(object sender, EventArgs e)
		{
			GridView tempGridView = new GridView();
			tempGridView.AutoGenerateColumns = false;
			Report.BindingData(tempGridView, user);
			GridViewExportUtil.Export("Coronary Heart Disease Platform", tempGridView);
		}
	}
}