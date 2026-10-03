 <%@ Page Language="C#" AutoEventWireup="true" %>

<!DOCTYPE html>
<script runat="server">
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            // Initial page load logic
        }
    }

    protected void btnSignIn_Click(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {
            string email = txtEmail.Text.Trim();
            string password = txtPassword.Text.Trim();
            string selectedRole = hfRole.Value;

            // Authentication / Database check goes here
        }
    }
</script>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Login - CrowdBridge</title>
    <style>
        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
            font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, Helvetica, Arial, sans-serif;
        }

        body {
            background-color: #F8F8F6;
            color: #333333;
            min-height: 100vh;
            display: flex;
            flex-direction: column;
            justify-content: space-between;
        }

        /* Top Navigation */
        .top-nav {
            padding: 30px 50px;
        }

        .back-link {
            color: #4A4A4A;
            text-decoration: none;
            font-size: 14px;
            font-weight: 500;
            display: inline-flex;
            align-items: center;
            gap: 6px;
        }

        .back-link:hover {
            color: #111111;
        }

        /* Main Container */
        .main-container {
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 20px;
            flex-grow: 1;
        }

        .login-card {
            background: #FFFFFF;
            width: 100%;
            max-width: 480px;
            padding: 40px;
            border-radius: 12px;
            box-shadow: 0px 4px 20px rgba(0, 0, 0, 0.03);
            border: 1px solid #EFEFEF;
            text-align: center;
        }

        .login-card h2 {
            font-size: 28px;
            font-weight: 700;
            color: #111111;
            margin-bottom: 8px;
        }

        .login-card p.subtitle {
            color: #666666;
            font-size: 15px;
            margin-bottom: 24px;
        }

        /* Role Switcher Tabs */
        .role-switcher {
            display: flex;
            background-color: #F2F2EE;
            padding: 4px;
            border-radius: 8px;
            margin-bottom: 24px;
        }

        .role-btn {
            flex: 1;
            padding: 10px;
            border: none;
            background: transparent;
            font-size: 14px;
            font-weight: 600;
            color: #555555;
            cursor: pointer;
            border-radius: 6px;
            transition: all 0.2s ease;
        }

        .role-btn.active {
            background: #FFFFFF;
            color: #C85A17;
            box-shadow: 0px 2px 4px rgba(0,0,0,0.05);
        }

        /* Form Inputs */
        .form-group {
            text-align: left;
            margin-bottom: 20px;
        }

        .form-group label {
            display: block;
            font-size: 14px;
            font-weight: 600;
            color: #222222;
            margin-bottom: 8px;
        }

        .password-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 8px;
        }

        .forgot-link {
            font-size: 12px;
            color: #C85A17;
            text-decoration: none;
            font-weight: 500;
        }

        .input-control {
            width: 100%;
            padding: 12px 14px;
            border: 1px solid #E0E0E0;
            border-radius: 8px;
            font-size: 15px;
            outline: none;
            transition: border-color 0.2s;
        }

        .input-control:focus {
            border-color: #FA6400;
        }

        /* WebForm Validator Error Text Style */
        .validator-error {
            color: #d9534f;
            font-size: 12px;
            margin-top: 4px;
            display: block;
        }

        /* Sign In Button */
        .btn-submit {
            width: 100%;
            background-color: #FA6400;
            color: #FFFFFF;
            border: none;
            padding: 14px;
            border-radius: 8px;
            font-size: 15px;
            font-weight: 600;
            cursor: pointer;
            display: flex;
            justify-content: center;
            align-items: center;
            gap: 8px;
            margin-top: 10px;
            transition: background 0.2s;
        }

        .btn-submit:hover {
            background-color: #E05500;
        }

        .register-text {
            margin-top: 24px;
            font-size: 14px;
            color: #555555;
        }

        .register-text a {
            color: #C85A17;
            text-decoration: none;
            font-weight: 600;
        }

        /* Footer */
        .footer {
            background: #FFFFFF;
            border-top: 1px solid #EFEFEF;
            padding: 30px 80px;
            display: flex;
            justify-content: space-between;
            align-items: flex-start;
        }

        .footer-brand {
            font-size: 22px;
            font-weight: 700;
            color: #9C4100;
            margin-bottom: 8px;
        }

        .footer-copy {
            font-size: 14px;
            color: #666666;
        }

        .footer-links a {
            color: #4A4A4A;
            text-decoration: none;
            font-size: 15px;
            margin-left: 24px;
        }

        .footer-links a:hover {
            color: #111111;
        }

        .lbl-error {
            color: #d9534f;
            font-size: 13px;
            display: block;
            margin-bottom: 15px;
            text-align: left;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        
        <!-- Top Nav -->
        <div class="top-nav">
            <asp:HyperLink ID="hlBackHome" runat="server" NavigateUrl="~/Home.aspx" CssClass="back-link">
                &larr; Back to Home
            </asp:HyperLink>
        </div>

        <!-- Form Card Container -->
        <div class="main-container">
            <div class="login-card">
                <h2>Welcome Back</h2>
                <p class="subtitle">Sign in to your CrowdBridge account.</p>

                <!-- Hidden field to store selected role -->
                <asp:HiddenField ID="hfRole" runat="server" Value="Creator" />

                <!-- Role Selector Tabs -->
                <div class="role-switcher">
                    <button type="button" class="role-btn" onclick="selectRole('Backer', this)">Backer</button>
                    <button type="button" class="role-btn active" onclick="selectRole('Creator', this)">Creator</button>
                    <button type="button" class="role-btn" onclick="selectRole('Admin', this)">Admin</button>
                </div>

                <!-- Input Fields with WebForm Validators -->
                <div class="form-group">
                    <label for="txtEmail">Email Address</label>
                    <asp:TextBox ID="txtEmail" runat="server" CssClass="input-control" Placeholder="you@example.com"></asp:TextBox>
                    
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

                <div class="form-group">
                    <div class="password-header">
                        <label for="txtPassword">Password</label>
                        <asp:HyperLink ID="hlForgotPassword" runat="server" NavigateUrl="~/ForgotPassword.aspx" CssClass="forgot-link">Forgot password?</asp:HyperLink>
                    </div>
                    <asp:TextBox ID="txtPassword" runat="server" CssClass="input-control" TextMode="Password" Placeholder="••••••••"></asp:TextBox>
                    
                    <asp:RequiredFieldValidator ID="rfvPassword" runat="server" 
                        ControlToValidate="txtPassword" 
                        ErrorMessage="Password is required." 
                        CssClass="validator-error" 
                        Display="Dynamic">
                    </asp:RequiredFieldValidator>
                </div>

                <!-- Backend Dynamic Error Label -->
                <asp:Label ID="lblError" runat="server" CssClass="lbl-error" Visible="false"></asp:Label>

                <!-- Action Button -->
                <asp:Button ID="btnSignIn" runat="server" Text="Sign In &#10141;" CssClass="btn-submit" OnClick="btnSignIn_Click" CausesValidation="true" />

                <div class="register-text">
                    Don’t have an account? 
                    <asp:HyperLink ID="hlRegister" runat="server" NavigateUrl="~/Register.aspx">Register New Account</asp:HyperLink>
                </div>
            </div>
        </div>

        <!-- Footer -->
        <div class="footer">
            <div>
                <div class="footer-brand">CrowdBridge</div>
                <div class="footer-copy">&copy; 2024 CrowdBridge India. Empowering communities together.</div>
            </div>
            <div class="footer-links">
                <asp:HyperLink ID="hlSupport" runat="server" NavigateUrl="~/Support.aspx">Support</asp:HyperLink>
                <asp:HyperLink ID="hlAbout" runat="server" NavigateUrl="~/About.aspx">About Us</asp:HyperLink>
            </div>
        </div>

    </form>

    <script type="text/javascript">
        function selectRole(roleName, element) {
            document.getElementById('<%= hfRole.ClientID %>').value = roleName;
            var buttons = document.querySelectorAll('.role-btn');
            buttons.forEach(function (btn) {
                btn.classList.remove('active');
            });
            element.classList.add('active');
        }
    </script>
</body>
</html>