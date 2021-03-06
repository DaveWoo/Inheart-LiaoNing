﻿namespace CoronaryHeartDiseaseProject.Admin.SuperManage
{
	using System;
	using System.Web.UI;
	using DreamWork.BussinessLogic;
	using DreamWork.ObjectModel;

	/// <summary>
	/// 医院修改类
	/// </summary>
	public partial class ModifyHospital : System.Web.UI.Page
	{
		public string MenuListCheckBox;
		private uint hospitalID = 0;
		public string hospitalNameOriginal = string.Empty;
		public string comment = string.Empty;

		/// <summary>
		/// 页面加载
		/// </summary>
		protected void Page_Load(object sender, EventArgs e)
		{
			if (!Page.IsPostBack)
			{
				this.GetHospitalName();
			}
		}

		/// <summary>
		/// 获得医院名称
		/// </summary>
		private void GetHospitalName()
		{
			string id = this.Request.QueryString["ID"];

			if (!string.IsNullOrEmpty(id))
			{
				bool isSucess = uint.TryParse(id, out hospitalID);
			}

			Hospital hos = SiteManagement.GetHospital(this.hospitalID);
			if (hos != null)
			{
				hospitalNameOriginal = hos.HospitalName;
				comment = hos.Description;
			}
		}

		/// <summary>
		/// 医院信息修改
		/// </summary>
		protected void Submit1_ServerClick(object sender, EventArgs e)
		{
			this.GetHospitalName();

			string hospitalname = Request.Form["hospitalname"].Trim();
			string comment = Request.Form["comment"].Trim();

			if (string.IsNullOrEmpty(hospitalname))
			{
				this.Response.Write(BaseSystem.ShowWindow("医院名称不能为空！！"));
			}

			if (string.IsNullOrEmpty(comment))
			{
				this.Response.Write(BaseSystem.ShowWindow("注释不能为空！！"));
			}
			if (hospitalNameOriginal.Equals(hospitalname))
			{
				this.Response.Write(BaseSystem.ShowWindow("请换一个名字，当前的医院名称已经存在！！"));
				return;
			}

			string id = this.Request.QueryString["ID"];
			if (!string.IsNullOrEmpty(id))
			{
				bool isSucess = uint.TryParse(id, out hospitalID);
			}

			// 修改医院具体信息
			string message = string.Empty;
			bool isSuccess = SiteManagement.UpdateHospital(hospitalID, hospitalname, comment, out message);

			if (!isSuccess)
			{
				if (!string.IsNullOrEmpty(message))
				{
					this.Response.Write(BaseSystem.ShowWindow(message));
				}
			}
			else
			{
				this.Response.Write(BaseSystem.ShowWindow("医院修改成功！！"));
				this.Response.Redirect("AdminManageHospital.aspx");
			}
		}
	}
}