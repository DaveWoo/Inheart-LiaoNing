namespace CoronaryHeartDiseaseProject.Admin
{
	using System;
	using System.Collections.Generic;
	using System.IO;
	using System.Linq;
	using System.Web.UI.DataVisualization.Charting;
	using DreamWork.BussinessLogic;

	public partial class SummaryReport : System.Web.UI.Page
	{
		private static SiteUser user;
		private static List<MedicalReportSource> medicalReportSourceList;

		public static int Total;
		public static int TotalAgeFangCha;
		public static int TotalRongShuan;
		public static int TotalJiZhen;
		public static int TotalDeath;
		public static int TotalTransfer;
		public static int Male;
		public static int Female;

		public static string StartTime = null;
		public static string EndTime = null;
		public static string actionType;

		public static int BelowForty;
		public static int FortyFifty;
		public static int FiftySixty;
		public static int SixtySeventy;
		public static int SeventyOldeer;

		public static double AvaAge;
		public static double Equation;

		protected void Page_Load(object sender, EventArgs e)
		{
			if (!Page.IsPostBack)
			{
				//user = new SiteUser();
				//user.UserName = "管理员4";
				//user.ID = 19;
				user = Session["sa"] as SiteUser;
				Total = 0;
				Male = 0;
				Female = 0;
				BelowForty = 0;
				FortyFifty = 0;
				FiftySixty = 0;
				SixtySeventy = 0;
				SeventyOldeer = 0;
				StartTime = null;
				EndTime = null;

				if (this.Request.QueryString["type"] != null)
				{
					actionType = this.Request.QueryString["type"];
				}
				switch (actionType)
				{
					case "Sum":
						this.panelQuery.Visible = true;
						this.panelSum.Visible = false;
						break;
					case "Sex":
						this.panelQuery.Visible = true;
						this.panelSex.Visible = false;
						break;
					case "Age":
						this.panelQuery.Visible = true;
						this.panelAge.Visible = false;
						break;
					case "ThrombolysisCount":
						this.panelQuery.Visible = true;
						this.panelThrombolysis.Visible = false;
						break;
					case "EmergencyTreate":
						this.panelQuery.Visible = true;
						this.panelEmergencyTreate.Visible = false;
						break;
					case "DeathCount":
						this.panelQuery.Visible = true;
						this.panelDeathCount.Visible = false;
						break;
					case "TransferUpHospitalCount":
						this.panelQuery.Visible = true;
						this.panelTransferUpHospitalCount.Visible = false;
						break;
					case "All":
						this.paneOverView.Visible = true;
						this.panelQuery.Visible = false;
						this.GetMainSource(user);

						break;
				}
			}
		}

		protected void Go_Click(object sender, EventArgs e)
		{
			#region set start/end time

			switch (actionType)
			{
				case "Sum":
					this.panelQuery.Visible = true;
					this.panelSum.Visible = true;
					break;
				case "Sex":
					this.panelQuery.Visible = true;
					this.panelSex.Visible = true;
					break;
				case "Age":
					this.panelQuery.Visible = false;
					this.panelAge.Visible = true;
					break;
				case "ThrombolysisCount":
					this.panelQuery.Visible = true;
					this.panelThrombolysis.Visible = true;
					break;
				case "EmergencyTreate":
					this.panelQuery.Visible = true;
					this.panelEmergencyTreate.Visible = true;
					break;
				case "DeathCount":
					this.panelQuery.Visible = true;
					this.panelDeathCount.Visible = true;
					break;
				case "TransferUpHospitalCount":
					this.panelQuery.Visible = true;
					this.panelTransferUpHospitalCount.Visible = true;
					break;
			}

			this.GetMainSource(user);

			#endregion set start/end time
		}

		private void GetMainSource(SiteUser user)
		{
			List<MedicalReportSource> medicalReportSourceListAll = Report.GetAllReportSummation(user);
			DateTime startTime = DateTime.MinValue;
			DateTime endTime = DateTime.Now;
			DateTime d;
			if (!string.IsNullOrWhiteSpace(this.controldate.Text) && DateTime.TryParse(this.controldate.Text, out d))
			{
				startTime = d;
			}

			if (!string.IsNullOrWhiteSpace(this.controldate2.Text) && DateTime.TryParse(this.controldate2.Text, out d))
			{
				endTime = d;
			}
			medicalReportSourceList = medicalReportSourceListAll.FindAll(p =>
				(p.ReportSummation.CreateDate != null)
					  && p.ReportSummation.CreateDate < endTime
					  && p.ReportSummation.CreateDate > startTime).ToList();

			if (medicalReportSourceList != null)
			{
				Total = medicalReportSourceList.Count;
				Male = medicalReportSourceList.FindAll(p => p.Person.Sex == "男").Count;
				Female = medicalReportSourceList.FindAll(p => p.Person.Sex == "女").Count;
				TotalDeath = medicalReportSourceList.FindAll(p => p.ReportLinChuangZhuanGui.TreatResult == "死亡").Count;

				TotalTransfer = medicalReportSourceList.Where(p => p.ReportLinChuangZhuanGui.TransUpHospitalConfirm == "是").Count();
				TotalRongShuan = medicalReportSourceList.Where(p => p.ReportLinChuangZhuanGui.ThrombolysisTreateConfirm == "是").Count();
				TotalJiZhen = medicalReportSourceList.Where(p => p.ReportLinChuangZhuanGui.EmergencyCoronaryTreateConfirm == "是").Count();
				TotalAgeFangCha = 0;

				BelowForty = medicalReportSourceList.Where(p => p.Person.Birthday.HasValue && p.Person.Birthday.Value.Year > DateTime.Now.Year - 40).Count();
				FortyFifty = medicalReportSourceList.Where(p => p.Person.Birthday.HasValue && (p.Person.Birthday.Value.Year <= DateTime.Now.Year - 40) && (p.Person.Birthday.Value.Year > DateTime.Now.Year - 50)).Count();
				FiftySixty = medicalReportSourceList.Where(p => p.Person.Birthday.HasValue && (p.Person.Birthday.Value.Year <= DateTime.Now.Year - 50) && (p.Person.Birthday.Value.Year > DateTime.Now.Year - 60)).Count();
				SixtySeventy = medicalReportSourceList.Where(p => p.Person.Birthday.HasValue && (p.Person.Birthday.Value.Year <= DateTime.Now.Year - 60) && (p.Person.Birthday.Value.Year > DateTime.Now.Year - 70)).Count();
				SeventyOldeer = medicalReportSourceList.Where(p => p.Person.Birthday.HasValue && p.Person.Birthday.Value.Year <= DateTime.Now.Year - 70).Count();

				int allAages = 0;

				var validDate = medicalReportSourceList.FindAll(p => p.Person.Birthday != null);
				validDate.ForEach(x => allAages += (DateTime.Now.Year - x.Person.Birthday.Value.Year));
				AvaAge = allAages / validDate.Count;

				double Fto = 0.0;
				validDate.ForEach(x => Fto += Math.Pow(AvaAge - (DateTime.Now.Year - x.Person.Birthday.Value.Year), 2));

				Equation = Fto / validDate.Count;
			}

			if (startTime == DateTime.MinValue)
			{
				StartTime = "";
			}
			else
			{
				StartTime = startTime.ToShortDateString();
			}

			EndTime = endTime.ToShortDateString();
		}

		private Dictionary<string, int> SetDisplayForSum()
		{
			Total = medicalReportSourceList.Count();
			return null;
		}

		private Dictionary<string, int> SetDisplayForAge()
		{
			Dictionary<string, int> dicTemp = new Dictionary<string, int>();

			Male = medicalReportSourceList.Where(p => p.Person.Sex == "男").Count();
			Female = medicalReportSourceList.Where(p => p.Person.Sex == "女").Count();
			Total = medicalReportSourceList.Count();

			BelowForty = medicalReportSourceList.Where(p => p.Person.Birthday.HasValue && p.Person.Birthday.Value.Year > DateTime.Now.Year - 40).Count();
			FortyFifty = medicalReportSourceList.Where(p => p.Person.Birthday.HasValue && (p.Person.Birthday.Value.Year <= DateTime.Now.Year - 40) && (p.Person.Birthday.Value.Year > DateTime.Now.Year - 50)).Count();
			FiftySixty = medicalReportSourceList.Where(p => p.Person.Birthday.HasValue && (p.Person.Birthday.Value.Year <= DateTime.Now.Year - 50) && (p.Person.Birthday.Value.Year > DateTime.Now.Year - 60)).Count();
			SixtySeventy = medicalReportSourceList.Where(p => p.Person.Birthday.HasValue && (p.Person.Birthday.Value.Year <= DateTime.Now.Year - 60) && (p.Person.Birthday.Value.Year > DateTime.Now.Year - 70)).Count();
			SeventyOldeer = medicalReportSourceList.Where(p => p.Person.Birthday.HasValue && p.Person.Birthday.Value.Year <= DateTime.Now.Year - 70).Count();

			if (!(Male == 0 && Female == 0))
			{
				dicTemp.Add("患病(男)", Male);
				dicTemp.Add("患病(女)", Female);
			}

			if (!(BelowForty == 0 && FortyFifty == 0 && FiftySixty == 0 && SixtySeventy == 0 && SeventyOldeer == 0))
			{
				Dictionary<string, int> dicAge = new Dictionary<string, int>();
				dicAge.Add("40岁以下", BelowForty);
				dicAge.Add("41～50岁", FortyFifty);
				dicAge.Add("51～60岁", FiftySixty);
				dicAge.Add("61～70岁", SixtySeventy);
				dicAge.Add("70岁以上", SeventyOldeer);
				string imagePath = GenerateRSDistributionChartImage(dicAge, "ChartAge");
				Random random = new Random();
				//this.imgAge.ImageUrl = "~/Images/ChartAge.jpg?" + random.Next(100);
				//this.imgAge.Visible = true;
			}

			return dicTemp;
		}

		private Dictionary<string, int> SetDisplayForSex()
		{
			Dictionary<string, int> dicTemp = new Dictionary<string, int>();

			Male = medicalReportSourceList.Where(p => p.Person.Sex == "男").Count();
			Female = medicalReportSourceList.Where(p => p.Person.Sex == "女").Count();
			Total = medicalReportSourceList.Count();

			BelowForty = medicalReportSourceList.Where(p => p.Person.Birthday.HasValue && p.Person.Birthday.Value.Year > DateTime.Now.Year - 40).Count();
			FortyFifty = medicalReportSourceList.Where(p => p.Person.Birthday.HasValue && (p.Person.Birthday.Value.Year <= DateTime.Now.Year - 40) && (p.Person.Birthday.Value.Year > DateTime.Now.Year - 50)).Count();
			FiftySixty = medicalReportSourceList.Where(p => p.Person.Birthday.HasValue && (p.Person.Birthday.Value.Year <= DateTime.Now.Year - 50) && (p.Person.Birthday.Value.Year > DateTime.Now.Year - 60)).Count();
			SixtySeventy = medicalReportSourceList.Where(p => p.Person.Birthday.HasValue && (p.Person.Birthday.Value.Year <= DateTime.Now.Year - 60) && (p.Person.Birthday.Value.Year > DateTime.Now.Year - 70)).Count();
			SeventyOldeer = medicalReportSourceList.Where(p => p.Person.Birthday.HasValue && p.Person.Birthday.Value.Year <= DateTime.Now.Year - 70).Count();

			if (!(Male == 0 && Female == 0))
			{
				dicTemp.Add("患病(男)", Male);
				dicTemp.Add("患病(女)", Female);
			}

			if (!(BelowForty == 0 && FortyFifty == 0 && FiftySixty == 0 && SixtySeventy == 0 && SeventyOldeer == 0))
			{
				Dictionary<string, int> dicAge = new Dictionary<string, int>();
				dicAge.Add("40岁以下", BelowForty);
				dicAge.Add("41～50岁", FortyFifty);
				dicAge.Add("51～60岁", FiftySixty);
				dicAge.Add("61～70岁", SixtySeventy);
				dicAge.Add("70岁以上", SeventyOldeer);
				string imagePath = GenerateRSDistributionChartImage(dicAge, "ChartAge");
				Random random = new Random();
				//this.imgAge.ImageUrl = "~/Images/ChartAge.jpg?" + random.Next(100);
				//this.imgAge.Visible = true;
			}

			return dicTemp;
		}

		private Dictionary<string, int> SetDisplayForThrombolysis()
		{
			Dictionary<string, int> dicTemp = new Dictionary<string, int>();
			Male = medicalReportSourceList.Where(p => p.ReportLinChuangZhuanGui.ThrombolysisTreateConfirm == "是" && p.Person.Sex == "男").Count();
			Female = medicalReportSourceList.Where(p => p.ReportLinChuangZhuanGui.ThrombolysisTreateConfirm == "是" && p.Person.Sex == "女").Count();
			Total = medicalReportSourceList.Where(p => p.ReportLinChuangZhuanGui.ThrombolysisTreateConfirm == "是").Count();

			if (!(Male == 0 && Female == 0))
			{
				dicTemp.Add("溶栓人数(男)", Male);
				dicTemp.Add("溶栓人数(女)", Female);
			}
			return dicTemp;
		}

		private Dictionary<string, int> SetDisplayForEmergencyTreate()
		{
			Male = medicalReportSourceList.Where(p => p.ReportLinChuangZhuanGui.EmergencyCoronaryTreateConfirm == "是" && p.Person.Sex == "男").Count();
			Female = medicalReportSourceList.Where(p => p.ReportLinChuangZhuanGui.EmergencyCoronaryTreateConfirm == "是" && p.Person.Sex == "女").Count();
			Total = medicalReportSourceList.Where(p => p.ReportLinChuangZhuanGui.EmergencyCoronaryTreateConfirm == "是").Count();

			Dictionary<string, int> dicTemp = new Dictionary<string, int>();
			if (!(Male == 0 && Female == 0))
			{
				dicTemp.Add("急诊介入治疗(男)", Male);
				dicTemp.Add("急诊介入治疗(女)", Female);
			}
			return dicTemp;
		}

		private Dictionary<string, int> SetDisplayForDeathCount()
		{
			Male = medicalReportSourceList.Where(p => p.ReportLinChuangZhuanGui.TreatResult == "死亡" && p.Person.Sex == "男").Count();
			Female = medicalReportSourceList.Where(p => p.ReportLinChuangZhuanGui.TreatResult == "死亡" && p.Person.Sex == "女").Count();
			Total = medicalReportSourceList.Where(p => p.ReportLinChuangZhuanGui.TreatResult == "死亡").Count();

			Dictionary<string, int> dicTemp = new Dictionary<string, int>();
			if (!(Male == 0 && Female == 0))
			{
				dicTemp.Add("死亡人数(男)", Male);
				dicTemp.Add("死亡人数(女)", Female);
			}
			return dicTemp;
		}

		private Dictionary<string, int> SetDisplayForTransUpHospitalConfirm()
		{
			Male = medicalReportSourceList.Where(p => p.ReportLinChuangZhuanGui.TransUpHospitalConfirm == "是" && p.Person.Sex == "男").Count();
			Female = medicalReportSourceList.Where(p => p.ReportLinChuangZhuanGui.TransUpHospitalConfirm == "是" && p.Person.Sex == "女").Count();
			Total = medicalReportSourceList.Where(p => p.ReportLinChuangZhuanGui.TransUpHospitalConfirm == "是").Count();

			Dictionary<string, int> dicTemp = new Dictionary<string, int>();
			if (!(Male == 0 && Female == 0))
			{
				dicTemp.Add("转上级医院人数(男)", Male);
				dicTemp.Add("转上级医院人数(女)", Female);
			}
			return dicTemp;
		}

		private string GenerateRSDistributionChartImage(Dictionary<string, int> values, string imgName)
		{
			string imgUrl = AppDomain.CurrentDomain.BaseDirectory + "Images\\";
			//imgUrl = Server.MapPath(".") + "Images\\";
			//imgUrl = imgName.ImageUrl;
			if (values != null && values.Count() != 0)
			{
				Chart chart = new Chart();
				chart.ChartAreas.Add("Default");
				chart.ChartAreas["Default"].Area3DStyle.Enable3D = true;

				chart.Legends.Add("Default");
				chart.Legends["Default"].DockedToChartArea = "Default";
				chart.Legends["Default"].Docking = Docking.Right;
				chart.Series.Add("Series1");
				chart.Series["Series1"].ChartArea = "Default";
				chart.Series["Series1"].Legend = "Default";
				chart.Series["Series1"].ChartType = SeriesChartType.Pie;

				int i = 0;
				foreach (var key in values.Keys)
				{
					chart.Series["Series1"].Points.AddY(values[key]);
					chart.Series["Series1"].Points[i].LegendText = key;
					chart.Series["Series1"].Points[i].Label = values[key].ToString();
					chart.Series["Series1"].Points[i].IsVisibleInLegend = true;
					i++;
				}

				chart.Width = 360;
				chart.Height = 360;
				if (!Directory.Exists(imgUrl))
				{
					Directory.CreateDirectory(imgUrl);
				}
				imgUrl += imgName + ".jpg";
				chart.SaveImage(imgUrl);
			}
			else
			{
				imgUrl = AppDomain.CurrentDomain.BaseDirectory + "\\Default.jpg";
				if (!System.IO.File.Exists(imgUrl))
				{
					System.Drawing.Bitmap bmp = new System.Drawing.Bitmap(200, 200);
					System.Drawing.Graphics g = System.Drawing.Graphics.FromImage(bmp);
					g.Clear(System.Drawing.Color.Blue);
					bmp.Save(imgUrl);
				}
			}
			return imgUrl;
		}
	}
}