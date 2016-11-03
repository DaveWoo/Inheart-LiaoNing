namespace CoronaryHeartDiseaseProject
{
	using System;
	using System.Web.UI;
	using System.Web.UI.WebControls;

	public class MyTemplate : ITemplate
	{
		private Control control;

		public MyTemplate(Control control)
		{
			this.control = control;
		}

		#region ITemplate Members

		public void InstantiateIn(Control container)
		{
			container.Controls.Add(this.control);
		}

		#endregion ITemplate Members
	}

	public class GridViewTemplate : ITemplate
	{
		private DataControlRowType templateType;
		private string columnName;
		private string dataField;
		private Control control;
		private Control container;

		public GridViewTemplate(DataControlRowType type, string colname, string dataField, Control control)
		{
			this.templateType = type;
			this.columnName = colname;
			this.dataField = dataField;
			this.control = control;
		}

		public void InstantiateIn(System.Web.UI.Control container)
		{
			this.container = container;
			// Create the content for the different row types.
			switch (templateType)
			{
				case DataControlRowType.Header:
					// Create the controls to put in the header
					// section and set their properties.
					Label lc = new Label();
					lc.Text = "<b>" + columnName + "</b>";

					// Add the controls to the Controls collection
					// of the container.
					container.Controls.Add(lc);
					if (this.control != null)
					{
						container.Controls.Add(control);
					}
					break;

				case DataControlRowType.DataRow:
					// Create the controls to put in a data row
					// section and set their properties.
					Label firstName = new Label();
					// To support data binding, register the event-handling methods
					// to perform the data binding. Each control needs its own event
					// handler.
					container.Controls.Add(firstName);
					firstName.DataBinding += new EventHandler(this.FirstName_DataBinding);

					break;

				// Insert cases to create the content for the other
				// row types, if desired.

				default:
					// Insert code to handle unexpected values.
					break;
			}
		}

		private void FirstName_DataBinding(Object sender, EventArgs e)
		{
			if (string.IsNullOrWhiteSpace(dataField))
			{
				return;
			}
			// Get the Label control to bind the value. The Label control
			// is contained in the object that raised the DataBinding
			// event (the sender parameter).
			Label l = (Label)sender;

			// Get the GridViewRow object that contains the Label control.
			GridViewRow row = (GridViewRow)l.NamingContainer;

			// Get the field value from the GridViewRow object and
			// assign it to the Text property of the Label control.
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