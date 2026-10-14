using System;
using System.IO;
using System.Web.UI;

namespace Style_On_Rent.Admin
{
    public partial class WebsiteSetting : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadSettings();
            }

            // File upload handle (onchange thi submit thay)
            if (fuMainLogo.HasFile) SaveMainLogo();
            if (fuFavicon.HasFile) SaveFavicon();
        }

        private void LoadSettings()
        {
            // TODO: DB thi load karo. Ahiya demo data.
            txtSiteName.Text = "Style On Rent";
            txtTagline.Text = "Premium Ethnic Wear on Rent";
            txtBusinessEmail.Text = "contact@styleonrent.com";
            txtSupportPhone.Text = "+91 98765 43210";
        }

        protected void btnSaveGeneral_Click(object sender, EventArgs e)
        {
            // TODO: DB ma save karo
            ShowSuccess("General settings saved successfully!");
        }

        protected void btnSaveBranding_Click(object sender, EventArgs e)
        {
            // TODO: DB ma save karo
            ShowSuccess("Branding settings saved successfully!");
        }

        private void SaveMainLogo()
        {
            string folder = Server.MapPath("~/Images/");
            if (!Directory.Exists(folder)) Directory.CreateDirectory(folder);

            string fileName = Path.GetFileName(fuMainLogo.FileName);
            fuMainLogo.SaveAs(Path.Combine(folder, fileName));
            imgCurrentLogo.ImageUrl = "~/Images/" + fileName;

            ShowSuccess("Logo uploaded successfully!");
        }

        private void SaveFavicon()
        {
            string folder = Server.MapPath("~/Images/");
            if (!Directory.Exists(folder)) Directory.CreateDirectory(folder);

            string fileName = Path.GetFileName(fuFavicon.FileName);
            fuFavicon.SaveAs(Path.Combine(folder, fileName));

            ShowSuccess("Favicon uploaded successfully!");
        }

        private void ShowSuccess(string msg)
        {
            litAlertMessage.Text = msg;
            pnlSuccessAlert.Visible = true;
        }
    }
}