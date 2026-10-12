using System;
using System.IO;
using System.Web.UI;

namespace CrowedBridge.Home
{
    public partial class LoginHome : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Default tab
                hfRole.Value = "Backer";
            }
        }

        protected void btnSignIn_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                string selectedRole = hfRole.Value;
                string email = txtEmail.Text.Trim();

                // Save user login session state
                Session["Username"] = email;
                Session["UserRole"] = selectedRole;

                switch (selectedRole)
                {
                    case "Backer":
                        // Redirects directly to Backer homepage
                        Response.Redirect("~/Backers/AuthenticatedHomepage.aspx");
                        break;

                    case "Admin":
                        // Redirects directly to Admin dashboard
                        Response.Redirect("~/Admin/AdminDashbord.aspx");
                        break;

                    case "Creator":
                        RedirectToDashboard("Creator", new string[] { "Dashboard.aspx", "Default.aspx" });
                        break;

                    default:
                        Response.Redirect("~/Home/Default.aspx");
                        break;
                }
            }
        }

        private void RedirectToDashboard(string folderName, string[] dashboardPages)
        {
            foreach (string pageName in dashboardPages)
            {
                string relativePath = $"~/{folderName}/{pageName}";
                string physicalPath = Server.MapPath(relativePath);

                if (File.Exists(physicalPath))
                {
                    Response.Redirect(relativePath);
                    return;
                }
            }

            Response.Redirect("~/Home/Default.aspx");
        }
    }
}