using System;
using System.Web.UI;

namespace CrowedBridge.Backers
{
    public partial class AuthenticatedHomepage : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Check Session["UserName"] first, fallback to Session["User"]
                string rawUser = Session["UserName"] != null ? Session["UserName"].ToString() :
                                (Session["User"] != null ? Session["User"].ToString() : string.Empty);

                if (!string.IsNullOrWhiteSpace(rawUser))
                {
                    string name = rawUser.Trim();
                    lblUserName.Text = name;

                    string[] parts = name.Split(' ');
                    if (parts.Length > 1)
                    {
                        lblProfileName.Text = parts[0] + " " + parts[1][0] + ".";
                    }
                    else
                    {
                        lblProfileName.Text = name;
                    }
                }
                else
                {
                    lblUserName.Text = "Rahul";
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