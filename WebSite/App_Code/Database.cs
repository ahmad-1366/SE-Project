using System;
using System.Collections;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI.WebControls;

/// <summary>
/// Summary description for Database
/// </summary>
public class Database
{
    public Database()
    {
    }
    public static SqlDataReader getTable(string query)
    {
        SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["Database"].ConnectionString);
        connection.Open();
        SqlCommand command = new SqlCommand(query, connection);
        SqlDataReader reader = command.ExecuteReader();
        return reader;
    }
    public static void executeNonQuery(SqlCommand command)
    {
        string sqlQuery = command.CommandText;
        foreach (SqlParameter parameter in command.Parameters)
            sqlQuery = sqlQuery.Replace(parameter.ParameterName, parameter.Value.ToString());
        SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["Database"].ConnectionString);
        command.Connection = connection;
        connection.Open();
        command.ExecuteNonQuery();
    }
    public static void updateValue(string query)
    {
        SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["Database"].ConnectionString);
        connection.Open();
        SqlCommand command = new SqlCommand(query, connection);
        command.ExecuteNonQuery();
    }
    public static void clear(SqlDataReader reader)
    {
        if (reader != null)
            reader.Close();
    }

}