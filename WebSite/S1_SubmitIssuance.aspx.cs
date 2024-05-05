using System;
using System.Collections;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.DynamicData;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class S1_SubmitIssuance : Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (submissionAllowed(SessionState.getActiveUserid()))
                loadDepartmentsList();
            else clearFormInputArea();
        }
    }
    private void clearFormInputArea()
    {
        issuanceform.Visible = false;
        errorHandler("overwrite");
    }
    private void setSuccessfulUpdation()
    {
        ddlDocType.SelectedIndex = -1;
        ddlDepartment.SelectedIndex = -1;
        txtEmail.Text = "";
        txtPhone.Text = "";
        txtStartYear.Text = "";
        txtEndYear.Text = "";
        errorHandler("success");
        Response.Redirect("~/S7_MakePayment.aspx");
    }
    private void errorHandler(string type)
    {
        if(type == "overwrite")
            FormErrorMessage.Visible = true;
        else if(type == "invalidform")
            ErrorMessage.CssClass = "showerror";
        else
        {
            ErrorMessage.CssClass = "hideerror eval";
            SuccessMessage.Visible = true;
            ErrorMessage.Visible = false;
        }
    }
    private bool submissionAllowed(int userid)
    {
        string query = "SELECT * FROM REQUEST WHERE user_id = " + userid;
        SqlDataReader reader = Database.getTable(query);
        if (reader.HasRows) return false;
        return true;
    }
    private bool validateFormState()
    {
        return txtPhone.Text != "" && txtEmail.Text != "" && ddlDocType.SelectedIndex > 0 &&
            ddlDepartment.SelectedIndex > 0 && txtStartYear.Text != "" && txtEndYear.Text != "";
    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        if (submissionAllowed(SessionState.getActiveUserid()))
        {
            if (validateFormState())
            {
                insertintoForm();
                insertintoRequest();

                insertintoBill();
                insertintoActivity();

                setSuccessfulUpdation();
            }
            else errorHandler("invalidform");
        }
        else clearFormInputArea();
    }
    private void insertintoForm()
    {
        string query = "INSERT INTO ISSUANCEFORM (phone, email, doc_type, start_year, end_year) " +
                        "VALUES (@phone, @email, @doc_type, @start_year, @end_year)";
        SqlCommand cmd = new SqlCommand(query);
        cmd.Parameters.AddWithValue("@phone", txtPhone.Text);
        cmd.Parameters.AddWithValue("@email", txtEmail.Text);
        cmd.Parameters.AddWithValue("@doc_type", ddlDocType.SelectedValue);
        cmd.Parameters.AddWithValue("@start_year", txtStartYear.Text);
        cmd.Parameters.AddWithValue("@end_year", txtEndYear.Text);
        Database.executeNonQuery(cmd);
    }
    private int getActiveFormId()
    {
        string query = "SELECT MAX(form_id) as activeform FROM ISSUANCEFORM";
        SqlDataReader reader = Database.getTable(query);
        if (reader.Read())
            return reader.GetInt32(reader.GetOrdinal("activeform"));
        return -1;
    }
    private int getActiveRequestId()
    {
        string query = "SELECT MAX(request_id) as activereq FROM REQUEST";
        SqlDataReader reader = Database.getTable(query);
        if (reader.Read())
            return reader.GetInt32(reader.GetOrdinal("activereq"));
        return -1;
    }
    private void insertintoRequest()
    {
        int formIdValue = getActiveFormId();
        int userIdValue = SessionState.getActiveUserid();
        string queryString = "INSERT INTO Request ([user_id], [form_id], [status]) VALUES (@user_id, @form_id, @status);";
        SqlCommand command = new SqlCommand(queryString);
        command.Parameters.AddWithValue("@user_id", userIdValue); 
        command.Parameters.AddWithValue("@form_id", formIdValue);
        command.Parameters.AddWithValue("@status", "Pending");
        Database.executeNonQuery(command);

        SessionState.setActiveRequestid(getActiveRequestId());
    }
    private void insertintoBill()
    {
        int request_id = SessionState.getActiveRequestid();
        string query = "insert into bill (request_id, amount, status) values (" +
            request_id + ", " + 1000 + ",'Not Paid')";
        Database.updateValue(query);
    }
    private void insertintoActivity()
    {
        int user_id = SessionState.getActiveUserid();
        int request_id = SessionState.getActiveRequestid();
        ActivityData.updateActivityStatus(request_id, "Student", "New Issuance Request Submission");
        //Notification.insertNotification("Admin", "New Issuance Request Recieved"); // Converted to Trigger
        Notification.insertNotification(user_id, "Your Issuance Request has been recieved");
    }
    private void loadDepartmentsList()
    {
        List<Department> list = Department.GetDepartmentsList();
        ddlDepartment.DataSource = list.Select(item => item.getDeptName());
        ddlDepartment.DataBind();
        ddlDepartment.Items.Insert(0, "-");
    }
}
