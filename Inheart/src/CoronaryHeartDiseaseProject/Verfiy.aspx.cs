namespace CoronaryHeartDiseaseProject
{
	using System;

	/// <summary>
	/// 验证码生成类
	/// </summary>
	public partial class Verfiy : System.Web.UI.Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{
			// 当页面刷新时生成验证码图片
			BaseSystem.DrawImage();
		}
	}
}