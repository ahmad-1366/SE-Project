using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Security.Cryptography;
using System.Web;

/// <summary>
/// Summary description for UserData
/// </summary>
public class UserData
{
    public int user_id { get; set; }
    private string username { get; set; }
    private string password { get; set; }
    private string first_name { get; set; }
    private string last_name { get; set; }
    private string cnic { get; set;}
    private DateTime dob { get; set;}
    private string type { get; set; }

    public UserData()
    {

    }
    public UserData(SqlDataReader reader)
    {
        try { user_id = reader.GetInt32(reader.GetOrdinal("user_id")); } catch{ }
        try { first_name = reader.GetString(reader.GetOrdinal("first_name")); } catch { }
        try { last_name = reader.GetString(reader.GetOrdinal("last_name")); } catch { }
        try { username = reader.GetString(reader.GetOrdinal("username")); } catch { }
        try { password = reader.GetString(reader.GetOrdinal("password")); } catch { }
        try { cnic = reader.GetString(reader.GetOrdinal("cnic")); } catch { }
        try { type = reader.GetString(reader.GetOrdinal("type")); } catch { }
        try { dob = reader.GetDateTime(reader.GetOrdinal("dob")); } catch { }
    }
    public string fullname()
    {
        return first_name + ' ' + last_name;
    }
    public string getUsername()
    {
        return username;
    }
    public string getDob()
    {
        return dob.ToString("yyyy-MM-dd");
    }
    public string getCNIC()
    {
        return cnic;
    }
}