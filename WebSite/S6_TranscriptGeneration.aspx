<%@ Page Language="C#" AutoEventWireup="true" CodeFile="S6_TranscriptGeneration.aspx.cs" Inherits="S6_TranscriptGeneration" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel = "stylesheet" type = "text/css" href = "~/StyleSheet.css" />
    <title>Transcript Generation</title>
</head>
<body>
    <form id="form1" runat="server">
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
        <div class="maincontent-panel">
            <div class="m-subheader">
                <h3 class="usertype-header">Student</h3>
                <label>| View Transcript</label>
            </div>
            <%--Main Content Body--%>
            <div class="m-content rounded"> 
                <div class="request-evaluation">
                    <asp:Label runat="server" Text="Student Details" Font-Bold="true" Width="100%" CssClass="summary-header"/>
                    <div class="transcript-summary ">
                        <div class="summary-column-0">
                            <asp:Label ID="StudentNameLabel" runat="server" Text="Student Name: " CssClass="summary-text"/>
                            <asp:Label ID="DobLabel" runat="server" Text="DoB: " CssClass="summary-text"/>
                            <asp:Label ID="CnicLabel" runat="server" Text="Cnic: " CssClass="summary-text"/><br />
                            <asp:Label ID="DegreeLabel" runat="server" Text="Degree: " CssClass="summary-text"/>
                        </div>
                        <div class="summary-column-1">
                            <asp:Label ID="RollNumberLabel" runat="server" Text="Roll Number: " CssClass="summary-text"/>
                            <asp:Label ID="BatchLabel" runat="server" Text="Batch: " CssClass="summary-text"/>
                            <asp:Label ID="DurationLabel" runat="server" Text="Duration: " CssClass="summary-text"/><br />
                            <asp:Label ID="CgpaLabel" runat="server" Text="CGPA: " CssClass="summary-text"/>
                        </div>
                    </div>
                </div>
            </div>
            <br /><br />
            <div class="m-content rounded">
                <div class="requestsheader">
                    <h5 class="m-subtitle"> Student Transcript </h5>
                </div>
                <asp:GridView ID="GradesList" runat="server" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None"
                    BorderWidth="1px" CellPadding="3" Width="80%" AutoGenerateColumns="False" HorizontalAlign="Center" >
                    <Columns>
                        <asp:BoundField DataField="course_code" HeaderText="Course Code" />
                        <asp:BoundField DataField="course_name" HeaderText="Course Name" />
                        <asp:BoundField DataField="credit_hrs" HeaderText="Credit Hours" />
                        <asp:BoundField DataField="letter_grade" HeaderText="Grade Achieved" />
                    </Columns>
                    <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" Height="40px" Font-Size="Large" />
                </asp:GridView>
            </div>
        </div>
        <div class="footer-panel"></div>
    </form>
</body>
</html>
