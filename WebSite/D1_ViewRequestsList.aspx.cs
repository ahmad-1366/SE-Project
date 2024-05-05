using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Policy;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class D1_ViewRequestsList : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            List<RequestData> list = RequestData.getUserRequestsList();
            Session["requestlist"] = list;
            loadDatesDropdown(list);
            loadRequestsList(list);
        }
    }
    private void loadRequestsList(List<RequestData> list)
    {
        RequestsList.DataSource = list.Select(obj => new
        {
            StudentName = obj.getUsername(),
            RollNumber = obj.getRollNumber(),
            SubmitDate = obj.getSubmitDate(),
            Status = obj.getStatus()
        }).ToList();
        RequestsList.DataBind();
    }
    private void loadDatesDropdown(List<RequestData> list)
    {
        DateDropDown.Items.Clear();
        List<string> validDates = new List<string> { "-" };
        foreach (RequestData request in list)
        {
            if (!validDates.Contains(request.getSubmitDate()))
                validDates.Add(request.getSubmitDate());
        }
        DateDropDown.DataSource = validDates;
        DateDropDown.DataBind();
    }
    public void Status_SelectedIndexChanged(object sender, EventArgs e)
    {
        string selectedStatus = StatusDropDown.SelectedValue;
        string selectedDate = DateDropDown.SelectedValue;
        List<RequestData> list = RequestData.getFilteredUserRequests(selectedStatus, selectedDate);
        Session["requestlist"] = list;
        loadRequestsList(list);
    }

    protected void RequestsList_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "SelectRow")
        {
            ErrorMessage.CssClass = "hideerror";
            int index = Convert.ToInt32(e.CommandArgument.ToString());
            RequestsList.SelectedIndex = index;
        }
    }

    protected void ActivityButton_Click(object sender, EventArgs e)
    {
        if (RequestsList.SelectedIndex == -1)
            ErrorMessage.CssClass = "showerror";
        else
        {
            List<RequestData> list = (List<RequestData>)Session["requestlist"];
            int selected = RequestsList.SelectedIndex;
            int request_id = list[selected].getRequestId();
            SessionState.setActiveRequestid(request_id);
            ErrorMessage.CssClass = "hideerror";
            Response.Redirect("D2_ViewActivityList.aspx");
        }
    }
}