using System;
using System.Web.UI;

namespace StyleOnRent
{
    public partial class ResetPassword : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void btnResetPassword_Click(object sender, EventArgs e)
        {
            Page.Validate("Reset");

            if (Page.IsValid)
            {
                string newPassword = txtNewPassword.Text.Trim();

                // Password validation successful
                lblMessage.ForeColor =
                    System.Drawing.Color.Green;

                lblMessage.Text =
                    "Password reset successful! Please login.";

                // Login page પર જવા માટે
                Response.Redirect("Login.aspx");
            }
        }
    }
}