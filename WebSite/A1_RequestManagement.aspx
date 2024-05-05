<%@ Page Language="C#" AutoEventWireup="true" CodeFile="A1_RequestManagement.aspx.cs" Inherits="RequestManagement" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel = "stylesheet" type = "text/css" href = "~/StyleSheet.css" />
    <title>Request Management</title>
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
                <li><a href="DefaultLogin.aspx">Logout</a></li>
            </ul>
        </div>w
        <div class="maincontent-panel">
            <div class="m-subheader">
                <h3 class="usertype-header">Admin</h3>
                <label>| Request Management</label>
            </div>
            <%--Main Content Body--%>
            <div class="m-content rounded"> 
                <div class="request-evaluation">
                    <asp:Label runat="server" Text="Student Summary" Font-Bold="true" Width="100%" CssClass="summary-header"/>
                    <div class="student-summary">
                        <asp:Label ID="StudentNameLabel" runat="server" Text="Student Name:" CssClass="summary-text"/>
                        <asp:Label ID="RollNumberLabel" runat="server" Text="Roll Number:" CssClass="summary-text"/>
                        <asp:Label ID="StatusLabel" runat="server" Text="Request Status:" CssClass="summary-text"/>
                    </div>
                </div>
                <div class="request-evaluation">
                    <asp:Label runat="server" Text="Student Summary" Font-Bold="true" Width="100%" CssClass="summary-header"/>
                </div>
                <br /><br />
                <div class="metrics-section">
                    <div class="metrics-section card rounded">
                        <div class="metrics-header">Waiting</div>
                        <asp:Label ID="waitStartDate" runat="server" Text="Start Date: NA" CssClass="metric-text"/>
                        <asp:Label ID="waitEndDate" runat="server" Text="End Date: NA" CssClass="metric-text"/>
                        <asp:Label ID="waitStatus" runat="server" Text="Incomplete" CssClass="metric-status fail"/>
                    </div>
                    <div class="metrics-section card rounded">
                        <div class="metrics-header">FYP Department</div>
                        <asp:Label ID="fypStartDate" runat="server" Text="Start Date: NA" CssClass="metric-text"/>
                        <asp:Label ID="fypEndDate" runat="server" Text="End Date: NA" CssClass="metric-text"/>
                        <asp:Label ID="fypStatus" runat="server" Text="Incomplete" CssClass="metric-status fail"/>
                    </div>
                    <div class="metrics-section card rounded">
                        <div class="metrics-header">Finance Department</div>
                        <asp:Label ID="finStartDate" runat="server" Text="Start Date: NA" CssClass="metric-text"/>
                        <asp:Label ID="finEndDate" runat="server" Text="End Date: NA" CssClass="metric-text"/>
                        <asp:Label ID="finStatus" runat="server" Text="Incomplete" CssClass="metric-status fail"/>
                    </div>
                    <div class="metrics-section card rounded">
                        <div class="metrics-header">Overall</div>
                        <asp:Label ID="totStartDate" runat="server" Text="Start Date: NA" CssClass="metric-text"/>
                        <asp:Label ID="totEndDate" runat="server" Text="End Date: NA" CssClass="metric-text"/>
                        <asp:Label ID="totStatus" runat="server" Text="Incomplete" CssClass="metric-status fail"/>
                    </div>
                </div>
                <div class="request-evaluation"> 
                    <div class="student-summary">
                        <div class="operationsheader">
                            <asp:Panel ID="ErrorMessage" runat="server" CssClass="hideerror eval" Width="400px" Height="30px">
                                <asp:Label ID="Err" runat="server" Text="" />
                            </asp:Panel>
                            <asp:Panel ID="SuccessMessage" runat="server" CssClass="showsuccess eval" Width="400px" Height="30px" Visible="false">
                                <asp:Label ID="Suc" runat="server" Text="Evaluated Successfully" />
                            </asp:Panel>
                            <div class="operationselect">
                                <asp:Button ID="BeginButton" runat="server" Text="Begin Processing" Width="175px"
                                    CssClass="operationselect button rounded" OnClick="BeginButton_Click"/>
                                <asp:Button ID="FinalizeButton" runat="server" Text="Finalize Request" Width="175px"
                                    CssClass="operationselect button rounded" OnClick="FinalizeButton_Click"/>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <br /><br />
            <div class="m-content rounded"> 
                <div class="requestsheader">
                    <h5 class="m-subtitle"> Student Requests </h5>
                    <div class="filtersort-section">
                        <asp:DropDownList ID="StatusDropDown" runat="server" CssClass="filtersort-section button"
                            AutoPostBack="true" OnSelectedIndexChanged="Status_SelectedIndexChanged">
                            <asp:ListItem Text="All" Value="All" Selected="True" />
                            <asp:ListItem Text="Pending" Value="Pending" />
                            <asp:ListItem Text="Processed" Value="Processed" />
                            <asp:ListItem Text="Processing" Value="Processing" />
                        </asp:DropDownList>
                    </div>
                </div>
                <div>
                    <asp:GridView ID="RequestsList" runat="server" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None"
                        BorderWidth="1px" CellPadding="3" Width="80%" AutoGenerateColumns="False" HorizontalAlign="Center"
                        OnRowCommand="RequestsList_RowCommand">
                        <Columns>
                            <asp:BoundField DataField="StudentName" HeaderText="Student Name" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="60%"/>
                            <asp:BoundField DataField="SubmitDate" HeaderText="Submission Date" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="25%"/>
                            <asp:BoundField DataField="Status" HeaderText="Status" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="15%"/>
                            <asp:TemplateField ItemStyle-Width="10%" ItemStyle-HorizontalAlign="Center">
                                <ItemTemplate>
                                    <asp:LinkButton ID="SelectButton" runat="server" CommandName="SelectRow" CommandArgument='<%# Container.DataItemIndex %>' Text="Select" />
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                        <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
                        <RowStyle ForeColor="#000066" />
                        <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
                    </asp:GridView>
                </div>
            </div>
        </div>
        <div class="footerbar-panel"></div>
    </form>
</body>
</html>
