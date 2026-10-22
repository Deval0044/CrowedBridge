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
                int id = 1;
                if (Request.QueryString["id"] != null)
                {
                    int.TryParse(Request.QueryString["id"], out id);
                }

                LoadProject(id);
            }
        }

        private void LoadProject(int id)
        {
            var masterList = ProjectSearch.GetMasterList(true);
            var project = masterList.FirstOrDefault(p => p.Id == id) ?? masterList.FirstOrDefault();

            if (project != null)
            {
                lblTitle.Text = project.Title;
                lblCity.Text = string.IsNullOrEmpty(project.City) ? "Nashik" : project.City;
                lblCategory.Text = project.Category;
                imgBanner.ImageUrl = project.ImageUrl;
                lblDescription.Text = project.Description;
                lblRaised.Text = project.Raised;
                lblGoal.Text = project.Goal;
                lblDaysLeft.Text = project.DaysLeft.ToString();
                lblPct.Text = project.Progress + "%";
                lblPctBadge.Text = project.Progress + "% Funded";

                double pct = project.Progress > 100 ? 100 : project.Progress;
                pnlProgress.Width = System.Web.UI.WebControls.Unit.Percentage(pct);
            }
        }

        protected void btnTier1_Click(object sender, EventArgs e)
        {
            RedirectToPledge("500");
        }

        protected void btnTier2_Click(object sender, EventArgs e)
        {
            RedirectToPledge("2500");
        }

        protected void btnBackProjectNow_Click(object sender, EventArgs e)
        {
            RedirectToPledge("2500");
        }

        private void RedirectToPledge(string amount)
        {
            string id = Request.QueryString["id"] ?? "1";
            Response.Redirect("~/Backers/PledgeModal.aspx?projectId=" + id + "&pledge=" + amount);
        }
    }
}