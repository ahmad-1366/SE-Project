using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Policy;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class RequestManagement : System.Web.UI.Page
{
    private List<RequestData> list;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
            refreshRequestsList();
    }
    private void refreshRequestsList()
    {
        list = RequestData.getUserRequestsList();
        Session["requestlist"] = list;
        loadRequestsList(list);
    }
    private void loadRequestsList(List<RequestData> list)
    {
        RequestsList.DataSource = list.Select(obj => new
        {
            StudentName = obj.getUsername(),
            SubmitDate = obj.getSubmitDate(),
            Status = obj.getStatus()
        }).ToList();
        RequestsList.DataBind();
    }
    public void Status_SelectedIndexChanged(object sender, EventArgs e)
    {
        string selectedStatus = StatusDropDown.SelectedValue;
        list = RequestData.getFilteredUserRequests(selectedStatus);
        Session["requestlist"] = list;
        loadRequestsList(list);
    }
    protected void RequestsList_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "SelectRow")
        {
            int index = Convert.ToInt32(e.CommandArgument.ToString());
            RequestsList.SelectedIndex = index;
            List<RequestData> requestlist = (List<RequestData>) Session["requestlist"];
            int request_id = requestlist[index].getRequestId();
            SessionState.setActiveRequestid(request_id);
            List<ActivityData> reqlist = ActivityData.getUserActivityList(request_id);
            loadProcessingMetrics(reqlist);
            messagesHandler("reset");
            loadStudentSummary();
        }
    }
    private void loadProcessingMetrics(List<ActivityData> list)
    {
        List<List<DateTime?>> metrics = new List<List<DateTime?>>{
            ActivityData.getStartEndByDept(list, "initial"),
            ActivityData.getStartEndByDept(list, "Finance Staff"),
            ActivityData.getStartEndByDept(list, "FYP Staff"),
            ActivityData.getStartEndByDept(list, "overall")
        };
        initializeMetricsSection(metrics);
    }
    private void setMetricStatus(Label status, List<DateTime?> metrics)
    {
        if (metrics[0] != null && metrics[1] != null)
        {
            status.CssClass = "metric-status success";
            status.Text = "Complete";
        }
    }
    private void setMetric(Label date, DateTime? datetime, string st)
    {
        if (datetime == null) return;
        DateTime data = (DateTime)datetime;
        date.Text = st + " Date: " + data.ToString("yyyy-MM-dd");
    }
    private void initializeMetricsSection(List<List<DateTime?>> metrics)
    {
        setMetric(waitStartDate, metrics[0][0], "Start");
        setMetric(waitEndDate, metrics[0][1], "End");
        setMetricStatus(waitStatus, metrics[0]);

        setMetric(fypStartDate, metrics[1][0], "Start");
        setMetric(fypEndDate, metrics[1][1], "End");
        setMetricStatus(fypStatus, metrics[1]);

        setMetric(finStartDate, metrics[2][0], "Start");
        setMetric(finEndDate, metrics[2][1], "End");
        setMetricStatus(finStatus, metrics[2]);

        setMetric(totStartDate, metrics[3][0], "Start");
        setMetric(totEndDate, metrics[3][1], "End");
        setMetricStatus(totStatus, metrics[3]);
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
            Err.Text = "Please Select a Request";
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
        else if(type == "status start")
        {
            Err.Text = "Request is Already Being Processed";
            ErrorMessage.CssClass = "showerror";
            SuccessMessage.Visible = false;
            ErrorMessage.Visible = true;
        }
        else if (type == "status final")
        {
            Err.Text = "Request has not Begun Processing";
            ErrorMessage.CssClass = "showerror";
            SuccessMessage.Visible = false;
            ErrorMessage.Visible = true;
        }
        else if (type == "cant end")
        {
            Err.Text = "Request not Approved By All Departments";
            ErrorMessage.CssClass = "showerror";
            SuccessMessage.Visible = false;
            ErrorMessage.Visible = true;
        }
    }
    private void loadStudentSummary()
    {
        int index = RequestsList.SelectedIndex;
        List<RequestData> list = (List<RequestData>)Session["requestlist"];
        RequestData request = list[index];
        StudentNameLabel.Text = "Student Name: " + request.getUsername();
        RollNumberLabel.Text = "Roll Number: " + request.getRollNumber();
        StatusLabel.Text = "Request Status: " + request.getStatus();
    }
    private void updateStatus(RequestData request, string newstatus)
    {
        if (RequestsList.SelectedIndex > -1)
        {
            request.updateRequestStatus(newstatus);
            setSuccessfulUpdation();
        }
        else messagesHandler("fail");
    }
    private void setSuccessfulUpdation()
    {
        RequestsList.SelectedIndex = -1;
        StudentNameLabel.Text = "Student Name: ";
        RollNumberLabel.Text = "Roll Number: ";
        StatusLabel.Text = "Request Status: ";
        messagesHandler("success");
        refreshRequestsList();
    }
    private bool validateSelection()
    {
        return RequestsList.SelectedIndex != -1;
    }
    protected void BeginButton_Click(object sender, EventArgs e)
    {
        if (!validateSelection())
        {
            messagesHandler("fail");
            return;
        }
        else
        {
            int index = RequestsList.SelectedIndex;
            List<RequestData> list = (List<RequestData>)Session["requestlist"];
            RequestData request = list[index];
            if (request.getStatus() == "Pending")
            {
                updateStatus(request,"Processing");
                Notification.insertNotification(request.getUserId(), "Admin has begun processing your request");
                ActivityData.updateActivityStatus(SessionState.getActiveRequestid(), "Admin", "Processing Started");
                ActivityData.updateActivityStatus(SessionState.getActiveRequestid(), "Finance Staff", "Processing Started");
                ActivityData.updateActivityStatus(SessionState.getActiveRequestid(), "FYP Staff", "Processing Started");
                Notification.insertNotification("Dept", "New Degree Issuance Request Recieved");
            }
            else messagesHandler("status start");
        }
    }
    private bool finalizableRequest()
    {
        return fypStatus.Text == "Complete" && finStatus.Text == "Complete";
    }
    protected void FinalizeButton_Click(object sender, EventArgs e)
    {
        if (!validateSelection())
        {
            messagesHandler("fail");
            return;
        }
        else
        {
            int index = RequestsList.SelectedIndex;
            List<RequestData> list = (List<RequestData>)Session["requestlist"];
            RequestData request = list[index];
            if (request.getStatus() == "Processing")
                if (finalizableRequest())
                {
                    updateStatus(request, "Processed");
                    ActivityData.updateActivityStatus(SessionState.getActiveRequestid(), "Admin", "Request Finalized");
                    Notification.insertNotification(request.getUserId(), "Your Request has been Finalized");
                }
                else messagesHandler("cant end");
            else messagesHandler("status final");
        }
    }
}