using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Style_On_Rent.Admin
{
    public partial class Notification : System.Web.UI.Page
    {
        private DataTable NotificationData
        {
            get
            {
                if (Session["StaticNotifications"] == null)
                {
                    DataTable dt = new DataTable();
                    dt.Columns.Add("Id", typeof(int));
                    dt.Columns.Add("Title", typeof(string));
                    dt.Columns.Add("Channels", typeof(string));
                    dt.Columns.Add("RecipientGroup", typeof(string));
                    dt.Columns.Add("Status", typeof(string));
                    dt.Columns.Add("DateSent", typeof(string));
                    dt.Columns.Add("MessageBody", typeof(string));

                    dt.Rows.Add(1, "Navratri Festive 20% Off", "Push & Email", "All Users", "Sent",
                        "Oct 12, 2026<br/><span style=\"color:#9ca3af;\">10:30 AM</span>",
                        "Celebrate this Navratri with our exclusive designer choli collection. Use code FESTIVE20.");
                    dt.Rows.Add(2, "Wedding Couture Early Access", "SMS & Push", "VIP Customers", "Scheduled",
                        "Oct 15, 2026<br/><span style=\"color:#9ca3af;\">02:00 PM</span>",
                        "Get early access to our handcrafted bridal couture before official launch.");
                    dt.Rows.Add(3, "Rental Return Reminder", "Email", "Active Renters", "Draft",
                        "Oct 10, 2026<br/><span style=\"color:#9ca3af;\">06:00 PM</span>",
                        "Kindly remember to return your rented choli item within the scheduled timeframe.");

                    Session["StaticNotifications"] = dt;
                }
                return (DataTable)Session["StaticNotifications"];
            }
            set
            {
                Session["StaticNotifications"] = value;
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            UnobtrusiveValidationMode = System.Web.UI.UnobtrusiveValidationMode.None;

            if (!IsPostBack)
            {
                BindNotifications();
            }
        }

        private void BindNotifications()
        {
            string search = txtSearchTitle != null ? txtSearchTitle.Text.Trim().ToLower() : "";
            DataTable dt = NotificationData;

            if (!string.IsNullOrEmpty(search))
            {
                DataTable filtered = dt.Clone();
                foreach (DataRow r in dt.Rows)
                {
                    if (r["Title"].ToString().ToLower().Contains(search) ||
                        r["RecipientGroup"].ToString().ToLower().Contains(search))
                    {
                        filtered.ImportRow(r);
                    }
                }
                rptNotifications.DataSource = filtered;
                rptNotifications.DataBind();
                litShowingText.Text = "Showing 1 to " + filtered.Rows.Count + " of " + filtered.Rows.Count + " entries";
            }
            else
            {
                rptNotifications.DataSource = dt;
                rptNotifications.DataBind();
                litShowingText.Text = "Showing 1 to " + dt.Rows.Count + " of " + dt.Rows.Count + " entries";
            }
        }

        public string GetStatusClass(string status)
        {
            switch (status != null ? status.Trim().ToLower() : "")
            {
                case "sent": return "status-sent";
                case "scheduled": return "status-scheduled";
                case "draft": return "status-draft";
                default: return string.Empty;
            }
        }

        protected void txtSearchTitle_TextChanged(object sender, EventArgs e)
        {
            BindNotifications();
            upnlNotification.Update();
        }

        protected void btnFilterOptions_Click(object sender, EventArgs e)
        {
            BindNotifications();
            upnlNotification.Update();
        }

        protected void btnNewCampaign_Click(object sender, EventArgs e)
        {
            Response.Redirect("AddCampaign.aspx");
        }

        protected void rptNotifications_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            int notifyId = Convert.ToInt32(e.CommandArgument);

            if (e.CommandName == "ViewNotification") OpenViewModal(notifyId);
            else if (e.CommandName == "EditNotification") OpenEditModal(notifyId);
            else if (e.CommandName == "DeleteNotification") OpenDeleteModal(notifyId);
        }

        private void OpenViewModal(int notifyId)
        {
            DataRow[] rows = NotificationData.Select("Id = " + notifyId);
            if (rows.Length > 0)
            {
                DataRow r = rows[0];
                litViewTitle.Text = r["Title"].ToString();
                litViewChannels.Text = r["Channels"].ToString();
                litViewAudience.Text = r["RecipientGroup"].ToString();
                litViewStatus.Text = r["Status"].ToString();
                litViewDate.Text = r["DateSent"].ToString();
                litViewBody.Text = r["MessageBody"].ToString();

                pnlViewModal.Visible = true;
                pnlEditModal.Visible = false;
                pnlDeleteModal.Visible = false;
                upnlNotification.Update();
            }
        }

        protected void btnCloseView_Click(object sender, EventArgs e)
        {
            pnlViewModal.Visible = false;
            upnlNotification.Update();
        }

        private void OpenEditModal(int notifyId)
        {
            DataRow[] rows = NotificationData.Select("Id = " + notifyId);
            if (rows.Length > 0)
            {
                DataRow r = rows[0];
                hfEditNotifyId.Value = r["Id"].ToString();
                txtEditTitle.Text = r["Title"].ToString();
                txtEditChannels.Text = r["Channels"].ToString();
                txtEditRecipientGroup.Text = r["RecipientGroup"].ToString();
                ddlEditStatus.SelectedValue = r["Status"].ToString();
                txtEditMessageBody.Text = r["MessageBody"].ToString();

                pnlEditModal.Visible = true;
                pnlViewModal.Visible = false;
                pnlDeleteModal.Visible = false;
                upnlNotification.Update();
            }
        }

        protected void btnCancelEdit_Click(object sender, EventArgs e)
        {
            pnlEditModal.Visible = false;
            upnlNotification.Update();
        }

        protected void btnSaveEdit_Click(object sender, EventArgs e)
        {
            int editId = Convert.ToInt32(hfEditNotifyId.Value);
            DataTable dt = NotificationData;

            DataRow[] rows = dt.Select("Id = " + editId);
            if (rows.Length > 0)
            {
                rows[0]["Title"] = txtEditTitle.Text.Trim();
                rows[0]["Channels"] = txtEditChannels.Text.Trim();
                rows[0]["RecipientGroup"] = txtEditRecipientGroup.Text.Trim();
                rows[0]["Status"] = ddlEditStatus.SelectedValue;
                rows[0]["MessageBody"] = txtEditMessageBody.Text.Trim();
            }

            NotificationData = dt;
            pnlEditModal.Visible = false;
            BindNotifications();
            upnlNotification.Update();
        }

        private void OpenDeleteModal(int notifyId)
        {
            DataRow[] rows = NotificationData.Select("Id = " + notifyId);
            if (rows.Length > 0)
            {
                hfDeleteNotifyId.Value = notifyId.ToString();
                litDeleteTargetName.Text = rows[0]["Title"].ToString();

                pnlDeleteModal.Visible = true;
                pnlViewModal.Visible = false;
                pnlEditModal.Visible = false;
                upnlNotification.Update();
            }
        }

        protected void btnCancelDelete_Click(object sender, EventArgs e)
        {
            pnlDeleteModal.Visible = false;
            upnlNotification.Update();
        }

        protected void btnConfirmDelete_Click(object sender, EventArgs e)
        {
            int targetId = Convert.ToInt32(hfDeleteNotifyId.Value);
            DataTable dt = NotificationData;

            for (int i = dt.Rows.Count - 1; i >= 0; i--)
            {
                if (Convert.ToInt32(dt.Rows[i]["Id"]) == targetId)
                {
                    dt.Rows.RemoveAt(i);
                    break;
                }
            }

            NotificationData = dt;
            pnlDeleteModal.Visible = false;
            BindNotifications();
            upnlNotification.Update();
        }
    }
}