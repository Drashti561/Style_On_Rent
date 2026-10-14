using System;
using System.Web;
using System.Web.UI;

namespace Style_On_Rent.Admin
{
    public partial class Admin_Logout : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e) { }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("Dashboard.aspx");
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Session.Abandon();
            Response.Redirect("admin_login.aspx");
        }
    }
}