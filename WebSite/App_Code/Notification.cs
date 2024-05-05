using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for Notification
/// </summary>
public class Notification
{
    private int user_id;
    private int notif_id;
    private string rcv_group;
    private string description;
    private DateTime timestamp;
    public Notification()
    {
    }
    public Notification(SqlDataReader reader)
    {
        try { user_id = reader.GetInt32(reader.GetOrdinal("user_id")); } catch { }
        try { notif_id = reader.GetInt32(reader.GetOrdinal("notification_id")); } catch { }
        try { description = reader.GetString(reader.GetOrdinal("description")); } catch { }
        try { rcv_group = reader.GetString(reader.GetOrdinal("rcv_group")); } catch { }
        try { timestamp = reader.GetDateTime(reader.GetOrdinal("timestamp")); } catch { }
    }
    public string getDescription()
    {
        return description;
    }
    public string getTimePassed()
    {
        DateTime start = timestamp, end = DateTime.Now;
        TimeSpan timeDifference = end - start;
        if (timeDifference.TotalSeconds < 60)
            return $"{(int)timeDifference.TotalSeconds} seconds ago";
        else if (timeDifference.TotalMinutes < 60)
            return $"{(int)timeDifference.TotalMinutes} minutes ago";
        else if (timeDifference.TotalHours < 24)
            return $"{(int)timeDifference.TotalHours} hours ago";
        else if (timeDifference.TotalDays < 7)
            return $"{(int)timeDifference.TotalDays} days ago";
        else if (timeDifference.TotalDays < 30) {
            int weeks = (int)(timeDifference.TotalDays / 7);
            return $"{weeks} {(weeks == 1 ? "week" : "weeks")} ago";
        } else{
            int months = (int)(timeDifference.TotalDays / 30);
            return $"{months} {(months == 1 ? "month" : "months")} ago";
        }
    }
    private static List<Notification> GetCommentsList(string query)
    {
        List<Notification> list = new List<Notification>();
        SqlDataReader reader = Database.getTable(query);
        while (reader.Read())
            list.Add(new Notification(reader));
        return list;
    }

    public static List<Notification> getGroupCommentsList(string group)
    {
        string query = "SELECT * FROM NOTIFICATION WHERE rcv_group = '" + group + "' ORDER BY timestamp DESC";
        return GetCommentsList(query);
    }
    public static List<Notification> getUserCommentsList(int userid)
    {
        string query = "SELECT * FROM NOTIFICATION WHERE user_id = " + userid + " ORDER BY timestamp DESC";
        return GetCommentsList(query);
    }
    public static void insertNotification(int user_id, string description)
    {
        string query = "INSERT INTO Notification (user_id, rcv_group, description) VALUES (" + user_id + ",null,'" + description + "')";
        Database.updateValue(query);
    }
    public static void insertNotification(string rcv_group, string description)
    {
        string query = "INSERT INTO Notification (user_id, rcv_group, description) VALUES (null, '" + rcv_group + "','" + description + "')";
        Database.updateValue(query);
    }

}