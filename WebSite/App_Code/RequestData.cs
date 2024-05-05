using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Remoting.Messaging;
using System.Web;
using System.Data.SqlClient;
using System.Web.UI;
using System.Runtime.CompilerServices;
using System.Reflection;
using System.Data;
using System.Activities.Statements;
using System.Activities.Tracking;

/// <summary>
/// Summary description for RequestData
/// </summary>
public class RequestData
{
    private UserData user;
    private int request_id { set; get; }
    private string status { set; get; }
    private string paymentstatus { set; get; }
    private string activitystatus { set; get; }
    private DateTime submit_date { set; get; }
    public RequestData()
    {
    }
    public int getRequestId()
    {
        return request_id;
    }
    public string getUsername()
    {
        return user.fullname();
    }
    public string getRollNumber()
    {
        return user.getUsername();
    }
    public string getSubmitDate()
    {
        return submit_date.ToString("yyyy-MM-dd");
    }
    public string getActivityStatus()
    {
        return activitystatus;
    }
    public string getStatus()
    {
        return status;
    }
    public int getUserId()
    {
        return user.user_id;
    }
    public string getPaymentStatus()
    {
        return paymentstatus;
    }

    public RequestData(SqlDataReader reader, bool includeform = false)
    {
        try { request_id = reader.GetInt32(reader.GetOrdinal("request_id"));} catch { }
        try { submit_date = reader.GetDateTime(reader.GetOrdinal("submit_date")); } catch { }
        try { paymentstatus = reader.GetString(reader.GetOrdinal("paymentstatus")); } catch { }
        try { activitystatus = reader.GetString(reader.GetOrdinal("activitystatus")); } catch { }
        try { status = reader.GetString(reader.GetOrdinal("status")); } catch { }
        user = new UserData(reader);
        //if (includeform) form = new IssuanceForm(reader);
    }
    public static List<RequestData> getRequestsList(bool includeFormData = false)
    {
        List<RequestData> list = new List<RequestData>();
        string query = "SELECT * FROM REQUEST";
        if (includeFormData)
            query = "SELECT * FROM REQUEST INNER JOIN ISSUANCEFORM ON form_id == request_id";
        SqlDataReader reader = Database.getTable(query);
        while (reader.Read())
            list.Add(new RequestData(reader));
         return list;
    }
    public static List<RequestData> getUserRequestsList(bool includeFormData = false)
    {
        List<RequestData> list = new List<RequestData>();
        string query = "SELECT * FROM REQUEST INNER JOIN [USER] ON [USER].User_id = REQUEST.user_id" ;
        if (includeFormData)
            query = "SELECT * FROM REQUEST INNER JOIN [USER] ON [USER].User_id = REQUEST.User_id INNER JOIN ISSUANCEFORM ON form_id == request_id";

        SqlDataReader reader = Database.getTable(query);
        while (reader.Read())
            list.Add(new RequestData(reader));
        Database.clear(reader);
        return list;
    }
    private static bool allStatus(string status)
    {
        return status == "-" || status == "All";
    }
    public static List<RequestData> getFilteredUserRequests(string status = "-", string date = "-")
    {
        if (date == "-" && allStatus(status)) return getUserRequestsList();

        string query = "SELECT * FROM REQUEST INNER JOIN [USER] ON [USER].User_id = REQUEST.user_id ";
        List<RequestData> list = new List<RequestData>();
        if(!allStatus(status) && date == "-")
            query += " WHERE status = '" + status + "'";
        else if (allStatus(status) && date != "-")
            query += " WHERE cast(submit_date as date) = '" + date + "'";
        else if (!allStatus(status) && date != "-")
            query += " WHERE cast(submit_date as date) = '" + date + "' AND status = '" + status + "'";


        SqlDataReader reader = Database.getTable(query);
        while (reader.Read())
            list.Add(new RequestData(reader));
        Database.clear(reader);
        return list;
    }
    public static List<RequestData> getPaymentRequests()
    {
        //string query = "SELECT [user].first_name, [user].last_name, [user].username, request.request_id, bill.status as paymentstatus, ACTIVITY.description " +
        //    " as activitystatus FROM [USER] INNER JOIN REQUEST ON[USER].user_id = REQUEST.user_id INNER JOIN BILL ON BILL.request_id = REQUEST.request_id " +
        //    " LEFT JOIN Activity ON REQUEST.request_id = ACTIVITY.request_id WHERE ACTIVITY.department = 'Finance Staff' AND " +
        //    "ACTIVITY.description in ('Approved', 'Rejected', 'Objected') or activity.description is null";

        //string query = "SELECT [user].first_name, [user].last_name, [user].username, request.request_id, bill.status as paymentstatus " +
        //            " FROM [USER] INNER JOIN REQUEST ON[USER].user_id = REQUEST.user_id INNER JOIN BILL ON BILL.request_id = REQUEST.request_id";// +
        //            //" WHERE request.status = 'Pending' OR request.status = 'Processing'";

        string query = "SELECT [user].user_id, [user].first_name, [user].last_name, [user].username, request.request_id, BILL.status as paymentstatus, REQUEST.status as " +
            "activitystatus FROM [USER] INNER JOIN REQUEST ON[USER].user_id = REQUEST.user_id INNER JOIN BILL ON BILL.request_id = REQUEST.request_id " +
            "where request.status = 'Processing' and Request.request_id in ( SELECT request_id FROM activity WHERE department = 'Finance Staff' AND " +
            "description = 'Processing Started' AND request_id NOT IN ( SELECT request_id FROM Activity WHERE department = 'Finance Staff' AND " +
            "description IN ('Request Approved','Request Rejected')));";

        List<RequestData> list = new List<RequestData>();
        SqlDataReader reader = Database.getTable(query);
        while (reader.Read())
            list.Add(new RequestData(reader));
        Database.clear(reader);
        return list;
    }
    public static List<RequestData> getFYPRequestsList()
    {
        //string query = "SELECT[user].first_name, [user].last_name, [user].username, unique request.request_id, ACTIVITY.description as activitystatus " +
        //    "FROM[USER] INNER JOIN REQUEST ON[USER].user_id = REQUEST.user_id LEFT JOIN Activity ON REQUEST.request_id = ACTIVITY.request_id " +
        //    "WHERE ACTIVITY.department = 'FYP Staff' AND (ACTIVITY.description in ('Approved', 'Rejected', 'Objected') or activity.description = 'Processing Started');";
        //string query = "SELECT [user].first_name, [user].last_name, [user].username, request.request_id, REQUEST.status as activitystatus " +
        //    "FROM [USER] INNER JOIN REQUEST ON[USER].user_id = REQUEST.user_id WHERE Request.request_id in ( SELECT request_id FROM activity " +
        //    "WHERE department = 'FYP Staff' AND description = 'Processing Started' AND request_id NOT IN ( SELECT request_id FROM Activity " +
        //    "WHERE description = 'Request Approved'));";
        string query = "SELECT [user].user_id, [user].first_name, [user].last_name, [user].username, request.request_id, REQUEST.status as activitystatus " +
            "FROM [USER] INNER JOIN REQUEST ON[USER].user_id = REQUEST.user_id where request.status='Processing' and Request.request_id " +
            "in ( SELECT request_id FROM activity WHERE department = 'FYP Staff' AND description = 'Processing Started' AND request_id " +
            "NOT IN ( SELECT request_id FROM Activity WHERE department = 'FYP Staff' AND description IN ('Request Approved','Request Rejected')));";

        List<RequestData> list = new List<RequestData>();
        SqlDataReader reader = Database.getTable(query);
        while (reader.Read())
            list.Add(new RequestData(reader));
        Database.clear(reader);
        return list;

    }
    public void updateRequestStatus(string newstatus)
    {
        status = newstatus;
        string query = "UPDATE REQUEST SET status = '" + newstatus + "' WHERE request_id = " + request_id;
        Database.updateValue(query);
    }
}