using System;
using System.Web.UI;

namespace Style_On_Rent.Admin
{
    public partial class Admin_Dashboard : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            this.UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;

            if (!IsPostBack)
            {
                // 1. Static Summary Metrics
                lblTotalRevenue.Text = "₹1,24,500";
                lblActiveRentals.Text = "18";
                lblTotalCustomers.Text = "142";
                lblPendingReturns.Text = "6";

                // 2. Chart.js Data (Last 6 Months)
                hfChartLabels.Value = "May,Jun,Jul,Aug,Sep,Oct";
                hfChartData.Value = "14000,22000,18500,28000,19500,22500";
            }
        }
    }
}