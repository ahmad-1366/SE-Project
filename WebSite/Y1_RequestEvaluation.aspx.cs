using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection;
using System.Security.Policy;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Y1_RequestEvaluation : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
            refreshRequestsList();
    }
    private void refreshRequestsList()
    {
        List<RequestData> list = RequestData.getFYPRequestsList();
        Session["requestlist"] = list;
        loadRequestsList(list);
    }
    private void loadRequestsList(List<RequestData> list)
    {
        RequestsList.DataSource = list.Select(obj => new
        {
            StudentName = obj.getUsername(),
            RollNumber = obj.getRollNumber(),
            Evaluation = obj.getActivityStatus()
        }).ToList();
        RequestsList.DataBind();
    }
    protected void RequestsList_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "SelectRow")
        {
            ErrorMessage.CssClass = "hideerror eval";
            int index = Convert.ToInt32(e.CommandArgument.ToString());
            RequestsList.SelectedIndex = index;
            messagesHandler("reset");
            loadStudentSummary();
        }
    }
    private void messagesHandler(string type)
    {
        if (type == "reset")
        {
            ErrorMessage.CssClass = "hideerror eval";
            SuccessMessage.Visible = false;
            ErrorMessage.Visible = true;
        }
        else if (type == "fail")
        {
            ErrorMessage.CssClass = "showerror";
            SuccessMessage.Visible = false;
            ErrorMessage.Visible = true;
        }
        else if (type == "success")
        {
            ErrorMessage.CssClass = "hideerror eval";
            SuccessMessage.Visible = true;
            ErrorMessage.Visible = false;
        }
    }
    private void loadStudentSummary()
    {
        int index = RequestsList.SelectedIndex;
        List<RequestData> list = (List<RequestData>)Session["requestlist"];
        RequestData request = list[index];
        StudentNameLabel.Text = "Student Name: " + request.getUsername();
        RollNumberLabel.Text = "Roll Number: " + request.getRollNumber();
    }
    private bool validateEvalution()
    {
        if (RequestsList.SelectedIndex == -1)
        {
            messagesHandler("fail");
            return false;
        }
        else
        {
            List<RequestData> list = (List<RequestData>)Session["requestlist"];
            int selected = RequestsList.SelectedIndex;
            int request_id = list[selected].getRequestId();
            SessionState.setActiveRequestid(request_id);
            messagesHandler("reset");
            return true;
        }
    }
    private bool validateStatusUpdate(int requestid)
    {
        return ActivityData.validateStatusUpdate(requestid, "FYP Staff");
    }
    private void raiseObjection(string objection)
    {
        int index = RequestsList.SelectedIndex;
        List<RequestData> list = (List<RequestData>)Session["requestlist"];
        RequestData request = list[index];
        ActivityData.insertObjection(request.getRequestId(), objection, "FYP Staff");
        Notification.insertNotification(request.getUserId(), "FYP Department Objected your Request");
    }
    private bool updateStatus(string newstatus)
    {
        if (validateEvalution())
        {
            int index = RequestsList.SelectedIndex;
            List<RequestData> list = (List<RequestData>)Session["requestlist"];
            RequestData request = list[index];
            if (validateStatusUpdate(request.getRequestId()))
            {
                ActivityData.updateActivityStatus(request.getRequestId(), "FYP Staff", newstatus);
                Notification.insertNotification(request.getUserId(), newstatus + " By FYP Department");
                setSuccessfulUpdation();
                return true;
            }
        } return false;
    }
    private void setSuccessfulUpdation()
    {
        StudentNameLabel.Text = "Student Name: ";
        RollNumberLabel.Text = "Roll Number: ";
        messagesHandler("success");
        refreshRequestsList();
    }
    protected void RejectButton_Click(object sender, EventArgs e)
    {
        updateStatus("Request Rejected");
    }
    protected void ApproveButton_Click(object sender, EventArgs e)
    {
        updateStatus("Request Approved");
    }
    protected void ObjectButton_Click(object sender, EventArgs e)
    {
        if(updateStatus("Objection Raised"))
            raiseObjection(CommentTextBox.Text);
    }
}