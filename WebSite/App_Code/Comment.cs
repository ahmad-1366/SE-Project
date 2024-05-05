using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Runtime.CompilerServices;
using System.Web;

/// <summary>
/// Summary description for Comment
/// </summary>
public class Comment
{
    private string cmt_from;
    private string description;
    private DateTime timestamp;
    public Comment(SqlDataReader reader)
    {
        try { description = reader.GetString(reader.GetOrdinal("description")); } catch { }
        try { cmt_from = reader.GetString(reader.GetOrdinal("cmt_from")); } catch { }
        try { timestamp = reader.GetDateTime(reader.GetOrdinal("timestamp")); } catch { }
    }
    public string getDescription()
    {
        return description;
    }
    public string getSource()
    {
        return cmt_from;
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
        else if (timeDifference.TotalDays < 30)
        {
            int weeks = (int)(timeDifference.TotalDays / 7);
            return $"{weeks} {(weeks == 1 ? "week" : "weeks")} ago";
        }
        else
        {
            int months = (int)(timeDifference.TotalDays / 30);
            return $"{months} {(months == 1 ? "month" : "months")} ago";
        }
    }
    public static List<Comment> GetCommentsList(int user_id)
    {
        string query = "SELECT * FROM COMMENT INNER JOIN REQUEST ON REQUEST.request_id = COMMENT.request_id WHERE user_id = " + user_id; 
        List<Comment> list = new List<Comment>();
        SqlDataReader reader = Database.getTable(query);
        while (reader.Read())
            list.Add(new Comment(reader));
        return list;
    }
}