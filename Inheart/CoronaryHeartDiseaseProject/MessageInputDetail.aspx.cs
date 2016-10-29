using System;
using System.Linq;
using System.Web.UI;
using System.Web.UI.WebControls;
using DreamWork.BussinessLogic;
using DreamWork.ObjectModel;

namespace CoronaryHeartDiseaseProject
{
    public partial class MessageDetail : System.Web.UI.Page
    {
        public static Person currentPerson;

        private MedicalReportBLO medicalReportBLO = new MedicalReportBLO();

        protected void BirthChanged(object sender, EventArgs e)
        {
        }

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
                    //reportSummation = new Report_Summation();
                    //this.EnableExpendContent(false);
                }
                SetControlVisible1();
            }
        }

        protected void txbBirthDay_TextChanged(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(txbBirthDay.Text))
            {
                this.txtAge.Text = (DateTime.Now.Year - Convert.ToDateTime(txbBirthDay.Text).Year).ToString();
            }
        }

        protected void ddlMonth_SelectedIndexChanged(object sender, EventArgs e)
        {
            #region Birthday

            //this.BindDateForDays(ddlYear, ddlMonth, ddlday);

            if (!string.IsNullOrEmpty(txbBirthDay.Text))
            {
                this.txtAge.Text = (DateTime.Now.Year - Convert.ToInt32(txbBirthDay.Text)).ToString();
            }

            #endregion Birthday
        }

        protected void ddlMonthVisit_SelectedIndexChanged(object sender, EventArgs e)
        {
            #region Visit date

            //this.BindDateForDays(ddlYearVisit, ddlMonthVisit, ddlDayVisit);

            //if (!string.IsNullOrEmpty(ddlYear.SelectedValue))
            //{
            //    this.ddlYearFirstImage.Text = ddlYear.SelectedValue;
            //    this.ddlYearFirstGetBloodTime.Text = ddlYear.SelectedValue;
            //    this.ddlYearFisrtBackTime.Text = ddlYear.SelectedValue;
            //}
            //if (!string.IsNullOrEmpty(ddlMonth.SelectedValue))
            //{
            //    this.ddlMonthFirstImage.Text = ddlMonth.SelectedValue;
            //    this.ddlMonthFirstGetBloodTime.Text = ddlMonth.SelectedValue;
            //    this.ddlMonthFirstBackTime.Text = ddlMonth.SelectedValue;
            //}

            #endregion Visit date
        }
    }
}