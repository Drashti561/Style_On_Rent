using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Style_On_Rent
{
    public partial class DeliveryDetails : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void btnNext_Click(object sender, EventArgs e)
        {
            string item = Request.QueryString["item"];

            if (!string.IsNullOrEmpty(item))
            {
                Response.Redirect("ShoppingDetails.aspx?item=" + item);
            }
            else
            {
                Response.Redirect("ShoppingDetails.aspx");
            }
        }
    }
}