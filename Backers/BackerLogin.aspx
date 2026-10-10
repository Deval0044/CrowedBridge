<%@ Page Language="C#" AutoEventWireup="true" %>

<!DOCTYPE html>

<script runat="server">
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            // Initial load logic
        }
    }

    protected void btnSignIn_Click(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {
            string email = txtEmail.Text.Trim();
            string password = txtPassword.Text.Trim();

            // Save session details
            Session["Username"] = email;
            Session["UserRole"] = "Backer";

            // Redirects to Backer Home or Default page
            Response.Redirect("~/Home/Default.aspx");
        }
    }
</script>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Backer Login - CrowdBridge</title>
    <style>
        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
            font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, Helvetica, Arial, sans-serif;
        }

        html, body {
            height: 100%;
        }

        form {
            display: flex;
            flex-direction: column;
            min-height: 100vh;
            background-color: #F8F8F6;
        }

        .top-nav {
            padding: 24px 48px;
        }

        .back-link {
            text-decoration: none;
            color: #444444;
            font-size: 14px;
            font-weight: 500;
            display: inline-flex;
            align-items: center;
            gap: 8px;
        }

        .back-link:hover {
            color: #111111;
        }

        .main-container {
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 20px;
            flex: 1;
        }

        .login-card {
            background: #FFFFFF;
            width: 100%;
            max-width: 440px;
            padding: 36px;
            border-radius: 12px;
            box-shadow: 0px 4px 15px rgba(0, 0, 0, 0.03);
            border: 1px solid #EFEFEF;
        }

        .login-card h2 {
            font-size: 24px;
            font-weight: bold;
            color: #111111;
            margin-bottom: 6px;
            text-align: center;
        }

        .subtitle {
            color: #666666;
            font-size: 14px;
            margin-bottom: 24px;
            text-align: center;
        }

        .form-group {
            margin-bottom: 18px;
        }

        .form-group label {
            display: block;
            font-size: 13px;
            font-weight: 600;
            color: #222222;
            margin-bottom: 6px;
        }

        .input-control {
            width: 100%;
            padding: 11px 14px;
            border: 1px solid #D0D0D0;
            border-radius: 6px;
            font-size: 14px;
            outline: none;
        }

        .input-control:focus {
            border-color: #FA6400;
        }

        .validator-error {
            color: #E53935;
            font-size: 12px;
            margin-top: 4px;
            display: block;
        }

        .btn-submit {
            width: 100%;
            background-color: #FA6400;
            color: #FFFFFF;
            border: none;
            padding: 13px;
            border-radius: 6px;
            font-size: 14px;
            font-weight: bold;
            cursor: pointer;
            margin-top: 10px;
        }

        .btn-submit:hover {
            background-color: #E05500;
        }

        .register-text {
            margin-top: 20px;
            font-size: 13px;
            color: #555555;
            text-align: center;
        }

        .register-text a {
            color: #FA6400;
            text-decoration: none;
            font-weight: bold;
        }

        .footer {
            background: #FFFFFF;
            border-top: 1px solid #EFEFEF;
            padding: 24px 48px;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .footer-brand {
            font-size: 18px;
            font-weight: bold;
            color: #FA6400;
        }

        .footer-copy {
            font-size: 13px;
            color: #666666;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        
        <!-- Top Nav -->
        <div class="top-nav">
            <asp:HyperLink ID="hlBackHome" runat="server" NavigateUrl="~/Home/Default.aspx" CssClass="back-link">
                &larr; Back to Home
            </asp:HyperLink>
        </div>

        <!-- Form Card Container -->
        <div class="main-container">
            <div class="login-card">
                <h2>Backer Sign In</h2>
                <p class="subtitle">Sign in to back projects and track your rewards</p>

                <!-- Server Error Label -->
                <asp:Label ID="lblError" runat="server" CssClass="validator-error" Style="margin-bottom: 12px; text-align: center;"></asp:Label>

                <!-- Email Field -->
                <div class="form-group">
                    <label for="txtEmail">Email Address</label>
                    <asp:TextBox ID="txtEmail" runat="server" CssClass="input-control" Placeholder="backer@example.com"></asp:TextBox>
                    
                    <asp:RequiredFieldValidator ID="rfvEmail" runat="server" 
                        ControlToValidate="txtEmail" 
                        ErrorMessage="Email address is required." 
                        CssClass="validator-error" 
                        Display="Dynamic">
                    </asp:RequiredFieldValidator>

                    <asp:RegularExpressionValidator ID="revEmail" runat="server" 
                        ControlToValidate="txtEmail" 
                        ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" 
                        ErrorMessage="Please enter a valid email address." 
                        CssClass="validator-error" 
                        Display="Dynamic">
                    </asp:RegularExpressionValidator>
                </div>

                <!-- Password Field -->
                <div class="form-group">
                    <label for="txtPassword">Password</label>
                    <asp:TextBox ID="txtPassword" runat="server" CssClass="input-control" TextMode="Password" Placeholder="••••••••"></asp:TextBox>
                    
                    <asp:RequiredFieldValidator ID="rfvPassword" runat="server" 
                        ControlToValidate="txtPassword" 
                        ErrorMessage="Password is required." 
                        CssClass="validator-error" 
                        Display="Dynamic">
                    </asp:RequiredFieldValidator>
                </div>

                <!-- Action Button -->
                <asp:Button ID="btnSignIn" runat="server" Text="Sign In &rarr;" CssClass="btn-submit" OnClick="btnSignIn_Click" />

                <div class="register-text">
                    Don’t have a Backer account? 
                    <asp:HyperLink ID="hlRegister" runat="server" NavigateUrl="~/Home/UserRegister.aspx">Register Here</asp:HyperLink>
                </div>
            </div>
        </div>

        <!-- Footer -->
        <div class="footer">
            <div>
                <div class="footer-brand">CrowdBridge</div>
                <div class="footer-copy">&copy; 2026 CrowdBridge India. Empowering communities together.</div>
            </div>
        </div>

    </form>
</body>
</html>