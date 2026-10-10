using System;
using System.Web.UI;

namespace CrowedBridge
{
    public partial class UserRegister : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            string fullName = txtFullName.Text.Trim();
            string role = ddlRole.SelectedValue;

            // Simple validation to ensure name is entered
            if (string.IsNullOrEmpty(fullName))
            {
                lblError.Text = "Please enter your full name.";
                lblError.Visible = true;
                return;
            }

            // Save the exact registered name into Session
            Session["UserName"] = fullName;

            // Redirect based on selected role
            if (role == "Creator")
            {
                Response.Redirect("~/Creator/Dashboard.aspx");
            }
            else if (role == "Admin")
            {
                Response.Redirect("~/Admin/Dashboard.aspx");
            }
            else
            {
                // Default for Backer or unselected role
                Response.Redirect("~/Backers/AuthenticatedHomepage.aspx");
            }
        }
    }
}