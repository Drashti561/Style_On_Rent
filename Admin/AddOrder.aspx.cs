using System;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Style_On_Rent.Admin
{
    public partial class AddOrder : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            UnobtrusiveValidationMode = System.Web.UI.UnobtrusiveValidationMode.None;

            if (!IsPostBack)
            {
                txtRentalStart.Text = DateTime.Today.ToString("yyyy-MM-dd");
                txtRentalEnd.Text = DateTime.Today.AddDays(3).ToString("yyyy-MM-dd");
            }
        }

        protected void cvDateRange_ServerValidate(object source, ServerValidateEventArgs args)
        {
            DateTime start, end;
            if (DateTime.TryParse(txtRentalStart.Text, out start) &&
                DateTime.TryParse(txtRentalEnd.Text, out end))
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
            Response.Redirect("Orders.aspx");   // ← Admin/ kadhi nakhyu
        }

        protected void btnSaveOrder_Click(object sender, EventArgs e)
        {
            Page.Validate("AddOrderGroup");
            if (!Page.IsValid) return;

            // TODO: DB insert ahiya karo

            ClientScript.RegisterStartupScript(
                this.GetType(),
                "orderSaved",
                "alert('Order saved successfully!'); window.location='Orders.aspx';",
                true
            );
        }
    }
}