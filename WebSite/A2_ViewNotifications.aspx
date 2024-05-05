<%@ Page Language="C#" AutoEventWireup="true" CodeFile="A2_ViewNotifications.aspx.cs" Inherits="A2_ViewNotifications" %>

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
                <li><a href="A1_RequestManagement.aspx">Request Management</a></li>
                <li><a href="A2_ViewNotifications.aspx">View Notifications</a></li>
            </ul>
        </div>
        <div class="maincontent-panel">
            <div class="m-subheader">
                <h3 class="usertype-header">Admin</h3>
                <label>| View Notifications</label>
            </div>
            <div class="m-content rounded"> 
                <%--Main Content Body--%>
                <div class="requestsheader">
                    <h5 class="m-subtitle"> Latest Notifications </h5>
                </div>
                <div>
                    <asp:GridView ID="CommentsList" runat="server" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None"
                        BorderWidth="1px" CellPadding="3" Width="80%" AutoGenerateColumns="False" HorizontalAlign="Center" >
                        <Columns>
                            <asp:BoundField DataField="Description" HeaderText="Description" ItemStyle-HorizontalAlign="Left" ItemStyle-Width="80%"/>
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
