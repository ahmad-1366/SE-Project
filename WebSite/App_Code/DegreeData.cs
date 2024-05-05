using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for DegreeData
/// </summary>
public class DegreeData
{
    //,major,batch,level,dept_name
    private string batch;
    private string level;
    private string dept_name;
    private string cgpa;
    public DegreeData(SqlDataReader reader)
    {
        try { batch = reader.GetString(reader.GetOrdinal("batch")); } catch { };
        try { level = reader.GetString(reader.GetOrdinal("level")); } catch { };
        try { cgpa = reader.GetString(reader.GetOrdinal("cgpa")); } catch { };
        try { dept_name = reader.GetString(reader.GetOrdinal("dept_name")); } catch { };
    }
    public string getTitle()
    {
        return level + " of Science in " + dept_name;
    }
    public string getCGPA()
    {
        return cgpa;
    }
}