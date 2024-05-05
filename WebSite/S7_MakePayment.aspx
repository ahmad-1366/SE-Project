<%@ Page Language="C#" AutoEventWireup="true" CodeFile="S7_MakePayment.aspx.cs" Inherits="S7_MakePayment" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel = "stylesheet" type = "text/css" href = "~/StyleSheet.css" />
    <title>Payment Process</title>
        <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
        }

        #container {
            width: 80%;
            margin: 50px auto;
            background-color: #fff;
            padding: 30px 70px;
            padding-bottom: 50px;
            border-radius: 5px;
            box-shadow: 0 2px 5px rgba(0,0,0,0.1);
            border:1px solid black;
        }

        h1 {
            text-align: center;
            color: #333;
        }

        #paymentMethod, #creditCardFields, #walletField, #submitBtn {
            width: 100%;
            padding: 10px;
            margin-bottom: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            box-sizing: border-box;
        }
        #creditCardFields, #walletField {
            display:none;
        }

        #creditCardFields{
            margin:10px 90px;
            padding: 10px 50px;
            font-size: 18px;
            width:80%;
        }
        #walletField{
            margin:10px 90px;
            padding: 10px 50px;
            font-size: 18px;
            width:80%;
        } 

        #submitBtn {
            background-color: #007bff;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }
    </style>
    <script>
        function showFields() {
            var paymentMethod = document.getElementById("<%= paymentMethod.ClientID %>").value;
            if (paymentMethod === "credit card") {
                document.getElementById("<%= creditCardFields.ClientID %>").style.display = "block";
                document.getElementById("<%= walletField.ClientID %>").style.display = "none";
            } else if (paymentMethod === "wallet") {
                document.getElementById("<%= creditCardFields.ClientID %>").style.display = "none";
                document.getElementById("<%= walletField.ClientID %>").style.display = "block";
            } else {
                document.getElementById("<%= creditCardFields.ClientID %>").style.display = "none";
                document.getElementById("<%= walletField.ClientID %>").style.display = "none";
            }
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div class="headerbar-panel">
            <h2 class="StdHeader">Onestop</h2>
        </div>
        <div class="sidebar-panel"></div>
        <div class="maincontent-panel">
            <div class="m-subheader">
                <h3 class="usertype-header">Student</h3>
                <label>| Issuance Form Submission</label>
            </div>
            <div id="container" class="m-form">
                <h1>Payment Form</h1>
                <asp:Label runat="server" Text="Select Payment Method" Width="40%" Font-Size="Large" ></asp:Label>
                <asp:DropDownList ID="paymentMethod" runat="server" AutoPostBack="true"  Width="52%" Font-Size="Large"
                    OnSelectedIndexChanged="method_SelectedIndexChanged"  Height="40px" CssClass="rounded">
                    <asp:ListItem Value="">Select Payment Method</asp:ListItem>
                    <asp:ListItem Value="credit card">Credit Card</asp:ListItem>
                    <asp:ListItem Value="wallet">Wallet</asp:ListItem>
                </asp:DropDownList>
                <br />
                <div id="creditCardFields" runat="server">
                    <div class="payment-header"><h5 class="payment-header"> Payment By Credit Card</h5></div>
                    Credit Card Number: <asp:TextBox ID="ccNumber" runat="server" Height="25px" Width="300px" CssClass="rounded"/><br /> <br />
                    Expiry Date: <asp:TextBox ID="expiryDate" runat="server" Height="25px" Width="300px" CssClass="rounded"/><br /><br />
                    CVV: <asp:TextBox ID="cvv" runat="server" Height="25px" Width="300px" CssClass="rounded"/><br /><br />
                </div>
                <div id="walletField" runat="server">
                    <div class="payment-header"><h5 class="payment-header"> Payment By Digital Wallet</h5></div>
                    Phone Number: <asp:TextBox ID="phoneNumber" runat="server" Height="25px" Width="300px" CssClass="rounded"/><br /><br />
                </div>
                <br />
                <asp:Button ID="submitBtn" runat="server" Text="Make Payment" OnClick="submitBtn_Click" />
            </div>
        </div>
        <div class="footer-panel"></div>
    </form>
</body>
</html>
