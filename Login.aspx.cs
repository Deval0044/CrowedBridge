using System;
using System.Configuration;
using System.Data.SqlClient;

namespace CrowdBridge
{
    public partial class Login : System.Web.UI.Page
    {
        protected global::System.Web.UI.WebControls.RadioButtonList rblRole;
        protected global::System.Web.UI.WebControls.TextBox txtEmail;
        protected global::System.Web.UI.WebControls.TextBox txtPassword;
        protected global::System.Web.UI.WebControls.Label lblError;

        string connStr;

        protected void Page_Load(object sender, EventArgs e)
        {
            var connSettings = ConfigurationManager.ConnectionStrings["CrowdBridgeDB"];
            if (connSettings != null)
            {
                connStr = connSettings.ConnectionString;
            }
            else
            {
                lblError.Text = "Connection string 'CrowdBridgeDB' missing from Web.config!";
            }
        }

        protected void btnSignIn_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(connStr)) return;

            using (SqlConnection con = new SqlConnection(connStr))
            {
                string query = "SELECT COUNT(*) FROM Users WHERE UserEmail=@Email AND Password=@Pass AND Role=@Role";
                SqlCommand cmd = new SqlCommand(query, con);

                cmd.Parameters.AddWithValue("@Email", txtEmail.Text.Trim());
                cmd.Parameters.AddWithValue("@Pass", txtPassword.Text.Trim());
                cmd.Parameters.AddWithValue("@Role", rblRole.SelectedValue);

                con.Open();
                int count = (int)cmd.ExecuteScalar();

                if (count > 0)
                {
                    Session["UserEmail"] = txtEmail.Text.Trim();
                    Session["UserRole"] = rblRole.SelectedValue;
                    Response.Redirect("Home.aspx");
                }
                else
                {
                    lblError.Text = "Invalid Email, Password, or Role selection!";
                }
            }
        }
    }
}