using System;
using System.Linq;
using System.Web.UI;
using CrowedBridge.Home;

namespace CrowedBridge.Backers
{
    public partial class ProjectDetails : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                int projectId = 1;
                if (Request.QueryString["id"] != null)
                {
                    int.TryParse(Request.QueryString["id"], out projectId);
                }

                LoadProjectDetails(projectId);
            }
        }

        private void LoadProjectDetails(int id)
        {
            var masterList = ProjectSearch.GetMasterList(true);
            var project = masterList.FirstOrDefault(p => p.Id == id) ?? masterList.FirstOrDefault();

            if (project != null)
            {
                lblTitle.Text = project.Title;
                lblCity.Text = string.IsNullOrEmpty(project.City) ? "Pune" : project.City;
                imgBanner.ImageUrl = project.ImageUrl;

                if (project.Progress >= 100)
                {
                    lblBadge.Text = project.Progress + "% Funded";
                    lblBadge.CssClass = "funded-badge";
                }
                else if (project.BadgeText == "Urgent")
                {
                    lblBadge.Text = "Urgent";
                    lblBadge.CssClass = "urgent-badge";
                }
                else
                {
                    lblBadge.Text = string.IsNullOrEmpty(project.BadgeText) ? "Active Funding" : project.BadgeText;
                    lblBadge.CssClass = "funded-badge";
                }

                lblDescription.Text = project.Description;
                lblRaised.Text = project.Raised;
                lblGoal.Text = project.Goal;
                lblDaysLeft.Text = project.DaysLeft.ToString();

                SetImpactMetrics(project.Category);

                double pct = project.Progress > 100 ? 100 : project.Progress;
                pnlProgress.Width = System.Web.UI.WebControls.Unit.Percentage(pct);
                pnlProgress.CssClass = project.Progress >= 100 ? "progress-bar-fill funded" : "progress-bar-fill";
            }
        }

        private void SetImpactMetrics(string category)
        {
            if (string.IsNullOrEmpty(category)) category = "";

            switch (category.ToUpper())
            {
                case "AGRITECH":
                    lblMetric1Val.Text = "5,000 kg";
                    lblMetric1Lbl.Text = "Yield per year";
                    lblMetric2Val.Text = "12";
                    lblMetric2Lbl.Text = "Local jobs created";
                    break;

                case "EDUTECH":
                    lblMetric1Val.Text = "1,200+";
                    lblMetric1Lbl.Text = "Students reached";
                    lblMetric2Val.Text = "15 Labs";
                    lblMetric2Lbl.Text = "Digital Classrooms";
                    break;

                case "CLEANTECH":
                    lblMetric1Val.Text = "450 MWh";
                    lblMetric1Lbl.Text = "Clean power / yr";
                    lblMetric2Val.Text = "85%";
                    lblMetric2Lbl.Text = "CO2 Reduction";
                    break;

                case "HEALTHCARE":
                    lblMetric1Val.Text = "10,000+";
                    lblMetric1Lbl.Text = "Patients treated";
                    lblMetric2Val.Text = "24/7";
                    lblMetric2Lbl.Text = "Mobile Coverage";
                    break;

                case "ARTISANS & CRAFTS":
                    lblMetric1Val.Text = "250+";
                    lblMetric1Lbl.Text = "Artisans supported";
                    lblMetric2Val.Text = "3x";
                    lblMetric2Lbl.Text = "Income Multiplier";
                    break;

                default:
                    lblMetric1Val.Text = "1,000+";
                    lblMetric1Lbl.Text = "Lives impacted";
                    lblMetric2Val.Text = "100%";
                    lblMetric2Lbl.Text = "Verified delivery";
                    break;
            }
        }

        protected void btnTier500_Click(object sender, EventArgs e)
        {
            txtPledgeAmount.Text = "500";
        }

        protected void btnTier2500_Click(object sender, EventArgs e)
        {
            txtPledgeAmount.Text = "2500";
        }

        protected void btnTier10000_Click(object sender, EventArgs e)
        {
            txtPledgeAmount.Text = "10000";
        }

        protected void btnBackProject_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                string projectId = Request.QueryString["id"] ?? "1";
                string pledge = txtPledgeAmount.Text.Trim();
                Response.Redirect("~/Backers/PledgeModal.aspx?projectId=" + projectId + "&pledge=" + pledge);
            }
        }
    }
}