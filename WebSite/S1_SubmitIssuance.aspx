<%@ Page Language="C#" AutoEventWireup="true" CodeFile="S1_SubmitIssuance.aspx.cs" Inherits="S1_SubmitIssuance" %>

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
                <label>| Submit Degree Issuance Form</label>
            </div>
            <br />
            <asp:Label ID="FormErrorMessage" runat="server" visible="false" CssClass ="showerror" Text="Form Already Submitted"/>
            <asp:Panel ID="issuanceform" runat="server" class="m-content rounded"> 
                <%--Main Content Body--%>
                <div class="requestsheader">
                    <h5 class="m-subtitle"> Issuance Form </h5>
                </div>
                <div class="form-format">
                    <p>
                        <asp:Label runat="server" Text="Enter your Email" Width="40%" Font-Size="Large"></asp:Label>                    
                        <asp:TextBox ID="txtEmail" runat="server" placeholder="Email" class="rounded" Width="50%" Height="25px"></asp:TextBox><br />
                    </p>
                    <p style="height: 4px">&nbsp;</p>
                    <p>
                        <asp:Label runat="server" Text="Enter your Phone Number" Width="40%" Font-Size="Large"></asp:Label>                    
                        <asp:TextBox ID="txtPhone" runat="server" placeholder="Phone" class="rounded" Width="50%" Height="25px"></asp:TextBox><br />
                    </p>
                    <p style="height: 4px">&nbsp;</p>
                    <p>
                        <asp:Label runat="server" Text="Select your Department" Width="40%" Font-Size="Large" ></asp:Label>
                        <asp:DropDownList ID="ddlDepartment" runat="server" Width="52%" 
                            Height="40px" CssClass="rounded">
                        </asp:DropDownList><br />
                    </p>
                    <p style="height: 4px">&nbsp;</p>
                    <p>
                        <asp:Label runat="server" Text="Select a Document Type" Width="40%" Font-Size="Large" ></asp:Label>
                        <asp:DropDownList ID="ddlDocType" runat="server" DataTextField="Text" DataValueField="Value" Width="52%" 
                            Height="40px" CssClass="rounded">
                            <asp:ListItem Text="-" Value="" Selected="True"></asp:ListItem>
                            <asp:ListItem Text="Degree" Value="Degree"></asp:ListItem>
                            <asp:ListItem Text="Transcript" Value="Transcript"></asp:ListItem>
                        </asp:DropDownList><br />
                    </p>
                    <p style="height: 4px">&nbsp;</p>
                    <p>
                        <asp:Label runat="server" Text="Enter Your Degree Duration" Width="100%" Font-Size="Large" CssClass="vertspace"></asp:Label>
                        <asp:TextBox ID="txtStartYear" runat="server" placeholder="Start Year" Width="40%" class="rounded label-space" Height="25px"/>
                        <asp:TextBox ID="txtEndYear" runat="server" placeholder="End Year" Width="40%" class="rounded" Height="25px"/>
                    </p>
                    <p class ="operationsheader">
                        <asp:Panel ID="ErrorMessage" runat="server" CssClass="hideerror eval" Width="400px" Height="30px">
                            Please Enter Valid Data in All Fields
                        </asp:Panel>
                        <asp:Panel ID="SuccessMessage" runat="server" CssClass="showsuccess" Width="400px" Height="30px" Visible="false">
                            Degree Issuance Form Submitted Successfully
                        </asp:Panel>
                        <asp:Button ID="SubmitButton" runat="server" Text="Submit Form" 
                            CssClass="operationselect button rounded" OnClick="btnSubmit_Click"/>
                    </p>                
                </div>
            </asp:Panel>
        </div>
        <div class="footerbar-panel"></div>
    </form>
</body>
</html>

