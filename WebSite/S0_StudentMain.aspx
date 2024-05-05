<%@ Page Language="C#" AutoEventWireup="true" CodeFile="S0_StudentMain.aspx.cs" Inherits="S0_StudentMain" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel = "stylesheet" type = "text/css" href = "~/StyleSheet.css" />
    <title>Student Dashboard</title>
</head>
<body>
    <form id="form2" runat="server">
        <div class="headerbar-panel">
            <h2 class="StdHeader">Onestop</h2>
        </div>
        <div class="sidebar-panel">
            <ul>
                <li><a href="S0_StudentMain.aspx">Home Page</a></li>
                <li><a href="S1_SubmitIssuance.aspx">Submit Issuance Form</a></li>
                <li><a href="S2_SubmitComplaint.aspx">Submit Complaint Form</a></li>
                <li><a href="S3_ViewRequestProgress.aspx">View Request Progess</a></li>
                <li><a href="S4_ViewNotifications.aspx">View Notifications</a></li>
                <li><a href="S5_DegreeGeneration.aspx">View Degree</a></li>
                <li><a href="S6_TranscriptGeneration.aspx">View Transcript</a></li>
                <li><a href="S8_ViewComments.aspx">View Comments</a></li>
                <li><a href="DefaultLogin.aspx">Logout</a></li>
            </ul>
        </div>
        <div class="maincontent-panel bg-img">
            <div class="m-subheader">
                <h3 class="usertype-header">Student</h3>
                <label>| Main Dashboard</label>
            </div>
                <%--Main Content Body--%>
                <div >
                    <h1 > Welcome to Onestop Student Service Center</h1>
                    <h2> Degree Issuance Module</h2>
                </div>
            <br /><br />
                <div class="sd-dashboard">
                    <div class="sd-row">
                        <a href="S0_StudentMain.aspx" class="sd-operation">Home Page</a>
                        <a href="S1_SubmitIssuance.aspx" class="sd-operation">Issuance Request</a>
                        <a href="S2_SubmitComplaint.aspx" class="sd-operation">Submit Complaint</a>
                        <a href="S3_ViewRequestProgress.aspx" class="sd-operation">View Request Progress</a>
                    </div>
                    <div class="sd-row">
                        <a href="S4_ViewNotifications.aspx" class="sd-operation">View Notifications</a>
                        <a href="S5_DegreeGeneration.aspx" class="sd-operation">View Degree</a>
                        <a href="S6_TranscriptGeneration.aspx" class="sd-operation">View Transcript</a>
                        <a href="S8_ViewComments.aspx" class="sd-operation">View Comments</a>
                    </div>
                </div>
            </div>
        <%--</div>--%>
    </form>
</body>
</html>

