using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Style_On_Rent.Admin
{
    public partial class ManageHomeHero : System.Web.UI.Page
    {
        private static List<Collection> _collections = new List<Collection>
        {
            new Collection { Id=1, Title="Bridal Couture",     ItemsCount=42, ImageUrl="Images/col1.jpg" },
            new Collection { Id=2, Title="Navratri Special",   ItemsCount=28, ImageUrl="Images/col2.jpg" },
            new Collection { Id=3, Title="Party Wear",         ItemsCount=36, ImageUrl="Images/col3.jpg" }
        };

        private static List<Trending> _trending = new List<Trending>
        {
            new Trending { Id=1, Name="Royal Maroon Velvet Choli",    RentalPrice=1500, Status="In Stock", ImageUrl="Images/tr1.jpg" },
            new Trending { Id=2, Name="Navratri Mirror Work Choli",   RentalPrice=1200, Status="Rented",   ImageUrl="Images/tr2.jpg" },
            new Trending { Id=3, Name="Designer Party Choli",         RentalPrice=1800, Status="In Stock", ImageUrl="Images/tr3.jpg" }
        };

        protected void Page_Load(object sender, EventArgs e)
        {
            UnobtrusiveValidationMode = System.Web.UI.UnobtrusiveValidationMode.None;

            if (!IsPostBack)
            {
                BindCollections();
                BindTrending();
            }
        }

        private void BindCollections()
        {
            rptCollections.DataSource = _collections;
            rptCollections.DataBind();
        }

        private void BindTrending()
        {
            rptTrendingCholis.DataSource = _trending;
            rptTrendingCholis.DataBind();
        }

        // ---------- PUBLISH ----------
        protected void btnPublishChanges_Click(object sender, EventArgs e)
        {
            pnlAlertSuccess.Visible = true;
            upnlHomeHero.Update();
        }

        // ---------- ADD COLLECTION ----------
        protected void btnAddCollectionModal_Click(object sender, EventArgs e)
        {
            txtCollectionTitle.Text = "";
            txtCollectionCount.Text = "";
            pnlCollectionModal.Visible = true;
            upnlHomeHero.Update();
        }

        protected void btnCloseCollectionModal_Click(object sender, EventArgs e)
        {
            pnlCollectionModal.Visible = false;
            upnlHomeHero.Update();
        }

        protected void btnSaveCollection_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrWhiteSpace(txtCollectionTitle.Text)) return;

            int count = 0;
            int.TryParse(txtCollectionCount.Text, out count);

            int newId = _collections.Count == 0 ? 1 : _collections.Max(c => c.Id) + 1;
            _collections.Add(new Collection
            {
                Id = newId,
                Title = txtCollectionTitle.Text.Trim(),
                ItemsCount = count,
                ImageUrl = "Images/col_default.jpg"
            });

            pnlCollectionModal.Visible = false;
            BindCollections();
            upnlHomeHero.Update();
        }

        // ---------- TRENDING ACTIONS ----------
        protected void rptTrendingCholis_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            int id;
            if (!int.TryParse(Convert.ToString(e.CommandArgument), out id)) return;

            switch (e.CommandName)
            {
                case "EditTrending": OpenTrendingModal(id); break;
                case "DeleteTrending": DeleteTrending(id); break;
            }
        }

        protected void btnAddTrendingModal_Click(object sender, EventArgs e)
        {
            hfTrendingEditId.Value = "0";
            hfCurrentImageUrl.Value = "";
            litTrendingModalTitle.Text = "Add Trending Item";
            txtTrendingName.Text = "";
            txtTrendingPrice.Text = "";
            ddlTrendingStatus.SelectedValue = "In Stock";
            imgTrendingPreview.ImageUrl = "Images/default_choli.jpg";

            pnlTrendingModal.Visible = true;
            upnlHomeHero.Update();
        }

        private void OpenTrendingModal(int id)
        {
            var t = _trending.FirstOrDefault(x => x.Id == id);
            if (t == null) return;

            hfTrendingEditId.Value = t.Id.ToString();
            hfCurrentImageUrl.Value = t.ImageUrl;
            litTrendingModalTitle.Text = "Edit Trending Item";
            txtTrendingName.Text = t.Name;
            txtTrendingPrice.Text = t.RentalPrice.ToString();
            ddlTrendingStatus.SelectedValue = t.Status;
            imgTrendingPreview.ImageUrl = t.ImageUrl;

            pnlTrendingModal.Visible = true;
            upnlHomeHero.Update();
        }

        protected void btnCloseTrendingModal_Click(object sender, EventArgs e)
        {
            pnlTrendingModal.Visible = false;
            upnlHomeHero.Update();
        }

        protected void btnSaveTrending_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrWhiteSpace(txtTrendingName.Text)) return;

            int id = 0;
            int.TryParse(hfTrendingEditId.Value, out id);

            decimal price = 0;
            decimal.TryParse(txtTrendingPrice.Text, out price);

            // Image upload (optional)
            string imageUrl = hfCurrentImageUrl.Value;
            if (fuTrendingImage.HasFile)
            {
                string folderPath = Server.MapPath("~/Images/");
                if (!Directory.Exists(folderPath)) Directory.CreateDirectory(folderPath);
                string fileName = Path.GetFileName(fuTrendingImage.FileName);
                fuTrendingImage.SaveAs(Path.Combine(folderPath, fileName));
                imageUrl = "Images/" + fileName;
            }
            if (string.IsNullOrEmpty(imageUrl)) imageUrl = "Images/default_choli.jpg";

            if (id == 0)
            {
                // Add new
                int newId = _trending.Count == 0 ? 1 : _trending.Max(t => t.Id) + 1;
                _trending.Add(new Trending
                {
                    Id = newId,
                    Name = txtTrendingName.Text.Trim(),
                    RentalPrice = price,
                    Status = ddlTrendingStatus.SelectedValue,
                    ImageUrl = imageUrl
                });
            }
            else
            {
                // Update existing
                var t = _trending.FirstOrDefault(x => x.Id == id);
                if (t != null)
                {
                    t.Name = txtTrendingName.Text.Trim();
                    t.RentalPrice = price;
                    t.Status = ddlTrendingStatus.SelectedValue;
                    t.ImageUrl = imageUrl;
                }
            }

            pnlTrendingModal.Visible = false;
            BindTrending();
            upnlHomeHero.Update();
        }

        private void DeleteTrending(int id)
        {
            var t = _trending.FirstOrDefault(x => x.Id == id);
            if (t != null) _trending.Remove(t);

            BindTrending();
            upnlHomeHero.Update();
        }

        // ---------- MODELS ----------
        public class Collection
        {
            public int Id { get; set; }
            public string Title { get; set; }
            public int ItemsCount { get; set; }
            public string ImageUrl { get; set; }
        }

        public class Trending
        {
            public int Id { get; set; }
            public string Name { get; set; }
            public decimal RentalPrice { get; set; }
            public string Status { get; set; }
            public string ImageUrl { get; set; }
        }
    }
}