using System;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Style_On_Rent.Admin
{
    public partial class AddOffer : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            UnobtrusiveValidationMode = System.Web.UI.UnobtrusiveValidationMode.None;

            if (!IsPostBack)
            {
                txtStartDate.Text = DateTime.Today.ToString("yyyy-MM-dd");
                txtEndDate.Text = DateTime.Today.AddDays(30).ToString("yyyy-MM-dd");
            }
        }

        protected void cvDateRange_ServerValidate(object source, ServerValidateEventArgs args)
        {
            DateTime start, end;
            if (DateTime.TryParse(txtStartDate.Text, out start) &&
                DateTime.TryParse(txtEndDate.Text, out end))
            {
                args.IsValid = (end >= start);
            }
            else
            {
                args.IsValid = false;
            }
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Admin/Offers.aspx");
        }

        protected void btnSaveOffer_Click(object sender, EventArgs e)
        {
            Page.Validate("NewOfferGroup");
            if (!Page.IsValid) return;

            // TODO: DB insert ahiya karo

            ClientScript.RegisterStartupScript(
                this.GetType(),
                "offerSaved",
                "alert('Offer saved successfully!'); window.location='Offers.aspx';",
                true
            );
        }
    }
}