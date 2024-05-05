<%@ Page Language="C#" AutoEventWireup="true" CodeFile="F1_RequestEvaluation.aspx.cs" Inherits="F1_RequestEvaluation" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel = "stylesheet" type = "text/css" href = "~/StyleSheet.css" />
    <title>Request Evaluation</title>
</head>
<body>
    <form id="form1" runat="server">
        <div class="headerbar-panel">
            <h2 class="StdHeader">Onestop</h2>
        </div>
        <div class="sidebar-panel">
            <ul>
                <li><a href="F1_RequestEvaluation.aspx">Evaluate Requests</a></li>
                <li><a href="F2_ViewNotifications.aspx">View Notifications</a></li>
                <li><a href="DefaultLogin.aspx">Logout</a></li>
            </ul>
        </div>
        <div class="maincontent-panel">
            <div class="m-subheader">
                <h3 class="usertype-header">Finance Department</h3>
                <label>| Request Evaluation</label>
            </div>
            <%--Main Content Body--%>
            <div class="m-content rounded"> 
                <div class="request-evaluation">
                    <asp:Label runat="server" Text="Student Summary" Font-Bold="true" Width="100%" CssClass="summary-header"/>
                    <div class="student-summary">
                        <asp:Label ID="StudentNameLabel" runat="server" Text="Student Name:" CssClass="summary-text"/>
                        <asp:Label ID="RollNumberLabel" runat="server" Text="Roll Number:" CssClass="summary-text"/>
                        <asp:Label ID="PaymentLabel" runat="server" Text="Payment Status:" CssClass="summary-text"/>
                    </div><br />
                    <asp:Label runat="server" Text="Decision Section" Font-Bold="true" Width="100%" CssClass="summary-header"/>
                    <div class="student-summary">
                        <asp:Label runat="server" Text="Add Comment" CssClass="summary-text"/>
                        <asp:TextBox ID="CommentTextBox" runat="server" TextMode="MultiLine" Width="99%" Height="60px"></asp:TextBox>
                        <br /><br />
                        <div class="operationsheader">
                            <asp:Panel ID="ErrorMessage" runat="server" CssClass="hideerror eval" Width="400px" Height="30px">
                                Please Select a Request to Provide Evaluation
                            </asp:Panel>
                            <asp:Panel ID="SuccessMessage" runat="server" CssClass="showsuccess" Width="400px" Height="30px" Visible="false">
                                Request Evaluated Successfully
                            </asp:Panel>
                            <div class="operationselect">
                                <asp:Button ID="ObjectRequest" runat="server" Text="Raise Objection" Width="180px"
                                    CssClass="operationselect button rounded" OnClick="ObjectButton_Click"/>
                                <asp:Button ID="RejectButton" runat="server" Text="Reject Request" Width="165px"
                                    CssClass="operationselect button rounded" OnClick="RejectButton_Click"/>
                                <asp:Button ID="ApproveButton" runat="server" Text="Approve Request" Width="185px" 
                                    CssClass="operationselect button rounded" OnClick="ApproveButton_Click"/>
                            </div>
                        </div>
                    </div>
                </div>
            </div><br /><br />
            <div class="m-content rounded"> 
                <div class="requestsheader">
                    <h5 class="m-subtitle"> Student Requests </h5>
                </div>
                <div>
                    <asp:GridView ID="RequestsList" runat="server" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None"
                        BorderWidth="1px" CellPadding="3" Width="80%" AutoGenerateColumns="False" HorizontalAlign="Center" 
                        OnRowCommand="RequestsList_RowCommand">
                        <Columns>
                            <asp:BoundField DataField="RollNumber" HeaderText="Roll Number" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="30px"/>
                            <asp:BoundField DataField="StudentName" HeaderText="Student Name" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="40%"/>
                            <asp:BoundField DataField="Status" HeaderText="Payment Status" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="35px"/>
                            <asp:BoundField DataField="Evaluation" HeaderText="Evaluation" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="35px"/>
                            <asp:TemplateField ItemStyle-Width="30px" ItemStyle-HorizontalAlign="Center">
                                <ItemTemplate>
                                    <asp:LinkButton ID="SelectButton" runat="server" CommandName="SelectRow" CommandArgument='<%# Container.DataItemIndex %>' Text="Select" />
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                        <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" Height="40px" Font-Size="Large" />
                        <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
                    </asp:GridView>
                </div>
            </div>
        </div>
        <div class="footerbar-panel"></div>
    </form>
</body>
</html>

