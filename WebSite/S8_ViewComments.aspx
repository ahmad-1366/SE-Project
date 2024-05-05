<%@ Page Language="C#" AutoEventWireup="true" CodeFile="S8_ViewComments.aspx.cs" Inherits="S8_ViewComments " %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel = "stylesheet" type = "text/css" href = "~/StyleSheet.css" />
    <title>View Notifications</title>
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
                <label>| View Comments</label>
            </div>
            <div class="m-content rounded"> 
                <%--Main Content Body--%>
                <div class="requestsheader">
                    <h5 class="m-subtitle"> Comments Section </h5>
                </div>
                <div>
                    <asp:GridView ID="CommentsList" runat="server" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None"
                        BorderWidth="1px" CellPadding="3" Width="80%" AutoGenerateColumns="False" HorizontalAlign="Center" >
                        <Columns>
                            <asp:BoundField DataField="Description" HeaderText="Description" ItemStyle-HorizontalAlign="Left" ItemStyle-Width="60%"/>
                            <asp:BoundField DataField="CmtSource" HeaderText="From" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="50px"/>
                            <asp:BoundField DataField="TimePassed" HeaderText="Time Passed" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="20px"/>
                        </Columns>
                        <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" Height="40px" Font-Size="Large" />
                    </asp:GridView>
                </div>
            </div>
        </div>
        <div class="footerbar-panel"></div>
    </form>
</body>
</html>
