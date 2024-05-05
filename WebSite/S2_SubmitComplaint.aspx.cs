using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class S2_SubmitComplaint : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        if (validFormState())
            submitComplaintForm();
        else
        {
			messagesHandler("fail");
        }

    }
	private void setSuccessfulUpdation()
	{
		ddlDocType.SelectedIndex = -1;
		CommentTextBox.Text = "";
		messagesHandler("success");
	}
	private void messagesHandler(string type)
	{
		if (type == "fail")
		{
			CommentTextBox.Text = "";
			ErrorMessage.CssClass = "showerror";
			SuccessMessage.Visible = false;
			ErrorMessage.Visible = true;
		}
		else if (type == "success")
		{
			CommentTextBox.Text = "";
			ErrorMessage.CssClass = "hideerror eval";
			SuccessMessage.Visible = true;
			ErrorMessage.Visible = false;
		}
	}
	private bool validFormState()
    {
		return ddlDocType.SelectedIndex > 0 && CommentTextBox.Text != "";
	}

	private void submitComplaintForm()
    {
		string description = CommentTextBox.Text;
		string docType = ddlDocType.SelectedValue;

		string query = "INSERT INTO COMPLAINT (user_id, description, doc_type) VALUES (" +
			SessionState.getActiveUserid() + ", '" + description + "', '" + docType + "');";
        Notification.insertNotification("Admin", "New Complaint Recieved");
        Database.updateValue(query);
		setSuccessfulUpdation();
	}
}
