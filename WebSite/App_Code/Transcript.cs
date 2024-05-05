using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for Transcript
/// </summary>
public class Transcript
{
    private int user_id;
    private int start_year;
    private int end_year;
    private string cgpa;
    private string batch;
    private string level;
    private string dept_name;

    public Transcript(SqlDataReader reader)
    {
        try { user_id = reader.GetInt32(reader.GetOrdinal("user_id")); } catch { }
        try { cgpa = reader.GetString(reader.GetOrdinal("cgpa")); } catch { }
        try { start_year = reader.GetInt16(reader.GetOrdinal("start_year")); } catch { }
        try { end_year = reader.GetInt16(reader.GetOrdinal("end_year")); } catch { }
        try { dept_name = reader.GetString(reader.GetOrdinal("dept_name")); } catch { }
        try { batch = reader.GetString(reader.GetOrdinal("batch")); } catch { }
        try { level = reader.GetString(reader.GetOrdinal("level")); } catch { }
    }
    public string GetCgpa()
    {
        return cgpa;
    }
    public string getDuration()
    {
        return start_year + " - " + end_year;
    }
    public string getTitle()
    {
        return level + " in " + dept_name;
    }
    public string getBatch()
    {
        return batch;
    }
}