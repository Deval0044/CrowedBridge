using System;
using System.Data.SqlClient;
using System.Web.UI;
using CrowedBridge;

namespace CrowedBridge.Home
{
    public partial class UserRegister : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            string fullName = txtFullName.Text.Trim();
            string email = txtEmail.Text.Trim();
            string mobile = txtMobile.Text.Trim();
            string role = ddlRole.SelectedValue;
            string password = txtPassword.Text.Trim();
            string confirmPassword = txtConfirmPassword.Text.Trim();

            if (password != confirmPassword)
            {
                lblError.Text = "Passwords do not match.";
                lblError.Visible = true;
                return;
            }

            try
            {
                string query = "INSERT INTO Users (FullName, Email, Mobile, Password, Role) VALUES (@FullName, @Email, @Mobile, @Password, @Role)";
                SqlParameter[] parameters = {
                    new SqlParameter("@FullName", fullName),
                    new SqlParameter("@Email", email),
                    new SqlParameter("@Mobile", mobile),
                    new SqlParameter("@Password", password),
                    new SqlParameter("@Role", role)
                };

                int rows = DbHelper.ExecuteNonQuery(query, parameters);
                if (rows > 0)
                {
                    Response.Redirect("Login.aspx?registered=true");
                }
            }
            catch
            {
                Session["UserName"] = fullName;
                Session["UserRole"] = role;

                if (role == "Creator")
                    Response.Redirect("~/Creator/Dashboard.aspx");
                else if (role == "Admin")
                    Response.Redirect("~/Admin/AdminDashbord.aspx");
                else
                    Response.Redirect("~/Backers/AuthenticatedHomepage.aspx");
            }
        }
    }
}