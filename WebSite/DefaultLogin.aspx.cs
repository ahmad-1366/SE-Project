using System;
using System.Configuration;
using System.Data.SqlClient;

public partial class LogIn : System.Web.UI.Page
{
    protected void loginButton_Click(object sender, EventArgs e)
    {
        string username = TextBox1.Text;
        string password = TextBox2.Text;

        if (username == "" || password == "")
            ErrorMessage.CssClass = "showerror";
        else
        {
            string query = "SELECT [USER].User_Id, [USER].Type" +
                " FROM [USER] WHERE [USER].Password = '" + password +
                "' AND [USER].username = '" + username + "';";

            SqlDataReader reader = Database.getTable(query);
            if (reader.HasRows)
            {
                reader.Read();
                int user_Id = reader.GetInt32(reader.GetOrdinal("User_Id"));
                string type = reader.GetString(reader.GetOrdinal("Type"));
                SessionState.setActiveUser(user_Id);

                switch (type)
                {
                    case "Admin":
                        Response.Redirect("~/A1_RequestManagement.aspx");
                        break;
                    case "Student":
                        Response.Redirect("~/S0_StudentMain.aspx");
                        break;
                    case "Director":
                        Response.Redirect("~/D1_ViewRequestsList.aspx");
                        break;
                    case "Finance Staff":
                        Response.Redirect("~/F1_RequestEvaluation.aspx");
                        break;
                    case "FYP Staff":
                        Response.Redirect("~/Y1_RequestEvaluation.aspx");
                        break;
                }
            }
            else ErrorMessage.CssClass = "showerror";
            reader.Dispose();
        }
    }
}

    /*
    
<%--<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel = "stylesheet" type = "text/css" href = "~/StyleSheet.css" />
<title>Onestop</title>
</head>
<body>
<form id="DefaultLogin" runat="server">
        <div>
            <asp:Label ID="Label1" runat="server" BackColor="#000066" BorderColor="#000099"
                    BorderWidth="5px" Columns="2" Font-Size="X-Large" ForeColor="White" Height="40px"
                    Width="100%" ><div class="StdHeader">Onestop | </div>
            </asp:Label>
            <asp:Label ID="Label5" runat="server" BackColor="#9900CC" BorderColor="#9900CC"
                    BorderWidth="5px" Font-Size="X-Large" ForeColor="White" Height="40px"
                    Width="100%" ><div class="StdHeader">LogIn | </div>
            </asp:Label>
        </div>
        <br /><br />
        <div class="logInFormat">
            <p>
                <asp:Label ID="Label2" runat="server" Text="Username" Width="40%" Font-Size="Large"></asp:Label>
                <asp:TextBox ID="TextBox1" runat="server" class="rounded" Height="30px" Width="50%"></asp:TextBox>
            </p>
            <p style="height: 5px">&nbsp;</p>
            <p>
                <asp:Label ID="Label3" runat="server" Text="Password" Width="40%" Font-Size="Large"></asp:Label>
                <asp:TextBox ID="TextBox2" runat="server" class="rounded" Height="30px" Width="50%"></asp:TextBox>
            </p>
            <p style="height: 30px">&nbsp;</p>
            <p>
                <asp:Button ID="LogInButton" runat="server" OnClick="Button1_Click" Text="Login" CssClass="logInButton" Width="200px" />
            </p>
            <p>
                <asp:Label ID="LoginErrorLabel" runat="server" CssClass="loginError" ForeColor="Red" Text="Invalid Username or Password Entered" Visible="False"></asp:Label>
            </p>
        </div>
        <br /><br /><br />
    </form>
</body>
</html>--%>*/