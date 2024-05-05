using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;

public partial class S5_DegreeGeneration : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
            if(degreeAvailable())
                generateDegree();
    }
    private void generateDegree()
    {
        int user_id = SessionState.getActiveUserid();
        string query = "select first_name,last_name,dob,cgpa,level,dept_name from " +
            "dbo.[Degree] inner join [User] on [Degree].user_id = [User].user_id " +
            "inner join [Department] on [Department].dept_id = [Degree].dept_id " +
            "inner join [Transcript] on [Transcript].user_id = [user].user_id " +
            "where [user].user_id = " + user_id;
        SqlDataReader reader = Database.getTable(query);
        if (reader.Read())
        {
            UserData user = new UserData(reader);
            DegreeData degree = new DegreeData(reader);
            initializeDegree(user, degree);
        }
        Database.clear(reader);
    }
    private void initializeDegree(UserData user, DegreeData degree)
    {
        StudentNameLabel.Text = user.fullname();
        DegreeTitleLabel.Text = degree.getTitle();
        dobLabel.Text = "DoB: " + user.getDob();
        CGPALabel.Text = degree.getCGPA() + " Grade Point Average";
    }
    private bool degreeAvailable()
    {
        int user_id = SessionState.getActiveUserid();
        string query = "SELECT doc_type FROM REQUEST INNER JOIN ISSUANCEFORM ON REQUEST.form_id = ISSUANCEFORM.form_id"
            + " WHERE doc_type = 'Degree' AND status = 'Processed' AND user_id = " + user_id;
        SqlDataReader reader = Database.getTable(query);
        while(reader.Read()) {
            string doc_type = reader.GetString(reader.GetOrdinal("doc_type"));
            if (doc_type == "Degree")
                return true;
        }
        return false;
    }
}