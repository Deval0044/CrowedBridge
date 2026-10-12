using System;
using System.Web.UI;

namespace CrowedBridge.Backers
{
    public partial class PledgeModal : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string amount = Request.QueryString["amount"];
                string tier = Request.QueryString["tier"];

                if (!string.IsNullOrEmpty(amount))
                {
                    lblTierAmount.Text = amount;
                    lblMinPledge.Text = amount;
                    txtPledgeAmount.Text = amount.Replace(",", "");
                }

                if (!string.IsNullOrEmpty(tier))
                {
                    lblTierTitle.Text = tier;
                }
            }
        }
    }
}