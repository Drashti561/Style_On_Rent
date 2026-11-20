using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Style_On_Rent
{
    public partial class RentalCart : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindCart();
            }
        }

        private void BindCart()
        {
            List<string> cart = Session["Cart"] as List<string>;

            if (cart == null || cart.Count == 0)
            {
                pnlEmpty.Visible = true;
                pnlCart.Visible = false;
                return;
            }

            pnlEmpty.Visible = false;
            pnlCart.Visible = true;

            List<CartItem> items = new List<CartItem>();
            decimal total = 0;

            foreach (string key in cart)
            {
                CartItem ci = GetProductByKey(key);
                if (ci != null)
                {
                    items.Add(ci);
                    total += ci.PriceValue;
                }
            }

            rptCart.DataSource = items;
            rptCart.DataBind();

            lblSubtotal.Text = "₹" + total.ToString("N0");
            lblTotal.Text = "₹" + total.ToString("N0");
        }

        protected void rptCart_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName == "Remove")
            {
                string key = e.CommandArgument.ToString();

                List<string> cart = Session["Cart"] as List<string>;
                if (cart != null)
                {
                    cart.Remove(key);
                    Session["Cart"] = cart;
                }

                BindCart();
            }
        }

        public static CartItem GetProductByKey(string key)
        {
            switch (key)
            {
                // Page 2 - Bridal
                case "bridal_1": return new CartItem { ItemKey = "bridal_1", Name = "Classic Red Bridal Lehenga", Image = "Images/AAA.jfif", Price = "₹4,500", PriceValue = 4500 };
                case "bridal_2": return new CartItem { ItemKey = "bridal_2", Name = "Royal Maroon Bridal Lehenga", Image = "Images/BBB.jfif", Price = "₹5,000", PriceValue = 5000 };
                case "bridal_3": return new CartItem { ItemKey = "bridal_3", Name = "Pink Embroidered Bridal Lehenga", Image = "Images/CCC.jfif", Price = "₹4,800", PriceValue = 4800 };
                case "bridal_4": return new CartItem { ItemKey = "bridal_4", Name = "Traditional Green Bridal Lehenga", Image = "Images/DDD.jfif", Price = "₹4,600", PriceValue = 4600 };
                case "bridal_5": return new CartItem { ItemKey = "bridal_5", Name = "Designer Red Bridal Lehenga", Image = "Images/EEE.jfif", Price = "₹5,200", PriceValue = 5200 };
                case "bridal_6": return new CartItem { ItemKey = "bridal_6", Name = "Elegant Beige Bridal Lehenga", Image = "Images/FFF.jfif", Price = "₹4,900", PriceValue = 4900 };

                // Page 3 - Blush Floral
                case "blush_1": return new CartItem { ItemKey = "blush_1", Name = "Rose Quartz Floral Lehenga", Image = "Images/Blush_1.jfif", Price = "₹4,500", PriceValue = 4500 };
                case "blush_2": return new CartItem { ItemKey = "blush_2", Name = "Petal Pink Organza Lehenga", Image = "Images/Blush_2.jfif", Price = "₹4,800", PriceValue = 4800 };
                case "blush_3": return new CartItem { ItemKey = "blush_3", Name = "Blush Shimmer Lehenga", Image = "Images/Blush_3.jfif", Price = "₹4,700", PriceValue = 4700 };
                case "blush_4": return new CartItem { ItemKey = "blush_4", Name = "Rose Gold Draped Lehenga", Image = "Images/Blush_4.jfif", Price = "₹4,600", PriceValue = 4600 };
                case "blush_5": return new CartItem { ItemKey = "blush_5", Name = "Classic Blush Floral Lehenga", Image = "Images/Blush_5.jfif", Price = "₹4,900", PriceValue = 4900 };
                case "blush_6": return new CartItem { ItemKey = "blush_6", Name = "The Aura Floral Ensemble", Image = "Images/Blush_6.jfif", Price = "₹5,000", PriceValue = 5000 };

                // Page 4 - Emerald
                case "emerald_1": return new CartItem { ItemKey = "emerald_1", Name = "The Royal Velvet", Image = "Images/Emerald_1.jfif", Price = "₹5,499", PriceValue = 5499 };
                case "emerald_2": return new CartItem { ItemKey = "emerald_2", Name = "Mughal Emerald", Image = "Images/Emerald_2.jfif", Price = "₹4,899", PriceValue = 4899 };
                case "emerald_3": return new CartItem { ItemKey = "emerald_3", Name = "Emerald Zardosi Detail", Image = "Images/Emerald_3.jfif", Price = "₹3,999", PriceValue = 3999 };
                case "emerald_4": return new CartItem { ItemKey = "emerald_4", Name = "Teal Bridal Silk", Image = "Images/Emerald_4.jfif", Price = "₹4,599", PriceValue = 4599 };
                case "emerald_5": return new CartItem { ItemKey = "emerald_5", Name = "Midnight Embroidered", Image = "Images/Emerald_5.jfif", Price = "₹5,199", PriceValue = 5199 };
                case "emerald_6": return new CartItem { ItemKey = "emerald_6", Name = "Emerald Heritage", Image = "Images/Emerald_6.jfif", Price = "₹4,799", PriceValue = 4799 };

                // Page 5 - Pearl
                case "pearl_1": return new CartItem { ItemKey = "pearl_1", Name = "Ivory Pearl Couture", Image = "Images/Pearl_1.jfif", Price = "₹5,999", PriceValue = 5999 };
                case "pearl_2": return new CartItem { ItemKey = "pearl_2", Name = "Pearl Mahal Ensemble", Image = "Images/Pearl_2.jfif", Price = "₹5,499", PriceValue = 5499 };
                case "pearl_3": return new CartItem { ItemKey = "pearl_3", Name = "Champagne Pearl Lehenga", Image = "Images/Pearl_3.jfif", Price = "₹5,799", PriceValue = 5799 };
                case "pearl_4": return new CartItem { ItemKey = "pearl_4", Name = "Blush Pearl Embroidery", Image = "Images/Pearl_4.jfif", Price = "₹4,999", PriceValue = 4999 };
                case "pearl_5": return new CartItem { ItemKey = "pearl_5", Name = "Ivory Zari Elegance", Image = "Images/Pearl_5.jfif", Price = "₹5,699", PriceValue = 5699 };
                case "pearl_6": return new CartItem { ItemKey = "pearl_6", Name = "Pearl Bridal Choli", Image = "Images/Pearl_6.jfif", Price = "₹5,299", PriceValue = 5299 };

                // Page 6 - Navy
                case "navy_1": return new CartItem { ItemKey = "navy_1", Name = "Royal Midnight Lehenga", Image = "Images/Navy_1.jfif", Price = "₹5,499", PriceValue = 5499 };
                case "navy_2": return new CartItem { ItemKey = "navy_2", Name = "Blue Zari Floral Lehenga", Image = "Images/Navy_2.jfif", Price = "₹4,899", PriceValue = 4899 };
                case "navy_3": return new CartItem { ItemKey = "navy_3", Name = "Navy Blue Regal Ensemble", Image = "Images/Navy_3.jfif", Price = "₹5,299", PriceValue = 5299 };
                case "navy_4": return new CartItem { ItemKey = "navy_4", Name = "Traditional Navy Silk", Image = "Images/Navy_4.jfif", Price = "₹4,799", PriceValue = 4799 };
                case "navy_5": return new CartItem { ItemKey = "navy_5", Name = "Royal Blue Heritage", Image = "Images/Navy_5.jfif", Price = "₹5,199", PriceValue = 5199 };
                case "navy_6": return new CartItem { ItemKey = "navy_6", Name = "Midnight Blue Work", Image = "Images/Navy_6.jfif", Price = "₹4,999", PriceValue = 4999 };

                // Page 7 - Mustard
                case "mustard_1": return new CartItem { ItemKey = "mustard_1", Name = "Royal Mustard Bridal Lehenga", Image = "Images/Mustard_1.jfif", Price = "₹5,499", PriceValue = 5499 };
                case "mustard_2": return new CartItem { ItemKey = "mustard_2", Name = "Golden Yellow Zardosi", Image = "Images/Mustard_2.jfif", Price = "₹4,999", PriceValue = 4999 };
                case "mustard_3": return new CartItem { ItemKey = "mustard_3", Name = "Mustard Gold Bridal Ensemble", Image = "Images/Mustard_3.jfif", Price = "₹5,299", PriceValue = 5299 };
                case "mustard_4": return new CartItem { ItemKey = "mustard_4", Name = "Vibrant Yellow Lehenga", Image = "Images/Mustard_4.jfif", Price = "₹4,799", PriceValue = 4799 };
                case "mustard_5": return new CartItem { ItemKey = "mustard_5", Name = "Geometric Goldwork", Image = "Images/Mustard_5.jfif", Price = "₹5,199", PriceValue = 5199 };
                case "mustard_6": return new CartItem { ItemKey = "mustard_6", Name = "Traditional Mustard Gold", Image = "Images/Mustard_6.jfif", Price = "₹4,999", PriceValue = 4999 };
            }
            return null;
        }
    }

    public class CartItem
    {
        public string ItemKey { get; set; }
        public string Name { get; set; }
        public string Image { get; set; }
        public string Price { get; set; }
        public decimal PriceValue { get; set; }
    }
}