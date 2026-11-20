using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Style_On_Rent
{
    public partial class Site1 : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            UpdateCounts();
        }

        private void UpdateCounts()
        {
            // Cart count
            List<string> cart = Session["Cart"] as List<string>;
            int cartCount = (cart == null) ? 0 : cart.Count;

            if (cartCount > 0)
            {
                lblCartCount.Text = cartCount.ToString();
                lblCartCount.Visible = true;
            }
            else
            {
                lblCartCount.Visible = false;
            }

            // Wishlist count
            List<string> wishlist = Session["Wishlist"] as List<string>;
            int wishCount = (wishlist == null) ? 0 : wishlist.Count;

            if (wishCount > 0)
            {
                lblWishCount.Text = wishCount.ToString();
                lblWishCount.Visible = true;
            }
            else
            {
                lblWishCount.Visible = false;
            }
        }
    }
}
