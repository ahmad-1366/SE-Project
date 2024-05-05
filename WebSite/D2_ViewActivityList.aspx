<%@ Page Language="C#" AutoEventWireup="true" CodeFile="D2_ViewActivityList.aspx.cs" Inherits="D2_ViewActivityList" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel = "stylesheet" type = "text/css" href = "~/StyleSheet.css" />
    <title>Progress Tracking</title>
</head>
<body>
    <form id="form1" runat="server">
        <div class="headerbar-panel"><h2 class="StdHeader">Onestop</h2></div>
        <div class="sidebar-panel">
            <ul>
                <li><a href="D1_ViewRequestsList.aspx">View Requests</a></li>
                <li><a href="D2_ViewActivityList.aspx">View Activity</a></li>
                <li><a href="DefaultLogin.aspx">Logout</a></li>
            </ul>
        </div>
        <div class="maincontent-panel">
            <%--Main Content Body--%>
            <div class="m-subheader">
                <h3 class="usertype-header">Director</h3>
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
                        <asp:Label ID="waitStartTime" runat="server" Text="Start Time: NA" CssClass="metric-text"/>
                        <asp:Label ID="waitEndDate" runat="server" Text="End Date: NA" CssClass="metric-text"/>
                        <asp:Label ID="waitEndTime" runat="server" Text="End Time: NA" CssClass="metric-text"/>
                    </div>
                    <div class="metrics-section card rounded">
                        <div class="metrics-header">FYP Department</div>
                        <asp:Label ID="fypStartDate" runat="server" Text="Start Date: NA" CssClass="metric-text"/>
                        <asp:Label ID="fypStartTime" runat="server" Text="Start Time: NA" CssClass="metric-text"/>
                        <asp:Label ID="fypEndDate" runat="server" Text="End Date: NA" CssClass="metric-text"/>
                        <asp:Label ID="fypEndTime" runat="server" Text="End Time: NA" CssClass="metric-text"/>
                    </div>
                    <div class="metrics-section card rounded">
                        <div class="metrics-header">Finance Department</div>
                        <asp:Label ID="finStartDate" runat="server" Text="Start Date: NA" CssClass="metric-text"/>
                        <asp:Label ID="finStartTime" runat="server" Text="Start Time: NA" CssClass="metric-text"/>
                        <asp:Label ID="finEndDate" runat="server" Text="End Date: NA" CssClass="metric-text"/>
                        <asp:Label ID="finEndTime" runat="server" Text="End Time: NA" CssClass="metric-text"/>
                    </div>
                    <div class="metrics-section card rounded">
                        <div class="metrics-header">Overall</div>
                        <asp:Label ID="totStartDate" runat="server" Text="Start Date: NA" CssClass="metric-text"/>
                        <asp:Label ID="totStartTime" runat="server" Text="Start Time: NA" CssClass="metric-text"/>
                        <asp:Label ID="totEndDate" runat="server" Text="End Date: NA" CssClass="metric-text"/>
                        <asp:Label ID="totEndTime" runat="server" Text="End Time: NA" CssClass="metric-text"/>
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
