using System;
using System.Collections.Generic;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CrowedBridge
{
    public partial class Default : Page
    {
        // Explicit control declarations to prevent CS0103 build errors
        protected global::System.Web.UI.WebControls.HyperLink hlSignIn;
        protected global::System.Web.UI.WebControls.Panel pnlUserBanner;
        protected global::System.Web.UI.WebControls.Repeater rptCampaigns;
        protected global::System.Web.UI.WebControls.Image imgHeroBg;
        protected global::System.Web.UI.WebControls.HyperLink hlStartFunding;

        public class ProjectItem
        {
            public int Id { get; set; }
            public string Title { get; set; }
            public string Category { get; set; }
            public string City { get; set; }
            public string Description { get; set; }
            public string ImageUrl { get; set; }
            public string BadgeText { get; set; }
            public string Raised { get; set; }
            public string Goal { get; set; }
            public int DaysLeft { get; set; }
            public int Progress { get; set; }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                CheckAuthenticationStatus();
                LoadCampaigns();
            }
        }

        private void CheckAuthenticationStatus()
        {
            if (Session["User"] != null && hlSignIn != null)
            {
                hlSignIn.Text = "My Dashboard";
                hlSignIn.NavigateUrl = "~/Home/UserDashboard.aspx";
                if (pnlUserBanner != null) pnlUserBanner.Visible = true;
            }
        }

        private void LoadCampaigns()
        {
            var list = new List<ProjectItem>
            {
                new ProjectItem { Id = 1, Title = "Urban Oasis Hydroponics", Category = "AGRITECH", City = "PUNE", Description = "Empowering urban communities to grow pesticide-free vegetables.", ImageUrl = "~/Images/1.jpg", BadgeText = "Funded", Raised = "15.2L", Goal = "12.0L", DaysLeft = 12, Progress = 100 },
                new ProjectItem { Id = 2, Title = "NextGen Coding Academies", Category = "EDUTECH", City = "BANGALORE", Description = "Bridging the digital divide by setting up state-of-the-art coding labs.", ImageUrl = "~/Images/2.jpg", BadgeText = "Urgent", Raised = "18.7L", Goal = "25.0L", DaysLeft = 5, Progress = 75 },
                new ProjectItem { Id = 3, Title = "Heritage Weavers Collective", Category = "ARTISANS & CRAFTS", City = "JAIPUR", Description = "Modernizing supply chain access for local pottery and weaving artisans.", ImageUrl = "~/Images/3.jpg", BadgeText = "", Raised = "4.5L", Goal = "10.0L", DaysLeft = 28, Progress = 45 },
                new ProjectItem { Id = 4, Title = "Surya Community Microgrids", Category = "CLEANTECH", City = "DELHI", Description = "Deploying affordable decentralized solar microgrids to rural housing centers.", ImageUrl = "~/Images/4.jpg", BadgeText = "", Raised = "42.5L", Goal = "50.0L", DaysLeft = 15, Progress = 85 }
            };

            // Additional featured campaigns unlocked when user is authenticated
            if (Session["User"] != null)
            {
                list.Add(new ProjectItem { Id = 5, Title = "Bio-Gas Container Processing", Category = "CLEANTECH", City = "PUNE", Description = "Converting organic municipal waste into clean cooking gas.", ImageUrl = "~/Images/5.jpg", BadgeText = "Trending", Raised = "22.0L", Goal = "25.0L", DaysLeft = 9, Progress = 88 });
                list.Add(new ProjectItem { Id = 6, Title = "Mobile Tele-Clinic Diagnostic Van", Category = "HEALTHCARE", City = "BANGALORE", Description = "Deploying solar diagnostic vans with primary healthcare equipment.", ImageUrl = "~/Images/6.jpg", BadgeText = "Urgent", Raised = "8.2L", Goal = "10.0L", DaysLeft = 4, Progress = 82 });
            }

            if (rptCampaigns != null)
            {
                rptCampaigns.DataSource = list;
                rptCampaigns.DataBind();
            }
        }

        public string GetBadgeMarkup(string badge)
        {
            if (string.IsNullOrEmpty(badge)) return "";
            string css = badge == "Funded" ? "badge-funded" : "badge-urgent";
            return $"<span class=\"badge {css}\">{badge}</span>";
        }
    }
}