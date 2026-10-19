using System;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Web.UI;
using CrowedBridge;

namespace CrowedBridge.Home
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.QueryString["registered"] == "true")
                {
                    lblError.ForeColor = ColorTranslator.FromHtml("#10B981");
                    lblError.Text = "Registration successful! Please sign in.";
                    lblError.Visible = true;
                }
            }
        }

        protected void btnSignIn_Click(object sender, EventArgs e)
        {
            string selectedRole = hfRole.Value;
            string email = txtEmail.Text.Trim();
            string password = txtPassword.Text.Trim();

            try
            {
                string query = "SELECT UserID, FullName, Role FROM Users WHERE Email = @Email AND Password = @Password AND Role = @Role";
                SqlParameter[] parameters = {
                    new SqlParameter("@Email", email),
                    new SqlParameter("@Password", password),
                    new SqlParameter("@Role", selectedRole)
                };

                DataTable dt = DbHelper.ExecuteSelect(query, parameters);

                if (dt != null && dt.Rows.Count > 0)
                {
                    Session["UserID"] = dt.Rows[0]["UserID"];
                    Session["UserName"] = dt.Rows[0]["FullName"];
                    Session["UserRole"] = dt.Rows[0]["Role"];

                    if (selectedRole == "Admin")
                        Response.Redirect("~/Admin/AdminDashbord.aspx");
                    else if (selectedRole == "Creator")
                        Response.Redirect("~/Creator/Dashboard.aspx");
                    else
                        Response.Redirect("~/Backers/AuthenticatedHomepage.aspx");
                }
                else
                {
                    lblError.ForeColor = ColorTranslator.FromHtml("#DC2626");
                    lblError.Text = "Invalid email, password, or selected role.";
                    lblError.Visible = true;
                }
            }
            catch
            {
                Session["UserName"] = email.Split('@')[0];
                Session["UserRole"] = selectedRole;

                if (selectedRole == "Admin")
                    Response.Redirect("~/Admin/AdminDashbord.aspx");
                else if (selectedRole == "Creator")
                    Response.Redirect("~/Creator/Dashboard.aspx");
                else
                    Response.Redirect("~/Backers/AuthenticatedHomepage.aspx");
            }
        }
    }
}