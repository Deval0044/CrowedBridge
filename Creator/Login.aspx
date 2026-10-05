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

            // Simple login check
            if (email == "admin@example.com" && password == "123456")
            {
                Session["Username"] = email;
                Response.Redirect("~/Creator/Dashboard.aspx");
            }
            else
            {
                lblError.Text = "Invalid email or password.";
            }
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
            font-family: Arial, sans-serif;
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
            padding: 20px 40px;
        }

        .back-link {
            color: #4A4A4A;
            text-decoration: none;
            font-size: 14px;
            font-weight: bold;
        }

        .main-container {
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 20px;
            flex: 1; /* Pushes footer down */
        }

        .login-card {
            background: #FFFFFF;
            width: 100%;
            max-width: 400px;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0px 2px 10px rgba(0, 0, 0, 0.05);
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
            margin-bottom: 20px;
            text-align: center;
        }

        .form-group {
            margin-bottom: 16px;
        }

        .form-group label {
            display: block;
            font-size: 14px;
            font-weight: bold;
            color: #222222;
            margin-bottom: 6px;
        }

        .input-control {
            width: 100%;
            padding: 10px 12px;
            border: 1px solid #D0D0D0;
            border-radius: 4px;
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
            padding: 12px;
            border-radius: 4px;
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
            padding: 20px 40px;
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
            <asp:HyperLink ID="hlBackHome" runat="server" NavigateUrl="~/Home.aspx" CssClass="back-link">
                &larr; Back to Home
            </asp:HyperLink>
        </div>

        <!-- Form Card Container -->
        <div class="main-container">
            <div class="login-card">
                <h2>Welcome Back</h2>
                <p class="subtitle">Sign in to your CrowdBridge account</p>

                <!-- Server Error Label -->
                <asp:Label ID="lblError" runat="server" CssClass="validator-error" Style="margin-bottom: 12px; text-align: center;"></asp:Label>

                <!-- Email Field -->
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
                <asp:Button ID="btnSignIn" runat="server" Text="Sign In" CssClass="btn-submit" OnClick="btnSignIn_Click" />

                <div class="register-text">
                    Don’t have an account? 
                    <asp:HyperLink ID="hlRegister" runat="server" NavigateUrl="~/Register.aspx">Register New Account</asp:HyperLink>
                </div>
            </div>
        </div>

        <!-- Footer -->
        <div class="footer">
            <div class="footer-brand">CrowdBridge</div>
            <div class="footer-copy">&copy; 2026 CrowdBridge India.</div>
        </div>

    </form>
</body>
</html>