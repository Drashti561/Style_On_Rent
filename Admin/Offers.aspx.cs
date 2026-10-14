using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Style_On_Rent.Admin
{
    public partial class Offers : System.Web.UI.Page
    {
        // In-memory list — DB hoy tyare replace karo
        private static List<Offer> _offers = new List<Offer>
        {
            new Offer { Id=1, OfferName="Summer Wedding Special", CouponCode="SUMMER20", Discount="20% OFF",
                        StartDate="2026-05-01", EndDate="2026-06-30", Status="Active" },
            new Offer { Id=2, OfferName="Navratri Festive Deal", CouponCode="NAV10", Discount="10% OFF",
                        StartDate="2026-09-15", EndDate="2026-10-15", Status="Active" },
            new Offer { Id=3, OfferName="Diwali Mega Sale", CouponCode="DIWALI500", Discount="₹500 OFF",
                        StartDate="2026-10-20", EndDate="2026-11-05", Status="Active" },
            new Offer { Id=4, OfferName="First Rental Bonus", CouponCode="FIRST15", Discount="15% OFF",
                        StartDate="2026-01-01", EndDate="2026-03-31", Status="Expired" },
            new Offer { Id=5, OfferName="Bridal Couture Premium", CouponCode="BRIDAL1000", Discount="₹1000 OFF",
                        StartDate="2026-04-01", EndDate="2026-04-30", Status="Expired" }
        };

        protected void Page_Load(object sender, EventArgs e)
        {
            UnobtrusiveValidationMode = System.Web.UI.UnobtrusiveValidationMode.None;

            if (!IsPostBack)
            {
                BindOffers();
                UpdateMetrics();
            }
        }

        // ---------- BIND ----------
        private void BindOffers()
        {
            var list = GetOffers();

            string filter = txtFilter != null ? txtFilter.Text.Trim().ToLower() : "";
            if (!string.IsNullOrEmpty(filter))
            {
                list = list.Where(o =>
                    (o.OfferName ?? "").ToLower().Contains(filter) ||
                    (o.CouponCode ?? "").ToLower().Contains(filter)).ToList();
            }

            rptOffers.DataSource = list;
            rptOffers.DataBind();

            litShowingOffers.Text = "Showing 1-" + list.Count + " of " + list.Count + " offers";
        }

        private List<Offer> GetOffers() { return _offers; }

        private void UpdateMetrics()
        {
            litActiveOffers.Text = _offers.Count(o => o.Status == "Active").ToString();
            litTotalUsage.Text = "348";
            litSavingsPassed.Text = "4,250";
        }

        // ---------- FILTER ----------
        protected void txtFilter_TextChanged(object sender, EventArgs e)
        {
            BindOffers();
            upnlOffers.Update();
        }

        // ---------- CREATE NEW OFFER ----------
        protected void btnOpenCreatePage_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Admin/AddOffer.aspx");
        }

        // ---------- REPEATER ACTIONS ----------
        protected void rptOffers_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            int id;
            if (!int.TryParse(Convert.ToString(e.CommandArgument), out id)) return;

            switch (e.CommandName)
            {
                case "ViewOffer": OpenViewModal(id); break;
                case "EditOffer": OpenEditModal(id); break;
                case "ConfirmDelete": OpenDeleteModal(id); break;
            }
        }

        // ---------- VIEW MODAL ----------
        private void OpenViewModal(int id)
        {
            var o = _offers.FirstOrDefault(x => x.Id == id);
            if (o == null) return;

            litViewName.Text = o.OfferName;
            litViewCode.Text = o.CouponCode;
            litViewDiscount.Text = o.Discount;
            litViewStatus.Text = o.Status;
            litViewStart.Text = o.StartDate;
            litViewEnd.Text = o.EndDate;

            pnlViewModal.Visible = true;
            pnlEditModal.Visible = false;
            pnlDeleteModal.Visible = false;
            upnlOffers.Update();
        }

        protected void btnCloseView_Click(object sender, EventArgs e)
        {
            pnlViewModal.Visible = false;
            upnlOffers.Update();
        }

        // ---------- EDIT MODAL ----------
        private void OpenEditModal(int id)
        {
            var o = _offers.FirstOrDefault(x => x.Id == id);
            if (o == null) return;

            hfEditOfferId.Value = o.Id.ToString();
            txtEditOfferName.Text = o.OfferName;
            txtEditCouponCode.Text = o.CouponCode;
            txtEditDiscount.Text = o.Discount;
            txtEditStartDate.Text = o.StartDate;
            txtEditEndDate.Text = o.EndDate;
            ddlEditStatus.SelectedValue = o.Status;

            pnlEditModal.Visible = true;
            pnlViewModal.Visible = false;
            pnlDeleteModal.Visible = false;
            upnlOffers.Update();
        }

        protected void btnCancelEdit_Click(object sender, EventArgs e)
        {
            pnlEditModal.Visible = false;
            upnlOffers.Update();
        }

        protected void cvEditEndDate_ServerValidate(object source, ServerValidateEventArgs args)
        {
            DateTime start, end;
            if (DateTime.TryParse(txtEditStartDate.Text, out start) &&
                DateTime.TryParse(txtEditEndDate.Text, out end))
            {
                args.IsValid = (end >= start);
            }
            else
            {
                args.IsValid = true; // End date optional
            }
        }

        protected void btnUpdateOffer_Click(object sender, EventArgs e)
        {
            Page.Validate("EditOfferGroup");
            if (!Page.IsValid) return;

            int id;
            if (!int.TryParse(hfEditOfferId.Value, out id)) return;

            var o = _offers.FirstOrDefault(x => x.Id == id);
            if (o == null) return;

            o.OfferName = txtEditOfferName.Text.Trim();
            o.CouponCode = txtEditCouponCode.Text.Trim();
            o.Discount = txtEditDiscount.Text.Trim();
            o.StartDate = txtEditStartDate.Text;
            o.EndDate = txtEditEndDate.Text;
            o.Status = ddlEditStatus.SelectedValue;

            pnlEditModal.Visible = false;
            BindOffers();
            UpdateMetrics();
            upnlOffers.Update();
        }

        // ---------- DELETE MODAL ----------
        private void OpenDeleteModal(int id)
        {
            var o = _offers.FirstOrDefault(x => x.Id == id);
            if (o == null) return;

            hfDeleteId.Value = o.Id.ToString();
            litDeleteTargetName.Text = o.CouponCode;

            pnlDeleteModal.Visible = true;
            pnlViewModal.Visible = false;
            pnlEditModal.Visible = false;
            upnlOffers.Update();
        }

        protected void btnCancelDelete_Click(object sender, EventArgs e)
        {
            pnlDeleteModal.Visible = false;
            upnlOffers.Update();
        }

        protected void btnConfirmDelete_Click(object sender, EventArgs e)
        {
            int id;
            if (int.TryParse(hfDeleteId.Value, out id))
            {
                var o = _offers.FirstOrDefault(x => x.Id == id);
                if (o != null) _offers.Remove(o);
            }

            pnlDeleteModal.Visible = false;
            BindOffers();
            UpdateMetrics();
            upnlOffers.Update();
        }

        // ---------- MODEL ----------
        public class Offer
        {
            public int Id { get; set; }
            public string OfferName { get; set; }
            public string CouponCode { get; set; }
            public string Discount { get; set; }
            public string StartDate { get; set; }
            public string EndDate { get; set; }
            public string Status { get; set; }
        }
    }
}