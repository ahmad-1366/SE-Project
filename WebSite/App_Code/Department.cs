using Microsoft.SqlServer.Server;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for Department
/// </summary>
public class Department
{
    private string dept_name;
    private string dept_code;
    public Department()
    {

    }
    public string getDeptName()
    {
        return dept_name;
    }
    public string getDeptCode()
    {
        return dept_code;
    }
    public Department(SqlDataReader reader)
    {
        try{ dept_name = reader.GetString(reader.GetOrdinal("dept_name")); } catch { }
        try { dept_code = reader.GetString(reader.GetOrdinal("dept_code")); } catch { }
    }
    public static List<Department> GetDepartmentsList()
    {
        List<Department> departments = new List<Department>();
        string query = "SELECT * FROM DEPARTMENT";
        SqlDataReader reader = Database.getTable(query);
        while (reader.Read())
            departments.Add(new Department(reader));
        return departments;
    }
}