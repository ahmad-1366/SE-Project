using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class S6_TranscriptGeneration : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
            GenerateTranscriptData();
    }
    private void GenerateTranscriptData()
    {
        int transcript_id = getTranscriptId();
        loadGrades(transcript_id);
        loadDetails();
    }
    public int getTranscriptId()
    {
        int transcript_id = -1;
        int user_id = SessionState.getActiveUserid();
        string query = "select transcript_id from Transcript where user_id = " + user_id;
        SqlDataReader reader = Database.getTable(query);
        if (reader.Read()) transcript_id = reader.GetInt32(reader.GetOrdinal("transcript_id"));
        return transcript_id;
    }
    private void loadGrades(int transcriptId)
    {
        string query = "select course_name,course_code,credit_hrs,letter_grade from Grade inner join " +
            "Course on Grade.course_id = Course.course_id where transcript_id = " + transcriptId;
        SqlDataReader reader = Database.getTable(query);
        GradesList.DataSource = reader;
        GradesList.DataBind();
    }
    private void loadDetails()
    {
        int userid = SessionState.getActiveUserid();
        string query = "select first_name,last_name,cnic,dob,username,cgpa,start_year,end_year,batch,level,dept_name " +
            "from [User] inner join Transcript on [User].user_id = Transcript.user_id inner join Degree on Degree.user_id " +
            "= [User].user_id inner join Department on Degree.dept_id = Department.dept_id where [User].user_id = " + userid;
        SqlDataReader reader = Database.getTable(query);
        if (reader.Read())
        {
            Transcript transcript = new Transcript(reader);
            UserData user = new UserData(reader);
            initializeSummary(user, transcript);
        }
    }
    private void initializeSummary(UserData user, Transcript transcript)
    {
        StudentNameLabel.Text += user.fullname();
        RollNumberLabel.Text += user.getUsername();
        CnicLabel.Text += user.getCNIC();
        DobLabel.Text += user.getDob();
        DurationLabel.Text += transcript.getDuration();
        DegreeLabel.Text += transcript.getTitle();
        BatchLabel.Text += transcript.getBatch();
        CgpaLabel.Text += transcript.GetCgpa();
    }
}