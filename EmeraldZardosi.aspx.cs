using System;
using System.Collections.Generic;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Style_On_Rent
{
    public partial class EmeraldZardosi : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e) { }

        protected void AddToCart_Click(object sender, EventArgs e)
        {
            LinkButton btn = (LinkButton)sender;
            string item = btn.CommandArgument;

            List<string> cart = Session["Cart"] as List<string>;
            if (cart == null) cart = new List<string>();
            if (!cart.Contains(item)) cart.Add(item);
            Session["Cart"] = cart;

            Response.Redirect("RentalCart.aspx");
        }

        protected void AddToWishlist_Click(object sender, EventArgs e)
        {
            LinkButton btn = (LinkButton)sender;
            string item = btn.CommandArgument;

            List<string> wishlist = Session["Wishlist"] as List<string>;
            if (wishlist == null) wishlist = new List<string>();
            if (!wishlist.Contains(item)) wishlist.Add(item);
            Session["Wishlist"] = wishlist;

            Response.Redirect("Wishlist.aspx");
        }
    }
}