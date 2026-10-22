using System;
using System.Web.UI;

namespace CrowedBridge.Creator
{
    public partial class Dashboard : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Verify user session
                if (Session["User"] == null && Session["UserName"] == null)
                {
                    Response.Redirect("~/Home/Login.aspx");
                }
            }
        }

        protected void btnSignOut_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Session.Abandon();
            Response.Redirect("~/Home/Login.aspx");
        }
    }
}