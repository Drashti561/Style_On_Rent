using System;
using System.Collections.Generic;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Style_On_Rent.Admin
{
    public partial class ManageAboutUs : System.Web.UI.Page
    {
        // In-memory lists
        private static List<CoreValue> _coreValues = new List<CoreValue>
        {
            new CoreValue { Id=1, IconClass="bi bi-gem",     Title="Premium Quality",       Description="Each garment is handpicked and quality-checked before every rental." },
            new CoreValue { Id=2, IconClass="bi bi-feather", Title="Effortless Elegance",    Description="Curated collections that make traditional wear easy and stylish." },
            new CoreValue { Id=3, IconClass="bi bi-stars",   Title="Hygiene First",          Description="Every outfit is professionally cleaned and sanitized." },
            new CoreValue { Id=4, IconClass="bi bi-heart",   Title="Customer Delight",       Description="Dedicated support to make your rental experience seamless." }
        };

        private static List<Leader> _leaders = new List<Leader>
        {
            new Leader { Id=1, Name="Ananya Sharma", Role="Founder & CEO",            AvatarUrl="Images/leader1.jpg" },
            new Leader { Id=2, Name="Rohan Mehta",   Role="Head of Operations",       AvatarUrl="Images/leader2.jpg" },
            new Leader { Id=3, Name="Sneha Iyer",    Role="Creative Director",        AvatarUrl="Images/leader3.jpg" }
        };

        protected void Page_Load(object sender, EventArgs e)
        {
            UnobtrusiveValidationMode = System.Web.UI.UnobtrusiveValidationMode.None;

            if (!IsPostBack)
            {
                LoadAboutContent();
                BindCoreValues();
                BindLeadership();
            }
        }

        private void LoadAboutContent()
        {
            txtOurStory.Text = "Style On Rent was born from a simple idea — every woman deserves to wear her dream outfit without the burden of ownership. From bridal couture to festive cholis, we bring designer wear to your doorstep.";
            txtOurMission.Text = "To make premium ethnic fashion accessible, affordable, and sustainable through a curated rental experience.";
            txtOurVision.Text = "To become India's most trusted rental wardrobe for celebrations, weddings, and every special occasion.";
        }

        private void BindCoreValues()
        {
            rptCoreValues.DataSource = _coreValues;
            rptCoreValues.DataBind();
        }

        private void BindLeadership()
        {
            rptLeadership.DataSource = _leaders;
            rptLeadership.DataBind();
        }

        // ---------- ADD CORE VALUE ----------
        protected void btnAddValueModal_Click(object sender, EventArgs e)
        {
            txtNewValueTitle.Text = "";
            txtNewValueDesc.Text = "";
            pnlAddValueModal.Visible = true;
            upnlAboutUs.Update();
        }

        protected void btnCloseValueModal_Click(object sender, EventArgs e)
        {
            pnlAddValueModal.Visible = false;
            upnlAboutUs.Update();
        }

        protected void btnSaveValue_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrWhiteSpace(txtNewValueTitle.Text) ||
                string.IsNullOrWhiteSpace(txtNewValueDesc.Text))
                return;

            int newId = _coreValues.Count == 0 ? 1 : _coreValues.Count + 1;
            _coreValues.Add(new CoreValue
            {
                Id = newId,
                IconClass = ddlValueIcon.SelectedValue,
                Title = txtNewValueTitle.Text.Trim(),
                Description = txtNewValueDesc.Text.Trim()
            });

            pnlAddValueModal.Visible = false;
            BindCoreValues();
            upnlAboutUs.Update();
        }

        // ---------- ADD LEADER ----------
        protected void btnAddLeaderModal_Click(object sender, EventArgs e)
        {
            txtNewLeaderName.Text = "";
            txtNewLeaderRole.Text = "";
            txtNewLeaderAvatar.Text = "";
            pnlAddLeaderModal.Visible = true;
            upnlAboutUs.Update();
        }

        protected void btnCloseLeaderModal_Click(object sender, EventArgs e)
        {
            pnlAddLeaderModal.Visible = false;
            upnlAboutUs.Update();
        }

        protected void btnSaveLeader_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrWhiteSpace(txtNewLeaderName.Text) ||
                string.IsNullOrWhiteSpace(txtNewLeaderRole.Text))
                return;

            int newId = _leaders.Count == 0 ? 1 : _leaders.Count + 1;
            _leaders.Add(new Leader
            {
                Id = newId,
                Name = txtNewLeaderName.Text.Trim(),
                Role = txtNewLeaderRole.Text.Trim(),
                AvatarUrl = string.IsNullOrWhiteSpace(txtNewLeaderAvatar.Text)
                    ? "Images/default_avatar.png"
                    : txtNewLeaderAvatar.Text.Trim()
            });

            pnlAddLeaderModal.Visible = false;
            BindLeadership();
            upnlAboutUs.Update();
        }

        // ---------- SAVE ALL ----------
        protected void btnSaveAllChanges_Click(object sender, EventArgs e)
        {
            // TODO: DB save ahiya karo
            pnlAlertSuccess.Visible = true;
            upnlAboutUs.Update();
        }

        // ---------- MODELS ----------
        public class CoreValue
        {
            public int Id { get; set; }
            public string IconClass { get; set; }
            public string Title { get; set; }
            public string Description { get; set; }
        }

        public class Leader
        {
            public int Id { get; set; }
            public string Name { get; set; }
            public string Role { get; set; }
            public string AvatarUrl { get; set; }
        }
    }
}