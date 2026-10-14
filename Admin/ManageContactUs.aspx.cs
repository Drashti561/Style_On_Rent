using System;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Style_On_Rent.Admin
{
    public partial class ManageContactUs : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            UnobtrusiveValidationMode = System.Web.UI.UnobtrusiveValidationMode.None;

            if (!IsPostBack)
            {
                LoadContactContent();
            }
        }

        private void LoadContactContent()
        {
            // TODO: DB thi load karo
            // Demo data:
            txtBusinessPhone.Text = "+91 98765 43210";
            txtSecondaryPhone.Text = "";
            txtWhatsappNumber.Text = "+91 98765 43210";
            txtBusinessEmail.Text = "hello@styleonrent.com";
            txtInstagramUrl.Text = "https://instagram.com/styleonrent";
            txtFacebookUrl.Text = "https://facebook.com/styleonrent";
            txtStoreAddress.Text = "123 Heritage Lane, Silk District, Mumbai, Maharashtra 400001";
        }

        protected void btnSaveAllChanges_Click(object sender, EventArgs e)
        {
            string businessPhone = txtBusinessPhone.Text.Trim();
            string secondaryPhone = txtSecondaryPhone.Text.Trim();
            string whatsapp = txtWhatsappNumber.Text.Trim();
            string email = txtBusinessEmail.Text.Trim();
            string instagram = txtInstagramUrl.Text.Trim();
            string facebook = txtFacebookUrl.Text.Trim();
            string address = txtStoreAddress.Text.Trim();
            bool emailNotify = chkEmailNotifications.Checked;
            bool autoReply = chkAutoReply.Checked;

            // TODO: DB save ahiya karo

            pnlAlertSuccess.Visible = true;
            upnlContactUs.Update();
        }
    }
}