<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminDashbord.aspx.cs" Inherits="CrowedBridge.Admin.AdminDashbord" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Admin Console - Platform Overview</title>
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
            display: flex;
            min-height: 100vh;
            width: 100%;
        }

        /* Sidebar Navigation */
        .sidebar {
            width: 240px;
            background-color: #FFFFFF;
            border-right: 1px solid #EFEFEF;
            padding: 32px 20px;
            display: flex;
            flex-direction: column;
            justify-content: space-between;
            flex-shrink: 0;
        }

        .brand-title {
            font-size: 20px;
            font-weight: 800;
            color: #A34E00;
            margin-bottom: 2px;
        }

        .brand-subtitle {
            font-size: 11px;
            color: #777777;
            margin-bottom: 32px;
        }

        .nav-list {
            list-style: none;
            display: flex;
            flex-direction: column;
            gap: 6px;
        }

        .nav-link {
            display: flex;
            align-items: center;
            gap: 12px;
            padding: 12px 14px;
            border-radius: 8px;
            color: #555555;
            text-decoration: none;
            font-size: 14px;
            font-weight: 600;
            transition: all 0.15s ease;
        }

        .nav-link:hover {
            background-color: #F8F8F6;
            color: #111111;
        }

        .nav-link.active {
            background-color: #FA6400;
            color: #FFFFFF;
        }

        .nav-link svg {
            width: 18px;
            height: 18px;
            stroke: currentColor;
            fill: none;
            stroke-width: 2;
        }

        .signout-link {
            display: flex;
            align-items: center;
            gap: 10px;
            color: #555555;
            text-decoration: none;
            font-size: 13px;
            font-weight: 600;
            padding: 10px 14px;
        }

        .signout-link:hover {
            color: #111111;
        }

        /* Main Workspace */
        .main-content {
            flex-grow: 1;
            padding: 36px 50px;
            max-width: 1280px;
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
            margin-bottom: 28px;
            text-decoration: none;
        }

        .page-title {
            font-size: 32px;
            font-weight: 800;
            color: #111111;
            letter-spacing: -0.5px;
            margin-bottom: 28px;
        }

        /* Top Metrics Row */
        .metrics-grid {
            display: grid;
            grid-template-columns: repeat(3, 1fr);
            gap: 20px;
            margin-bottom: 32px;
        }

        .metric-card {
            background: #FFFFFF;
            border: 1px solid #EFEFEF;
            border-radius: 12px;
            padding: 24px;
            box-shadow: 0px 2px 8px rgba(0, 0, 0, 0.015);
        }

        .metric-label {
            font-size: 13px;
            font-weight: 600;
            color: #666666;
            margin-bottom: 12px;
        }

        .metric-value {
            font-size: 36px;
            font-weight: 800;
            color: #111111;
            margin-bottom: 16px;
            line-height: 1;
        }

        .metric-value.highlight {
            color: #A34E00;
        }

        .metric-sub {
            font-size: 12px;
            font-weight: 600;
            display: flex;
            align-items: center;
            gap: 6px;
        }

        .sub-green {
            color: #10B981;
        }

        .sub-gray {
            color: #666666;
        }

        /* Layout Grid Body */
        .dashboard-body {
            display: grid;
            grid-template-columns: 1fr 320px;
            gap: 28px;
        }

        /* Card Container */
        .card {
            background: #FFFFFF;
            border: 1px solid #EFEFEF;
            border-radius: 12px;
            box-shadow: 0px 2px 8px rgba(0, 0, 0, 0.015);
            overflow: hidden;
        }

        .card-header {
            padding: 20px 24px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            border-bottom: 1px solid #F4F4F2;
        }

        .card-title {
            font-size: 18px;
            font-weight: 800;
            color: #111111;
        }

        .view-all-link {
            font-size: 12px;
            font-weight: 700;
            color: #A34E00;
            text-decoration: none;
        }

        /* Recent Activity List */
        .activity-list {
            list-style: none;
        }

        .activity-item {
            padding: 18px 24px;
            display: flex;
            align-items: center;
            gap: 16px;
            border-bottom: 1px solid #F4F4F2;
        }

        .activity-item:last-child {
            border-bottom: none;
        }

        .activity-icon-box {
            width: 40px;
            height: 40px;
            border-radius: 8px;
            display: flex;
            align-items: center;
            justify-content: center;
            flex-shrink: 0;
        }

        .icon-orange { background-color: #FDF2E9; color: #A34E00; }
        .icon-gray { background-color: #F3F4F6; color: #4B5563; }
        .icon-red { background-color: #FEE2E2; color: #DC2626; }
        .icon-green { background-color: #D1FAE5; color: #059669; }

        .activity-icon-box svg {
            width: 20px;
            height: 20px;
            stroke: currentColor;
            fill: none;
            stroke-width: 2;
        }

        .activity-details {
            display: flex;
            flex-direction: column;
            gap: 4px;
        }

        .activity-text {
            font-size: 14px;
            font-weight: 700;
            color: #111111;
        }

        .activity-time {
            font-size: 12px;
            color: #777777;
        }

        /* Quick Actions Grid */
        .section-title {
            font-size: 18px;
            font-weight: 800;
            color: #111111;
            margin-bottom: 16px;
        }

        .actions-grid {
            display: grid;
            grid-template-columns: repeat(2, 1fr);
            gap: 12px;
            margin-bottom: 24px;
        }

        .action-card {
            background: #FFFFFF;
            border: 1px solid #EFEFEF;
            border-radius: 12px;
            padding: 20px 12px;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            gap: 10px;
            text-decoration: none;
            color: #111111;
            transition: all 0.15s ease;
        }

        .action-card:hover {
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.05);
            transform: translateY(-1px);
        }

        .action-card svg {
            width: 22px;
            height: 22px;
            stroke: #111111;
            fill: none;
            stroke-width: 2;
        }

        .action-label {
            font-size: 12px;
            font-weight: 700;
        }

        /* System Status Box */
        .status-box {
            background-color: #EFEFEF;
            border-radius: 12px;
            padding: 20px;
        }

        .status-header {
            display: flex;
            align-items: flex-start;
            gap: 10px;
            font-size: 13px;
            font-weight: 700;
            color: #111111;
            line-height: 1.4;
            margin-bottom: 8px;
        }

        .status-dot {
            width: 8px;
            height: 8px;
            border-radius: 50%;
            background-color: #10B981;
            margin-top: 4px;
            flex-shrink: 0;
        }

        .status-sub {
            font-size: 11px;
            color: #666666;
            margin-left: 18px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="app-container">
            <!-- Sidebar Navigation -->
            <div class="sidebar">
                <div>
                    <div class="brand-title">Admin Console</div>
                    <div class="brand-subtitle">Platform Oversight</div>

                    <ul class="nav-list">
                        <li>
                            <a href="AdminDashbord.aspx" class="nav-link active">
                                <svg viewBox="0 0 24 24"><rect x="3" y="3" width="7" height="7"></rect><rect x="14" y="3" width="7" height="7"></rect><rect x="14" y="14" width="7" height="7"></rect><rect x="3" y="14" width="7" height="7"></rect></svg>
                                Dashboard
                            </a>
                        </li>
                        <li>
                            <a href="UserDirectory.aspx" class="nav-link">
                                <svg viewBox="0 0 24 24"><path d="M17 21v-2a4 4 0 0 0-4-4H5a4 4 0 0 0-4 4v2"></path><circle cx="9" cy="7" r="4"></circle><path d="M23 21v-2a4 4 0 0 0-3-3.87"></path><path d="M16 3.13a4 4 0 0 1 0 7.75"></path></svg>
                                User Directory
                            </a>
                        </li>
                        <li>
                            <a href="ProjectModeration.aspx" class="nav-link">
                                <svg viewBox="0 0 24 24"><path d="M9 11l3 3L22 4"></path><path d="M21 12v7a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2V5a2 2 0 0 1 2-2h11"></path></svg>
                                Project Moderation
                            </a>
                        </li>
                        <li>
                            <a href="KYCVerification.aspx" class="nav-link">
                                <svg viewBox="0 0 24 24"><path d="M12 22s8-4 8-10V5l-8-3-8 3v7c0 6 8 10 8 10z"></path></svg>
                                KYC Verification
                            </a>
                        </li>
                        <li>
                            <a href="Reports.aspx" class="nav-link">
                                <svg viewBox="0 0 24 24"><line x1="18" y1="20" x2="18" y2="10"></line><line x1="12" y1="20" x2="12" y2="4"></line><line x1="6" y1="20" x2="6" y2="14"></line></svg>
                                Reports
                            </a>
                        </li>
                    </ul>
                </div>

                <a href="../Creator/Login.aspx" class="signout-link">
                    <svg viewBox="0 0 24 24" width="16" height="16" stroke="currentColor" fill="none" stroke-width="2"><path d="M9 21H5a2 2 0 0 1-2-2V5a2 2 0 0 1 2-2h4"></path><polyline points="16 17 21 12 16 7"></polyline><line x1="21" y1="12" x2="9" y2="12"></line></svg>
                    Sign Out
                </a>
            </div>

            <!-- Main Workspace -->
            <div class="main-content">
                <a href="../Default.aspx" class="back-btn">&larr; Back to Main Platform</a>

                <h1 class="page-title">Platform Overview</h1>

                <!-- Summary Metrics Row -->
                <div class="metrics-grid">
                    <div class="metric-card">
                        <div class="metric-label">Total Volume</div>
                        <div class="metric-value highlight">&#x20B9;48.5L</div>
                        <div class="metric-sub sub-green">
                            <svg viewBox="0 0 24 24" width="14" height="14" stroke="currentColor" fill="none" stroke-width="2"><polyline points="23 6 13.5 15.5 8.5 10.5 1 18"></polyline><polyline points="17 6 23 6 23 12"></polyline></svg>
                            +12% this month
                        </div>
                    </div>

                    <div class="metric-card">
                        <div class="metric-label">Live Projects</div>
                        <div class="metric-value">42</div>
                        <div class="metric-sub sub-gray">
                            <svg viewBox="0 0 24 24" width="14" height="14" stroke="currentColor" fill="none" stroke-width="2"><path d="M22 12h-4l-3 9L9 3l-3 9H2"></path></svg>
                            5 pending review
                        </div>
                    </div>

                    <div class="metric-card">
                        <div class="metric-label">Total Users</div>
                        <div class="metric-value">1,280</div>
                        <div class="metric-sub sub-green">
                            <svg viewBox="0 0 24 24" width="14" height="14" stroke="currentColor" fill="none" stroke-width="2"><path d="M16 21v-2a4 4 0 0 0-4-4H5a4 4 0 0 0-4 4v2"></path><circle cx="9" cy="7" r="4"></circle><line x1="19" y1="8" x2="19" y2="14"></line><line x1="22" y1="11" x2="16" y2="11"></line></svg>
                            +84 new this week
                        </div>
                    </div>
                </div>

                <!-- Dashboard Split Section -->
                <div class="dashboard-body">
                    <!-- Left Column: Recent Activity Feed -->
                    <div class="card">
                        <div class="card-header">
                            <h2 class="card-title">Recent Activity</h2>
                            <a href="#" class="view-all-link">View All</a>
                        </div>
                        <ul class="activity-list">
                            <li class="activity-item">
                                <div class="activity-icon-box icon-orange">
                                    <svg viewBox="0 0 24 24"><path d="M12 22s8-4 8-10V5l-8-3-8 3v7c0 6 8 10 8 10z"></path><polyline points="9 12 11 14 15 10"></polyline></svg>
                                </div>
                                <div class="activity-details">
                                    <span class="activity-text">KYC Approved for user Rohit Sharma.</span>
                                    <span class="activity-time">2 mins ago</span>
                                </div>
                            </li>
                            <li class="activity-item">
                                <div class="activity-icon-box icon-gray">
                                    <svg viewBox="0 0 24 24"><line x1="12" y1="19" x2="12" y2="5"></line><polyline points="5 12 12 5 19 12"></polyline></svg>
                                </div>
                                <div class="activity-details">
                                    <span class="activity-text">New Project Submitted: "Clean Water Initiative Bengaluru".</span>
                                    <span class="activity-time">15 mins ago</span>
                                </div>
                            </li>
                            <li class="activity-item">
                                <div class="activity-icon-box icon-red">
                                    <svg viewBox="0 0 24 24"><path d="M10.29 3.86L1.82 18a2 2 0 0 0 1.71 3h16.94a2 2 0 0 0 1.71-3L13.71 3.86a2 2 0 0 0-3.42 0z"></path><line x1="12" y1="9" x2="12" y2="13"></line><line x1="12" y1="17" x2="12.01" y2="17"></line></svg>
                                </div>
                                <div class="activity-details">
                                    <span class="activity-text">Flagged Project: Multiple user reports received for "Tech Startup X".</span>
                                    <span class="activity-time">1 hour ago</span>
                                </div>
                            </li>
                            <li class="activity-item">
                                <div class="activity-icon-box icon-green">
                                    <svg viewBox="0 0 24 24"><rect x="2" y="4" width="20" height="16" rx="2"></rect><circle cx="12" cy="12" r="2"></circle><path d="M6 12h.01M18 12h.01"></path></svg>
                                </div>
                                <div class="activity-details">
                                    <span class="activity-text">Payout Processed: &#x20B9;1.2L transferred to "Education First".</span>
                                    <span class="activity-time">3 hours ago</span>
                                </div>
                            </li>
                        </ul>
                    </div>

                    <!-- Right Column: Quick Actions & Operational Status -->
                    <div>
                        <h2 class="section-title">Quick Actions</h2>
                        <div class="actions-grid">
                            <a href="#" class="action-card">
                                <svg viewBox="0 0 24 24"><path d="M16 21v-2a4 4 0 0 0-4-4H5a4 4 0 0 0-4 4v2"></path><circle cx="9" cy="7" r="4"></circle><line x1="19" y1="8" x2="19" y2="14"></line><line x1="22" y1="11" x2="16" y2="11"></line></svg>
                                <span class="action-label">Add Admin</span>
                            </a>
                            <a href="#" class="action-card">
                                <svg viewBox="0 0 24 24"><path d="M14 2H6a2 2 0 0 0-2 2v16a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V8z"></path><polyline points="14 2 14 8 20 8"></polyline><line x1="16" y1="13" x2="8" y2="13"></line><line x1="16" y1="17" x2="8" y2="17"></line></svg>
                                <span class="action-label">Export Data</span>
                            </a>
                            <a href="#" class="action-card">
                                <svg viewBox="0 0 24 24"><circle cx="12" cy="12" r="3"></circle><path d="M19.4 15a1.65 1.65 0 0 0 .33 1.82l.06.06a2 2 0 0 1 0 2.83 2 2 0 0 1-2.83 0l-.06-.06a1.65 1.65 0 0 0-1.82-.33 1.65 1.65 0 0 0-1 1.51V21a2 2 0 0 1-2 2 2 2 0 0 1-2-2v-.09A1.65 1.65 0 0 0 9 19.4a1.65 1.65 0 0 0-1.82.33l-.06.06a2 2 0 0 1-2.83 0 2 2 0 0 1 0-2.83l.06-.06a1.65 1.65 0 0 0 .33-1.82 1.65 1.65 0 0 0-1.51-1H3a2 2 0 0 1-2-2 2 2 0 0 1 2-2h.09A1.65 1.65 0 0 0 4.6 9a1.65 1.65 0 0 0-.33-1.82l-.06-.06a2 2 0 0 1 0-2.83 2 2 0 0 1 2.83 0l.06.06a1.65 1.65 0 0 0 1.82.33H9a1.65 1.65 0 0 0 1-1.51V3a2 2 0 0 1 2-2 2 2 0 0 1 2 2v.09a1.65 1.65 0 0 0 1 1.51 1.65 1.65 0 0 0 1.82-.33l.06-.06a2 2 0 0 1 2.83 0 2 2 0 0 1 0 2.83l-.06.06a1.65 1.65 0 0 0-.33 1.82V9a1.65 1.65 0 0 0 1.51 1H21a2 2 0 0 1 2 2 2 2 0 0 1-2 2h-.09a1.65 1.65 0 0 0-1.51 1z"></path></svg>
                                <span class="action-label">Platform Settings</span>
                            </a>
                            <a href="#" class="action-card">
                                <svg viewBox="0 0 24 24"><path d="M21 11.5a8.38 8.38 0 0 1-.9 3.8 8.5 8.5 0 0 1-7.6 4.7 8.38 8.38 0 0 1-3.8-.9L3 21l1.9-5.7a8.38 8.38 0 0 1-.9-3.8 8.5 8.5 0 0 1 4.7-7.6 8.38 8.38 0 0 1 3.8-.9h.5a8.48 8.48 0 0 1 8 8v.5z"></path></svg>
                                <span class="action-label">Support Inbox</span>
                            </a>
                        </div>

                        <div class="status-box">
                            <div class="status-header">
                                <div class="status-dot"></div>
                                <span>System Status: All Systems Operational</span>
                            </div>
                            <div class="status-sub">Last updated: Just now</div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>
</body>
</html>