using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.UI.WebControls;

namespace Style_On_Rent.Admin
{
    public partial class Users : System.Web.UI.Page
    {
        private static List<Customer> _customers = new List<Customer>
        {
            new Customer { Id=1, Name="Priya Sharma", Phone="9876543210", Email="priya@example.com", TotalRentals=5, LastRental="2025-01-12" },
            new Customer { Id=2, Name="Aarti Patel",  Phone="9823456781", Email="aarti@example.com", TotalRentals=0, LastRental="—" },
            new Customer { Id=3, Name="Meera Joshi",  Phone="9765432109", Email="meera@example.com", TotalRentals=2, LastRental="2025-01-08" },
            new Customer { Id=4, Name="Riya Desai",   Phone="9712345678", Email="riya@example.com",  TotalRentals=3, LastRental="2025-01-05" },
            new Customer { Id=5, Name="Kavya Mehta",  Phone="9698765432", Email="kavya@example.com", TotalRentals=1, LastRental="2024-12-29" }
        };

        protected void Page_Load(object sender, EventArgs e)
        {
            UnobtrusiveValidationMode = System.Web.UI.UnobtrusiveValidationMode.None; if (!IsPostBack) BindCustomers();
        }

        private void BindCustomers(string search = null)
        {
            var list = GetCustomers();
            if (!string.IsNullOrWhiteSpace(search))
            {
                string s = search.Trim().ToLower();
                list = list.Where(c =>
                    (c.Name ?? "").ToLower().Contains(s) ||
                    (c.Phone ?? "").ToLower().Contains(s)).ToList();
            }
            rptCustomers.DataSource = list;
            rptCustomers.DataBind();
            lblCustomerCount.Text = list.Count + " Customer" + (list.Count == 1 ? "" : "s");
        }

        private List<Customer> GetCustomers() { return _customers; }

        protected void btnSearch_Click(object sender, EventArgs e) { BindCustomers(txtSearch.Text); }
        protected void btnFilter_Click(object sender, EventArgs e) { BindCustomers(txtSearch.Text); }

        protected void rptCustomers_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            int id;
            if (!int.TryParse(Convert.ToString(e.CommandArgument), out id)) return;
            switch (e.CommandName)
            {
                case "ViewCustomer": ShowView(id); break;
                case "EditCustomer": ShowEdit(id); break;
                case "DeleteCustomer":
                    hdnDeleteId.Value = id.ToString();
                    pnlDeleteCustomer.Visible = true;
                    break;
            }
        }

        protected void btnOpenAdd_Click(object sender, EventArgs e)
        {
            txtAddName.Text = txtAddPhone.Text = txtAddEmail.Text = "";
            pnlAddCustomer.Visible = true;
        }
        protected void btnCloseAdd_Click(object sender, EventArgs e) { pnlAddCustomer.Visible = false; }

        protected void btnAddCustomer_Click(object sender, EventArgs e)
        {
            if (!Page.IsValid) return;
            int newId = _customers.Count == 0 ? 1 : _customers.Max(c => c.Id) + 1;
            _customers.Add(new Customer
            {
                Id = newId,
                Name = txtAddName.Text.Trim(),
                Phone = txtAddPhone.Text.Trim(),
                Email = txtAddEmail.Text.Trim(),
                TotalRentals = 0,
                LastRental = "—"
            });
            pnlAddCustomer.Visible = false;
            BindCustomers(txtSearch.Text);
        }

        private void ShowView(int id)
        {
            var c = _customers.FirstOrDefault(x => x.Id == id);
            if (c == null) return;
            lblViewName.Text = c.Name;
            lblViewPhone.Text = c.Phone;
            lblViewEmail.Text = c.Email;
            lblViewRentals.Text = c.TotalRentals.ToString();
            lblViewLastRental.Text = c.LastRental;
            pnlViewCustomer.Visible = true;
        }
        protected void btnCloseView_Click(object sender, EventArgs e) { pnlViewCustomer.Visible = false; }

        private void ShowEdit(int id)
        {
            var c = _customers.FirstOrDefault(x => x.Id == id);
            if (c == null) return;
            hdnEditId.Value = c.Id.ToString();
            txtEditName.Text = c.Name;
            txtEditPhone.Text = c.Phone;
            txtEditEmail.Text = c.Email;
            pnlEditCustomer.Visible = true;
        }
        protected void btnCloseEdit_Click(object sender, EventArgs e) { pnlEditCustomer.Visible = false; }

        protected void btnSaveCustomer_Click(object sender, EventArgs e)
        {
            if (!Page.IsValid) return;
            int id;
            if (!int.TryParse(hdnEditId.Value, out id)) return;
            var c = _customers.FirstOrDefault(x => x.Id == id);
            if (c == null) return;
            c.Name = txtEditName.Text.Trim();
            c.Phone = txtEditPhone.Text.Trim();
            c.Email = txtEditEmail.Text.Trim();
            pnlEditCustomer.Visible = false;
            BindCustomers(txtSearch.Text);
        }

        protected void btnCancelDelete_Click(object sender, EventArgs e) { pnlDeleteCustomer.Visible = false; }

        protected void btnConfirmDelete_Click(object sender, EventArgs e)
        {
            int id;
            if (int.TryParse(hdnDeleteId.Value, out id))
            {
                var c = _customers.FirstOrDefault(x => x.Id == id);
                if (c != null) _customers.Remove(c);
            }
            pnlDeleteCustomer.Visible = false;
            BindCustomers(txtSearch.Text);
        }

        public class Customer
        {
            public int Id { get; set; }
            public string Name { get; set; }
            public string Phone { get; set; }
            public string Email { get; set; }
            public int TotalRentals { get; set; }
            public string LastRental { get; set; }
        }
    }
}