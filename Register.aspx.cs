using System;
using System.Web.UI.WebControls;

namespace CrowedBridge
{
    public partial class Register : System.Web.UI.Page
    {
        // Explicit control declarations
        protected TextBox txtFullName;
        protected TextBox txtRegEmail;
        protected TextBox txtMobile;
        protected DropDownList ddlRole;
        protected TextBox txtRegPass;
        protected TextBox txtConfirmPass;
        protected Button btnRegister;

        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                Session["UserRole"] = ddlRole.SelectedValue;
                Session["UserName"] = txtFullName.Text.Trim();
                Session["UserEmail"] = txtRegEmail.Text.Trim();

                if (ddlRole.SelectedValue.Equals("Admin", StringComparison.OrdinalIgnoreCase))
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