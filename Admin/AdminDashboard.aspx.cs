using System;
using System.Data;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CrowdBridge
{
    public partial class AdminDashboard : System.Web.UI.Page
    {
        // Explicitly declare controls to prevent CS0103 error
        protected global::System.Web.UI.WebControls.Label lblAdminName;
        protected global::System.Web.UI.WebControls.Label lblPendingCount;
        protected global::System.Web.UI.WebControls.GridView gvPendingCampaigns;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["UserName"] != null)
                {
                    lblAdminName.Text = "Hi, " + Session["UserName"].ToString() + " (Admin)";
                }

                LoadCampaignData();
            }
        }

        private void LoadCampaignData()
        {
            if (Session["PendingCampaigns"] == null)
            {
                DataTable dt = new DataTable();
                dt.Columns.Add("ID", typeof(string));
                dt.Columns.Add("Title", typeof(string));
                dt.Columns.Add("Creator", typeof(string));
                dt.Columns.Add("Category", typeof(string));
                dt.Columns.Add("Goal", typeof(string));

                dt.Rows.Add("CMP-101", "Solar Powered Smart Cold Storage", "Sunil Verma", "CleanTech", "₹18,00,000");
                dt.Rows.Add("CMP-102", "Artisan Loom Digitalization", "Ritu Devi", "Artisans & Crafts", "₹8,50,000");
                dt.Rows.Add("CMP-103", "Mobile Rural Health Clinic", "Dr. K. Patel", "Healthcare", "₹30,00,000");

                Session["PendingCampaigns"] = dt;
            }

            DataTable pendingDt = (DataTable)Session["PendingCampaigns"];
            gvPendingCampaigns.DataSource = pendingDt;
            gvPendingCampaigns.DataBind();

            lblPendingCount.Text = pendingDt.Rows.Count + " Pending";
        }

        protected void gvPendingCampaigns_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            string campaignId = e.CommandArgument.ToString();
            DataTable dt = (DataTable)Session["PendingCampaigns"];

            if (dt != null)
            {
                for (int i = dt.Rows.Count - 1; i >= 0; i--)
                {
                    if (dt.Rows[i]["ID"].ToString() == campaignId)
                    {
                        dt.Rows.RemoveAt(i);
                        break;
                    }
                }

                Session["PendingCampaigns"] = dt;
                LoadCampaignData();
            }
        }

        protected void btnSignOut_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Session.Abandon();
            Response.Redirect("~/Login.aspx");
        }
    }
}