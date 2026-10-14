using System;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Style_On_Rent.Admin
{
    public partial class AddCholi : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            UnobtrusiveValidationMode = System.Web.UI.UnobtrusiveValidationMode.None;

            if (!IsPostBack)
            {
                LoadCategories();
            }
        }

        private void LoadCategories()
        {
            ddlCategory.Items.Clear();
            ddlCategory.Items.Add(new ListItem("-- Select Category --", "0"));
            ddlCategory.Items.Add(new ListItem("Blush Floral Applique", "1"));
            ddlCategory.Items.Add(new ListItem("Emerald Zardosi", "2"));
            ddlCategory.Items.Add(new ListItem("Navy Blue Velvet", "3"));
            ddlCategory.Items.Add(new ListItem("Ivory Chikankari Collection", "4"));
            ddlCategory.Items.Add(new ListItem("Mustard Yellow Mirror Work", "5"));
            ddlCategory.Items.Add(new ListItem("The Bridal Collection", "6"));
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("CholiInventory.aspx");
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            Page.Validate("AddCholiGroup");
            if (!Page.IsValid) return;

            int categoryId = 0;
            if (!int.TryParse(ddlCategory.SelectedValue, out categoryId) || categoryId <= 0)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alert",
                    "alert('Please select a valid Category!');", true);
                return;
            }

            ClientScript.RegisterStartupScript(this.GetType(), "saved",
                "alert('Choli Item Saved Successfully (Static Mode)!'); window.location='CholiInventory.aspx';",
                true);
        }
    }
}