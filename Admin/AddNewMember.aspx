<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddNewMember.aspx.cs" Inherits="CrowdBridge.Admin.AddNewMember" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Add New Member - CrowdBridge Admin</title>
    <style>
        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
            font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, Helvetica, Arial, sans-serif;
        }

        html, body, form {
            height: 100%;
            width: 100%;
        }

        body {
            background-color: #F8F8F6;
            color: #333333;
        }

        .app-container {
            padding: 40px 48px;
            max-width: 900px;
            margin: 0 auto;
        }

        /* Top Back Button Navigation */
        .back-btn {
            background: transparent;
            border: none;
            color: #A34E00;
            font-size: 13px;
            font-weight: 600;
            cursor: pointer;
            display: inline-flex;
            align-items: center;
            gap: 8px;
            text-decoration: none;
            margin-bottom: 32px;
        }

        /* Header Title Area */
        .header-section {
            margin-bottom: 32px;
        }

        .page-title {
            font-size: 32px;
            font-weight: 800;
            color: #111111;
            letter-spacing: -0.5px;
            margin-bottom: 8px;
        }

        .page-subtitle {
            font-size: 14px;
            color: #666666;
        }

        /* Form Card */
        .form-card {
            background: #FFFFFF;
            border: 1px solid #EFEFEF;
            border-radius: 12px;
            padding: 36px 40px;
            box-shadow: 0px 2px 8px rgba(0, 0, 0, 0.015);
        }

        .section-title {
            font-size: 20px;
            font-weight: 700;
            color: #111111;
            padding-bottom: 12px;
            border-bottom: 1px solid #F0F0EE;
            margin-bottom: 20px;
        }

        .form-group {
            margin-bottom: 24px;
        }

        .form-row {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 20px;
            margin-bottom: 24px;
        }

        .form-label {
            display: block;
            font-size: 13px;
            font-weight: 600;
            color: #222222;
            margin-bottom: 8px;
        }

        .form-control {
            width: 100%;
            padding: 12px 14px;
            border-radius: 8px;
            border: 1px solid #E2E8F0;
            background: #FFFFFF;
            font-size: 14px;
            color: #333333;
            outline: none;
            transition: border-color 0.2s ease;
        }

        .form-control:focus {
            border-color: #FA6400;
        }

        /* Custom Select Styling */
        .select-wrapper {
            position: relative;
        }

        .select-wrapper select {
            appearance: none;
            -webkit-appearance: none;
            -moz-appearance: none;
            cursor: pointer;
            padding-right: 36px;
        }

        .select-wrapper::after {
            content: '';
            position: absolute;
            right: 14px;
            top: 50%;
            transform: translateY(-50%);
            width: 10px;
            height: 6px;
            background-image: url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 10 6'%3E%3Cpath fill='none' stroke='%3C333' stroke-width='1.5' stroke-linecap='round' stroke-linejoin='round' d='M1 1l4 4 4-4'/%3E%3C/svg%3E");
            background-repeat: no-repeat;
            background-size: contain;
            pointer-events: none;
        }

        /* Password Field Styling */
        .password-wrapper {
            position: relative;
        }

        .password-toggle {
            position: absolute;
            right: 14px;
            top: 50%;
            transform: translateY(-50%);
            cursor: pointer;
            color: #666666;
            display: flex;
            align-items: center;
        }

        .field-help-text {
            font-size: 12px;
            color: #777777;
            margin-top: 8px;
        }

        /* Action Buttons */
        .form-actions {
            display: flex;
            justify-content: flex-end;
            gap: 12px;
            margin-top: 36px;
            padding-top: 24px;
            border-top: 1px solid #F0F0EE;
        }

        .btn-cancel {
            background: #FFFFFF;
            border: 1px solid #E2E8F0;
            color: #333333;
            padding: 11px 24px;
            border-radius: 8px;
            font-size: 13px;
            font-weight: 600;
            cursor: pointer;
        }

        .btn-save {
            background: #FA6400;
            border: none;
            color: #FFFFFF;
            padding: 11px 24px;
            border-radius: 8px;
            font-size: 13px;
            font-weight: 600;
            cursor: pointer;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="app-container">
            <!-- Back Button -->
            <a href="UserDirectory.aspx" class="back-btn">&larr; Back to User Directory</a>

            <!-- Page Title Header -->
            <div class="header-section">
                <h1 class="page-title">Add New Member</h1>
                <p class="page-subtitle">Provision a new administrative or moderation account for the CrowdBridge platform.</p>
            </div>

            <!-- Main Form Section -->
            <div class="form-card">
                
                <!-- Section 1: Personal Details -->
                <h2 class="section-title">Personal Details</h2>
                
                <div class="form-row">
                    <div>
                        <label class="form-label" for="txtFirstName">First Name</label>
                        <asp:TextBox ID="txtFirstName" runat="server" CssClass="form-control" Text="Jane" Placeholder="Enter first name"></asp:TextBox>
                    </div>
                    <div>
                        <label class="form-label" for="txtLastName">Last Name</label>
                        <asp:TextBox ID="txtLastName" runat="server" CssClass="form-control" Text="Doe" Placeholder="Enter last name"></asp:TextBox>
                    </div>
                </div>

                <div class="form-group">
                    <label class="form-label" for="txtEmail">Email Address</label>
                    <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" Text="jane.doe@crowdbridge.in" Placeholder="Enter email address"></asp:TextBox>
                </div>

                <!-- Section 2: Access & Role -->
                <h2 class="section-title" style="margin-top: 36px;">Access &amp; Role</h2>
                
                <div class="form-row">
                    <div>
                        <label class="form-label" for="ddlSystemRole">System Role</label>
                        <div class="select-wrapper">
                            <asp:DropDownList ID="ddlSystemRole" runat="server" CssClass="form-control">
                                <asp:ListItem Text="Select Role" Value="" Selected="True"></asp:ListItem>
                                <asp:ListItem Text="Administrator" Value="Admin"></asp:ListItem>
                                <asp:ListItem Text="Moderator" Value="Moderator"></asp:ListItem>
                                <asp:ListItem Text="Support Specialist" Value="Support"></asp:ListItem>
                            </asp:DropDownList>
                        </div>
                    </div>
                    <div>
                        <label class="form-label" for="ddlDepartment">Department</label>
                        <div class="select-wrapper">
                            <asp:DropDownList ID="ddlDepartment" runat="server" CssClass="form-control">
                                <asp:ListItem Text="Select Department" Value="" Selected="True"></asp:ListItem>
                                <asp:ListItem Text="Operations" Value="Operations"></asp:ListItem>
                                <asp:ListItem Text="Trust &amp; Safety" Value="TrustSafety"></asp:ListItem>
                                <asp:ListItem Text="Customer Support" Value="Support"></asp:ListItem>
                                <asp:ListItem Text="Engineering" Value="Engineering"></asp:ListItem>
                            </asp:DropDownList>
                        </div>
                    </div>
                </div>

                <!-- Section 3: Security -->
                <h2 class="section-title" style="margin-top: 36px;">Security</h2>
                
                <div class="form-group">
                    <label class="form-label" for="txtPassword">Temporary Password</label>
                    <div class="password-wrapper">
                        <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control" TextMode="Password" Text="........"></asp:TextBox>
                        <span class="password-toggle">
                            <svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                                <path d="M1 12s4-8 11-8 11 8 11 8-4 8-11 8-11-8-11-8z"></path>
                                <circle cx="12" cy="12" r="3"></circle>
                            </svg>
                        </span>
                    </div>
                    <p class="field-help-text">User will be prompted to change this upon first login.</p>
                </div>

                <!-- Form Action Buttons -->
                <div class="form-actions">
                    <asp:Button ID="btnCancel" runat="server" CssClass="btn-cancel" Text="Cancel" OnClientClick="return false;" />
                    <asp:Button ID="btnSave" runat="server" CssClass="btn-save" Text="Save New Member" />
                </div>

            </div>
        </div>
    </form>
</body>
</html>