<%@ Page Language="C#" AutoEventWireup="true" CodeFile="S2_SubmitComplaint.aspx.cs" Inherits="S2_SubmitComplaint" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel = "stylesheet" type = "text/css" href = "~/StyleSheet.css" />
    <title>Complaint Form</title>
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
                <label>| Submit Complaint Form</label>
            </div>
            <%--Main Content Body--%>
            <div class="m-content rounded"> 
                <div class="request-evaluation">
                    <asp:Label runat="server" Text="Complaint Form" Font-Bold="true" Width="100%" CssClass="summary-header"/>
                    <div class="student-summary">
                        <p style="height: 1px">&nbsp;</p>
                        <div style="display:inline-block; width:100%">
                            <asp:label runat="server" Width="20%" CssClass="summary-text">Document Type:</asp:label>
                            <asp:DropDownList ID="ddlDocType" runat="server" Width ="30%" font-size="Large">
                                <asp:ListItem Text="-" Value=""></asp:ListItem>
                                <asp:ListItem Text="Degree" Value="Degree"></asp:ListItem>
                                <asp:ListItem Text="Transcript" Value="Transcript"></asp:ListItem>
                            </asp:DropDownList>
                        </div>
                        <p style="height: 4px">&nbsp;</p>
                        <asp:Label runat="server" Text="Add Comment" CssClass="summary-text"/>
                        <asp:TextBox ID="CommentTextBox" runat="server" TextMode="MultiLine" Width="99%" Height="80px"></asp:TextBox>
                        <br /><br />

                        <div class="operationsheader">
                            <asp:Panel ID="ErrorMessage" runat="server" CssClass="hideerror eval" Width="400px" Height="30px">
                                Please Fill all Field Before Submitting
                            </asp:Panel>
                            <asp:Panel ID="SuccessMessage" runat="server" CssClass="showsuccess" Width="400px" Height="30px" Visible="false">
                                Complaint Form Submitted Successfully
                            </asp:Panel>
                            <div class="operationselect">
                                <asp:Button ID="SubmitButton" runat="server" Text="Submit Complaint" Width="185px" 
                                    CssClass="operationselect button rounded" OnClick="btnSubmit_Click"/>
                            </div>
                        </div>
                    </div>
                </div>
            </div><br /><br />
        </div>
        <div class="footerbar-panel"></div>
    </form>
</body>
</html>

