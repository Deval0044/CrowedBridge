<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UserRegister.aspx.cs" Inherits="CrowedBridge.UserRegister" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Create an Account - CrowdBridge</title>
    <style>
        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
            font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, Helvetica, Arial, sans-serif;
        }

        html, body {
            height: 100%;
            background-color: #F8F8F6;
            color: #333333;
        }

        form {
            height: 100%;
            display: flex;
            flex-direction: column;
        }

        /* Top Header Bar spanning over the left column */
        .page-header {
            background-color: #F8F8F6;
            padding: 16px 32px;
            display: flex;
            align-items: center;
        }

        .back-link {
            text-decoration: none;
            color: #555555;
            font-size: 13px;
            font-weight: 500;
            display: inline-flex;
            align-items: center;
            gap: 6px;
            transition: color 0.2s ease;
        }

        .back-link:hover {
            color: #111111;
        }

        /* Split Screen Container */
        .register-container {
            flex: 1;
            display: flex;
            width: 100%;
            overflow: hidden;
        }

        /* Left Column: Image Banner */
        .banner-section {
            flex: 1.1;
            position: relative;
            background: url('https://images.unsplash.com/photo-1497366216548-37526070297c?auto=format&fit=crop&w=1200&q=80') center center / cover no-repeat;
            display: flex;
            flex-direction: column;
            justify-content: flex-end;
            padding: 48px;
            color: #FFFFFF;
        }

        .banner-overlay {
            position: absolute;
            inset: 0;
            background: linear-gradient(to top, rgba(0, 0, 0, 0.75) 0%, rgba(0, 0, 0, 0.1) 60%);
        }

        .banner-content {
            position: relative;
            z-index: 2;
            max-width: 480px;
        }

        .banner-title {
            font-size: 32px;
            font-weight: 700;
            line-height: 1.25;
            margin-bottom: 12px;
            color: #FFFFFF;
        }

        .banner-subtitle {
            font-size: 14px;
            line-height: 1.5;
            color: #E0E0E0;
        }

        /* Right Column: Form */
        .form-section {
            flex: 1;
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 40px;
            background-color: #FAFAFA;
        }

        .form-card {
            background: #FFFFFF;
            width: 100%;
            max-width: 440px;
            border-radius: 12px;
            border: 1px solid #EFEFEF;
            box-shadow: 0px 4px 20px rgba(0, 0, 0, 0.03);
            padding: 36px 32px;
        }

        .form-header {
            margin-bottom: 24px;
        }

        .form-title {
            font-size: 24px;
            font-weight: 700;
            color: #111111;
            margin-bottom: 6px;
        }

        .form-subtitle {
            font-size: 13px;
            color: #666666;
        }

        /* Form Controls */
        .form-group {
            margin-bottom: 18px;
            display: flex;
            flex-direction: column;
            gap: 6px;
        }

        .field-label {
            font-size: 12px;
            font-weight: 600;
            color: #333333;
        }

        .text-input, .select-input {
            width: 100%;
            padding: 10px 14px;
            border: 1px solid #D1D5DB;
            border-radius: 8px;
            font-size: 13px;
            outline: none;
            color: #111111;
            background-color: #FFFFFF;
            transition: border-color 0.2s ease;
        }

        .text-input:focus, .select-input:focus {
            border-color: #FA6400;
        }

        /* Phone Input Group */
        .phone-group {
            display: flex;
            gap: 8px;
        }

        .phone-prefix {
            width: 65px;
            padding: 10px;
            border: 1px solid #D1D5DB;
            border-radius: 8px;
            font-size: 13px;
            text-align: center;
            background-color: #F3F4F6;
            color: #555555;
            font-weight: 500;
        }

        /* Password Grid */
        .password-grid {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 12px;
        }

        /* Submit Button */
        .btn-register {
            width: 100%;
            background-color: #FA6400;
            color: #FFFFFF;
            border: none;
            padding: 12px;
            border-radius: 8px;
            font-size: 13px;
            font-weight: 700;
            cursor: pointer;
            display: inline-flex;
            align-items: center;
            justify-content: center;
            gap: 6px;
            margin-top: 10px;
            transition: background-color 0.2s ease;
        }

        .btn-register:hover {
            background-color: #e05800;
        }

        @media (max-width: 900px) {
            .banner-section {
                display: none;
            }
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <!-- Top Navigation Bar Header -->
        <header class="page-header">
            <a href="javascript:history.back()" class="back-link">&larr; Back to Previous Page</a>
        </header>

        <!-- Main Body Content -->
        <div class="register-container">
            <!-- Left Image Banner -->
            <div class="banner-section">
                <div class="banner-overlay"></div>
                <div class="banner-content">
                    <h1 class="banner-title">Empowering communities together.</h1>
                    <p class="banner-subtitle">Join the leading platform connecting visionary creators with passionate backers across India.</p>
                </div>
            </div>

            <!-- Right Registration Form -->
            <div class="form-section">
                <div class="form-card">
                    <div class="form-header">
                        <h2 class="form-title">Create an Account</h2>
                        <p class="form-subtitle">Enter your details to register and get started.</p>
                    </div>

                    <!-- Full Name -->
                    <div class="form-group">
                        <label class="field-label">Full Name</label>
                        <asp:TextBox ID="txtFullName" runat="server" CssClass="text-input" Placeholder="Rahul Sharma"></asp:TextBox>
                    </div>

                    <!-- Email Address -->
                    <div class="form-group">
                        <label class="field-label">Email Address</label>
                        <asp:TextBox ID="txtEmail" runat="server" TextMode="Email" CssClass="text-input" Placeholder="rahul@example.com"></asp:TextBox>
                    </div>

                    <!-- Mobile Number -->
                    <div class="form-group">
                        <label class="field-label">Mobile Number</label>
                        <div class="phone-group">
                            <input type="text" class="phone-prefix" value="+91" readonly="readonly" />
                            <asp:TextBox ID="txtMobile" runat="server" CssClass="text-input" Placeholder="98765 43210"></asp:TextBox>
                        </div>
                    </div>

                    <!-- Role Dropdown -->
                    <div class="form-group">
                        <label class="field-label">I want to register as a</label>
                        <asp:DropDownList ID="ddlRole" runat="server" CssClass="select-input">
                            <asp:ListItem Text="Select your role..." Value="" Selected="True"></asp:ListItem>
                            <asp:ListItem Text="Backer / Contributor" Value="Backer"></asp:ListItem>
                            <asp:ListItem Text="Creator / Project Owner" Value="Creator"></asp:ListItem>
                        </asp:DropDownList>
                    </div>

                    <!-- Password and Confirm Password -->
                    <div class="password-grid">
                        <div class="form-group">
                            <label class="field-label">Password</label>
                            <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" CssClass="text-input" Placeholder="••••••••"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <label class="field-label">Confirm Password</label>
                            <asp:TextBox ID="txtConfirmPassword" runat="server" TextMode="Password" CssClass="text-input" Placeholder="••••••••"></asp:TextBox>
                        </div>
                    </div>

                    <!-- Submit Button -->
                    <asp:Button ID="btnRegister" runat="server" Text="Register Account &rarr;" CssClass="btn-register" OnClick="btnRegister_Click" />
                </div>
            </div>
        </div>
    </form>
</body>
</html>