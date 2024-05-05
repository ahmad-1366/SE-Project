using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class D2_ViewActivityList : System.Web.UI.Page
{
    private List<ActivityData> list;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            int request_id = SessionState.getActiveRequestid();
            list = ActivityData.getUserActivityList(request_id);
            loadProcessingMetrics(list);
            loadActivityList(list);
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
    private void loadActivityList(List<ActivityData> list)
    {
        int serialNumber = 1;
        ActivityList.DataSource = list.Select(obj => new
        {
            Number = serialNumber++,
            Description = obj.getDescription(),
            Date = obj.getActivityDate(),
            Time = obj.getActivityTime()
        }).ToList();
        ActivityList.DataBind();
    }
    private void setMetric(Label date, Label time, DateTime? datetime, string st)
    {
        if (datetime == null) return;
        DateTime data = (DateTime)datetime;
        date.Text = st + " Date: " + data.ToString("yyyy-MM-dd");
        time.Text = st + " Time: " + data.ToString("hh:mm tt");
    }
    private void initializeMetricsSection(List<List<DateTime?>> metrics)
    {
        setMetric(waitStartDate, waitStartTime, metrics[0][0], "Start");
        setMetric(waitEndDate, waitEndTime, metrics[0][1], "End");

        setMetric(fypStartDate, fypStartTime, metrics[1][0], "Start");
        setMetric(fypEndDate, fypEndTime, metrics[1][1], "End");

        setMetric(finStartDate, finStartTime, metrics[2][0], "Start");
        setMetric(finEndDate, finEndTime, metrics[2][1], "End");

        setMetric(totStartDate, totStartTime, metrics[3][0], "Start");
        setMetric(totEndDate, totEndTime, metrics[3][1], "End");
    }
}