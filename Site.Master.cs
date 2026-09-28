using System;
using System.Web.UI.WebControls;

namespace CrowedBridge
{
    public partial class SiteMaster : System.Web.UI.MasterPage
    {
        // Explicit Control Declarations to prevent CS0103 build errors
        protected PlaceHolder phLoggedOut;
        protected PlaceHolder phLoggedIn;
        protected Label lblUserGreeting;
        protected HyperLink hlAdminPortal;
        protected Button btnLogout;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                UpdateNavState();
            }
        }

        private void UpdateNavState()
        {
            if (Session["UserRole"] != null)
            {
                phLoggedOut.Visible = false;
                phLoggedIn.Visible = true;

                string userRole = Session["UserRole"].ToString();
                string userName = Session["UserName"] != null ? Session["UserName"].ToString() : "User";

                lblUserGreeting.Text = $"Hi, {userName} ({userRole})";

                if (userRole.Equals("Admin", StringComparison.OrdinalIgnoreCase))
                {
                    hlAdminPortal.Visible = true;
                }
            }
            else
            {
                phLoggedOut.Visible = true;
                phLoggedIn.Visible = false;
            }
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Session.Abandon();
            Response.Redirect("~/Login.aspx");
        }
    }
}