using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Style_On_Rent.Admin
{
    public partial class Payments : System.Web.UI.Page
    {
        private static List<Payment> _payments = new List<Payment>
        {
            new Payment { Id=1, TransactionId="TRX-2001", Customer="Priya Sharma",  CholiType="Royal Maroon Velvet Choli", Amount=2500, Date="2026-10-12", Status="Success" },
            new Payment { Id=2, TransactionId="TRX-2002", Customer="Aarti Patel",   CholiType="Navratri Mirror Work Choli", Amount=2400, Date="2026-10-14", Status="Pending" },
            new Payment { Id=3, TransactionId="TRX-2003", Customer="Meera Joshi",   CholiType="Designer Party Choli",       Amount=1800, Date="2026-10-05", Status="Success" },
            new Payment { Id=4, TransactionId="TRX-2004", Customer="Riya Desai",    CholiType="Silk Embroidered Choli",     Amount=3200, Date="2026-10-01", Status="Failed" }
        };

        protected void Page_Load(object sender, EventArgs e)
        {
            UnobtrusiveValidationMode = System.Web.UI.UnobtrusiveValidationMode.None;

            if (!IsPostBack)
            {
                BindPayments();
                UpdateMetrics();
            }
        }

        private void BindPayments()
        {
            var list = GetPayments();

            string search = txtSearchPayment != null ? txtSearchPayment.Text.Trim().ToLower() : "";
            if (!string.IsNullOrEmpty(search))
            {
                list = list.Where(p =>
                    (p.TransactionId ?? "").ToLower().Contains(search) ||
                    (p.Customer ?? "").ToLower().Contains(search)).ToList();
            }

            rptPayments.DataSource = list;
            rptPayments.DataBind();

            litShowingText.Text = "Showing 1 to " + list.Count + " of " + list.Count + " entries";
        }

        private List<Payment> GetPayments() { return _payments; }

        private void UpdateMetrics()
        {
            decimal total = _payments.Where(p => p.Status == "Success").Sum(p => p.Amount);
            litTotalRevenue.Text = total.ToString("N0");
            litSuccessPayments.Text = _payments.Count(p => p.Status == "Success").ToString();
        }

        public string GetStatusPillClass(string status)
        {
            switch ((status ?? "").Trim().ToLower())
            {
                case "success": return "status-success";
                case "pending": return "status-pending";
                case "failed": return "status-failed";
                default: return "";
            }
        }

        protected void txtSearchPayment_TextChanged(object sender, EventArgs e)
        {
            BindPayments();
            upnlPayments.Update();
        }

        protected void rptPayments_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            int id;
            if (!int.TryParse(Convert.ToString(e.CommandArgument), out id)) return;

            switch (e.CommandName)
            {
                case "ViewPayment": OpenViewModal(id); break;
                case "EditPayment": OpenEditModal(id); break;
                case "DeletePayment": OpenDeleteModal(id); break;
            }
        }

        // ---------- VIEW ----------
        private void OpenViewModal(int id)
        {
            var p = _payments.FirstOrDefault(x => x.Id == id);
            if (p == null) return;

            litViewTrxId.Text = p.TransactionId;
            litViewCustomer.Text = p.Customer;
            litViewAmount.Text = p.Amount.ToString("N0");
            litViewStatus.Text = p.Status;
            litViewCholiType.Text = p.CholiType;
            litViewDate.Text = p.Date;

            pnlViewModal.Visible = true;
            pnlEditModal.Visible = false;
            pnlDeleteModal.Visible = false;
            upnlPayments.Update();
        }

        protected void btnCloseView_Click(object sender, EventArgs e)
        {
            pnlViewModal.Visible = false;
            upnlPayments.Update();
        }

        // ---------- EDIT ----------
        private void OpenEditModal(int id)
        {
            var p = _payments.FirstOrDefault(x => x.Id == id);
            if (p == null) return;

            hfEditPaymentId.Value = p.Id.ToString();
            txtEditTrxId.Text = p.TransactionId;
            txtEditCustomer.Text = p.Customer;
            txtEditCholiType.Text = p.CholiType;
            txtEditAmount.Text = p.Amount.ToString();
            ddlEditStatus.SelectedValue = p.Status;

            pnlEditModal.Visible = true;
            pnlViewModal.Visible = false;
            pnlDeleteModal.Visible = false;
            upnlPayments.Update();
        }

        protected void btnCancelEdit_Click(object sender, EventArgs e)
        {
            pnlEditModal.Visible = false;
            upnlPayments.Update();
        }

        protected void btnSaveEdit_Click(object sender, EventArgs e)
        {
            int id;
            if (!int.TryParse(hfEditPaymentId.Value, out id)) return;

            var p = _payments.FirstOrDefault(x => x.Id == id);
            if (p == null) return;

            p.Customer = txtEditCustomer.Text.Trim();
            p.CholiType = txtEditCholiType.Text.Trim();
            decimal amt;
            if (decimal.TryParse(txtEditAmount.Text, out amt)) p.Amount = amt;
            p.Status = ddlEditStatus.SelectedValue;

            pnlEditModal.Visible = false;
            BindPayments();
            UpdateMetrics();
            upnlPayments.Update();
        }

        // ---------- DELETE ----------
        private void OpenDeleteModal(int id)
        {
            var p = _payments.FirstOrDefault(x => x.Id == id);
            if (p == null) return;

            hfDeletePaymentId.Value = p.Id.ToString();
            litDeleteTargetTrx.Text = p.TransactionId;

            pnlDeleteModal.Visible = true;
            pnlViewModal.Visible = false;
            pnlEditModal.Visible = false;
            upnlPayments.Update();
        }

        protected void btnCancelDelete_Click(object sender, EventArgs e)
        {
            pnlDeleteModal.Visible = false;
            upnlPayments.Update();
        }

        protected void btnConfirmDelete_Click(object sender, EventArgs e)
        {
            int id;
            if (int.TryParse(hfDeletePaymentId.Value, out id))
            {
                var p = _payments.FirstOrDefault(x => x.Id == id);
                if (p != null) _payments.Remove(p);
            }

            pnlDeleteModal.Visible = false;
            BindPayments();
            UpdateMetrics();
            upnlPayments.Update();
        }

        // ---------- MODEL ----------
        public class Payment
        {
            public int Id { get; set; }
            public string TransactionId { get; set; }
            public string Customer { get; set; }
            public string CholiType { get; set; }
            public decimal Amount { get; set; }
            public string Date { get; set; }
            public string Status { get; set; }
        }
    }
}