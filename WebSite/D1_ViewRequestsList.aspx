<%@ Page Language="C#" AutoEventWireup="true" CodeFile="D1_ViewRequestsList.aspx.cs" Inherits="D1_ViewRequestsList" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel = "stylesheet" type = "text/css" href = "~/StyleSheet.css" />
    <title>View Requests</title>
</head>
<body>
    <form id="form1" runat="server">
        <div class="headerbar-panel">
            <h2 class="StdHeader">Onestop</h2>
        </div>
        <div class="sidebar-panel">
            <ul><li><a href="DefaultLogin.aspx">Logout</a></li></ul>
        </div>
        <div class="maincontent-panel">
            <div class="m-subheader">
                <h3 class="usertype-header">Director</h3>
                <label>| View Requests</label>
            </div>
            <div class="operationsheader">
                <asp:Panel ID="ErrorMessage" runat="server" CssClass="hideerror" Width="400px" Height="30px">
                    Please Select a Request to View its Activity
                </asp:Panel>
                <div class="operationselect">
                    <asp:Button ID="ActivityButton" runat="server" Text="View Activity" 
                        CssClass="operationselect button rounded" OnClick="ActivityButton_Click"/>
                </div>
            </div>
            <br />
            <div class="m-content rounded"> 
                <%--Main Content Body--%>
                <div class="requestsheader">
                    <h5 class="m-subtitle"> Student Requests </h5>
                    <div class="filtersort-section">
                        <asp:DropDownList ID="DateDropDown" runat="server" CssClass="filtersort-section button"
                            AutoPostBack="true" OnSelectedIndexChanged="Status_SelectedIndexChanged">
                        </asp:DropDownList>
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
                            <asp:BoundField DataField="RollNumber" HeaderText="Roll Number" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="30px"/>
                            <asp:BoundField DataField="StudentName" HeaderText="Student Name" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="40%"/>
                            <asp:BoundField DataField="SubmitDate" HeaderText="Submission Date" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="30px"/>
                            <asp:BoundField DataField="Status" HeaderText="Status" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="35px"/>
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
