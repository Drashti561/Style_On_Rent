using System;
using System.Web.UI;

namespace StyleOnRent
{
    public partial class VerifyResetOTP : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void btnVerify_Click(object sender, EventArgs e)
        {
            Page.Validate("Verify");

            if (Page.IsValid)
            {
                // OTP verification પછી આગળના page પર જવા માટે
                Response.Redirect("ResetPassword.aspx");
            }
        }

        protected void lnkResend_Click(object sender, EventArgs e)
        {
            lblMessage.ForeColor =
                System.Drawing.Color.Green;

            lblMessage.Text =
                "Please request a new OTP.";
        }
    }
}