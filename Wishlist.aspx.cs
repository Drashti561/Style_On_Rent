using System;
using System.Collections.Generic;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Style_On_Rent
{
    public partial class Wishlist : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindWishlist();
            }
        }

        private void BindWishlist()
        {
            List<string> wishlist = Session["Wishlist"] as List<string>;

            if (wishlist == null || wishlist.Count == 0)
            {
                pnlEmpty.Visible = true;
                pnlWishlist.Visible = false;
                return;
            }

            pnlEmpty.Visible = false;
            pnlWishlist.Visible = true;

            List<CartItem> items = new List<CartItem>();

            foreach (string key in wishlist)
            {
                CartItem ci = RentalCart.GetProductByKey(key);
                if (ci != null)
                {
                    items.Add(ci);
                }
            }

            rptWishlist.DataSource = items;
            rptWishlist.DataBind();
        }

        protected void rptWishlist_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            string key = e.CommandArgument.ToString();

            if (e.CommandName == "Remove")
            {
                List<string> wishlist = Session["Wishlist"] as List<string>;
                if (wishlist == null) wishlist = new List<string>();

                wishlist.Remove(key);
                Session["Wishlist"] = wishlist;
                BindWishlist();
            }
            else if (e.CommandName == "MoveToCart")
            {
                // 1. Wishlist ma thi kadho
                List<string> wishlist = Session["Wishlist"] as List<string>;
                if (wishlist == null) wishlist = new List<string>();

                wishlist.Remove(key);
                Session["Wishlist"] = wishlist;

                // 2. Cart ma add karo
                List<string> cart = Session["Cart"] as List<string>;
                if (cart == null) cart = new List<string>();

                if (!cart.Contains(key))
                    cart.Add(key);

                Session["Cart"] = cart;

                // ✅ 3. RentalCart.aspx par redirect karo
                Response.Redirect("RentalCart.aspx");
            }
        }
    }
}