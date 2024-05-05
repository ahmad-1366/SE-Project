<%@ Page Language="C#" AutoEventWireup="true" CodeFile="S3_ViewRequestProgress.aspx.cs" Inherits="S3_ViewRequestProgress" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel = "stylesheet" type = "text/css" href = "~/StyleSheet.css" />
    <title>Progress Tracking</title>
</head>
<body>
    <form id="form2" runat="server">
        <div class="headerbar-panel"><h2 class="StdHeader">Onestop</h2></div>
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
            <%--Main Content Body--%>
            <div class="m-subheader">
                <h3 class="usertype-header">Student</h3>
                <label>| View Request Progress</label>
            </div>
            <div class="m-content rounded"> 
                <div class="requestsheader">
                    <h5 class="m-subtitle"> Processing Metrics </h5>
                </div>
                <div class="metrics-section">
                    <div class="metrics-section card rounded">
                        <div class="metrics-header">Waiting</div>
                        <asp:Label ID="waitStartDate" runat="server" Text="Start Date: NA" CssClass="metric-text"/>
                        <asp:Label ID="waitStartTime" runat="server" Text="Start Time: NA" CssClass="metric-text" Visible="false"/>
                        <asp:Label ID="waitEndDate" runat="server" Text="End Date: NA" CssClass="metric-text"/>
                        <asp:Label ID="waitEndTime" runat="server" Text="End Time: NA" CssClass="metric-text" Visible="false"/>
                        <asp:Label ID="waitStatus" runat="server" Text="Incomplete" CssClass="metric-status fail"/>
                    </div>
                    <div class="metrics-section card rounded">
                        <div class="metrics-header">FYP Department</div>
                        <asp:Label ID="fypStartDate" runat="server" Text="Start Date: NA" CssClass="metric-text"/>
                        <asp:Label ID="fypStartTime" runat="server" Text="Start Time: NA" CssClass="metric-text" Visible="false"/>
                        <asp:Label ID="fypEndDate" runat="server" Text="End Date: NA" CssClass="metric-text"/>
                        <asp:Label ID="fypEndTime" runat="server" Text="End Time: NA" CssClass="metric-text" Visible="false"/>
                        <asp:Label ID="fypStatus" runat="server" Text="Incomplete" CssClass="metric-status fail"/>
                    </div>
                    <div class="metrics-section card rounded">
                        <div class="metrics-header">Finance Department</div>
                        <asp:Label ID="finStartDate" runat="server" Text="Start Date: NA" CssClass="metric-text"/>
                        <asp:Label ID="finStartTime" runat="server" Text="Start Time: NA" CssClass="metric-text" Visible="false"/>
                        <asp:Label ID="finEndDate" runat="server" Text="End Date: NA" CssClass="metric-text"/>
                        <asp:Label ID="finEndTime" runat="server" Text="End Time: NA" CssClass="metric-text" Visible="false"/>
                        <asp:Label ID="finStatus" runat="server" Text="Incomplete" CssClass="metric-status fail"/>
                    </div>
                    <div class="metrics-section card rounded">
                        <div class="metrics-header">Overall</div>
                        <asp:Label ID="totStartDate" runat="server" Text="Start Date: NA" CssClass="metric-text"/>
                        <asp:Label ID="totStartTime" runat="server" Text="Start Time: NA" CssClass="metric-text" Visible="false"/>
                        <asp:Label ID="totEndDate" runat="server" Text="End Date: NA" CssClass="metric-text"/>
                        <asp:Label ID="totEndTime" runat="server" Text="End Time: NA" CssClass="metric-text" Visible="false"/>
                        <asp:Label ID="totStatus" runat="server" Text="Incomplete" CssClass="metric-status fail"/>
                    </div>
                </div>
            </div><br /><br />
            <div class="m-content rounded"> 
                <div class="requestsheader">
                    <h5 class="m-subtitle"> Request Updates </h5>
                </div>
                <div>
                    <asp:GridView ID="ActivityList" runat="server" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None"
                        BorderWidth="1px" CellPadding="3" Width="80%" AutoGenerateColumns="False" HorizontalAlign="Center">
                        <Columns>
                            <asp:BoundField DataField="Number" HeaderText="Sr no." ItemStyle-HorizontalAlign="Center" />
                            <asp:BoundField DataField="Description" HeaderText="Description" ItemStyle-HorizontalAlign="Left" />
                            <asp:BoundField DataField="Date" HeaderText="Date" ItemStyle-HorizontalAlign="Center" />
                            <asp:BoundField DataField="Time" HeaderText="Time" ItemStyle-HorizontalAlign="Center" />
                        </Columns>
                        <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
                    </asp:GridView>
                </div>
            </div>
        </div>
        <div class="footerbar-panel"></div>
    </form>
</body>
</html>

