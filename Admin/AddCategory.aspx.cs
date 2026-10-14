using System;
using System.IO;
using System.Web.UI;

namespace Style_On_Rent.Admin
{
    public partial class AddCategory : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            UnobtrusiveValidationMode = System.Web.UI.UnobtrusiveValidationMode.None;

            if (!IsPostBack)
            {
                // Page pehli vaar load thay tyare — kai karvanu nathi
            }
        }

        protected void btnSaveCategory_Click(object sender, EventArgs e)
        {
            if (!Page.IsValid) return;

            string categoryName = txtCategoryName.Text.Trim();
            string description = txtDescription.Text.Trim();
            string status = ddlStatus.SelectedValue;

            // Image upload (optional)
            if (fuCategoryMedia.HasFiles)
            {
                string folderPath = Server.MapPath("~/Images/Categories/");
                if (!Directory.Exists(folderPath))
                    Directory.CreateDirectory(folderPath);

                foreach (var file in fuCategoryMedia.PostedFiles)
                {
                    string safeName = Path.GetFileName(file.FileName);
                    file.SaveAs(Path.Combine(folderPath, safeName));
                }
            }

            // TODO: DB insert ahiya karo

            // Success alert + redirect
            string safeName2 = categoryName.Replace("'", "\\'").Replace("\"", "\\\"");
            string script = "alert('Category \\\"" + safeName2 + "\\\" successfully saved!'); " +
                            "window.location='CholiCategories.aspx';";
            ClientScript.RegisterStartupScript(this.GetType(), "saveSuccess", script, true);
        }
    }
}