
using System;
using System.Web.UI;

namespace StyleOnRent
{
    public partial class ForgotPassword : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void btnSendOTP_Click(object sender, EventArgs e)
        {
            Page.Validate("ForgotPassword");

            if (Page.IsValid)
            {
                // Get email entered by user
                string email = txtEmail.Text.Trim();

                // Store email in Session
                Session["PasswordResetEmail"] = email;

                // Generate a random 4-digit OTP
                Random random = new Random();

                string otp = random.Next(1000, 10000).ToString();

                // Store OTP in Session
                Session["PasswordResetOTP"] = otp;

                // Reset verification status
                Session["IsPasswordResetVerified"] = false;

                // Redirect to OTP verification page
                Response.Redirect("VerifyResetOTP.aspx");
            }
            else
            {
                lblMessage.ForeColor =
                    System.Drawing.Color.Red;

                lblMessage.Text =
                    "Please enter a valid email address.";
            }
        }
    }
}