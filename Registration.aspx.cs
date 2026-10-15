using System;
using System.Web.UI;

namespace style
{
    public partial class Registration : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            this.UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;
        }

        protected void btnJoinNow_Click(object sender, EventArgs e)
        {
            Page.Validate("SignupGroup");

            if (!Page.IsValid)
            {
                return;
            }

            if (!chkTerms.Checked)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "termsAlert", "alert('Please agree to the Terms of Service and Privacy Policy.');", true);
                return;
            }

            string fullName = txtFullName.Text.Trim();
            string email = txtEmail.Text.Trim();
            string password = txtPassword.Text.Trim();

            ClientScript.RegisterStartupScript(this.GetType(), "signupSuccess", "alert('Account created successfully!'); window.location='login.aspx';", true);
        }
    }
}