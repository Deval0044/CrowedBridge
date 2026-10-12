using System;
using System.Web.UI;

namespace CrowedBridge.Backers
{
    public partial class AuthenticatedHomepage : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["UserName"] != null && !string.IsNullOrWhiteSpace(Session["UserName"].ToString()))
                {
                    string name = Session["UserName"].ToString().Trim();

                    lblUserName.Text = name;

                    string[] parts = name.Split(' ');
                    if (parts.Length > 1)
                    {
                        lblProfileName.Text = parts[0] + " " + parts[1][0] + ".";
                    }
                    else
                    {
                        lblProfileName.Text = name;
                    }
                }
                else
                {
                    lblUserName.Text = "Rahul";
                    lblProfileName.Text = "Rahul V.";
                }
            }
        }

        protected void btnStartProject_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Creator/Dashboard.aspx");
        }

        protected void btnUpdate1_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Backers/ProjectDetails.aspx?id=1");
        }

        protected void btnUpdate2_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Backers/ProjectDetails.aspx?id=2");
        }

        // REDIRECT TO SmartIrrigationSensors.aspx HERE:
        protected void btnDetails1_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Backers/SmartIrrigationSensors.aspx");
        }

        protected void btnDetails2_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Backers/ProjectDetails.aspx?id=4");
        }

        protected void btnDetails3_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Backers/ProjectDetails.aspx?id=5");
        }

        protected void btnSignOut_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Session.Abandon();
            Response.Redirect("~/UserRegister.aspx");
        }
    }
}