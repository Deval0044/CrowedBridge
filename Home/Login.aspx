<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="CrowedBridge.UserLogin" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Welcome Back - CrowdBridge</title>
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
            max-width: 480px;
            border-radius: 16px;
            border: 1px solid #EFEFEF;
            box-shadow: 0px 4px 20px rgba(0, 0, 0, 0.02);
            padding: 40px 36px;
            text-align: center;
        }

        .card-title {
            font-size: 28px;
            font-weight: 700;
            color: #111111;
            margin-bottom: 8px;
        }

        .card-subtitle {
            font-size: 14px;
            color: #666666;
            margin-bottom: 28px;
        }

        .role-tabs {
            display: flex;
            background-color: #F3F3F0;
            border-radius: 10px;
            padding: 4px;
            margin-bottom: 28px;
        }

        .role-tab {
            flex: 1;
            padding: 10px 0;
            font-size: 13px;
            font-weight: 600;
            color: #666666;
            border: none;
            background: transparent;
            border-radius: 8px;
            cursor: pointer;
            transition: all 0.2s ease;
        }

        .role-tab.active {
            background-color: #FFFFFF;
            color: #C04800;
            box-shadow: 0px 2px 6px rgba(0, 0, 0, 0.05);
        }

        .form-group {
            text-align: left;
            margin-bottom: 20px;
        }

        .label-row {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 8px;
        }

        .field-label {
            font-size: 13px;
            font-weight: 600;
            color: #333333;
        }

        .forgot-link {
            font-size: 12px;
            color: #FA6400;
            text-decoration: none;
            font-weight: 500;
        }

        .text-input {
            width: 100%;
            padding: 12px 16px;
            border: 1px solid #E2E8F0;
            border-radius: 8px;
            font-size: 14px;
            outline: none;
            color: #111111;
            background-color: #FFFFFF;
        }

        .text-input:focus {
            border-color: #FA6400;
        }

        .btn-signin {
            width: 100%;
            background-color: #FA6400;
            color: #FFFFFF;
            border: none;
            padding: 14px;
            border-radius: 8px;
            font-size: 14px;
            font-weight: 700;
            cursor: pointer;
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 8px;
            margin-top: 24px;
        }

        .btn-signin:hover {
            background-color: #e05800;
        }

        .register-notice {
            margin-top: 24px;
            font-size: 13px;
            color: #666666;
        }

        .register-link {
            color: #B44200;
            text-decoration: none;
            font-weight: 700;
        }

        .site-footer {
            background-color: #FFFFFF;
            border-top: 1px solid #EFEFEF;
            padding: 32px 48px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-top: 40px;
        }

        .brand-name {
            font-size: 20px;
            font-weight: 800;
            color: #8B3A00;
            margin-bottom: 6px;
        }

        .copyright {
            font-size: 13px;
            color: #666666;
        }

        .footer-links {
            display: flex;
            gap: 24px;
        }

        .footer-link {
            text-decoration: none;
            color: #555555;
            font-size: 14px;
            font-weight: 500;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <nav class="top-nav">
                <a href="Default.aspx" class="back-link">&larr; Back to Home</a>
            </nav>

            <div class="main-container">
                <div class="login-card">
                    <h1 class="card-title">Welcome Back</h1>
                    <p class="card-subtitle">Sign in to your CrowdBridge account.</p>

                    <asp:HiddenField ID="hfRole" runat="server" Value="Backer" />

                    <div class="role-tabs">
                        <button type="button" class="role-tab active" onclick="selectRole('Backer', this)">Backer</button>
                        <button type="button" class="role-tab" onclick="selectRole('Creator', this)">Creator</button>
                        <button type="button" class="role-tab" onclick="selectRole('Admin', this)">Admin</button>
                    </div>

                    <div class="form-group">
                        <label class="field-label">Email Address</label>
                        <asp:TextBox ID="txtEmail" runat="server" TextMode="Email" CssClass="text-input" Placeholder="you@example.com"></asp:TextBox>
                    </div>

                    <div class="form-group">
                        <div class="label-row">
                            <label class="field-label">Password</label>
                            <a href="ForgotPassword.aspx" class="forgot-link">Forgot password?</a>
                        </div>
                        <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" CssClass="text-input" Placeholder="••••••••"></asp:TextBox>
                    </div>

                    <asp:Button ID="btnSignIn" runat="server" Text="Sign In &#10132;" CssClass="btn-signin" OnClick="btnSignIn_Click" />

                    <p class="register-notice">
                        Don’t have an account? <a href="UserRegister.aspx" class="register-link">Register New Account</a>
                    </p>
                </div>
            </div>
        </div>

        <footer class="site-footer">
            <div>
                <div class="brand-name">CrowdBridge</div>
                <div class="copyright">&copy; 2026 CrowdBridge India. Empowering communities together.</div>
            </div>
            <div class="footer-links">
                <a href="Support.aspx" class="footer-link">Support</a>
                <a href="About.aspx" class="footer-link">About Us</a>
            </div>
        </footer>
    </form>

    <script type="text/javascript">
        function selectRole(roleName, btnElement) {
            document.getElementById('<%= hfRole.ClientID %>').value = roleName;
            var tabs = document.querySelectorAll('.role-tab');
            tabs.forEach(function (tab) {
                tab.classList.remove('active');
            });
            btnElement.classList.add('active');
        }
    </script>
</body>
</html>