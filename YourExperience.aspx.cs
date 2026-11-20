using System;
using System.Collections.Generic;
using System.IO;
using System.Web.UI;

namespace Style_On_Rent
{
    public partial class YourExperience : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                lblMainMsg.Visible = false;
                lblTitleErr.Visible = false;
                lblBodyErr.Visible = false;
                lblNameErr.Visible = false;
                lblEmailErr.Visible = false;
            }
        }

        protected void btnSubmitReview_Click(object sender, EventArgs e)
        {
            lblMainMsg.Visible = false;
            lblTitleErr.Visible = false;
            lblBodyErr.Visible = false;
            lblNameErr.Visible = false;
            lblEmailErr.Visible = false;

            int rating = 0;
            int.TryParse(hfRating.Value, out rating);

            string title = txtReviewTitle.Text.Trim();
            string body = txtReviewBody.Text.Trim();
            string name = txtName.Text.Trim();
            string email = txtEmail.Text.Trim();

            bool hasError = false;

            if (rating < 1 || rating > 5)
            {
                lblMainMsg.Text = "⚠ Please select a star rating.";
                lblMainMsg.CssClass = "validation-error";
                lblMainMsg.Visible = true;
                hasError = true;
            }

            if (string.IsNullOrEmpty(title))
            {
                lblTitleErr.Visible = true;
                hasError = true;
            }

            if (string.IsNullOrEmpty(body))
            {
                lblBodyErr.Visible = true;
                hasError = true;
            }

            if (string.IsNullOrEmpty(name))
            {
                lblNameErr.Visible = true;
                hasError = true;
            }

            if (string.IsNullOrEmpty(email) || !email.Contains("@") || !email.Contains("."))
            {
                lblEmailErr.Visible = true;
                hasError = true;
            }

            if (hasError) return;

            // SAVE PHOTOS
            string uploadFolder = Server.MapPath("~/Uploads/Reviews/");
            if (!Directory.Exists(uploadFolder))
                Directory.CreateDirectory(uploadFolder);

            if (fuPhotos.HasFiles)
            {
                foreach (var file in fuPhotos.PostedFiles)
                {
                    if (file.ContentLength > 0 && file.ContentLength <= 5 * 1024 * 1024)
                    {
                        string ext = Path.GetExtension(file.FileName).ToLower();
                        if (ext == ".jpg" || ext == ".jpeg" || ext == ".png" || ext == ".gif")
                        {
                            string fileName = "review_" + DateTime.Now.Ticks + ext;
                            file.SaveAs(Path.Combine(uploadFolder, fileName));
                        }
                    }
                }
            }

            // SAVE REVIEW TO SESSION
            List<Review> reviews = Session["Reviews"] as List<Review>;
            if (reviews == null) reviews = new List<Review>();

            Review newReview = new Review
            {
                Name = name,
                Title = title,
                Body = body,
                Rating = rating,
                Stars = new string('★', rating) + new string('☆', 5 - rating),
                Date = DateTime.Now.ToString("dd MMM yyyy").ToUpper()
            };

            reviews.Insert(0, newReview); // Navu review pehla
            Session["Reviews"] = reviews;

            // ✅ CUSTOMER REVIEW PAGE PAR REDIRECT
            Response.Redirect("CustomersReview.aspx");
        }
    }
}