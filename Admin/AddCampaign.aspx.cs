using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Style_On_Rent.Admin
{
    public partial class AddCampaign : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // CE545 Requirement: Pure ASP.NET Validation (No jQuery required)
            UnobtrusiveValidationMode = System.Web.UI.UnobtrusiveValidationMode.None;
        }

        // Cancel Button: paacha Notification list page par javu
        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("Notification.aspx");
        }

        // Send Notification Button: Session State ma data save kari redirect
        protected void btnSendNotification_Click(object sender, EventArgs e)
        {
            // 1. Server-side Validation
            Page.Validate("SendNotificationGroup");
            if (!Page.IsValid) return;

            string title = txtNotificationTitle.Text.Trim();
            string content = txtMessageContent.Text.Trim();
            string audience = ddlTargetAudience.SelectedValue;

            // 2. Notification.aspx na Session DataTable ma navo record
            DataTable dt;
            if (Session["StaticNotifications"] != null)
            {
                dt = (DataTable)Session["StaticNotifications"];
            }
            else
            {
                dt = new DataTable();
                dt.Columns.Add("Id", typeof(int));
                dt.Columns.Add("Title", typeof(string));
                dt.Columns.Add("Channels", typeof(string));
                dt.Columns.Add("RecipientGroup", typeof(string));
                dt.Columns.Add("Status", typeof(string));
                dt.Columns.Add("DateSent", typeof(string));
                dt.Columns.Add("MessageBody", typeof(string));
            }

            int newId = dt.Rows.Count + 1;
            string currentDate = DateTime.Now.ToString("MMM dd, yyyy") +
                "<br/><span style=\"color:#9ca3af;\">" +
                DateTime.Now.ToString("hh:mm tt") + "</span>";

            dt.Rows.Add(newId, title, "Push & Email", audience, "Sent", currentDate, content);
            Session["StaticNotifications"] = dt;

            // 3. Success alert + redirect
            ClientScript.RegisterStartupScript(
                this.GetType(),
                "notifySuccess",
                "alert('Notification has been dispatched successfully!'); window.location='Notification.aspx';",
                true
            );
        }
    }
}