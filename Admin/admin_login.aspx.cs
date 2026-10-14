using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Style_On_Rent.Admin
{

        public partial class admin_login : System.Web.UI.Page
        {
            // Static Admin Credentials (Database વગર ટેસ્ટિંગ માટે)
            private const string StaticAdminEmail = "admin@styleonrent.com";
            private const string StaticAdminPassword = "admin";

            protected void Page_Load(object sender, EventArgs e)
            {
                // CE545 Requirement: No external jQuery validation dependency
                this.UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;

                if (!IsPostBack)
                {
                    // જો એડમિન પહેલેથી લૉગિન હોય તો સીધું Dashboard પર મોકલો
                    if (Session["AdminId"] != null)
                    {
                        Response.Redirect("Admin_Dashboard.aspx");
                    }
                }
            }

            protected void btnLogin_Click(object sender, EventArgs e)
            {
                // Server-side Validation Check
                Page.Validate("AdminLoginGroup");
                if (!Page.IsValid)
                {
                    return;
                }

                string email = txtEmail.Text.Trim();
                string password = txtPassword.Text.Trim();

                // Hardcoded Credentials Check (Without Database)
                if (email.Equals(StaticAdminEmail, StringComparison.OrdinalIgnoreCase) && password == StaticAdminPassword)
                {
                    // ASP.NET State Management: Session Variables સેટ કરવા
                    Session["AdminId"] = "1";
                    Session["AdminName"] = "Super Admin";
                    Session["AdminEmail"] = email;

                    // Dashboard પર મોકલો
                    Response.Redirect("Admin_Dashboard.aspx");
                }
                else
                {
                    // ખોટા આઈડી/પાસવર્ડ માટે એલર્ટ
                    ClientScript.RegisterStartupScript(this.GetType(), "loginFailed", "alert('Invalid Email or Password! Default: admin@styleonrent.com / admin');", true);
                }
            }
        }
    }