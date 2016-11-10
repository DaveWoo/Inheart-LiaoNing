namespace CoronaryHeartDiseaseProject
{
	using System;
	using System.Drawing;
	using System.Linq;
	using System.Text;
	using System.Web.UI;
	using System.Web.UI.WebControls;
	using DreamWork.BussinessLogic;
	using DreamWork.ObjectModel;

	/// <summary>
	///病例录入类
	/// </summary>
	public partial class MessageInput : System.Web.UI.Page
	{
		public static Person currentPerson;
		private MedicalReportBLO medicalReportBLO = new MedicalReportBLO();

		/// <summary>
		/// 检查控件值
		/// </summary>
		/// <param name="controls">控件</param>
		/// <returns>值</returns>
		private string CheckControlValue(ControlCollection controls)
		{
			StringBuilder errorMessage = new StringBuilder();
			foreach (Control item in controls)
			{
				if (item.Controls.Count != 0)
				{
					errorMessage.Append(CheckControlValue(item.Controls));
				}

				if (item is TextBox)
				{
					TextBox textbox = (TextBox)item;
					if (string.IsNullOrEmpty(textbox.Text) && !string.IsNullOrEmpty(textbox.ToolTip))
					{
						textbox.BackColor = Color.Yellow;
						errorMessage.Append(textbox.ToolTip);
						errorMessage.Append('\r');
					}
					else
					{
						if (textbox.BackColor == Color.Yellow)
						{
							textbox.BackColor = Color.Empty;
						}
					}
				}
				else if (item is RadioButtonList)
				{
					RadioButtonList radioButtonList = (RadioButtonList)item;
					if (radioButtonList.SelectedItem == null && !string.IsNullOrEmpty(radioButtonList.ToolTip))
					{
						radioButtonList.BackColor = Color.Yellow;
						errorMessage.Append(radioButtonList.ToolTip);
						errorMessage.Append('\r');
					}
					else
					{
						if (radioButtonList.BackColor == Color.Yellow)
						{
							radioButtonList.BackColor = Color.Empty;
						}
					}
				}
				else if (item is CheckBox)
				{
					CheckBox checkBox = (CheckBox)item;
					if (checkBox.Checked && !string.IsNullOrEmpty(checkBox.ToolTip))
					{
						checkBox.BackColor = Color.Yellow;
						errorMessage.Append(checkBox.ToolTip);
						errorMessage.Append('\r');
					}
					else
					{
						if (checkBox.BackColor == Color.Yellow)
						{
							checkBox.BackColor = Color.Empty;
						}
					}
				}
				else if (item is DropDownList)
				{
					DropDownList dropDownList = (DropDownList)item;
					if (dropDownList.SelectedItem != null && dropDownList.SelectedItem.Text == "请选择" && !string.IsNullOrEmpty(dropDownList.ToolTip))
					{
						dropDownList.BackColor = Color.Yellow;
						errorMessage.Append(dropDownList.ToolTip);
						errorMessage.Append('\r');
					}
					else
					{
						if (dropDownList.BackColor == Color.Yellow)
						{
							dropDownList.BackColor = Color.Empty;
						}
					}
				}
			}
			return errorMessage.ToString();
		}

		/// <summary>
		/// 页面加载
		/// </summary>
		protected void Page_Load(object sender, EventArgs e)
		{
			if (!Page.IsPostBack)
			{
				if (Request.QueryString.Count != 0)
				{
					InitReport();
				}
				else
				{
					reportSummation = new Report_Summation();
					this.EnableExpendContent(false);
				}
			}
		}

		/// <summary>
		/// 出生日期事件
		/// </summary>
		protected void txbBirthDay_TextChanged(object sender, EventArgs e)
		{
			if (!string.IsNullOrEmpty(txbBirthDay.Text))
			{
				// 自动计算年龄
				this.txtAge.Text = (DateTime.Now.Year - Convert.ToDateTime(txbBirthDay.Text).Year).ToString();
			}
		}

		/// <summary>
		///检查bool值
		/// </summary>
		/// <param name="input">控件</param>
		/// <returns>true | false</returns>
		private bool CheckBoolValue(object input)
		{
			bool result = false;
			if (input == null)
			{
				result = false;
			}
			else
			{
				Boolean.TryParse(input.ToString(), out result);
			}
			return result;
		}

		/// <summary>
		/// String 到 Int
		/// </summary>
		/// <param name="input">string value</param>
		/// <returns>int值</returns>
		private int ConvertToInt(string input)
		{
			int result = 0;
			Int32.TryParse(input, out result);
			return result;
		}

		/// <summary>
		/// 将object类型转化成string类型
		/// </summary>
		/// <param name="input">值</param>
		/// <returns>string类型的值</returns>
		private string ConvertToString(object input)
		{
			if (input == null)
			{
				return string.Empty;
			}
			else
			{
				return input.ToString();
			}
		}

		#region 公共方法

		/// <summary>
		/// 闰年检查
		/// </summary>
		/// <param name="yN">年份数字</param>
		/// <returns>是否闰年</returns>
		public bool IsLeap(int yN)
		{
			if ((yN % 400 == 0 && yN % 3200 != 0)
			   || (yN % 4 == 0 && yN % 100 != 0)
			   || (yN % 3200 == 0 && yN % 172800 == 0))
				return true;
			else
				return false;
		}

		/// <summary>
		///绑定时间
		/// </summary>
		/// <param name="year">年</param>
		/// <param name="month">月</param>
		/// <param name="day">日</param>
		/// <returns>下拉框</returns>
		protected DropDownList BindDateForDays(DropDownList year, DropDownList month, DropDownList day)
		{
			System.Collections.Generic.IEnumerable<int> days = null;
			if (year != null && !string.IsNullOrEmpty(year.SelectedValue))
			{
				bool isLeap = IsLeap(Convert.ToInt32(year.SelectedValue));

				switch (month.SelectedValue)
				{
					case "4":
					case "6":
					case "9":
					case "11":
						days = Enumerable.Range(1, 30);
						break;

					case "2":
						if (isLeap && month.SelectedValue == "2")
						{
							days = Enumerable.Range(1, 29);
						}
						else if (!isLeap && month.SelectedValue == "2")
						{
							days = Enumerable.Range(1, 28);
						}
						break;

					default:
						days = Enumerable.Range(1, 31);
						break;
				}
			}
			day.DataSource = null;
			day.DataSource = days;
			day.DataBind();

			return day;
		}

		#region 控件显示

		/// <summary>
		/// 出血选项
		/// </summary>
		protected void chkBlood_CheckedChanged(object sender, EventArgs e)
		{
			if (this.chkBlood.Checked)
			{
				this.rblBleed.Visible = true;
			}
			else
			{
				this.rblBleed.Visible = false;

				rblBleed.Text = null;
			}
		}

		/// <summary>
		/// 心律失常选项
		/// </summary>
		protected void ddlArrhythmiaExist_SelectedIndexChanged(object sender, EventArgs e)
		{
			if (this.ddlArrhythmiaExist.Text == "有")
			{
				this.PanelddlArrhythmiaExist.Visible = true;
			}
			else
			{
				this.PanelddlArrhythmiaExist.Visible = false;

				this.chkVPB.Checked = false;
				this.chkVT.Checked = false;
				this.chkVF.Checked = false;
				this.chmAts.Checked = false;
				this.chkAFS1.Checked = false;
				this.chkAF.Checked = false;
				this.chkAPB.Checked = false;

				this.chkAVBI.Checked = false;
				this.chkAVBII.Checked = false;
				this.chkAVBIII.Checked = false;
				this.chkAFS.Checked = false;
				this.chkRBBB.Checked = false;
				this.chkAVBOther.Checked = false;
			}
		}

		/// <summary>
		/// 脑卒中选项
		/// </summary>
		protected void rblCerebralHemorrhageConfirm_SelectedIndexChanged(object sender, EventArgs e)
		{
			if (rblCerebralHemorrhageConfirm.Text == "肯定")
			{
				this.PanelrblCerebralHemorrhageTreateLasted.Visible = true;
			}
			else
			{
				this.PanelrblCerebralHemorrhageTreateLasted.Visible = false;
				this.rblCerebralHemorrhageTreateLasted.Text = null;
			}
		}

		/// <summary>
		/// 伴随症状选项
		/// </summary>
		protected void rblConcomitantSymptomExist_SelectedIndexChanged(object sender, EventArgs e)
		{
			if (rblConcomitantSymptomExist.Text == "有")
			{
				this.PanelrblConcomitantSymptomType.Visible = true;
			}
			else
			{
				this.PanelrblConcomitantSymptomType.Visible = false;
			}
		}

		/// <summary>
		/// 在院24h内是否进行了心肺复苏选项
		/// </summary>
		protected void rblCPR_SelectedIndexChanged(object sender, EventArgs e)
		{
			if (rblCPR.Text == "是")
			{
				this.panetxtCPRTimes.Visible = true;
			}
			else
			{
				this.panetxtCPRTimes.Visible = false;
			}
		}

		/// <summary>
		/// 糖尿病选项
		/// </summary>
		protected void rblGlycuresisConfirm_SelectedIndexChanged(object sender, EventArgs e)
		{
			if (rblGlycuresisConfirm.Text == "肯定")
			{
				this.PanelddlGlycuresisLasted.Visible = true;
			}
			else
			{
				this.PanelddlGlycuresisLasted.Visible = false;
				this.ddlGlycuresisLasted.Text = null;
				this.ddlGlycuresisTreatedState.Text = null;
			}
		}

		/// <summary>
		/// 高血压选项
		/// </summary>
		protected void rblHypertensionConfirm_SelectedIndexChanged(object sender, EventArgs e)
		{
			if (rblHypertensionConfirm.Text == "肯定")
			{
				this.PanelddlHypertensionLasted.Visible = true;
			}
			else
			{
				this.PanelddlHypertensionLasted.Visible = false;
				this.ddlHypertensionLasted.Text = null;
				this.ddlHypertensionTreatedState.Text = null;
			}
		}

		/// <summary>
		/// 诱因选项
		/// </summary>
		protected void rblIncentiveExist_SelectedIndexChanged(object sender, EventArgs e)
		{
			if (rblIncentiveExist.Text == "有")
			{
				this.PanelrblIncentiveType.Visible = true;
			}
			else
			{
				this.PanelrblIncentiveType.Visible = false;
			}
		}

		/// <summary>
		/// 是否应用他汀类药物选项
		/// </summary>
		protected void rblLoadStatinUsed_SelectedIndexChanged(object sender, EventArgs e)
		{
			if (rblLoadStatinUsed.Text == "是")
			{
				this.PanelRadioButtonList.Visible = true;
			}
			else
			{
				this.PanelRadioButtonList.Visible = false;

				this.chkSimvastatin.Checked = false;
				this.chkPravastatin.Checked = false;
				this.chkFluvastatin.Checked = false;
				this.chkAtorvastatin.Checked = false;
				this.chkRosuvastatin.Checked = false;
				this.chkPitavastatin.Checked = false;
			}
		}

		/// <summary>
		/// 部位选项
		/// </summary>
		protected void rblPositionExist_SelectedIndexChanged(object sender, EventArgs e)
		{
			if (rblPositionExist.Text == "有")
			{
				this.PanelrblPositionType.Visible = true;
			}
			else
			{
				this.PanelrblPositionType.Visible = false;
			}
		}

		/// <summary>
		/// 放射痛部位选项
		/// </summary>
		protected void rblRadiationPainExist_SelectedIndexChanged(object sender, EventArgs e)
		{
			if (rblRadiationPainExist.Text == "有")
			{
				this.PanelrblRadiationPainType.Visible = true;
			}
			else
			{
				this.PanelrblRadiationPainType.Visible = false;
			}
		}

		/// <summary>
		/// 是否进行了静脉溶栓治疗选项
		/// </summary>
		protected void rdbThrombolysisTreateConfirm_SelectedIndexChanged1(object sender, EventArgs e)
		{
			if (rdbThrombolysisTreateConfirm.Text == "是")
			{
				this.panelWeiJinXingJingMaiRongShuan.Visible = false;
				this.panelRongShuanLiYou.Visible = true;
			}
			else
			{
				this.panelWeiJinXingJingMaiRongShuan.Visible = true;
				this.panelRongShuanLiYou.Visible = false;
			}
		}

		/// <summary>
		/// 转上级医院选项
		/// </summary>
		protected void rblTransUpHospitalConfirm_SelectedIndexChanged(object sender, EventArgs e)
		{
			if (rblTransUpHospitalConfirm.Text == "是")
			{
				this.panelTransfer.Visible = true;
			}
			else
			{
				this.panelTransfer.Visible = false;
			}
		}

		/// <summary>
		/// 在院24h内的转归选项
		/// </summary>
		protected void rblTreatResult_SelectedIndexChanged(object sender, EventArgs e)
		{
			if (rblTreatResult.Text == "死亡")
			{
				this.panelrblTreatResult.Visible = true;
			}
			else
			{
				this.panelrblTreatResult.Visible = false;

				this.txtDeadTime.Text = null;
				this.chkDeadForVentriclarArrhythmias.Checked = false;
				this.chkDeadForCardiacArrest.Checked = false;
				this.chkDeadForCardiogenicShock.Checked = false;
				this.chkDeadForACVD.Checked = false;
				this.chkDeadForGIH.Checked = false;
				this.chkDeadForOther.Checked = false;
			}
		}

		/// <summary>
		/// 急性ST段抬高性心肌梗死选项
		/// </summary>
		protected void rdAcuteST_CheckedChanged(object sender, EventArgs e)
		{
			if (rdAcuteST.Checked)
			{
				this.PanelrdAcuteST.Visible = true;
			}
			else
			{
				this.chkAnteroseptal.Checked = false;
				this.chkAntetheca.Checked = false;
				this.chkExtensive.Checked = false;
				this.chkHeartWall.Checked = false;
				this.chkHighWall.Checked = false;
				this.chkInteriorWall.Checked = false;
				this.chkBackWall.Checked = false;
				this.chkRightVentricular.Checked = false;
			}
		}

		/// <summary>
		/// 段抬高性心肌梗死选项--未选中
		/// </summary>
		protected void rdAcuteST_UnCheckedChanged(object sender, EventArgs e)
		{
			this.rdAcuteST.Checked = false;
		}

		#endregion 控件显示

		/// <summary>
		/// 控件是否开启
		/// </summary>
		/// <param name="isEnable">是否开启</param>
		protected void EnableExpendContent(bool isEnable)
		{
			this.PanelrblIncentiveType.Visible = isEnable;
			this.PanelrblPositionType.Visible = isEnable;
			this.PanelrblRadiationPainType.Visible = isEnable;
			this.PanelrblConcomitantSymptomType.Visible = isEnable;
			this.PanelddlHypertensionLasted.Visible = isEnable;
			this.PanelddlGlycuresisLasted.Visible = isEnable;
			this.PanelrblCerebralHemorrhageTreateLasted.Visible = isEnable;
			this.PanelddlArrhythmiaExist.Visible = isEnable;
			this.panelrblTreatResult.Visible = isEnable;
			this.panelTransfer.Visible = isEnable;
			this.PanelRadioButtonList.Visible = isEnable;
			this.panetxtCPRTimes.Visible = isEnable;
			this.rblBleed.Visible = isEnable;
			this.panelWeiJinXingJingMaiRongShuan.Visible = isEnable;
			this.panelRongShuanLiYou.Visible = isEnable;
			this.btnEnterPrint.Enabled = isEnable;
		}

		#endregion 公共方法

		/// <summary>
		/// 是否进行了静脉溶栓治疗选项
		/// </summary>
		protected void rdbThrombolysisTreateConfirm_SelectedIndexChanged(object sender, EventArgs e)
		{
			if (rdbThrombolysisTreateConfirm.Text == "否")
			{
				this.panelWeiJinXingJingMaiRongShuan.Visible = true;
			}
			else
			{
				this.panelWeiJinXingJingMaiRongShuan.Visible = false;
			}
		}

		/// <summary>
		/// 静脉溶栓选项
		/// </summary>
		protected void niaoJiMei_CheckedChanged(object sender, EventArgs e)
		{
			this.rblAlteplase.Text = null;
			this.rblReteplase.Text = null;
		}

		/// <summary>
		/// 阿替普酶选项
		/// </summary>
		protected void aiTiPuMei_CheckedChanged(object sender, EventArgs e)
		{
			this.rblUrokinase.Text = null;
			this.rblReteplase.Text = null;
			this.txtUrokinaseOther.Text = null;
		}

		/// <summary>
		/// 瑞替普酶选项
		/// </summary>
		protected void ruiTiPuMei_CheckedChanged(object sender, EventArgs e)
		{
			this.rblUrokinase.Text = null;
			this.rblAlteplase.Text = null;
			this.txtUrokinaseOther.Text = null;
		}

		/// <summary>
		/// 瑞替普酶选项--次数
		/// </summary>
		protected void rblReteplase_SelectedIndexChanged(object sender, EventArgs e)
		{
			this.ruiTiPuMei.Checked = true;
			ruiTiPuMei_CheckedChanged(null, null);

			this.niaoJiMei.Checked = false;
			this.aiTiPuMei.Checked = false;
		}

		/// <summary>
		/// 瑞替普酶选项--用量单位
		/// </summary>
		protected void rblAlteplase_SelectedIndexChanged(object sender, EventArgs e)
		{
			this.aiTiPuMei.Checked = true;
			aiTiPuMei_CheckedChanged(null, null);

			this.niaoJiMei.Checked = false;
			this.ruiTiPuMei.Checked = false;
		}

		/// <summary>
		/// 尿激酶选项
		/// </summary>
		protected void rblUrokinase_SelectedIndexChanged(object sender, EventArgs e)
		{
			this.niaoJiMei.Checked = true;
			niaoJiMei_CheckedChanged(null, null);

			this.ruiTiPuMei.Checked = false;
			this.aiTiPuMei.Checked = false;
		}

		/// <summary>
		/// 进入打印页面
		/// </summary>
		protected void btnEnterPrint_Click(object sender, EventArgs e)
		{
			string htmlstring = string.Empty;
			htmlstring = "MessageInputDetail.aspx?IsLocked=true";
			htmlstring = htmlstring + "&ReportID=" + reportID;

			this.Response.Write(BaseSystem.ShowWindow("您确定要进入打印页面吗？", htmlstring));
		}
	}
}