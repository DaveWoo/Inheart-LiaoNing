namespace CoronaryHeartDiseaseProject
{
	using System;
	using System.Web.UI;
	using System.Web.UI.WebControls;

	/// <summary>
	/// 表格模板类
	/// </summary>
	public class GridViewTemplate : ITemplate
	{
		#region 私有变量

		private DataControlRowType templateType;
		private string columnName;
		private string dataField;
		private Control control;
		private Control container;

		#endregion 私有变量

		/// <summary>
		/// 表格模板类的初始化器
		/// </summary>
		public GridViewTemplate(DataControlRowType type, string colname, string dataField, Control control)
		{
			this.templateType = type;
			this.columnName = colname;
			this.dataField = dataField;
			this.control = control;
		}

		/// <summary>
		/// 定义使用子控件填充模板化ASP.NET服务器控件的行为。子控件表示在页面上定义的内联模板。
		/// </summary>
		/// <param name="container"></param>
		public void InstantiateIn(System.Web.UI.Control container)
		{
			this.container = container;
			// 为不同的行类型创建内容。
			switch (templateType)
			{
				case DataControlRowType.Header:
					// 为不同的行类型创建内容。并设置其属性。
					Label lc = new Label();
					lc.Text = "<b>" + columnName + "</b>";

					// 将控件添加到容器的Controls集合。
					container.Controls.Add(lc);
					if (this.control != null)
					{
						container.Controls.Add(control);
					}
					break;

				case DataControlRowType.DataRow:
					// 创建要放入数据行部分的控件并设置其属性。
					Label firstName = new Label();
					// 要支持数据绑定，请注册事件处理方法以执行数据绑定。 每个控件都需要自己的事件处理程序。
					container.Controls.Add(firstName);
					firstName.DataBinding += new EventHandler(this.FirstName_DataBinding);

					break;

				// 如果需要，可以插入大小写以创建其他行类型的内容。
				default:
					// 插入代码以处理意外的值。
					break;
			}
		}

		private void FirstName_DataBinding(Object sender, EventArgs e)
		{
			if (string.IsNullOrWhiteSpace(dataField))
			{
				return;
			}
			// 获取Label控件以绑定值。 Label控件包含在引发DataBinding事件的对象（sender参数）中。
			Label l = (Label)sender;

			// Get the GridViewRow object that contains the Label control.
			GridViewRow row = (GridViewRow)l.NamingContainer;

			// 获取包含Label控件的GridViewRow对象。
			if (DataBinder.Eval(row.DataItem, dataField) == null)
			{
				l.Text = string.Empty;
			}
			else
			{
				l.Text = DataBinder.Eval(row.DataItem, dataField).ToString();

				if (l.Text.ToUpper() == "TRUE")
				{
					l.Text = "是";
				}
				if (l.Text.ToUpper() == "FALSE")
				{
					l.Text = "否";
				}
			}
		}
	}
}