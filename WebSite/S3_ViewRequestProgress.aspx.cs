using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class S3_ViewRequestProgress : System.Web.UI.Page
{
    private List<ActivityData> list;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            int user_id = SessionState.getActiveUserid();
            list = ActivityData.getStudentActivityList(user_id);
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
    private void setMetricStatus(Label status, List<DateTime?> metrics)
    {
        if (metrics[0] != null && metrics[1] != null)
        {
            status.CssClass = "metric-status success";
            status.Text = "Complete";
        }
    }

    private void setMetric(Label date, Label time, DateTime? datetime, string st)
    {
        if (datetime == null) return;
        DateTime data = (DateTime)datetime;
        date.Text = st + " Date: " + data.ToString("yyyy-MM-dd");
//        time.Text = st + " Time: " + data.ToString("hh:mm tt");
    }
    private void initializeMetricsSection(List<List<DateTime?>> metrics)
    {
        setMetric(waitStartDate, waitStartTime, metrics[0][0], "Start");
        setMetric(waitEndDate, waitEndTime, metrics[0][1], "End");
        setMetricStatus(waitStatus, metrics[0]);

        setMetric(fypStartDate, fypStartTime, metrics[1][0], "Start");
        setMetric(fypEndDate, fypEndTime, metrics[1][1], "End");
        setMetricStatus(fypStatus, metrics[1]);

        setMetric(finStartDate, finStartTime, metrics[2][0], "Start");
        setMetric(finEndDate, finEndTime, metrics[2][1], "End");
        setMetricStatus(finStatus, metrics[2]);

        setMetric(totStartDate, totStartTime, metrics[3][0], "Start");
        setMetric(totEndDate, totEndTime, metrics[3][1], "End");
        setMetricStatus(totStatus, metrics[3]);
    }
}