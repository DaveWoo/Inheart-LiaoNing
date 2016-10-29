using System;
using System.Collections.Generic;
using System.Data;
using System.Web.UI;
using System.Web.UI.WebControls;
using DreamWork.BussinessLogic;
using System.Drawing;

namespace CoronaryHeartDiseaseProject
{
    public partial class ReportingManage : System.Web.UI.Page
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
        private Dictionary<string, string> HeaderList = new Dictionary<string, string>();
        private Dictionary<string, string> fieldList = new Dictionary<string, string>();
        private static object dataSource;
        private static GridView m_GridView;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
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
                    user = new SiteUser();
                    user.UserName = "管理员4";
                    user.ID = 19;
                    //user = (SiteUser)Session["admin"];
                    //this.btnAddMedical.Visible = false;
                }
                GridView1.ForeColor = System.Drawing.ColorTranslator.FromHtml("#333333");

                GridView1.PagerSettings.Mode = PagerButtons.Numeric;
                GridView1.PagerSettings.Position = PagerPosition.Bottom;
                GridView1.PagerSettings.PageButtonCount = 10;

                GridView1.PagerStyle.BackColor = Color.LightBlue;

                GridView1.AlternatingRowStyle.BackColor = Color.White;
                GridView1.AlternatingRowStyle.ForeColor = System.Drawing.ColorTranslator.FromHtml("#284775");

                GridView1.EditRowStyle.BackColor = System.Drawing.ColorTranslator.FromHtml("#999999");

                GridView1.HeaderStyle.BackColor = System.Drawing.ColorTranslator.FromHtml("#5D7B9D");
                GridView1.HeaderStyle.Font.Bold = true;
                GridView1.HeaderStyle.ForeColor = Color.White;

                GridView1.PagerStyle.BackColor = System.Drawing.ColorTranslator.FromHtml("#284775");
                GridView1.PagerStyle.ForeColor = Color.White;

                GridView1.RowStyle.BackColor = System.Drawing.ColorTranslator.FromHtml("#F7F6F3");
                GridView1.RowStyle.ForeColor = System.Drawing.ColorTranslator.FromHtml("#333333");

                GridView1.SelectedRowStyle.BackColor = System.Drawing.ColorTranslator.FromHtml("#E2DED6");
                GridView1.SelectedRowStyle.Font.Bold = true;
                GridView1.SelectedRowStyle.ForeColor = System.Drawing.ColorTranslator.FromHtml("#333333");
                GridView1.CellPadding = 5;

                Report.BindingData(this.GridView1, user, ref m_GridView);

                // BindingData();
                dataSource = this.GridView1.DataSource;
            }
        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
        }

        protected void ImportExcel_Click(object sender, EventArgs e)
        {
            GridViewExportUtil.Export("Coronary HeartDisease Platform" + DateTime.Now, m_GridView);
        }

        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.DataSource = dataSource;
            GridView1.PageIndex = e.NewPageIndex;
            GridView1.DataBind();
        }

        protected void GridView1_Sorting(object sender, GridViewSortEventArgs e)
        {
            DataTable dataTable = GridView1.DataSource as DataTable;

            if (dataTable != null)
            {
                DataView dataView = new DataView(dataTable);
                dataView.Sort = e.SortExpression + " " + ConvertSortDirectionToSql(e.SortDirection);

                GridView1.DataSource = dataView;
                GridView1.DataBind();
            }
        }

        private string ConvertSortDirectionToSql(SortDirection sortDirection)
        {
            string newSortDirection = String.Empty;

            switch (sortDirection)
            {
                case SortDirection.Ascending:
                    newSortDirection = "ASC";
                    break;

                case SortDirection.Descending:
                    newSortDirection = "DESC";
                    break;
            }

            return newSortDirection;
        }

        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Header)
            {
                // GridView1.Attributes.Add("style", "word-break:break-all;word-wrap:break-word");
            }
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                //   GridView1.Attributes.Add("style", "word-break:keep-all;word-wrap:normal");
            }
        }
    }
}