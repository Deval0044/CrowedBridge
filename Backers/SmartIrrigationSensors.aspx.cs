using System;
using System.Web.UI;

namespace CrowedBridge.Backers
{
    public partial class SmartIrrigationSensors : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void btnSelectTier2_Click(object sender, EventArgs e)
        {
            // Redirects directly to PledgeModal.aspx
            Response.Redirect("~/Backers/PledgeModal.aspx?amount=2,500&tier=Early Bird Kit");
        }
    }
}