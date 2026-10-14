using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Style_On_Rent.Admin
{
    public partial class Orders : System.Web.UI.Page
    {
        private static List<Order> _orders = new List<Order>
        {
            new Order { Id=1, OrderId="ORD-1001", CustomerName="Priya Sharma", CustomerContact="9876543210",
                        Initials="PS", AvatarClass="avatar-orange",
                        ItemTitle="Royal Maroon Velvet Choli", ItemCount="1 item",
                        RentalDates="Oct 12 – Oct 15, 2026", TotalAmount=2500, Status="Active" },

            new Order { Id=2, OrderId="ORD-1002", CustomerName="Aarti Patel", CustomerContact="9823456781",
                        Initials="AP", AvatarClass="avatar-maroon",
                        ItemTitle="Navratri Mirror Work Choli", ItemCount="2 items",
                        RentalDates="Oct 14 – Oct 17, 2026", TotalAmount=2400, Status="Pending" },

            new Order { Id=3, OrderId="ORD-1003", CustomerName="Meera Joshi", CustomerContact="9765432109",
                        Initials="MJ", AvatarClass="avatar-blue",
                        ItemTitle="Designer Party Choli", ItemCount="1 item",
                        RentalDates="Oct 05 – Oct 08, 2026", TotalAmount=1800, Status="Returned" },

            new Order { Id=4, OrderId="ORD-1004", CustomerName="Riya Desai", CustomerContact="9712345678",
                        Initials="RD", AvatarClass="avatar-gray",
                        ItemTitle="Silk Embroidered Choli", ItemCount="1 item",
                        RentalDates="Oct 01 – Oct 04, 2026", TotalAmount=3200, Status="Cancelled" }
        };

        protected void Page_Load(object sender, EventArgs e)
        {
            UnobtrusiveValidationMode = System.Web.UI.UnobtrusiveValidationMode.None;

            if (!IsPostBack)
            {
                BindOrders();
            }
        }

        private void BindOrders(string status = "All")
        {
            var list = GetOrders();

            if (!string.IsNullOrEmpty(status) && status != "All")
            {
                list = list.Where(o => o.Status == status).ToList();
            }

            string search = txtOrderSearch != null ? txtOrderSearch.Text.Trim().ToLower() : "";
            if (!string.IsNullOrEmpty(search))
            {
                list = list.Where(o =>
                    (o.OrderId ?? "").ToLower().Contains(search) ||
                    (o.CustomerName ?? "").ToLower().Contains(search) ||
                    (o.ItemTitle ?? "").ToLower().Contains(search)).ToList();
            }

            rptOrders.DataSource = list;
            rptOrders.DataBind();

            pnlNoOrders.Visible = list.Count == 0;
            litShowingOrders.Text = "Showing 1-" + list.Count + " of " + list.Count;

            UpdateTabCounts();
        }

        private List<Order> GetOrders() { return _orders; }

        private void UpdateTabCounts()
        {
            int all = _orders.Count;
            int pending = _orders.Count(o => o.Status == "Pending");
            int active = _orders.Count(o => o.Status == "Active");
            int returned = _orders.Count(o => o.Status == "Returned");
            int cancelled = _orders.Count(o => o.Status == "Cancelled");

            tabAll.Text = "All (" + all + ")";
            tabPending.Text = "Pending (" + pending + ")";
            tabActive.Text = "Active (" + active + ")";
            tabReturned.Text = "Returned (" + returned + ")";
            tabCancelled.Text = "Cancelled (" + cancelled + ")";
        }

        public string GetStatusPillClass(string status)
        {
            switch ((status ?? "").Trim().ToLower())
            {
                case "active": return "status-active";
                case "pending": return "status-pending";
                case "returned": return "status-returned";
                case "cancelled": return "status-cancelled";
                default: return "";
            }
        }

        protected void txtOrderSearch_TextChanged(object sender, EventArgs e)
        {
            string tab = ViewState["CurrentTab"] != null ? ViewState["CurrentTab"].ToString() : "All";
            BindOrders(tab);
            upnlOrders.Update();
        }

        protected void StatusTab_Click(object sender, EventArgs e)
        {
            LinkButton btn = (LinkButton)sender;
            string status = btn.CommandArgument;

            ViewState["CurrentTab"] = status;

            tabAll.CssClass = "tab-btn";
            tabPending.CssClass = "tab-btn";
            tabActive.CssClass = "tab-btn";
            tabReturned.CssClass = "tab-btn";
            tabCancelled.CssClass = "tab-btn";

            btn.CssClass = "tab-btn active";

            BindOrders(status);
            upnlOrders.Update();
        }

        protected void btnSelectDates_Click(object sender, EventArgs e)
        {
            pnlDateModal.Visible = true;
            upnlOrders.Update();
        }

        protected void btnCancelDateModal_Click(object sender, EventArgs e)
        {
            pnlDateModal.Visible = false;
            upnlOrders.Update();
        }

        protected void btnApplyDateFilter_Click(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(txtStartDate.Text) && !string.IsNullOrEmpty(txtEndDate.Text))
            {
                litSelectedDateText.Text = txtStartDate.Text + " → " + txtEndDate.Text;
                btnClearDateFilter.Visible = true;
            }
            else
            {
                litSelectedDateText.Text = "Select Dates";
                btnClearDateFilter.Visible = false;
            }

            pnlDateModal.Visible = false;
            string tab = ViewState["CurrentTab"] != null ? ViewState["CurrentTab"].ToString() : "All";
            BindOrders(tab);
            upnlOrders.Update();
        }

        protected void btnClearDateFilter_Click(object sender, EventArgs e)
        {
            txtStartDate.Text = "";
            txtEndDate.Text = "";
            litSelectedDateText.Text = "Select Dates";
            btnClearDateFilter.Visible = false;

            string tab = ViewState["CurrentTab"] != null ? ViewState["CurrentTab"].ToString() : "All";
            BindOrders(tab);
            upnlOrders.Update();
        }

        protected void btnNewOrder_Click(object sender, EventArgs e)
        {
            Response.Redirect("AddOrder.aspx");
        }

        protected void rptOrders_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            int id;
            if (!int.TryParse(Convert.ToString(e.CommandArgument), out id)) return;

            switch (e.CommandName)
            {
                case "ApproveOrder":
                    {
                        var o = _orders.FirstOrDefault(x => x.Id == id);
                        if (o != null) o.Status = "Active";
                        string tab = ViewState["CurrentTab"] != null ? ViewState["CurrentTab"].ToString() : "All";
                        BindOrders(tab);
                        upnlOrders.Update();
                        break;
                    }
                case "CancelOrder":
                    {
                        var o = _orders.FirstOrDefault(x => x.Id == id);
                        if (o != null) o.Status = "Cancelled";
                        string tab = ViewState["CurrentTab"] != null ? ViewState["CurrentTab"].ToString() : "All";
                        BindOrders(tab);
                        upnlOrders.Update();
                        break;
                    }
            }
        }

        public class Order
        {
            public int Id { get; set; }
            public string OrderId { get; set; }
            public string CustomerName { get; set; }
            public string CustomerContact { get; set; }
            public string Initials { get; set; }
            public string AvatarClass { get; set; }
            public string ItemTitle { get; set; }
            public string ItemCount { get; set; }
            public string RentalDates { get; set; }
            public decimal TotalAmount { get; set; }
            public string Status { get; set; }
        }
    }
}