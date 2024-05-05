using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class S7_MakePayment : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void submitBtn_Click(object sender, EventArgs e)
    {
        if (paymentMethod.SelectedValue == "credit card")
        {
            if (string.IsNullOrWhiteSpace(ccNumber.Text) || string.IsNullOrWhiteSpace(expiryDate.Text) || string.IsNullOrWhiteSpace(cvv.Text))
            {
                Response.Write("<script>alert('Please fill out all credit card fields.');</script>");
                return;
            }
        }
        else if (paymentMethod.SelectedValue == "wallet")
        {
            if (string.IsNullOrWhiteSpace(phoneNumber.Text))
            {
                Response.Write("<script>alert('Please fill out the phone number field.');</script>");
                return;
            }
        }
        string updateQuery = "UPDATE [Bill] SET [status] = @status, [paid_on] = GETDATE() WHERE [request_id] = @billId";
        SqlCommand command = new SqlCommand(updateQuery);
        command.Parameters.AddWithValue("@status", "Paid");
        command.Parameters.AddWithValue("@billId", SessionState.getActiveRequestid());
        Database.executeNonQuery(command);
        Response.Redirect("~/S1_SubmitIssuance.aspx");


        //string connectionString = "YourConnectionString";
        //using (SqlConnection connection = new SqlConnection(connectionString))
        //{
        //    connection.Open();
        //    string updateQuery = "UPDATE [Bill] SET [status] = @status, [paid_on] = GETDATE() WHERE [request_id] = @billId";
        //    using (SqlCommand command = new SqlCommand(updateQuery, connection))
        //    {
        //        command.Parameters.AddWithValue("@status", "Paid");
        //        command.Parameters.AddWithValue("@billId", SessionState.getActiveRequestid());

        //        command.ExecuteNonQuery();
        //    }
        //}
        //Response.Redirect(Request.RawUrl);
    }


    protected void method_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (paymentMethod.SelectedValue == "credit card")
        {
            creditCardFields.Style["display"] = "block";
            walletField.Style["display"] = "none";
        }
        else if (paymentMethod.SelectedValue == "wallet")
        {
            creditCardFields.Style["display"] = "none";
            walletField.Style["display"] = "block";
        }
        else
        {
            creditCardFields.Style["display"] = "none";
            walletField.Style["display"] = "none";
        }
    }

}