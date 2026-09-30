<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="CrowdBridge.Login" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title>Sign In - CrowdBridge</title>
</head>
<body style="font-family: Arial, sans-serif; background-color: #f8fafc; margin: 0; padding: 0;">
    <form id="form1" runat="server">
        
        <!-- Back to Home Button -->
        <div style="padding: 20px 40px;">
            <a href="Home.aspx" style="text-decoration: none; color: #475569; font-size: 14px; font-weight: bold;">← Back to Home</a>
        </div>

        <!-- Login Card Container -->
        <div style="max-width: 420px; margin: 20px auto; background: #ffffff; border: 1px solid #e2e8f0; border-radius: 12px; padding: 40px; box-shadow: 0 4px 6px -1px rgba(0, 0, 0, 0.05);">
            
            <h2 style="text-align: center; font-size: 26px; color: #0f172a; margin: 0 0 6px 0;">Welcome Back</h2>
            <p style="text-align: center; font-size: 13px; color: #64748b; margin: 0 0 24px 0;">Sign in to your CrowdBridge account.</p>

            <!-- Role Selector (Backer / Creator / Admin) -->
            <div style="background-color: #f1f5f9; padding: 4px; border-radius: 8px; display: flex; margin-bottom: 24px;">
                <asp:RadioButtonList ID="rblRole" runat="server" RepeatDirection="Horizontal" Width="100%" CssClass="role-selector" style="text-align: center; font-size: 13px;">
                    <asp:ListItem Text="Backer" Value="Backer" Selected="True"></asp:ListItem>
                    <asp:ListItem Text="Creator" Value="Creator"></asp:ListItem>
                    <asp:ListItem Text="Admin" Value="Admin"></asp:ListItem>
                </asp:RadioButtonList>
            </div>

            <!-- Email Input -->
            <div style="margin-bottom: 16px;">
                <label style="font-size: 13px; font-weight: bold; color: #334155;">Email Address</label><br />
                <asp:TextBox ID="txtEmail" runat="server" Placeholder="you@example.com" style="width: 100%; padding: 10px; border: 1px solid #cbd5e1; border-radius: 6px; box-sizing: border-box; margin-top: 6px;"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvEmail" runat="server" ControlToValidate="txtEmail" ErrorMessage="Email is required" ForeColor="Red" Font-Size="12px" Display="Dynamic"></asp:RequiredFieldValidator>
            </div>

            <!-- Password Input -->
            <div style="margin-bottom: 24px;">
                <div style="display: flex; justify-content: space-between; align-items: center;">
                    <label style="font-size: 13px; font-weight: bold; color: #334155;">Password</label>
                    <a href="#" style="font-size: 12px; color: #ea580c; text-decoration: none;">Forgot password?</a>
                </div>
                <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" Placeholder="••••••••" style="width: 100%; padding: 10px; border: 1px solid #cbd5e1; border-radius: 6px; box-sizing: border-box; margin-top: 6px;"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvPassword" runat="server" ControlToValidate="txtPassword" ErrorMessage="Password is required" ForeColor="Red" Font-Size="12px" Display="Dynamic"></asp:RequiredFieldValidator>
            </div>

            <!-- Sign In Button -->
            <asp:Button ID="btnSignIn" runat="server" Text="Sign In ➔" OnClick="btnSignIn_Click" style="width: 100%; background-color: #f97316; color: white; border: none; padding: 12px; border-radius: 6px; font-size: 14px; font-weight: bold; cursor: pointer;" />

            <!-- Error Display Label -->
            <div style="text-align: center; margin-top: 12px;">
                <asp:Label ID="lblError" runat="server" ForeColor="Red" Font-Size="13px"></asp:Label>
            </div>

            <!-- Register Link -->
            <p style="text-align: center; font-size: 13px; color: #64748b; margin-top: 24px; margin-bottom: 0;">
                Don't have an account? <a href="Register.aspx" style="color: #ea580c; font-weight: bold; text-decoration: none;">Register New Account</a>
            </p>
        </div>

        <!-- Minimal Footer -->
        <div style="border-top: 1px solid #e2e8f0; margin-top: 60px; padding: 24px 40px; display: flex; justify-content: space-between; background-color: #ffffff;">
            <div>
                <strong style="color: #ea580c; font-size: 18px;">CrowdBridge</strong>
                <p style="font-size: 12px; color: #64748b; margin: 4px 0 0 0;">© 2026 CrowdBridge India. Empowering communities together.</p>
            </div>
            <div style="font-size: 13px;">
                <a href="#" style="color: #64748b; text-decoration: none; margin-left: 16px;">Support</a>
                <a href="#" style="color: #64748b; text-decoration: none; margin-left: 16px;">About Us</a>
            </div>
        </div>

    </form>
</body>
</html>