using System;
using System.Data;
using System.Web.UI.WebControls;

namespace CrowedBridge
{
    public partial class Default : System.Web.UI.Page
    {
        // Explicit Control Declarations to prevent CS0103 build errors
        protected Repeater rptCampaigns;
        protected HyperLink hlStartCampaign;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadFeaturedCampaigns();
            }
        }

        private void LoadFeaturedCampaigns()
        {
            DataTable dt = new DataTable();
            dt.Columns.Add("Title", typeof(string));
            dt.Columns.Add("Category", typeof(string));
            dt.Columns.Add("Description", typeof(string));
            dt.Columns.Add("Raised", typeof(string));
            dt.Columns.Add("Progress", typeof(int));
            dt.Columns.Add("Creator", typeof(string));

            dt.Rows.Add("Solar Cold Storage for Farmers", "CleanTech", "Providing solar-powered refrigeration units to rural farmers to reduce crop wastage.", "₹12,50,000", 70, "Sunil Verma");
            dt.Rows.Add("Digital Looms for Village Artisans", "Artisans", "Upgrading traditional handlooms with automated design patterns for higher yield.", "₹4,20,000", 50, "Ritu Devi");
            dt.Rows.Add("Mobile Health Van for District 4", "Healthcare", "Deploying primary healthcare diagnostic tools on wheel units for remote tribal areas.", "₹21,00,000", 85, "Dr. K. Patel");

            rptCampaigns.DataSource = dt;
            rptCampaigns.DataBind();
        }
    }
}