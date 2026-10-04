<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="KYCVerification.aspx.cs" Inherits="CrowedBridge.Admin.KYCVerification" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Admin Console - KYC Verification</title>
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
            padding: 32px 48px;
            max-width: 1440px;
            margin: 0 auto;
        }

        /* Top Navigation Header */
        .top-nav {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 28px;
        }

        .back-btn {
            background: transparent;
            border: none;
            color: #222222;
            font-size: 13px;
            font-weight: 600;
            cursor: pointer;
            display: inline-flex;
            align-items: center;
            gap: 8px;
            text-decoration: none;
        }

        .brand-logo {
            font-size: 22px;
            font-weight: 800;
            color: #A34E00;
        }

        /* Title Area */
        .header-section {
            display: flex;
            justify-content: space-between;
            align-items: flex-end;
            margin-bottom: 28px;
        }

        .page-title {
            font-size: 32px;
            font-weight: 800;
            color: #111111;
            letter-spacing: -0.5px;
            margin-bottom: 6px;
        }

        .page-subtitle {
            font-size: 14px;
            color: #666666;
        }

        .search-box {
            position: relative;
            width: 280px;
        }

        .search-box input {
            width: 100%;
            padding: 10px 14px 10px 38px;
            border-radius: 8px;
            border: 1px solid #E2E8F0;
            background: #FFFFFF;
            font-size: 13px;
            outline: none;
        }

        .search-box svg {
            position: absolute;
            left: 12px;
            top: 50%;
            transform: translateY(-50%);
            width: 16px;
            height: 16px;
            stroke: #94A3B8;
            fill: none;
            stroke-width: 2;
        }

        /* Grid Layout */
        .kyc-layout {
            display: grid;
            grid-template-columns: 320px 1fr;
            gap: 24px;
            align-items: start;
        }

        /* Left Side List */
        .sidebar-card {
            background: #FFFFFF;
            border: 1px solid #EFEFEF;
            border-radius: 12px;
            overflow: hidden;
            box-shadow: 0px 2px 8px rgba(0, 0, 0, 0.015);
        }

        .list-header {
            padding: 16px 20px;
            background: #FAFAFA;
            border-bottom: 1px solid #EFEFEF;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .list-title {
            font-size: 13px;
            font-weight: 700;
            color: #333333;
        }

        .badge-count {
            background: #FA6400;
            color: #FFFFFF;
            font-size: 11px;
            font-weight: 700;
            padding: 2px 8px;
            border-radius: 10px;
        }

        .applicant-item {
            padding: 18px 20px;
            border-bottom: 1px solid #F4F4F2;
            cursor: pointer;
            transition: background 0.15s ease;
        }

        .applicant-item:last-child {
            border-bottom: none;
        }

        .applicant-item.active {
            background: #FFFDFB;
            border-left: 3px solid #FA6400;
        }

        .applicant-top {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 4px;
        }

        .applicant-name {
            font-size: 14px;
            font-weight: 700;
            color: #111111;
        }

        .urgent-tag {
            color: #D97706;
            font-size: 11px;
            font-weight: 600;
            display: flex;
            align-items: center;
            gap: 4px;
        }

        .applicant-time {
            font-size: 12px;
            color: #777777;
            margin-bottom: 10px;
        }

        .doc-tags {
            display: flex;
            gap: 6px;
        }

        .doc-tag {
            background: #F3F4F6;
            color: #4B5563;
            font-size: 11px;
            font-weight: 600;
            padding: 3px 8px;
            border-radius: 4px;
        }

        /* Right Side Detail Workspace */
        .detail-card {
            background: #FFFFFF;
            border: 1px solid #EFEFEF;
            border-radius: 12px;
            padding: 28px 32px;
            box-shadow: 0px 2px 8px rgba(0, 0, 0, 0.015);
        }

        .profile-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding-bottom: 24px;
            border-bottom: 1px solid #F4F4F2;
            margin-bottom: 28px;
        }

        .profile-info {
            display: flex;
            align-items: center;
            gap: 16px;
        }

        .user-avatar {
            width: 56px;
            height: 56px;
            border-radius: 50%;
            object-fit: cover;
        }

        .user-fullname {
            font-size: 22px;
            font-weight: 800;
            color: #111111;
            margin-bottom: 4px;
        }

        .meta-details {
            display: flex;
            gap: 16px;
            font-size: 13px;
            color: #555555;
        }

        .meta-item {
            display: flex;
            align-items: center;
            gap: 6px;
        }

        .header-buttons {
            display: flex;
            gap: 12px;
        }

        .btn-reject-outline {
            background: #FFFFFF;
            border: 1px solid #DC2626;
            color: #DC2626;
            padding: 9px 20px;
            border-radius: 8px;
            font-size: 13px;
            font-weight: 600;
            cursor: pointer;
            display: flex;
            align-items: center;
            gap: 6px;
        }

        .btn-approve-fill {
            background: #FA6400;
            border: none;
            color: #FFFFFF;
            padding: 9px 22px;
            border-radius: 8px;
            font-size: 13px;
            font-weight: 600;
            cursor: pointer;
            display: flex;
            align-items: center;
            gap: 6px;
        }

        /* Detail Workspace Grid */
        .workspace-grid {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 32px;
        }

        .section-label {
            font-size: 11px;
            font-weight: 700;
            color: #555555;
            letter-spacing: 0.5px;
            text-transform: uppercase;
            margin-bottom: 16px;
        }

        .doc-box {
            background: #FFFFFF;
            border: 1px solid #EFEFEF;
            border-radius: 10px;
            padding: 16px;
            margin-bottom: 20px;
            position: relative;
        }

        .doc-box-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 12px;
            font-size: 13px;
            font-weight: 700;
            color: #222222;
        }

        .expand-icon {
            color: #FA6400;
            cursor: pointer;
            font-size: 12px;
            font-weight: bold;
        }

        .doc-img-wrapper {
            width: 100%;
            height: 140px;
            background-color: #F8F8F6;
            border-radius: 6px;
            overflow: hidden;
            margin-bottom: 12px;
        }

        .doc-img-wrapper img {
            width: 100%;
            height: 100%;
            object-fit: cover;
        }

        .doc-meta {
            display: flex;
            justify-content: space-between;
            font-size: 12px;
            color: #666666;
        }

        .doc-meta-value {
            font-weight: 700;
            color: #111111;
        }

        /* Financial Box */
        .financial-card {
            border-top: 1px solid #EFEFEF;
            padding-top: 16px;
            margin-bottom: 28px;
        }

        .info-row {
            display: flex;
            justify-content: space-between;
            padding: 10px 0;
            font-size: 13px;
        }

        .info-row:not(:last-child) {
            border-bottom: 1px solid #F4F4F2;
        }

        .info-label {
            color: #666666;
        }

        .info-value {
            font-weight: 700;
            color: #111111;
            display: flex;
            align-items: center;
            gap: 6px;
        }

        .verified-check {
            color: #10B981;
            display: inline-flex;
        }

        .link-action {
            color: #FA6400;
            text-decoration: none;
            font-size: 12px;
            font-weight: 600;
            display: inline-flex;
            align-items: center;
            gap: 6px;
            margin-top: 10px;
        }

        /* Address Panel */
        .address-panel {
            background: #FFFFFF;
            border: 1px solid #EFEFEF;
            border-radius: 10px;
            padding: 18px;
            font-size: 13px;
            color: #333333;
            line-height: 1.6;
        }

        .address-badge {
            margin-top: 16px;
            background: #ECFDF5;
            color: #065F46;
            border-radius: 6px;
            padding: 8px 12px;
            font-size: 11px;
            font-weight: 600;
            display: flex;
            align-items: center;
            gap: 8px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="app-container">
            <!-- Top Navigation -->
            <div class="top-nav">
                <a href="AdminDashbord.aspx" class="back-btn">&larr; Back to Admin Dashboard</a>
                <div class="brand-logo">CrowdBridge</div>
            </div>

            <!-- Page Title Bar -->
            <div class="header-section">
                <div>
                    <h1 class="page-title">KYC Verification</h1>
                    <p class="page-subtitle">Review and approve creator identification documents.</p>
                </div>
                <div class="search-box">
                    <svg viewBox="0 0 24 24"><circle cx="11" cy="11" r="8"></circle><line x1="21" y1="21" x2="16.65" y2="16.65"></line></svg>
                    <asp:TextBox ID="txtSearch" runat="server" Placeholder="Search creators..."></asp:TextBox>
                </div>
            </div>

            <!-- Main Layout Split -->
            <div class="kyc-layout">
                <!-- Left Sidebar: Pending Applications List -->
                <div class="sidebar-card">
                    <div class="list-header">
                        <span class="list-title">Pending Verification</span>
                        <span class="badge-count">12</span>
                    </div>

                    <!-- Item 1 (Selected) -->
                    <div class="applicant-item active">
                        <div class="applicant-top">
                            <span class="applicant-name">Ravi Kumar</span>
                            <span class="urgent-tag">&#9202; Urgent</span>
                        </div>
                        <div class="applicant-time">Submitted: 2 hours ago</div>
                        <div class="doc-tags">
                            <span class="doc-tag">Aadhaar</span>
                            <span class="doc-tag">PAN</span>
                        </div>
                    </div>

                    <!-- Item 2 -->
                    <div class="applicant-item">
                        <div class="applicant-top">
                            <span class="applicant-name">Priya Sharma</span>
                        </div>
                        <div class="applicant-time">Submitted: 5 hours ago</div>
                        <div class="doc-tags">
                            <span class="doc-tag">Aadhaar</span>
                        </div>
                    </div>

                    <!-- Item 3 -->
                    <div class="applicant-item">
                        <div class="applicant-top">
                            <span class="applicant-name">Amit Patel</span>
                        </div>
                        <div class="applicant-time">Submitted: 1 day ago</div>
                        <div class="doc-tags">
                            <span class="doc-tag">Passport</span>
                            <span class="doc-tag">Bank Stmt</span>
                        </div>
                    </div>
                </div>

                <!-- Right Area: Detailed Verification Workspace -->
                <div class="detail-card">
                    <div class="profile-header">
                        <div class="profile-info">
                            <img src="https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?auto=format&fit=crop&q=80&w=120" alt="Ravi Kumar" class="user-avatar" />
                            <div>
                                <h2 class="user-fullname">Ravi Kumar</h2>
                                <div class="meta-details">
                                    <span class="meta-item">&#9993; ravi.kumar@example.com</span>
                                    <span>|</span>
                                    <span class="meta-item">&#128222; +91 98765 43210</span>
                                </div>
                            </div>
                        </div>
                        <div class="header-buttons">
                            <button type="button" class="btn-reject-outline">&times; Reject</button>
                            <button type="button" class="btn-approve-fill">&#10003; Approve</button>
                        </div>
                    </div>

                    <div class="workspace-grid">
                        <!-- Column 1: Identity Documents -->
                        <div>
                            <div class="section-label">Identity Documents</div>

                            <!-- Aadhaar Card Box -->
                            <div class="doc-box">
                                <div class="doc-box-header">
                                    <span>Aadhaar Card (Front &amp; Back)</span>
                                    <span class="expand-icon">&#x200B;&#x26F6;</span>
                                </div>
                                <div class="doc-img-wrapper">
                                    <img src="https://images.unsplash.com/photo-1589829545856-d10d557cf95f?auto=format&fit=crop&q=80&w=600" alt="Aadhaar Front" />
                                </div>
                                <div class="doc-meta">
                                    <span>Aadhaar No:</span>
                                    <span class="doc-meta-value">XXXX XXXX 1234</span>
                                </div>
                            </div>

                            <!-- PAN Card Box -->
                            <div class="doc-box">
                                <div class="doc-box-header">
                                    <span>PAN Card</span>
                                    <span class="expand-icon">&#x200B;&#x26F6;</span>
                                </div>
                                <div class="doc-img-wrapper">
                                    <img src="https://images.unsplash.com/photo-1618005182384-a83a8bd57fbe?auto=format&fit=crop&q=80&w=600" alt="PAN Card" />
                                </div>
                                <div class="doc-meta">
                                    <span>PAN No:</span>
                                    <span class="doc-meta-value">ABCDE1234F</span>
                                </div>
                            </div>
                        </div>

                        <!-- Column 2: Financial Details & Address -->
                        <div>
                            <div class="section-label">Financial Details</div>
                            <div class="financial-card">
                                <div class="info-row">
                                    <span class="info-label">Bank Name</span>
                                    <span class="info-value">State Bank of India</span>
                                </div>
                                <div class="info-row">
                                    <span class="info-label">Account No</span>
                                    <span class="info-value">XXXX XXXX 9876</span>
                                </div>
                                <div class="info-row">
                                    <span class="info-label">IFSC Code</span>
                                    <span class="info-value">
                                        SBIN0001234
                                        <svg class="verified-check" width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="3"><polyline points="20 6 9 17 4 12"></polyline></svg>
                                    </span>
                                </div>
                                <a href="#" class="link-action">&#128196; View Cancelled Cheque</a>
                            </div>

                            <div class="section-label">Extracted Address</div>
                            <div class="address-panel">
                                142, Orchid Apartments,<br />
                                MG Road, Indiranagar,<br />
                                Bengaluru, Karnataka - 560038
                                
                                <div class="address-badge">
                                    <svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="3"><polyline points="20 6 9 17 4 12"></polyline></svg>
                                    Address matches Aadhaar records
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>
</body>
</html>