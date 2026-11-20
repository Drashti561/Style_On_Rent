using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Style_On_Rent
{
    public partial class Profile : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Default profile data set karo (session ma na hoy to)
                if (Session["ProfileName"] == null)
                {
                    Session["ProfileName"] = "Aanya Sharma";
                    Session["ProfileEmail"] = "aanya.sharma@gmail.com";
                    Session["ProfilePhone"] = "+91 1234567890";
                    Session["ProfileMemberSince"] = "October 2022";
                }

                LoadProfile();
            }
        }

        private void LoadProfile()
        {
            string name = Session["ProfileName"] as string;
            string email = Session["ProfileEmail"] as string;
            string phone = Session["ProfilePhone"] as string;
            string member = Session["ProfileMemberSince"] as string;

            // Display mode
            lblName.Text = name;
            lblEmail.Text = email;
            lblPhone.Text = phone;
            lblMemberSince.Text = member;

            // Side card name
            lblSideName.Text = name.Replace(" ", "<br />");
        }

        protected void btnEdit_Click(object sender, EventArgs e)
        {
            // Edit mode on karo
            pnlDisplay.Visible = false;
            pnlEdit.Visible = true;
            btnEdit.Visible = false;
            lblSuccess.Visible = false;

            // Textbox ma current values set karo
            txtName.Text = Session["ProfileName"] as string;
            txtEmail.Text = Session["ProfileEmail"] as string;
            txtPhone.Text = Session["ProfilePhone"] as string;
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            // Values session ma save karo
            Session["ProfileName"] = txtName.Text.Trim();
            Session["ProfileEmail"] = txtEmail.Text.Trim();
            Session["ProfilePhone"] = txtPhone.Text.Trim();

            // Edit mode off karo
            pnlDisplay.Visible = true;
            pnlEdit.Visible = false;
            btnEdit.Visible = true;

            // Success message show karo
            lblSuccess.Visible = true;

            // Display mode ma values update karo
            LoadProfile();
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            // Edit mode off karo (kai save nahi)
            pnlDisplay.Visible = true;
            pnlEdit.Visible = false;
            btnEdit.Visible = true;
            lblSuccess.Visible = false;

            // Display mode ma old values show karo
            LoadProfile();
        }
    }
}