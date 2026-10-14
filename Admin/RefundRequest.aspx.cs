using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Style_On_Rent.Admin
{
    public partial class RefundRequest : System.Web.UI.Page
    {
        // In-memory list — DB hoy tyare replace karo
        private static List<Refund> _refunds = new List<Refund>
        {
            new Refund { Id=1, RequestId="REF-3001", Customer="Aarti Joshi",  Initials="AJ", AvatarClass="av-aj",
                         OrderId="ORD-1001", RefundAmount=1200, Reason="Wrong size delivered",
                         RequestDate="2026-10-12", Status="Pending" },

            new Refund { Id=2, RequestId="REF-3002", Customer="Rahul Mehta",  Initials="RM", AvatarClass="av-rm",
                         OrderId="ORD-1002", RefundAmount=800,  Reason="Damaged fabric on arrival",
                         RequestDate="2026-10-13", Status="Approved" },

            new Refund { Id=3, RequestId="REF-3003", Customer="Sneha Kapoor", Initials="SK", AvatarClass="av-sk",
                         OrderId="ORD-1003", RefundAmount=2400, Reason="Order cancelled before dispatch",
                         RequestDate="2026-10-14", Status="Pending" },

            new Refund { Id=4, RequestId="REF-3004", Customer="Vikram Kumar", Initials="VK", AvatarClass="av-vk",
                         OrderId="ORD-1004", RefundAmount=500,  Reason="Late delivery - partial refund",
                         RequestDate="2026-10-15", Status="Rejected" },

            new Refund { Id=5, RequestId="REF-3005", Customer="Priya Sharma", Initials="PS", AvatarClass="av-ps",
                         OrderId="ORD-1005", RefundAmount=1800, Reason="Color mismatch with listing",
                         RequestDate="2026-10-16", Status="Approved" }
        };

        protected void Page_Load(object sender, EventArgs e)
        {
            UnobtrusiveValidationMode = System.Web.UI.UnobtrusiveValidationMode.None;

            if (!IsPostBack)
            {
                BindRefunds();
                UpdateMetrics();
            }
        }

        private void BindRefunds()
        {
            var list = GetRefunds();

            string search = txtSearchRefund != null ? txtSearchRefund.Text.Trim().ToLower() : "";
            if (!string.IsNullOrEmpty(search))
            {
                list = list.Where(r =>
                    (r.RequestId ?? "").ToLower().Contains(search) ||
                    (r.Customer ?? "").ToLower().Contains(search) ||
                    (r.OrderId ?? "").ToLower().Contains(search)).ToList();
            }

            rptRefunds.DataSource = list;
            rptRefunds.DataBind();

            litShowingText.Text = "Showing 1-" + list.Count + " of " + list.Count + " requests";
        }

        private List<Refund> GetRefunds() { return _refunds; }

        private void UpdateMetrics()
        {
            litTotalRequests.Text = _refunds.Count.ToString();
        }

        public string GetStatusBadgeClass(string status)
        {
            switch ((status ?? "").Trim().ToLower())
            {
                case "approved": return "status-approved";
                case "rejected": return "status-rejected";
                case "pending": return "status-pending";
                default: return "";
            }
        }

        protected void txtSearchRefund_TextChanged(object sender, EventArgs e)
        {
            BindRefunds();
            upnlRefund.Update();
        }

        protected void rptRefunds_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            int id;
            if (!int.TryParse(Convert.ToString(e.CommandArgument), out id)) return;

            switch (e.CommandName)
            {
                case "ViewRefund": OpenViewModal(id); break;
                case "EditRefund": OpenEditModal(id); break;
                case "DeleteRefund": OpenDeleteModal(id); break;
            }
        }

        // ---------- VIEW ----------
        private void OpenViewModal(int id)
        {
            var r = _refunds.FirstOrDefault(x => x.Id == id);
            if (r == null) return;

            litViewReqId.Text = r.RequestId;
            litViewCustomer.Text = r.Customer;
            litViewOrderId.Text = r.OrderId;
            litViewAmount.Text = r.RefundAmount.ToString("N0");
            litViewStatus.Text = r.Status;
            litViewDate.Text = r.RequestDate;
            litViewReason.Text = r.Reason;

            pnlViewModal.Visible = true;
            pnlEditModal.Visible = false;
            pnlDeleteModal.Visible = false;
            upnlRefund.Update();
        }

        protected void btnCloseView_Click(object sender, EventArgs e)
        {
            pnlViewModal.Visible = false;
            upnlRefund.Update();
        }

        // ---------- EDIT ----------
        private void OpenEditModal(int id)
        {
            var r = _refunds.FirstOrDefault(x => x.Id == id);
            if (r == null) return;

            hfEditRefundId.Value = r.Id.ToString();
            txtEditReqId.Text = r.RequestId;
            txtEditOrderId.Text = r.OrderId;
            txtEditCustomer.Text = r.Customer;
            txtEditAmount.Text = r.RefundAmount.ToString();
            ddlEditStatus.SelectedValue = r.Status;
            txtEditReason.Text = r.Reason;

            pnlEditModal.Visible = true;
            pnlViewModal.Visible = false;
            pnlDeleteModal.Visible = false;
            upnlRefund.Update();
        }

        protected void btnCancelEdit_Click(object sender, EventArgs e)
        {
            pnlEditModal.Visible = false;
            upnlRefund.Update();
        }

        protected void btnSaveEdit_Click(object sender, EventArgs e)
        {
            int id;
            if (!int.TryParse(hfEditRefundId.Value, out id)) return;

            var r = _refunds.FirstOrDefault(x => x.Id == id);
            if (r == null) return;

            r.Customer = txtEditCustomer.Text.Trim();
            decimal amt;
            if (decimal.TryParse(txtEditAmount.Text, out amt)) r.RefundAmount = amt;
            r.Status = ddlEditStatus.SelectedValue;
            r.Reason = txtEditReason.Text.Trim();

            pnlEditModal.Visible = false;
            BindRefunds();
            UpdateMetrics();
            upnlRefund.Update();
        }

        // ---------- DELETE ----------
        private void OpenDeleteModal(int id)
        {
            var r = _refunds.FirstOrDefault(x => x.Id == id);
            if (r == null) return;

            hfDeleteRefundId.Value = r.Id.ToString();
            litDeleteTargetReq.Text = r.RequestId;

            pnlDeleteModal.Visible = true;
            pnlViewModal.Visible = false;
            pnlEditModal.Visible = false;
            upnlRefund.Update();
        }

        protected void btnCancelDelete_Click(object sender, EventArgs e)
        {
            pnlDeleteModal.Visible = false;
            upnlRefund.Update();
        }

        protected void btnConfirmDelete_Click(object sender, EventArgs e)
        {
            int id;
            if (int.TryParse(hfDeleteRefundId.Value, out id))
            {
                var r = _refunds.FirstOrDefault(x => x.Id == id);
                if (r != null) _refunds.Remove(r);
            }

            pnlDeleteModal.Visible = false;
            BindRefunds();
            UpdateMetrics();
            upnlRefund.Update();
        }

        // ---------- MODEL ----------
        public class Refund
        {
            public int Id { get; set; }
            public string RequestId { get; set; }
            public string Customer { get; set; }
            public string Initials { get; set; }
            public string AvatarClass { get; set; }
            public string OrderId { get; set; }
            public decimal RefundAmount { get; set; }
            public string Reason { get; set; }
            public string RequestDate { get; set; }
            public string Status { get; set; }
        }
    }
}