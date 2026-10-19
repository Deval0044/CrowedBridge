using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CrowedBridge.Home
{
    public partial class ProjectSearch : Page
    {
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
                CheckAuth();
                BindData();
            }
        }

        private void CheckAuth()
        {
            if (Session["User"] != null && hlSignIn != null)
            {
                hlSignIn.Text = "My Dashboard";
                hlSignIn.NavigateUrl = "~/Home/UserDashboard.aspx";
            }
        }

        public static List<ProjectItem> GetMasterList(bool isLoggedIn)
        {
            var list = new List<ProjectItem>
            {
                new ProjectItem { Id = 1, Title = "Urban Oasis Hydroponics", Category = "AGRITECH", City = "PUNE", Description = "Empowering urban communities to grow pesticide-free vegetables.", ImageUrl = "~/Images/1.jpg", BadgeText = "Funded", Raised = "15.2L", Goal = "12.0L", DaysLeft = 12, Progress = 100 },
                new ProjectItem { Id = 2, Title = "NextGen Coding Academies", Category = "EDUTECH", City = "BANGALORE", Description = "Bridging the digital divide by setting up state-of-the-art coding labs.", ImageUrl = "~/Images/2.jpg", BadgeText = "Urgent", Raised = "18.7L", Goal = "25.0L", DaysLeft = 5, Progress = 75 },
                new ProjectItem { Id = 3, Title = "Heritage Weavers Collective", Category = "ARTISANS & CRAFTS", City = "JAIPUR", Description = "Modernizing supply chain access for local pottery and weaving artisans.", ImageUrl = "~/Images/3.jpg", BadgeText = "", Raised = "4.5L", Goal = "10.0L", DaysLeft = 28, Progress = 45 },
                new ProjectItem { Id = 4, Title = "Surya Community Microgrids", Category = "CLEANTECH", City = "DELHI", Description = "Deploying affordable decentralized solar microgrids to rural housing centers.", ImageUrl = "~/Images/4.jpg", BadgeText = "", Raised = "42.5L", Goal = "50.0L", DaysLeft = 15, Progress = 85 },
                new ProjectItem { Id = 5, Title = "Bio-Gas Container Processing", Category = "CLEANTECH", City = "PUNE", Description = "Converting organic municipal waste into clean cooking gas using modular containers.", ImageUrl = "~/Images/5.jpg", BadgeText = "Trending", Raised = "22.0L", Goal = "25.0L", DaysLeft = 9, Progress = 88 },
                new ProjectItem { Id = 6, Title = "Mobile Tele-Clinic Diagnostic Van", Category = "HEALTHCARE", City = "BANGALORE", Description = "Deploying solar diagnostic vans with primary healthcare equipment to rural sectors.", ImageUrl = "~/Images/6.jpg", BadgeText = "Urgent", Raised = "8.2L", Goal = "10.0L", DaysLeft = 4, Progress = 82 },
                new ProjectItem { Id = 7, Title = "Smart Drip Irrigation Networks", Category = "AGRITECH", City = "JAIPUR", Description = "Low-cost automated drip lines powered by soil moisture sensors for small farms.", ImageUrl = "~/Images/7.jpg", BadgeText = "", Raised = "6.4L", Goal = "8.0L", DaysLeft = 19, Progress = 80 },
                new ProjectItem { Id = 8, Title = "Rural Solar Cold Storage Units", Category = "CLEANTECH", City = "DELHI", Description = "Installing off-grid solar cold rooms to prevent post-harvest crop loss.", ImageUrl = "~/Images/8.jpg", BadgeText = "Funded", Raised = "15.0L", Goal = "15.0L", DaysLeft = 0, Progress = 100 },
                new ProjectItem { Id = 9, Title = "Smart Classroom Learning Tablets", Category = "EDUTECH", City = "PUNE", Description = "Providing solar-rechargeable digital tablets for rural primary school students.", ImageUrl = "~/Images/9.jpg", BadgeText = "", Raised = "11.5L", Goal = "20.0L", DaysLeft = 14, Progress = 58 }
            };

            if (isLoggedIn)
            {
                list.Add(new ProjectItem { Id = 10, Title = "Clean River Sanitation Dredging", Category = "CLEANTECH", City = "DELHI", Description = "Solar-powered trash skimmers for community water bodies.", ImageUrl = "~/Images/1.jpg", BadgeText = "Urgent", Raised = "14.0L", Goal = "20.0L", DaysLeft = 10, Progress = 70 });
                list.Add(new ProjectItem { Id = 11, Title = "Organic Seeds Distribution Hub", Category = "AGRITECH", City = "PUNE", Description = "Distributing indigenous climate-resilient crop seeds.", ImageUrl = "~/Images/2.jpg", BadgeText = "", Raised = "8.5L", Goal = "10.0L", DaysLeft = 22, Progress = 85 });
                list.Add(new ProjectItem { Id = 12, Title = "Village Computer Labs Expansion", Category = "EDUTECH", City = "BANGALORE", Description = "Building high-speed satellite connectivity for rural classrooms.", ImageUrl = "~/Images/3.jpg", BadgeText = "Trending", Raised = "19.0L", Goal = "22.0L", DaysLeft = 6, Progress = 86 });
                list.Add(new ProjectItem { Id = 13, Title = "Traditional Textile Weaving R&D", Category = "ARTISANS & CRAFTS", City = "JAIPUR", Description = "Handloom solar motors for elderly artisan weavers.", ImageUrl = "~/Images/4.jpg", BadgeText = "", Raised = "3.2L", Goal = "5.0L", DaysLeft = 30, Progress = 64 });
            }

            return list;
        }

        private void BindData()
        {
            bool isLoggedIn = Session["User"] != null;
            var list = GetMasterList(isLoggedIn);

            string q = txtSearch.Text.Trim().ToLower();
            if (!string.IsNullOrEmpty(q))
                list = list.Where(p => p.Title.ToLower().Contains(q) || p.Category.ToLower().Contains(q) || p.City.ToLower().Contains(q)).ToList();

            if (ddlCity.SelectedValue != "All")
                list = list.Where(p => p.City == ddlCity.SelectedValue).ToList();

            if (hfCategory.Value != "All Projects")
                list = list.Where(p => p.Category == hfCategory.Value).ToList();

            if (hfStatus.Value == "Live Funding") list = list.Where(p => p.BadgeText != "Funded").ToList();
            else if (hfStatus.Value == "Completed") list = list.Where(p => p.BadgeText == "Funded").ToList();
            else if (hfStatus.Value == "Trending") list = list.Where(p => p.Progress >= 75).ToList();

            lblCount.Text = $"Showing {list.Count} projects";
            rptProjects.DataSource = list;
            rptProjects.DataBind();
        }

        protected void FilterProjects(object sender, EventArgs e) => BindData();

        protected void Category_Click(object sender, EventArgs e)
        {
            var btn = (Button)sender;
            hfCategory.Value = btn.CommandArgument;
            btnCatAll.CssClass = btnCatClean.CssClass = btnCatAgri.CssClass = btnCatEdu.CssClass = btnCatArtisan.CssClass = btnCatHealth.CssClass = "chip";
            btn.CssClass = "chip active";
            BindData();
        }

        protected void Status_Click(object sender, EventArgs e)
        {
            var btn = (Button)sender;
            hfStatus.Value = btn.CommandArgument;
            btnStatAll.CssClass = btnStatLive.CssClass = btnStatDone.CssClass = btnStatTrend.CssClass = "status-pill";
            btn.CssClass = "status-pill active";
            BindData();
        }

        public string GetBadgeMarkup(string badge)
        {
            if (string.IsNullOrEmpty(badge)) return "";
            string css = badge == "Funded" ? "badge-funded" : "badge-urgent";
            return $"<span class=\"badge {css}\">{badge}</span>";
        }
    }
}