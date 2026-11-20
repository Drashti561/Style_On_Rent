using System;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Style_On_Rent
{
    public partial class ViewDetails : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadProductDetails();
            }
        }

        private void LoadProductDetails()
        {
            // Default Values
            string img = "Images/choli1.jpg";
            string name = "Mustard Yellow Lehanga";
            string color = "Yellow";
            string price = "₹4,500";

            string item = Request.QueryString["item"];

            if (!string.IsNullOrEmpty(item))
            {
                switch (item.ToLower())
                {
                    case "mustard":
                        img = "Images/yellow.jfif";
                        name = "Mustard Yellow Choli";
                        color = "Yellow";
                        price = "₹4,500";
                        break;

                    case "navy":
                        img = "Images/choli2.jpg";
                        name = "Navy Blue Velvet Choli";
                        color = "Navy Blue";
                        price = "₹5,000";
                        break;

                    case "ivory":
                        img = "Images/choli3.jpg";
                        name = "Ivory Chikankari Set";
                        color = "Ivory";
                        price = "₹4,800";
                        break;

                    case "emerald":
                        img = "Images/choli4.jpg";
                        name = "Emerald Zardozi Lehanga";
                        color = "Emerald Green";
                        price = "₹4,600";
                        break;

                    case "blush":
                        img = "Images/choli5.jpg";
                        name = "Blush Floral Designer Choli";
                        color = "Blush Pink";
                        price = "₹5,200";
                        break;

                    case "bridalred":
                        img = "Images/choli6.jpg";
                        name = "Classic Bridal Red Lehanga";
                        color = "Red";
                        price = "₹4,900";
                        break;
                }
            }

            // Assign values to UI controls
            imgProduct.ImageUrl = img;
            lblProductName.Text = name;
            lblColor.Text = color;
            lblPrice.Text = price;
            lblBreadcrumb.Text = name;
        }

        protected void btnRentNow_Click(object sender, EventArgs e)
        {
            // Redirect to Checkout (ShoppingDetails.aspx) with selected item & size
            string currentItem = Request.QueryString["item"];
            if (string.IsNullOrEmpty(currentItem))
            {
                currentItem = "mustard";
            }

            string selectedSize = ddlSize.SelectedValue;

            // Pass item and size parameter to ShoppingDetails page
            Response.Redirect("ShoppingDetails.aspx?item=" + currentItem + "&size=" + selectedSize);
        }
    }
}