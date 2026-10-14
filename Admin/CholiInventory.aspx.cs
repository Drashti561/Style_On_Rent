using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Style_On_Rent.Admin
{
    public partial class CholiInventory : System.Web.UI.Page
    {
        // In-memory list — DB hoy tyare replace karo
        private static List<Choli> _inventory = new List<Choli>
        {
            new Choli { Id=1, Title="Bridal Red Velvet Choli",   Sku="BRD-001", Category="Bridal Wear",       Size="M",  Price=2500, RentalDays=3, Status="Available",   ImageUrl="Images/choli1.jpg" },
            new Choli { Id=2, Title="Navratri Mirror Work Choli", Sku="NAV-002", Category="Navratri Special",  Size="S",  Price=1200, RentalDays=3, Status="Rented",      ImageUrl="Images/choli2.jpg" },
            new Choli { Id=3, Title="Designer Party Choli",       Sku="PTY-003", Category="Party Wear",        Size="L",  Price=1800, RentalDays=3, Status="Available",   ImageUrl="Images/choli3.jpg" },
            new Choli { Id=4, Title="Silk Embroidered Choli",     Sku="BRD-004", Category="Bridal Wear",       Size="XL", Price=3200, RentalDays=3, Status="Maintenance", ImageUrl="Images/choli4.jpg" },
            new Choli { Id=5, Title="Garba Special Choli",        Sku="NAV-005", Category="Navratri Special",  Size="M",  Price=1500, RentalDays=3, Status="Available",   ImageUrl="Images/choli5.jpg" }
        };

        protected void Page_Load(object sender, EventArgs e)
        {
            UnobtrusiveValidationMode = System.Web.UI.UnobtrusiveValidationMode.None;

            if (!IsPostBack)
            {
                BindInventory();
            }
        }

        // ---------- BIND ----------
        private void BindInventory()
        {
            var list = GetInventory();

            // Search
            string search = txtSearch != null ? txtSearch.Text.Trim().ToLower() : "";
            if (!string.IsNullOrEmpty(search))
            {
                list = list.Where(c =>
                    (c.Title ?? "").ToLower().Contains(search) ||
                    (c.Sku ?? "").ToLower().Contains(search)).ToList();
            }

            // Category filter
            if (ddlCategoryFilter != null && !string.IsNullOrEmpty(ddlCategoryFilter.SelectedValue))
            {
                list = list.Where(c => c.Category == ddlCategoryFilter.SelectedValue).ToList();
            }

            // Status filter
            if (ddlStatusFilter != null && !string.IsNullOrEmpty(ddlStatusFilter.SelectedValue))
            {
                list = list.Where(c => c.Status == ddlStatusFilter.SelectedValue).ToList();
            }

            rptInventory.DataSource = list;
            rptInventory.DataBind();

            pnlNoData.Visible = list.Count == 0;
            litShowingEntries.Text = "Showing 1 to " + list.Count + " of " + list.Count + " entries";
        }

        private List<Choli> GetInventory() { return _inventory; }

        // ---------- STATUS BADGE ----------
        public string GetStatusClass(string status)
        {
            switch ((status ?? "").Trim().ToLower())
            {
                case "available": return "status-badge badge-available";
                case "rented": return "status-badge badge-rented";
                case "maintenance": return "status-badge badge-maintenance";
                default: return "status-badge";
            }
        }

        // ---------- SEARCH & FILTER ----------
        protected void txtSearch_TextChanged(object sender, EventArgs e)
        {
            BindInventory();
            upnlInventory.Update();
        }

        protected void btnToggleFilter_Click(object sender, EventArgs e)
        {
            pnlFilterBox.Visible = !pnlFilterBox.Visible;
            upnlInventory.Update();
        }

        protected void ddlFilter_SelectedIndexChanged(object sender, EventArgs e)
        {
            // Auto-postback — filter apply thai jashe
        }

        protected void btnApplyFilter_Click(object sender, EventArgs e)
        {
            BindInventory();
            pnlFilterBox.Visible = false;
            upnlInventory.Update();
        }

        protected void btnResetFilter_Click(object sender, EventArgs e)
        {
            ddlCategoryFilter.SelectedIndex = 0;
            ddlStatusFilter.SelectedIndex = 0;
            txtSearch.Text = "";
            BindInventory();
            pnlFilterBox.Visible = false;
            upnlInventory.Update();
        }

        // ---------- REPEATER ACTIONS ----------
        protected void rptInventory_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            int id;
            if (!int.TryParse(Convert.ToString(e.CommandArgument), out id)) return;

            switch (e.CommandName)
            {
                case "View": OpenViewModal(id); break;
                case "Edit": OpenEditModal(id); break;
                case "ConfirmDelete": OpenDeleteModal(id); break;
            }
        }

        // ---------- ADD ----------
        protected void btnAddCholi_Click(object sender, EventArgs e)
        {
            Response.Redirect("AddCholi.aspx");
        }

        // ---------- VIEW MODAL ----------
        private void OpenViewModal(int id)
        {
            var c = _inventory.FirstOrDefault(x => x.Id == id);
            if (c == null) return;

            lblModalTitle.Text = c.Title;
            lblModalSku.Text = c.Sku;
            lblModalCategory.Text = c.Category;
            lblModalSize.Text = c.Size;
            lblModalPrice.Text = c.Price.ToString("N0");
            lblModalDays.Text = c.RentalDays.ToString();
            lblModalStatus.Text = c.Status;
            imgModalCholi.ImageUrl = c.ImageUrl;

            pnlViewModal.Visible = true;
            pnlEditModal.Visible = false;
            pnlDeleteModal.Visible = false;
            upnlInventory.Update();
        }

        protected void btnCloseModal_Click(object sender, EventArgs e)
        {
            pnlViewModal.Visible = false;
            upnlInventory.Update();
        }

        // ---------- EDIT MODAL ----------
        private void OpenEditModal(int id)
        {
            var c = _inventory.FirstOrDefault(x => x.Id == id);
            if (c == null) return;

            hfEditId.Value = c.Id.ToString();
            txtEditTitle.Text = c.Title;
            txtEditSku.Text = c.Sku;
            ddlEditCategory.SelectedValue = c.Category;
            txtEditSize.Text = c.Size;
            txtEditPrice.Text = c.Price.ToString();
            txtEditDays.Text = c.RentalDays.ToString();
            ddlEditStatus.SelectedValue = c.Status;

            pnlEditModal.Visible = true;
            pnlViewModal.Visible = false;
            pnlDeleteModal.Visible = false;
            upnlInventory.Update();
        }

        protected void btnCancelEdit_Click(object sender, EventArgs e)
        {
            pnlEditModal.Visible = false;
            upnlInventory.Update();
        }

        protected void btnSaveEdit_Click(object sender, EventArgs e)
        {
            int id;
            if (!int.TryParse(hfEditId.Value, out id)) return;

            var c = _inventory.FirstOrDefault(x => x.Id == id);
            if (c == null) return;

            c.Title = txtEditTitle.Text.Trim();
            c.Sku = txtEditSku.Text.Trim();
            c.Category = ddlEditCategory.SelectedValue;
            c.Size = txtEditSize.Text.Trim();
            decimal price;
            if (decimal.TryParse(txtEditPrice.Text, out price)) c.Price = price;
            int days;
            if (int.TryParse(txtEditDays.Text, out days)) c.RentalDays = days;
            c.Status = ddlEditStatus.SelectedValue;

            pnlEditModal.Visible = false;
            BindInventory();
            upnlInventory.Update();
        }

        // ---------- DELETE MODAL ----------
        private void OpenDeleteModal(int id)
        {
            var c = _inventory.FirstOrDefault(x => x.Id == id);
            if (c == null) return;

            hfDeleteId.Value = c.Id.ToString();
            lblDeleteCholiName.Text = c.Title;

            pnlDeleteModal.Visible = true;
            pnlViewModal.Visible = false;
            pnlEditModal.Visible = false;
            upnlInventory.Update();
        }

        protected void btnCancelDelete_Click(object sender, EventArgs e)
        {
            pnlDeleteModal.Visible = false;
            upnlInventory.Update();
        }

        protected void btnConfirmDelete_Click(object sender, EventArgs e)
        {
            int id;
            if (int.TryParse(hfDeleteId.Value, out id))
            {
                var c = _inventory.FirstOrDefault(x => x.Id == id);
                if (c != null) _inventory.Remove(c);
            }

            pnlDeleteModal.Visible = false;
            BindInventory();
            upnlInventory.Update();
        }

        // ---------- MODEL ----------
        public class Choli
        {
            public int Id { get; set; }
            public string Title { get; set; }
            public string Sku { get; set; }
            public string Category { get; set; }
            public string Size { get; set; }
            public decimal Price { get; set; }
            public int RentalDays { get; set; }
            public string Status { get; set; }
            public string ImageUrl { get; set; }
        }
    }
}