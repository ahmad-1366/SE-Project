using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Net;
using System.Security.Cryptography;
using System.Security.Policy;
using System.Web;

/// <summary>
/// Summary description for ActivityData
/// </summary>
public class ActivityData
{
    private int activity_id { set; get; }
    private string description { set; get; }
    private DateTime timestamp { set; get; }
    private string department { set; get; }


    public string getDescription()
    {
        return description + " By " + department;
    }
    public string getActivityDate()
    {
        return timestamp.ToString("yyyy-MM-dd");
    }
    public string getActivityTime()
    {
        return timestamp.ToString("h:mm tt");
    }
    public DateTime getDateTime()
    {
        return timestamp;
    }
    public ActivityData()
    {
    }
    public ActivityData(SqlDataReader reader)
    {
        try { activity_id = reader.GetInt32(reader.GetOrdinal("request_id")); } catch { }
        try { description = reader.GetString(reader.GetOrdinal("description")); } catch { }
        try { department = reader.GetString(reader.GetOrdinal("department")); } catch { }
        try { timestamp = reader.GetDateTime(reader.GetOrdinal("timestamp")); } catch { }
    }
    public static List<ActivityData> getUserActivityList(int request_id)
    {
        List<ActivityData> list = new List<ActivityData>();
        string query = "SELECT * FROM ACTIVITY WHERE request_id = " + request_id;
        SqlDataReader reader = Database.getTable(query);
        while (reader.Read())
            list.Add(new ActivityData(reader));
        return list;
    }
    public static List<ActivityData> getStudentActivityList(int student_id)
    {
        List<ActivityData> list = new List<ActivityData>();
        string query = "SELECT * FROM ACTIVITY INNER JOIN REQUEST ON ACTIVITY.request_id = REQUEST.request_id WHERE user_id = " + student_id;
        SqlDataReader reader = Database.getTable(query);
        while (reader.Read())
            list.Add(new ActivityData(reader));
        return list;
    }
    public static bool validateStatusUpdate(int requestid, string department)
    {
        string query = "SELECT * FROM ACTIVITY WHERE department = '" + department + "' AND request_id = " + requestid;
        SqlDataReader reader = Database.getTable(query);
        while (reader.Read())
        {
            ActivityData data = new ActivityData(reader);
            if (data.description == "Request Approved" || data.description == "Request Rejected")
                return false;
        }
        return true;
    }
    public static void updateActivityStatus(int requestid, string department, string status)
    {
        string query = "INSERT INTO ACTIVITY (request_id, description, department) VALUES (" +
            requestid + ",'" + status + "','" + department + "');";
        Database.updateValue(query);

    }
    public static void insertObjection(int requestid, string objection, string cmt_from)
    {
        string query = "INSERT INTO COMMENT (request_id, description, cmt_from) VALUES (" +
            requestid + ",'" + objection + "','" + cmt_from + "');";
        Database.updateValue(query);
    }
    public static List<DateTime?> getStartEndByDept(List<ActivityData> activities, string dept)
    {
        ActivityData firstActivity, lastActivity;
        if (dept == "initial")
        {
            firstActivity = activities.FirstOrDefault(a => a.description == "New Issuance Request Submission");
            lastActivity = activities.FirstOrDefault(a => a.description == "Processing Started");
        }
        else if (dept == "overall")
        {
            firstActivity = activities.FirstOrDefault(a => a.description == "New Issuance Request Submission");
            lastActivity = activities.FirstOrDefault(a => a.description == "Request Finalized");
        }
        else
        {
            firstActivity = activities.FirstOrDefault(a => a.department == dept && a.description == "Processing Started");
            lastActivity = activities.FirstOrDefault(a => a.department == dept && a.description == "Request Approved");
        }
        DateTime? start = null, last = null;
        if (firstActivity != null) start = firstActivity.getDateTime();
        if (lastActivity != null) last = lastActivity.getDateTime();
        return new List<DateTime?> { start, last };
    }
}