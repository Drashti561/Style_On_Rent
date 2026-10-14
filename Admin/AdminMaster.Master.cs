using System;
using System.IO;
using System.Web.UI;
using System.Web.UI.HtmlControls;

namespace Style_On_Rent.Admin
{
    public partial class AdminMaster : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Unobtrusive validation bandh karvu (CE545 Syllabus / No external jQuery requirement)
            this.Page.UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;

            // 1. Session Auth Check (Without Database: Session mathi Admin Login check thashe)
            if (Session["AdminId"] == null && !Request.Url.AbsolutePath.ToLower().Contains("admin_login.aspx"))
            {
                Response.Redirect("admin_login.aspx");
                return;
            }

            // 2. Active Sidebar Link Highlight karvo
            HighlightCurrentMenu();
        }

        // Active page mujab sidebar menu item ma "active" class add karvani method
        private void HighlightCurrentMenu()
        {
            // Current chaluta page nu naam melavvu (e.g., "Users.aspx")
            string currentPage = Path.GetFileName(Request.Url.AbsolutePath).ToLower();

            // Pehla badha menu items mathi 'active' class remove karvo
            ResetMenuSelection();

            // Current URL sathe match kari ne je-te li tag ne 'active' class apo
            if (currentPage.Contains("admin_dashboard"))
            {
                liDashboard.Attributes.Add("class", "active");
            }
            else if (currentPage.Contains("users"))
            {
                liUsers.Attributes.Add("class", "active");
            }
            else if (currentPage.Contains("choliinventory") || currentPage.Contains("addcholi"))
            {
                liInventory.Attributes.Add("class", "active");
            }
            else if (currentPage.Contains("orders"))
            {
                liOrders.Attributes.Add("class", "active");
            }
            else if (currentPage.Contains("offers"))
            {
                liOffers.Attributes.Add("class", "active");
            }
            else if (currentPage.Contains("notification") || currentPage.Contains("addcampaign"))
            {
                liNotification.Attributes.Add("class", "active");
            }
            else if (currentPage.Contains("payments"))
            {
                liPayments.Attributes.Add("class", "active");
            }
            else if (currentPage.Contains("refundrequest"))
            {
                liRefundRequest.Attributes.Add("class", "active");
            }
            else if (currentPage.Contains("manageaboutus"))
            {
                liAbout.Attributes.Add("class", "active");
            }
            else if (currentPage.Contains("managecontactus"))
            {
                liContact.Attributes.Add("class", "active");
            }
            else if (currentPage.Contains("managehomehero"))
            {
                liHero.Attributes.Add("class", "active");
            }
            else if (currentPage.Contains("cholicategories"))
            {
                liCategories.Attributes.Add("class", "active");
            }
            else if (currentPage.Contains("adminreviewmanagement"))
            {
                liReviews.Attributes.Add("class", "active");
            }
            else if (currentPage.Contains("profile"))
            {
                liProfile.Attributes.Add("class", "active");
            }
            else if (currentPage.Contains("websitesetting"))
            {
                liSetting.Attributes.Add("class", "active");
            }
        }

        private void ResetMenuSelection()
        {
            liDashboard.Attributes["class"] = "";
            liUsers.Attributes["class"] = "";
            liInventory.Attributes["class"] = "";
            liOrders.Attributes["class"] = "";
            liOffers.Attributes["class"] = "";
            liNotification.Attributes["class"] = "";
            liPayments.Attributes["class"] = "";
            liRefundRequest.Attributes["class"] = "";
            liAbout.Attributes["class"] = "";
            liContact.Attributes["class"] = "";
            liHero.Attributes["class"] = "";
            liCategories.Attributes["class"] = "";
            liReviews.Attributes["class"] = "";
            liProfile.Attributes["class"] = "";
            liSetting.Attributes["class"] = "";
        }
    }
}