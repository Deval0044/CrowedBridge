using System;
using System.Web.UI;

namespace CrowedBridge.Backers
{
    public partial class Impact : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["User"] != null && !string.IsNullOrWhiteSpace(Session["User"].ToString()))
                {
                    string name = Session["User"].ToString().Trim();
                    string[] parts = name.Split(' ');
                    lblProfileName.Text = parts.Length > 1 ? parts[0] + " " + parts[1][0] + "." : name;
                }
                else
                {
                    lblProfileName.Text = "Rahul V.";
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