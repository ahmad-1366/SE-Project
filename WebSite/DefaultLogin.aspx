<%@ Page Language="C#" AutoEventWireup="true" CodeFile="DefaultLogin.aspx.cs" Inherits="LogIn" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel = "stylesheet" type = "text/css" href = "~/StyleSheet.css" />
    <title>Onestop Login</title>
</head>
<body>
    <form id="form1" runat="server">
        <div class="headerbar-panel">
            <h2 class="StdHeader">Onestop</h2>
        </div>
        <div class="sidebar-panel"></div>
        <div class="maincontent-panel bg-img">
            <br />
            <div >
                <h1 > Welcome to Onestop Student Service Center</h1>
            </div>
            <div class="logInFormat">
                <div class="m-subheader">
                    <h2 class="usertype-header">User Login</h2>
                    <label>| </label>
                </div>
                <br />
                <div class="logininput-section">
                    <p>
                        <asp:Label ID="Label2" runat="server" Text="Username" Width="40%" Font-Size="Large" ></asp:Label>
                        <asp:TextBox ID="TextBox1" runat="server" class="rounded" Height="30px" Width="50%"></asp:TextBox>
                    </p>
                    <p style="height: 5px">&nbsp;</p>
                    <p>
                        <asp:Label ID="Label3" runat="server" Text="Password" Width="40%" Font-Size="Large" ></asp:Label>
                        <asp:TextBox ID="TextBox2" runat="server" class="rounded" Height="30px" Width="50%"></asp:TextBox>
                    </p>
                    <p style="height: 30px">&nbsp;</p>
                    <div class ="operationsheader">
                        <asp:Panel ID="ErrorMessage" runat="server" CssClass="hideerror eval" Width="250px" Height="30px">
                            Invalid Username or Password
                        </asp:Panel>
                        <asp:Button ID="LogInButton" runat="server" Text="Login"
                            CssClass="operationselect loginbutton rounded" OnClick="loginButton_Click"/>
                    </div> 
                </div>
            </div>
        </div>
    </form>
</body>
</html>

