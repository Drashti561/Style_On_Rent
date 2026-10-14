using System;
using System.IO;
using System.Web.UI;

namespace Style_On_Rent.Admin
{
    public partial class Admin_Profile : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadProfile();
            }
        }

        // ---------- LOAD ----------
        private void LoadProfile()
        {
            // TODO: DB thi load karo. Ahiya demo data.
            txtFirstName.Text = "Priya";
            txtLastName.Text = "Sharma";
            txtEmail.Text = "admin@styleonrent.com";
            txtPhone.Text = "+91 98765 43210";
        }

        // ---------- SAVE PROFILE ----------
        protected void btnSaveChanges_Click(object sender, EventArgs e)
        {
            // Optional: profile pic upload
            if (fuProfilePic.HasFile)
            {
                string folder = Server.MapPath("~/Admin/Images/");
                if (!Directory.Exists(folder))
                    Directory.CreateDirectory(folder);

                string fileName = Path.GetFileName(fuProfilePic.FileName);
                string fullPath = Path.Combine(folder, fileName);
                fuProfilePic.SaveAs(fullPath);

                imgProfile.ImageUrl = "Images/" + fileName;
            }

            // TODO: DB ma save karo
            // UPDATE Admins SET FirstName=..., LastName=..., Email=..., Phone=... WHERE Id=...

            ShowAlert("Profile updated successfully!");
        }

        // ---------- UPDATE PASSWORD ----------
        protected void btnUpdatePassword_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrWhiteSpace(txtCurrentPass.Text) ||
                string.IsNullOrWhiteSpace(txtNewPass.Text) ||
                string.IsNullOrWhiteSpace(txtConfirmPass.Text))
            {
                ShowAlert("Please fill all password fields.");
                return;
            }

            if (txtNewPass.Text != txtConfirmPass.Text)
            {
                ShowAlert("New password and confirm password do not match.");
                return;
            }

            // TODO: Verify current password + update in DB

            txtCurrentPass.Text = "";
            txtNewPass.Text = "";
            txtConfirmPass.Text = "";

            ShowAlert("Password updated successfully!");
        }

        // ---------- HELPER ----------
        private void ShowAlert(string message)
        {
            string safe = message.Replace("'", "\\'");
            string script = "alert('" + safe + "');";
            ClientScript.RegisterStartupScript(this.GetType(), "alertMsg", script, true);
        }
    }
}