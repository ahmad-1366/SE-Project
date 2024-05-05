<%@ Page Language="C#" AutoEventWireup="true" CodeFile="S5_DegreeGeneration.aspx.cs" Inherits="S5_DegreeGeneration" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel = "stylesheet" type = "text/css" href = "~/StyleSheet.css" />
    <title>Degree Generation</title>
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
                <label>| View Degree</label>
            </div>
            <div class="container pm-certificate-container">
                <div class="outer-border"></div>
                <div class="inner-border"></div>
                <div class="pm-certificate-border col-xs-12">
                    <div class="row pm-certificate-header cursive">
                        <h2>National University of Computers and Emerging Sciences</h2>
                    </div>

                    <div class="row pm-certificate-body">
        
                        <div class="pm-certificate-block">
                            <div class="col-xs-12">
                                <div class="row">
                                <div class="col-xs-2" ></div>
                                    <asp:Label ID="StudentNameLabel" runat="server" Text="" CssClass="bold" style="font-size:22px"/>
                                <div class="col-xs-2"></div>
                                </div>
                            </div>          

                            <div class="col-xs-12">
                                <div class="row">
                                <div class="col-xs-2"></div>
                                <div class="pm-earned col-xs-8 text-center">
                                    <span class="pm-earned-text padding-0 block cursive">has earned</span>
                                    <asp:Label ID="CGPALabel" runat="server" Text="Grade Point Average" CssClass="bold sans" />
                                </div>
                                <div class="col-xs-2"></div>
                            </div>
            
                            <div class="col-xs-12">
                                <div class="row">
                                <div class="col-xs-2"></div>
                                    <span class="pm-earned-text block cursive">upon completing the degree entitled</span>
                                </div>
                                <div class="col-xs-2"></div>
                                </div>
                            </div>

                            <div class="col-xs-12">
                                <div class="row">
                                <div class="col-xs-2"></div>
                                <div class="pm-course-title underline col-xs-8 text-center">
                                    <asp:Label ID="DegreeTitleLabel" runat="server" CssClass="pm-credits-text block bold sans"
                                        Text = "Bachelors of Science in Computer Science" />
                                </div>
                                <div class="col-xs-2"></div>
                                </div>
                            </div>
                        </div>       
        
                        <div class="col-xs-12">
                            <div class="row">
                            <div class="pm-certificate-footer">
                                <div class="col-xs-4 pm-certified col-xs-4 text-center">
                                    <span class="pm-credits-text block sans">FAST-NUCES Islamabad</span>
                                    <span class="vertspace block underline"></span>
                                    <span class="bold block">A.K. Brohi Road H-11/4 Islamabad</span>
                                </div>
                                <div class="pm-certificate-sep">
                                    &nbsp;
                                </div>
                                <div class="col-xs-4 pm-certified col-xs-4 text-center">
                                    <span class="pm-credits-text block sans">Date Completed</span>
                                    <span class="vertspace block underline"></span>
                                    <asp:Label ID="dobLabel" runat="server" Text="DOB: 2002-05-21" CssClass="bold block" />
                                </div>
                            </div>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
        </div>
        <div class="footer-panel"></div>
    </form>
</body>
</html>
