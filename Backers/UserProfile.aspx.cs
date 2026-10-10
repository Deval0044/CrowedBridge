using System;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CrowedBridge.Backers
{
    public partial class UserProfile : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["UserName"] != null && !string.IsNullOrWhiteSpace(Session["UserName"].ToString()))
                {
                    lblFullName.Text = Session["UserName"].ToString();
                }
                else
                {
                    lblFullName.Text = "Rahul Verma";
                }
            }
        }

        // Fixes error CS1061 for line 340
        protected void btnBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Backers/AuthenticatedHomepage.aspx");
        }

        protected void btnEditProfile_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Backers/EditProfile.aspx");
        }

        protected void btnReceipt_Click(object sender, EventArgs e)
        {
            LinkButton btn = (LinkButton)sender;
            string contributionId = btn.CommandArgument;
            Response.Redirect($"~/Backers/DownloadReceipt.aspx?id={contributionId}");
        }
    }
}