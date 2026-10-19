<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UserRegister.aspx.cs" Inherits="CrowedBridge.Home.UserRegister" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Create an Account - CrowdBridge</title>
    <style>
        * { box-sizing: border-box; margin: 0; padding: 0; font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, Helvetica, Arial, sans-serif; }
        html, body { height: 100%; background-color: #F8F8F6; color: #333333; }
        form { height: 100%; display: flex; flex-direction: column; }

        .page-header { background-color: #F8F8F6; padding: 16px 32px; display: flex; align-items: center; }
        .back-link { text-decoration: none; color: #555555; font-size: 13px; font-weight: 500; display: inline-flex; align-items: center; gap: 6px; }

        .register-container { flex: 1; display: flex; width: 100%; overflow: hidden; }

        /* Left Split Banner Architecture Photo */
        .banner-section { flex: 1.1; position: relative; background: url('https://images.unsplash.com/photo-1497366216548-37526070297c?auto=format&fit=crop&w=1200&q=80') center center / cover no-repeat; display: flex; flex-direction: column; justify-content: flex-end; padding: 48px; color: #FFFFFF; }
        .banner-overlay { position: absolute; inset: 0; background: linear-gradient(to top, rgba(0, 0, 0, 0.75) 0%, rgba(0, 0, 0, 0.1) 60%); }
        .banner-content { position: relative; z-index: 2; max-width: 480px; }
        .banner-title { font-size: 32px; font-weight: 700; line-height: 1.25; margin-bottom: 12px; color: #FFFFFF; }
        .banner-subtitle { font-size: 14px; line-height: 1.5; color: #E0E0E0; }

        .form-section { flex: 1; display: flex; justify-content: center; align-items: center; padding: 40px; background-color: #FAFAFA; }
        .form-card { background: #FFFFFF; width: 100%; max-width: 440px; border-radius: 12px; border: 1px solid #EFEFEF; box-shadow: 0px 4px 20px rgba(0, 0, 0, 0.03); padding: 36px 32px; }

        .form-header { margin-bottom: 24px; }
        .form-title { font-size: 24px; font-weight: 800; color: #111111; margin-bottom: 6px; }
        .form-subtitle { font-size: 13px; color: #666666; }

        .form-group { margin-bottom: 18px; display: flex; flex-direction: column; gap: 6px; }
        .field-label { font-size: 12px; font-weight: 600; color: #333333; }

        .text-input, .select-input { width: 100%; padding: 10px 14px; border: 1px solid #D1D5DB; border-radius: 8px; font-size: 13px; outline: none; color: #111111; background-color: #FFFFFF; }
        .text-input:focus, .select-input:focus { border-color: #FA6400; }

        .phone-group { display: flex; gap: 8px; }
        .phone-prefix { width: 65px; padding: 10px; border: 1px solid #D1D5DB; border-radius: 8px; font-size: 13px; text-align: center; background-color: #F3F4F6; color: #555555; font-weight: 500; }

        .password-grid { display: grid; grid-template-columns: 1fr 1fr; gap: 12px; }

        .btn-register { width: 100%; background-color: #FA6400; color: #FFFFFF; border: none; padding: 12px; border-radius: 8px; font-size: 13px; font-weight: 700; cursor: pointer; display: inline-flex; align-items: center; justify-content: center; gap: 6px; margin-top: 10px; }
        .btn-register:hover { background-color: #e05800; }

        .error-lbl { color: #DC2626; font-size: 12px; margin-bottom: 12px; display: block; }
        @media (max-width: 900px) { .banner-section { display: none; } }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <header class="page-header">
            <a href="Login.aspx" class="back-link">&larr; Back to Login Page</a>
        </header>

        <div class="register-container">
            <div class="banner-section">
                <div class="banner-overlay"></div>
                <div class="banner-content">
                    <h1 class="banner-title">Empowering communities together.</h1>
                    <p class="banner-subtitle">Join the leading platform connecting visionary creators with passionate backers across India.</p>
                </div>
            </div>

            <div class="form-section">
                <div class="form-card">
                    <div class="form-header">
                        <h2 class="form-title">Create an Account</h2>
                        <p class="form-subtitle">Enter your details to register and get started.</p>
                    </div>

                    <asp:Label ID="lblError" runat="server" CssClass="error-lbl" Visible="false"></asp:Label>

                    <div class="form-group">
                        <label class="field-label">Full Name</label>
                        <asp:TextBox ID="txtFullName" runat="server" CssClass="text-input" Placeholder="Rahul Sharma" required="required"></asp:TextBox>
                    </div>

                    <div class="form-group">
                        <label class="field-label">Email Address</label>
                        <asp:TextBox ID="txtEmail" runat="server" TextMode="Email" CssClass="text-input" Placeholder="rahul@example.com" required="required"></asp:TextBox>
                    </div>

                    <div class="form-group">
                        <label class="field-label">Mobile Number</label>
                        <div class="phone-group">
                            <input type="text" class="phone-prefix" value="+91" readonly="readonly" />
                            <asp:TextBox ID="txtMobile" runat="server" CssClass="text-input" Placeholder="98765 43210" required="required"></asp:TextBox>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="field-label">I want to register as a</label>
                        <asp:DropDownList ID="ddlRole" runat="server" CssClass="select-input" required="required">
                            <asp:ListItem Text="Select your role..." Value=""></asp:ListItem>
                            <asp:ListItem Text="Backer / Contributor" Value="Backer" Selected="True"></asp:ListItem>
                            <asp:ListItem Text="Creator / Project Owner" Value="Creator"></asp:ListItem>
                            <asp:ListItem Text="Admin / Platform Administrator" Value="Admin"></asp:ListItem>
                        </asp:DropDownList>
                    </div>

                    <div class="password-grid">
                        <div class="form-group">
                            <label class="field-label">Password</label>
                            <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" CssClass="text-input" Placeholder="••••••••" required="required"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <label class="field-label">Confirm Password</label>
                            <asp:TextBox ID="txtConfirmPassword" runat="server" TextMode="Password" CssClass="text-input" Placeholder="••••••••" required="required"></asp:TextBox>
                        </div>
                    </div>

                    <asp:Button ID="btnRegister" runat="server" Text="Register Account &rarr;" CssClass="btn-register" OnClick="btnRegister_Click" />
                </div>
            </div>
        </div>
    </form>
</body>
</html>