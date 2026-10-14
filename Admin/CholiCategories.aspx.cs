using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Style_On_Rent.Admin
{
    public partial class CholiCategories : System.Web.UI.Page
    {
        // In-memory list — DB hoy tyare replace karo
        private static List<Category> _categories = new List<Category>
        {
            new Category { Id=1, CategoryName="Bridal Velvet Collection", Status="PREMIUM", InventoryCount=18,
                           PrimaryImage="Images/cat1.jpg", SecondaryImage="Images/cat1b.jpg", CountBadge="+3",
                           ImageUrls = new List<string>{ "Images/cat1.jpg", "Images/cat1b.jpg", "Images/cat1c.jpg" } },

            new Category { Id=2, CategoryName="Navratri Mirror Work",     Status="ACTIVE", InventoryCount=24,
                           PrimaryImage="Images/cat2.jpg", SecondaryImage="", CountBadge="+5",
                           ImageUrls = new List<string>{ "Images/cat2.jpg", "Images/cat2b.jpg" } },

            new Category { Id=3, CategoryName="Designer Party Wear",      Status="ACTIVE", InventoryCount=12,
                           PrimaryImage="Images/cat3.jpg", SecondaryImage="Images/cat3b.jpg", CountBadge="+2",
                           ImageUrls = new List<string>{ "Images/cat3.jpg", "Images/cat3b.jpg", "Images/cat3c.jpg" } },

            new Category { Id=4, CategoryName="Silk Embroidered Cholis",  Status="PREMIUM", InventoryCount=8,
                           PrimaryImage="Images/cat4.jpg", SecondaryImage="", CountBadge="",
                           ImageUrls = new List<string>{ "Images/cat4.jpg" } }
        };

        protected void Page_Load(object sender, EventArgs e)
        {
            UnobtrusiveValidationMode = System.Web.UI.UnobtrusiveValidationMode.None;

            if (!IsPostBack)
            {
                BindCategories();
            }
        }

        private void BindCategories()
        {
            rptCategories.DataSource = _categories;
            rptCategories.DataBind();
        }

        // ---------- REPEATER ACTIONS ----------
        protected void rptCategories_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            int id;
            if (!int.TryParse(Convert.ToString(e.CommandArgument), out id)) return;

            switch (e.CommandName)
            {
                case "ViewCategory": OpenViewModal(id); break;
                case "EditCategory": OpenEditModal(id); break;
                case "DeleteCategory": OpenDeleteModal(id); break;
            }
        }

        // ---------- VIEW ----------
        private void OpenViewModal(int id)
        {
            var c = _categories.FirstOrDefault(x => x.Id == id);
            if (c == null) return;

            litViewCatName.Text = c.CategoryName;
            litViewStatus.Text = c.Status;
            litViewInventory.Text = c.InventoryCount.ToString();
            litViewGalleryBadge.Text = c.InventoryCount.ToString();
            litViewPhotoCount.Text = c.ImageUrls.Count.ToString();

            rptViewGallery.DataSource = c.ImageUrls;
            rptViewGallery.DataBind();

            pnlViewModal.Visible = true;
            pnlEditModal.Visible = false;
            pnlDeleteModal.Visible = false;
            upnlCategories.Update();
        }

        protected void btnCloseView_Click(object sender, EventArgs e)
        {
            pnlViewModal.Visible = false;
            upnlCategories.Update();
        }

        // ---------- EDIT ----------
        private void OpenEditModal(int id)
        {
            var c = _categories.FirstOrDefault(x => x.Id == id);
            if (c == null) return;

            hfEditCategoryId.Value = c.Id.ToString();
            hfAllImageUrls.Value = string.Join("|", c.ImageUrls);
            txtEditCatName.Text = c.CategoryName;
            ddlEditStatus.SelectedValue = c.Status;
            txtEditInventory.Text = c.InventoryCount.ToString();

            rptCurrentEditThumbs.DataSource = c.ImageUrls;
            rptCurrentEditThumbs.DataBind();
            pnlCurrentThumbs.Visible = c.ImageUrls.Count > 0;

            pnlEditModal.Visible = true;
            pnlViewModal.Visible = false;
            pnlDeleteModal.Visible = false;
            upnlCategories.Update();
        }

        protected void btnCancelEdit_Click(object sender, EventArgs e)
        {
            pnlEditModal.Visible = false;
            upnlCategories.Update();
        }

        protected void btnSaveEdit_Click(object sender, EventArgs e)
        {
            int id;
            if (!int.TryParse(hfEditCategoryId.Value, out id)) return;

            var c = _categories.FirstOrDefault(x => x.Id == id);
            if (c == null) return;

            c.CategoryName = txtEditCatName.Text.Trim();
            c.Status = ddlEditStatus.SelectedValue;

            int inv;
            if (int.TryParse(txtEditInventory.Text, out inv)) c.InventoryCount = inv;

            // Image upload (multiple)
            if (fuCategoryImages.HasFiles)
            {
                string folderPath = Server.MapPath("~/Images/");
                if (!Directory.Exists(folderPath)) Directory.CreateDirectory(folderPath);

                foreach (var file in fuCategoryImages.PostedFiles)
                {
                    string fileName = Path.GetFileName(file.FileName);
                    file.SaveAs(Path.Combine(folderPath, fileName));
                    c.ImageUrls.Add("Images/" + fileName);
                }

                if (c.ImageUrls.Count > 0) c.PrimaryImage = c.ImageUrls[0];
                if (c.ImageUrls.Count > 1) c.SecondaryImage = c.ImageUrls[1];
            }

            pnlEditModal.Visible = false;
            BindCategories();
            upnlCategories.Update();
        }

        // ---------- DELETE ----------
        private void OpenDeleteModal(int id)
        {
            var c = _categories.FirstOrDefault(x => x.Id == id);
            if (c == null) return;

            hfDeleteCategoryId.Value = c.Id.ToString();
            litDeleteTargetName.Text = c.CategoryName;

            pnlDeleteModal.Visible = true;
            pnlViewModal.Visible = false;
            pnlEditModal.Visible = false;
            upnlCategories.Update();
        }

        protected void btnCancelDelete_Click(object sender, EventArgs e)
        {
            pnlDeleteModal.Visible = false;
            upnlCategories.Update();
        }

        protected void btnConfirmDelete_Click(object sender, EventArgs e)
        {
            int id;
            if (int.TryParse(hfDeleteCategoryId.Value, out id))
            {
                var c = _categories.FirstOrDefault(x => x.Id == id);
                if (c != null) _categories.Remove(c);
            }

            pnlDeleteModal.Visible = false;
            BindCategories();
            upnlCategories.Update();
        }

        // ---------- MODEL ----------
        public class Category
        {
            public int Id { get; set; }
            public string CategoryName { get; set; }
            public string Status { get; set; }
            public int InventoryCount { get; set; }
            public string PrimaryImage { get; set; }
            public string SecondaryImage { get; set; }
            public string CountBadge { get; set; }
            public List<string> ImageUrls { get; set; } = new List<string>();
        }
    }
}