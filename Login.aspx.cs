using System;
using System.Data.SqlClient;

namespace StyleOnRent
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            Page.Validate("Login");

            if (!Page.IsValid)
            {
                return;
            }

            string email = txtEmail.Text.Trim();
            string password = txtPassword.Text.Trim();

            try
            {
                using (SqlConnection con = DBHelper.GetConnection())
                {
                    con.Open();

                    string query = @"
                        SELECT
                            UserId,
                            FullName
                        FROM Users
                        WHERE Email = @Email
                        AND PasswordHash = @Password
                        AND Status = 'ACTIVE'";

                    using (SqlCommand cmd =
                        new SqlCommand(query, con))
                    {
                        cmd.Parameters.AddWithValue(
                            "@Email", email);

                        cmd.Parameters.AddWithValue(
                            "@Password", password);


                        using (SqlDataReader reader =
                            cmd.ExecuteReader())
                        {
                            if (reader.Read())
                            {
                                // Store user information
                                Session["UserId"] =
                                    reader["UserId"];

                                Session["UserName"] =
                                    reader["FullName"];


                                // Login successful
                                Response.Redirect(
                                    "home.aspx");
                            }
                            else
                            {
                                lblMessage.Text =
                                    "Invalid Email or Password.";

                                lblMessage.ForeColor =
                                    System.Drawing.Color.Red;
                            }
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                lblMessage.Text =
                    "Database Error: " + ex.Message;

                lblMessage.ForeColor =
                    System.Drawing.Color.Red;
            }
        }

        protected void txtPassword_TextChanged(object sender, EventArgs e)
        {

        }
    }
}