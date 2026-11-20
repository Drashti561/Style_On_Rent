using System;
using System.Web.UI;

namespace Style_On_Rent
{
    public partial class ShoppingDetails : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Call method to load order summaries/product info from query string, session, or database
                LoadOrderSummary();
            }
        }

        private void LoadOrderSummary()
        {
            // Sample placeholder binding implementation
            // lblProductName.Text = "Designer Lehenga";
            // lblColor.Text = "Maroon";
            // lblPrice.Text = "₹4,500.00";
            // lblSubtotal.Text = "₹4,500.00";
            // lblTotal.Text = "₹4,500.00";
            // imgProduct.ImageUrl = "~/Images/product-placeholder.jpg";
        }

        protected void btnPlaceOrder_Click(object sender, EventArgs e)
        {
            // Triggers and validates all ASP.NET validators on the page
            if (Page.IsValid)
            {
                string fullName = txtFullName.Text.Trim();
                string email = txtEmail.Text.Trim();
                string address = txtAddress.Text.Trim();
                string city = txtCity.Text.Trim();
                string postalCode = txtPostalCode.Text.Trim();
                string phone = txtPhone.Text.Trim();

                // TODO: Save order and shipping info to your database here

                // Redirect upon success
                Response.Redirect("OrderConfirmed.aspx", false);
                Context.ApplicationInstance.CompleteRequest();
            }
        }
    }
}