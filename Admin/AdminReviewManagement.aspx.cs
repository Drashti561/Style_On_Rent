using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Style_On_Rent.Admin
{
    public partial class AdminReviewManagement : System.Web.UI.Page
    {
        private static List<Review> _reviews = new List<Review>
        {
            new Review { ReviewId=1, ItemTitle="Royal Maroon Velvet Choli", ItemImage="Images/choli1.jpg",
                         OrderCode="ORD-1001", CustomerName="Priya Sharma",
                         Rating=5, SentimentText="Very Positive", FitFeedback="True to Size",
                         ReviewTitle="Absolutely stunning!",
                         ReviewBody="The velvet is rich and the embroidery is beautiful. Fits perfectly for my sister's wedding.",
                         CustomerPhotoUrl="Images/review1.jpg", Status="Approved" },

            new Review { ReviewId=2, ItemTitle="Navratri Mirror Work Choli", ItemImage="Images/choli2.jpg",
                         OrderCode="ORD-1002", CustomerName="Aarti Patel",
                         Rating=4, SentimentText="Positive", FitFeedback="Slightly Large",
                         ReviewTitle="Beautiful but loose",
                         ReviewBody="Loved the mirror work. The fit was slightly loose on the waist, but overall great quality.",
                         CustomerPhotoUrl="", Status="Pending" },

            new Review { ReviewId=3, ItemTitle="Designer Party Choli", ItemImage="Images/choli3.jpg",
                         OrderCode="ORD-1003", CustomerName="Meera Joshi",
                         Rating=3, SentimentText="Neutral", FitFeedback="Slightly Small",
                         ReviewTitle="Decent but tight",
                         ReviewBody="The design is nice but the fitting was tight around the shoulders. Fabric was good.",
                         CustomerPhotoUrl="Images/review3.jpg", Status="Pending" },

            new Review { ReviewId=4, ItemTitle="Silk Embroidered Choli", ItemImage="Images/choli4.jpg",
                         OrderCode="ORD-1004", CustomerName="Riya Desai",
                         Rating=5, SentimentText="Very Positive", FitFeedback="True to Size",
                         ReviewTitle="Perfect rental experience",
                         ReviewBody="Beautiful silk choli, arrived clean and on time. Would definitely rent again.",
                         CustomerPhotoUrl="Images/review4.jpg", Status="Approved" },

            new Review { ReviewId=5, ItemTitle="Garba Special Choli", ItemImage="Images/choli5.jpg",
                         OrderCode="ORD-1005", CustomerName="Kavya Mehta",
                         Rating=2, SentimentText="Negative", FitFeedback="Slightly Large",
                         ReviewTitle="Not as expected",
                         ReviewBody="The color was different from the photos. Fabric felt a bit rough.",
                         CustomerPhotoUrl="", Status="Rejected" }
        };

        protected void Page_Load(object sender, EventArgs e)
        {
            UnobtrusiveValidationMode = System.Web.UI.UnobtrusiveValidationMode.None;

            if (!IsPostBack)
            {
                BindReviews();
                UpdateMetrics();
            }
        }

        private void BindReviews()
        {
            var list = GetReviews();

            string search = txtSearch != null ? txtSearch.Text.Trim().ToLower() : "";
            if (!string.IsNullOrEmpty(search))
            {
                list = list.Where(r =>
                    (r.ItemTitle ?? "").ToLower().Contains(search) ||
                    (r.CustomerName ?? "").ToLower().Contains(search) ||
                    (r.ReviewTitle ?? "").ToLower().Contains(search) ||
                    (r.ReviewBody ?? "").ToLower().Contains(search)).ToList();
            }

            string status = ddlStatusFilter != null ? ddlStatusFilter.SelectedValue : "ALL";
            if (!string.IsNullOrEmpty(status) && status != "ALL")
            {
                list = list.Where(r => r.Status == status).ToList();
            }

            rptReviews.DataSource = list;
            rptReviews.DataBind();
        }

        private List<Review> GetReviews() { return _reviews; }

        private void UpdateMetrics()
        {
            litTotalReviews.Text = _reviews.Count.ToString();
            litPendingReviews.Text = _reviews.Count(r => r.Status == "Pending").ToString();

            if (_reviews.Count > 0)
            {
                double avg = _reviews.Average(r => r.Rating);
                litAvgRating.Text = avg.ToString("0.0");
            }
            else
            {
                litAvgRating.Text = "0.0";
            }

            litPhotoCount.Text = _reviews.Count(r => !string.IsNullOrEmpty(r.CustomerPhotoUrl)).ToString();
        }

        // ---------- HELPERS ----------
        public string RenderStars(int rating)
        {
            string stars = "";
            for (int i = 1; i <= 5; i++)
            {
                stars += i <= rating ? "<i class='fa-solid fa-star'></i>" : "<i class='fa-regular fa-star'></i>";
            }
            return stars;
        }

        public string GetFitClass(string fit)
        {
            switch ((fit ?? "").Trim().ToLower())
            {
                case "true to size": return "fit-true";
                case "slightly small": return "fit-small";
                case "slightly large": return "fit-large";
                default: return "";
            }
        }

        // ---------- SEARCH & FILTER ----------
        protected void txtSearch_TextChanged(object sender, EventArgs e)
        {
            BindReviews();
            upnlReviews.Update();
        }

        protected void ddlStatusFilter_SelectedIndexChanged(object sender, EventArgs e)
        {
            BindReviews();
            upnlReviews.Update();
        }

        // ---------- REPEATER ACTIONS ----------
        protected void rptReviews_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            int id;
            if (!int.TryParse(Convert.ToString(e.CommandArgument), out id)) return;

            switch (e.CommandName)
            {
                case "ViewReview": OpenModal(id); break;
                case "ApproveReview":
                    {
                        var r = _reviews.FirstOrDefault(x => x.ReviewId == id);
                        if (r != null) r.Status = "Approved";
                        BindReviews();
                        UpdateMetrics();
                        upnlReviews.Update();
                        break;
                    }
                case "RejectReview":
                    {
                        var r = _reviews.FirstOrDefault(x => x.ReviewId == id);
                        if (r != null) r.Status = "Rejected";
                        BindReviews();
                        UpdateMetrics();
                        upnlReviews.Update();
                        break;
                    }
                case "DeleteReview":
                    {
                        var r = _reviews.FirstOrDefault(x => x.ReviewId == id);
                        if (r != null) _reviews.Remove(r);
                        BindReviews();
                        UpdateMetrics();
                        upnlReviews.Update();
                        break;
                    }
            }
        }

        // ---------- MODAL ----------
        private void OpenModal(int id)
        {
            var r = _reviews.FirstOrDefault(x => x.ReviewId == id);
            if (r == null) return;

            litModalItemTitle.Text = r.ItemTitle;
            litModalCustomer.Text = r.CustomerName;
            litModalOrder.Text = r.OrderCode;
            litModalStars.Text = RenderStars(r.Rating);
            litModalSentiment.Text = r.SentimentText;
            litModalFit.Text = "<span class='fit-pill " + GetFitClass(r.FitFeedback) + "'>" + r.FitFeedback + "</span>";
            litModalTitle.Text = r.ReviewTitle;
            litModalBody.Text = r.ReviewBody;

            if (!string.IsNullOrEmpty(r.CustomerPhotoUrl))
            {
                imgModalCustomerPhoto.ImageUrl = r.CustomerPhotoUrl;
                pnlModalPhotos.Visible = true;
            }
            else
            {
                pnlModalPhotos.Visible = false;
            }

            pnlReviewModal.Visible = true;
            upnlReviews.Update();
        }

        protected void btnCloseModal_Click(object sender, EventArgs e)
        {
            pnlReviewModal.Visible = false;
            upnlReviews.Update();
        }

        // ---------- MODEL ----------
        public class Review
        {
            public int ReviewId { get; set; }
            public string ItemTitle { get; set; }
            public string ItemImage { get; set; }
            public string OrderCode { get; set; }
            public string CustomerName { get; set; }
            public int Rating { get; set; }
            public string SentimentText { get; set; }
            public string FitFeedback { get; set; }
            public string ReviewTitle { get; set; }
            public string ReviewBody { get; set; }
            public string CustomerPhotoUrl { get; set; }
            public string Status { get; set; }
        }
    }
}