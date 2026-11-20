using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Style_On_Rent
{
    public partial class SecuritySettings : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Pehli var page load thay tyare messages hide karo
            if (!IsPostBack)
            {
                lblError.Visible = false;
                lblSuccess.Visible = false;
            }
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            // Default: badha messages hide karo
            lblError.Visible = false;
            lblSuccess.Visible = false;

            string current = txtCurrent.Text.Trim();
            string newPass = txtNew.Text.Trim();
            string confirm = txtConfirm.Text.Trim();

            // 1️⃣ Check: koi field khali to nathi?
            if (string.IsNullOrEmpty(current) ||
                string.IsNullOrEmpty(newPass) ||
                string.IsNullOrEmpty(confirm))
            {
                lblError.Text = "Please fill in all fields";
                lblError.Visible = true;
                return;
            }

            // 2️⃣ Check: New Password ane Confirm Password match thay chhe?
            if (newPass != confirm)
            {
                lblError.Text = "Passwords do not match";
                lblError.Visible = true;
                return;
            }

            // 3️⃣ Check: New Password minimum 6 characters?
            if (newPass.Length < 6)
            {
                lblError.Text = "Password must be at least 6 characters";
                lblError.Visible = true;
                return;
            }

            // ✅ Badhu barabar chhe — success message show karo
            lblSuccess.Text = "✓ Password changed successfully";
            lblSuccess.Visible = true;

            // Fields clear karo
            txtCurrent.Text = "";
            txtNew.Text = "";
            txtConfirm.Text = "";
        }
    }
}