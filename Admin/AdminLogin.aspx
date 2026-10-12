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
            Session["UserRole"] = "Admin";

            // Redirects to Admin Dashboard or Home
            Response.Redirect("~/Home/Default.aspx");
        }
    }
</script>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Admin Login - CrowdBridge</title>
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
            background-color: #1E293B;
        }

        .top-nav {
            padding: 24px 48px;
        }

        .back-link {
            text-decoration: none;
            color: #94A3B8;
            font-size: 14px;
            font-weight: 500;
            display: inline-flex;
            align-items: center;
            gap: 8px;
        }

        .back-link:hover {
            color: #FFFFFF;
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
            box-shadow: 0px 4px 20px rgba(0, 0, 0, 0.15);
            border: 1px solid #334155;
        }

        .login-card h2 {
            font-size: 24px;
            font-weight: bold;
            color: #0F172A;
            margin-bottom: 6px;
            text-align: center;
        }

        .subtitle {
            color: #64748B;
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
            color: #334155;
            margin-bottom: 6px;
        }

        .input-control {
            width: 100%;
            padding: 11px 14px;
            border: 1px solid #CBD5E1;
            border-radius: 6px;
            font-size: 14px;
            outline: none;
        }

        .input-control:focus {
            border-color: #0F172A;
        }

        .validator-error {
            color: #EF4444;
            font-size: 12px;
            margin-top: 4px;
            display: block;
        }

        .btn-submit {
            width: 100%;
            background-color: #0F172A;
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
            background-color: #1E293B;
        }

        .footer {
            background: #0F172A;
            border-top: 1px solid #334155;
            padding: 24px 48px;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .footer-brand {
            font-size: 18px;
            font-weight: bold;
            color: #F8FAFC;
        }

        .footer-copy {
            font-size: 13px;
            color: #94A3B8;
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
                <h2>Admin Control Portal</h2>
                <p class="subtitle">Sign in with administrator credentials</p>

                <!-- Server Error Label -->
                <asp:Label ID="lblError" runat="server" CssClass="validator-error" Style="margin-bottom: 12px; text-align: center;"></asp:Label>

                <!-- Email Field -->
                <div class="form-group">
                    <label for="txtEmail">Admin Email</label>
                    <asp:TextBox ID="txtEmail" runat="server" CssClass="input-control" Placeholder="admin@crowdbridge.com"></asp:TextBox>
                    
                    <asp:RequiredFieldValidator ID="rfvEmail" runat="server" 
                        ControlToValidate="txtEmail" 
                        ErrorMessage="Admin email is required." 
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
                <asp:Button ID="btnSignIn" runat="server" Text="Access Portal &rarr;" CssClass="btn-submit" OnClick="btnSignIn_Click" />
            </div>
        </div>

        <!-- Footer -->
        <div class="footer">
            <div>
                <div class="footer-brand">CrowdBridge Admin</div>
                <div class="footer-copy">&copy; 2026 CrowdBridge Management Systems.</div>
            </div>
        </div>

    </form>
</body>
</html>