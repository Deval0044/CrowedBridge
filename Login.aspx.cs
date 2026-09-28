using System;
using System.Web.UI.WebControls;

namespace CrowedBridge
{
    public partial class Login : System.Web.UI.Page
    {
        // Explicit control declarations
        protected Button btnRoleBacker;
        protected Button btnRoleCreator;
        protected Button btnRoleAdmin;
        protected HiddenField hfSelectedRole;
        protected TextBox txtEmail;
        protected TextBox txtPassword;
        protected Button btnSignIn;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                UpdateRoleUI();
            }
        }

        protected void SelectRole_Click(object sender, EventArgs e)
        {
            Button btn = (Button)sender;
            hfSelectedRole.Value = btn.CommandArgument;
            UpdateRoleUI();
        }

        private void UpdateRoleUI()
        {
            string selected = hfSelectedRole.Value;

            btnRoleBacker.CssClass = selected == "Backer" ? "py-2 text-xs font-bold rounded-xl bg-white text-orange-600 shadow-sm border border-gray-200" : "py-2 text-xs font-bold rounded-xl text-gray-500 hover:text-gray-800";
            btnRoleCreator.CssClass = selected == "Creator" ? "py-2 text-xs font-bold rounded-xl bg-white text-orange-600 shadow-sm border border-gray-200" : "py-2 text-xs font-bold rounded-xl text-gray-500 hover:text-gray-800";
            btnRoleAdmin.CssClass = selected == "Admin" ? "py-2 text-xs font-bold rounded-xl bg-white text-orange-600 shadow-sm border border-gray-200" : "py-2 text-xs font-bold rounded-xl text-gray-500 hover:text-gray-800";
        }

        protected void btnSignIn_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                string role = hfSelectedRole.Value;
                string email = txtEmail.Text.Trim();

                Session["UserRole"] = role;
                Session["UserEmail"] = email;
                Session["UserName"] = email.Contains("@") ? email.Split('@')[0] : "User";

                if (role.Equals("Admin", StringComparison.OrdinalIgnoreCase))
                {
                    Response.Redirect("~/Admin/AdminDashboard.aspx");
                }
                else
                {
                    Response.Redirect("~/Default.aspx");
                }
            }
        }
    }
}