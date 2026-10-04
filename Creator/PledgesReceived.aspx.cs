using System;
using System.Web.UI;

namespace CrowedBridge.Creator
{
    public partial class PledgesReceived : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Load pledges data here
            }
        }

        protected void txtSearch_TextChanged(object sender, EventArgs e)
        {
            // Add search filtering logic here
        }

        protected void btnPrev_Click(object sender, EventArgs e)
        {
            // Add previous page logic here
        }

        protected void btnNext_Click(object sender, EventArgs e)
        {
            // Add next page logic here
        }
    }
}