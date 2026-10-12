using System;
using System.Web.UI;

namespace CrowedBridge.Backers
{
    public partial class PledgeSuccess : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Dynamic Pledge Amount
                if (Session["LastPledgeAmount"] != null)
                {
                    lblAmount.Text = Session["LastPledgeAmount"].ToString();
                }

                // Dynamic Date & Time
                lblDateTime.Text = DateTime.Now.ToString("MMM dd, yyyy, HH:mm") + " IST";

                // Generate Random Transaction ID
                Random rng = new Random();
                lblTransactionID.Text = "#TXN-" + rng.Next(10000, 99999).ToString();
            }
        }

        protected void btnBackDashboard_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Backers/AuthenticatedHomepage.aspx");
        }
    }
}