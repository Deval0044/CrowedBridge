using System;
using System.Web.UI;

namespace CrowedBridge
{
    public partial class UserLogin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSignIn_Click(object sender, EventArgs e)
        {
            string selectedRole = hfRole.Value;
            string email = txtEmail.Text.Trim();
            string password = txtPassword.Text.Trim();

            // Login logic here
        }
    }
}