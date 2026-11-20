using System;
using System.Collections.Generic;
using System.Web.UI;

namespace Style_On_Rent
{
    public partial class CustomersReview : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Har vakhat load karo (IsPostBack check nathi)
            LoadReviews();
        }

        private void LoadReviews()
        {
            List<Review> reviews = Session["Reviews"] as List<Review>;

            if (reviews == null || reviews.Count == 0)
            {
                reviews = new List<Review>
                {
                    new Review
                    {
                        Name = "Aisha",
                        Title = "Absolutely Stunning Lehenga with Exquisite Embroidery",
                        Body = "The embroidery is even more beautiful in person. The fit was perfect and the rental process was smooth and easy.",
                        Rating = 5,
                        Stars = "★★★★★",
                        Date = "2 WEEKS AGO"
                    },
                    new Review
                    {
                        Name = "Meera",
                        Title = "Beautiful but a bit heavy",
                        Body = "Gorgeous outfit and true to the photos. It was a little heavy for long hours but still worth every moment.",
                        Rating = 5,
                        Stars = "★★★★★",
                        Date = "1 MONTH AGO"
                    },
                    new Review
                    {
                        Name = "Priya",
                        Title = "Perfect Fit and Great Service",
                        Body = "Customer service was excellent and the lehenga fit me perfectly. Got so many compliments at the wedding!",
                        Rating = 4,
                        Stars = "★★★★☆",
                        Date = "1 MONTH AGO"
                    },
                    new Review
                    {
                        Name = "Sneha",
                        Title = "Perfect fit, incredible detail",
                        Body = "The detailing is incredible and the colour is rich and elegant. Will definitely rent again for the next event.",
                        Rating = 5,
                        Stars = "★★★★★",
                        Date = "2 MONTHS AGO"
                    }
                };
                Session["Reviews"] = reviews;
            }

            rptReviews.DataSource = reviews;
            rptReviews.DataBind();
        }
    }
}