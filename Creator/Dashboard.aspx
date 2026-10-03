<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Dashboard.aspx.cs" Inherits="CrowedBridge.Creator.Dashboard" %>

<!DOCTYPE html>
<script runat="server">
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            // Initial load logic
        }
    }

    protected void btnStartCampaign_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Creator/CreateCampaign.aspx");
    }

    protected void btnSignOut_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Login.aspx");
    }
</script>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Creator Hub - Dashboard Overview</title>
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
        }

        /* Sidebar Styling */
        .sidebar {
            width: 260px;
            background: #FFFFFF;
            border-right: 1px solid #EFEFEF;
            display: flex;
            flex-direction: column;
            justify-content: space-between;
            padding: 30px 20px;
            position: fixed;
            top: 0;
            bottom: 0;
            left: 0;
        }

        .brand-header {
            margin-bottom: 30px;
        }

        .brand-title {
            font-size: 22px;
            font-weight: 700;
            color: #B24600;
        }

        .brand-subtitle {
            font-size: 13px;
            color: #777777;
            margin-top: 2px;
        }

        .nav-list {
            list-style: none;
            display: flex;
            flex-direction: column;
            gap: 8px;
        }

        .nav-item {
            display: flex;
            align-items: center;
            gap: 12px;
            padding: 12px 16px;
            border-radius: 8px;
            font-size: 14px;
            font-weight: 600;
            color: #555555;
            text-decoration: none;
            transition: all 0.2s;
        }

        .nav-item:hover {
            background-color: #F5F5F0;
            color: #111111;
        }

        .nav-item.active {
            background-color: #FA6400;
            color: #FFFFFF;
        }

        .nav-item svg {
            width: 18px;
            height: 18px;
            fill: currentColor;
        }

        .sign-out-btn {
            background: transparent;
            border: none;
            display: flex;
            align-items: center;
            gap: 10px;
            font-size: 14px;
            font-weight: 600;
            color: #555555;
            cursor: pointer;
            padding: 12px 16px;
            border-radius: 8px;
            width: 100%;
            text-align: left;
            transition: background 0.2s;
        }

        .sign-out-btn:hover {
            background-color: #F5F5F0;
            color: #111111;
        }

        /* Main Content */
        .main-content {
            margin-left: 260px;
            flex-grow: 1;
            padding: 40px 50px;
        }

        /* Top Header Area */
        .top-bar {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 30px;
        }

        .back-link {
            color: #555555;
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

        .btn-primary {
            background-color: #FA6400;
            color: #FFFFFF;
            border: none;
            padding: 12px 20px;
            border-radius: 8px;
            font-size: 14px;
            font-weight: 600;
            cursor: pointer;
            display: inline-flex;
            align-items: center;
            gap: 8px;
            transition: background 0.2s;
        }

        .btn-primary:hover {
            background-color: #E05500;
        }

        .page-title {
            font-size: 28px;
            font-weight: 700;
            color: #111111;
            margin-bottom: 24px;
        }

        /* Metric Cards */
        .metrics-grid {
            display: grid;
            grid-template-columns: repeat(3, 1fr);
            gap: 20px;
            margin-bottom: 40px;
        }

        .metric-card {
            background: #FFFFFF;
            border: 1px solid #EFEFEF;
            border-radius: 12px;
            padding: 24px;
            box-shadow: 0px 2px 10px rgba(0,0,0,0.02);
        }

        .metric-header {
            display: flex;
            align-items: center;
            gap: 8px;
            color: #666666;
            font-size: 14px;
            font-weight: 500;
            margin-bottom: 12px;
        }

        .metric-header svg {
            width: 18px;
            height: 18px;
            fill: #666666;
        }

        .metric-value {
            font-size: 32px;
            font-weight: 800;
            color: #111111;
        }

        .metric-value.highlight {
            color: #B24600;
        }

        .metric-sub {
            font-size: 12px;
            margin-top: 6px;
            font-weight: 500;
        }

        .metric-sub.positive {
            color: #10B981;
        }

        .metric-sub.neutral {
            color: #777777;
        }

        /* Section Header */
        .section-title {
            font-size: 20px;
            font-weight: 700;
            color: #111111;
            margin-bottom: 16px;
        }

        /* Table Card */
        .table-card {
            background: #FFFFFF;
            border: 1px solid #EFEFEF;
            border-radius: 12px;
            overflow: hidden;
            box-shadow: 0px 2px 10px rgba(0,0,0,0.02);
        }

        table {
            width: 100%;
            border-collapse: collapse;
            text-align: left;
        }

        th {
            background-color: #F8F8F6;
            padding: 16px 24px;
            font-size: 12px;
            font-weight: 700;
            color: #666666;
            text-transform: uppercase;
            letter-spacing: 0.5px;
            border-bottom: 1px solid #EFEFEF;
        }

        td {
            padding: 20px 24px;
            border-bottom: 1px solid #EFEFEF;
            vertical-align: middle;
        }

        tr:last-child td {
            border-bottom: none;
        }

        /* Campaign Cell Details */
        .campaign-cell {
            display: flex;
            align-items: center;
            gap: 16px;
        }

        .campaign-icon-box {
            width: 48px;
            height: 48px;
            border-radius: 8px;
            background-color: #F2F2EE;
            display: flex;
            align-items: center;
            justify-content: center;
            overflow: hidden;
            flex-shrink: 0;
        }

        .campaign-icon-box img {
            width: 100%;
            height: 100%;
            object-fit: cover;
        }

        .campaign-title {
            font-size: 15px;
            font-weight: 600;
            color: #111111;
        }

        .campaign-cat {
            font-size: 13px;
            color: #777777;
            margin-top: 2px;
        }

        /* Progress Bar */
        .progress-wrap {
            display: flex;
            flex-direction: column;
            gap: 6px;
            width: 180px;
        }

        .amount-text {
            font-size: 14px;
            font-weight: 600;
            color: #333333;
        }

        .progress-bar-bg {
            width: 100%;
            height: 8px;
            background-color: #EFEFEF;
            border-radius: 4px;
            overflow: hidden;
        }

        .progress-bar-fill {
            height: 100%;
            background-color: #FA6400;
            border-radius: 4px;
        }

        /* Status Badges */
        .badge {
            display: inline-block;
            padding: 6px 12px;
            border-radius: 20px;
            font-size: 12px;
            font-weight: 600;
        }

        .badge-live {
            background-color: #E6F4EA;
            color: #137333;
        }

        .badge-pending {
            background-color: #F1F3F4;
            color: #3C4043;
        }

        .badge-draft {
            background-color: #F1F3F4;
            color: #5F6368;
        }

        /* Action Controls */
        .action-btns {
            display: flex;
            align-items: center;
            gap: 12px;
        }

        .icon-action-btn {
            background: transparent;
            border: none;
            cursor: pointer;
            color: #777777;
            padding: 4px;
            border-radius: 4px;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .icon-action-btn:hover {
            color: #111111;
            background-color: #F2F2EE;
        }

        .icon-action-btn svg {
            width: 18px;
            height: 18px;
            fill: currentColor;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        
        <!-- Left Sidebar Navigation -->
        <div class="sidebar">
            <div>
                <div class="brand-header">
                    <div class="brand-title">Creator Hub</div>
                    <div class="brand-subtitle">Manage Campaigns</div>
                </div>

                <ul class="nav-list">
                    <li>
                        <a href="Dashboard.aspx" class="nav-item active">
                            <svg viewBox="0 0 24 24"><path d="M3 13h8V3H3v10zm0 8h8v-6H3v6zm10 0h8v-10h-8v10zm0-18v6h8V3h-8z"/></svg>
                            Hub Dashboard
                        </a>
                    </li>
                    <li>
                        <a href="BuildReward.aspx" class="nav-item">
                            <svg viewBox="0 0 24 24"><path d="M20 4H4c-1.11 0-1.99.89-1.99 2L2 18c0 1.11.89 2 2 2h16c1.11 0 2-.89 2-2V6c0-1.11-.89-2-2-2zm-5 14H4v-4h11v4zm0-5H4V9h11v4zm5 5h-4V9h4v9z"/></svg>
                            Build Reward
                        </a>
                    </li>
                    <li>
                        <a href="Pledges.aspx" class="nav-item">
                            <svg viewBox="0 0 24 24"><path d="M21 18v1c0 1.1-.9 2-2 2H5c-1.11 0-2-.9-2-2V5c0-1.1.89-2 2-2h14c1.1 0 2 .9 2 2v1h-9c-1.11 0-2 .9-2 2v8c0 1.1.89 2 2 2h9zm-9-2h10V8H12v8zm4-2.5c-.83 0-1.5-.67-1.5-1.5s.67-1.5 1.5-1.5 1.5.67 1.5 1.5-.67 1.5-1.5 1.5z"/></svg>
                            Pledges Received
                        </a>
                    </li>
                    <li>
                        <a href="Payouts.aspx" class="nav-item">
                            <svg viewBox="0 0 24 24"><path d="M19 14V6c0-1.1-.9-2-2-2H3c-1.1 0-2 .9-2 2v8c0 1.1.9 2 2 2h14c1.1 0 2-.9 2-2zm-9-1c-1.66 0-3-1.34-3-3s1.34-3 3-3 3 1.34 3 3-1.34 3-3 3zm13-6v11c0 1.1-.9 2-2 2H4v-2h17V7h2z"/></svg>
                            Payouts
                        </a>
                    </li>
                </ul>
            </div>

            <asp:Button ID="btnSignOut" runat="server" Text="&#x21AA;  Sign Out" CssClass="sign-out-btn" OnClick="btnSignOut_Click" CausesValidation="false" />
        </div>

        <!-- Main Dashboard Content -->
        <div class="main-content">
            
            <!-- Top Bar Actions -->
            <div class="top-bar">
                <asp:HyperLink ID="hlBackHome" runat="server" NavigateUrl="~/Home.aspx" CssClass="back-link">
                    &larr; Back to Home
                </asp:HyperLink>

                <asp:Button ID="btnStartCampaign" runat="server" Text="+ Start New Campaign" CssClass="btn-primary" OnClick="btnStartCampaign_Click" CausesValidation="false" />
            </div>

            <h1 class="page-title">Dashboard Overview</h1>

            <!-- Metric Stats Cards -->
            <div class="metrics-grid">
                
                <!-- Total Raised -->
                <div class="metric-card">
                    <div class="metric-header">
                        <svg viewBox="0 0 24 24"><path d="M12 2C6.48 2 2 6.48 2 12s4.48 10 10 10 10-4.48 10-10S17.52 2 12 2zm1 14h-2v-1c-1.66 0-3-1.34-3-3h2c0 1.1.9 2 2 2s2-.9 2-2c0-1.6-2.5-1.5-2.5-4C9.5 7 11 6 12 6v-1h2v1c1.66 0 3 1.34 3 3h-2c0-1.1-.9-2-2-2s-2 .9-2 2c0 1.6 2.5 1.5 2.5 4 0 1.66-1.5 3-2.5 3v1z"/></svg>
                        Total Raised
                    </div>
                    <div class="metric-value highlight">&#x20B9;8,20,000</div>
                    <div class="metric-sub positive">&#x2197; +12% this month</div>
                </div>

                <!-- Total Backers -->
                <div class="metric-card">
                    <div class="metric-header">
                        <svg viewBox="0 0 24 24"><path d="M16 11c1.66 0 2.99-1.34 2.99-3S17.66 5 16 5c-1.66 0-3 1.34-3 3s1.34 3 3 3zm-8 0c1.66 0 2.99-1.34 2.99-3S9.66 5 8 5C6.34 5 5 6.34 5 8s1.34 3 3 3zm0 2c-2.33 0-7 1.17-7 3.5V19h14v-2.5c0-2.33-4.67-3.5-7-3.5zm8 0c-.29 0-.62.02-.97.05 1.16.84 1.97 1.97 1.97 3.45V19h6v-2.5c0-2.33-4.67-3.5-7-3.5z"/></svg>
                        Total Backers
                    </div>
                    <div class="metric-value">142</div>
                    <div class="metric-sub neutral">Across 3 campaigns</div>
                </div>

                <!-- Page Views -->
                <div class="metric-card">
                    <div class="metric-header">
                        <svg viewBox="0 0 24 24"><path d="M12 21.35l-1.45-1.32C5.4 15.36 2 12.28 2 8.5 2 5.42 4.42 3 7.5 3c1.74 0 3.41.81 4.5 2.09C13.09 3.81 14.76 3 16.5 3 19.58 3 22 5.42 22 8.5c0 3.78-3.4 6.86-8.55 11.54L12 21.35z"/></svg>
                        Page Views
                    </div>
                    <div class="metric-value">4.2K</div>
                    <div class="metric-sub neutral">Last 30 days</div>
                </div>

            </div>

            <!-- Campaign List Table -->
            <h2 class="section-title">Your Campaigns</h2>

            <div class="table-card">
                <table>
                    <thead>
                        <tr>
                            <th>Project Name</th>
                            <th>Raised</th>
                            <th>Status</th>
                            <th style="text-align: right;">Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        
                        <!-- Row 1 -->
                        <tr>
                            <td>
                                <div class="campaign-cell">
                                    <div class="campaign-icon-box">
                                        <img src="https://picsum.photos/100/100?random=1" alt="Campaign Thumbnail" />
                                    </div>
                                    <div>
                                        <div class="campaign-title">Rural Education Initiative</div>
                                        <div class="campaign-cat">Education in Bihar</div>
                                    </div>
                                </div>
                            </td>
                            <td>
                                <div class="progress-wrap">
                                    <span class="amount-text">&#x20B9;4,50,000</span>
                                    <div class="progress-bar-bg">
                                        <div class="progress-bar-fill" style="width: 75%;"></div>
                                    </div>
                                </div>
                            </td>
                            <td>
                                <span class="badge badge-live">Live</span>
                            </td>
                            <td>
                                <div class="action-btns" style="justify-content: flex-end;">
                                    <button type="button" class="icon-action-btn" title="Edit">
                                        <svg viewBox="0 0 24 24"><path d="M3 17.25V21h3.75L17.81 9.94l-3.75-3.75L3 17.25zM20.71 7.04c.39-.39.39-1.02 0-1.41l-2.34-2.34c-.39-.39-1.02-.39-1.41 0l-1.83 1.83 3.75 3.75 1.83-1.83z"/></svg>
                                    </button>
                                    <button type="button" class="icon-action-btn" title="More Options">
                                        <svg viewBox="0 0 24 24"><path d="M12 8c1.1 0 2-.9 2-2s-.9-2-2-2-2 .9-2 2 .9 2 2 2zm0 2c-1.1 0-2 .9-2 2s.9 2 2 2 2-.9 2-2-.9-2-2-2zm0 6c-1.1 0-2 .9-2 2s.9 2 2 2 2-.9 2-2-.9-2-2-2z"/></svg>
                                    </button>
                                </div>
                            </td>
                        </tr>

                        <!-- Row 2 -->
                        <tr>
                            <td>
                                <div class="campaign-cell">
                                    <div class="campaign-icon-box">
                                        <svg viewBox="0 0 24 24" width="24" height="24" fill="#777"><path d="M12 2.69l5.66 5.66a8 8 0 1 1-11.31 0z"/></svg>
                                    </div>
                                    <div>
                                        <div class="campaign-title">Clean Water Tech</div>
                                        <div class="campaign-cat">Innovation Startup</div>
                                    </div>
                                </div>
                            </td>
                            <td>
                                <div class="progress-wrap">
                                    <span class="amount-text">&#x20B9;0</span>
                                    <div class="progress-bar-bg">
                                        <div class="progress-bar-fill" style="width: 0%;"></div>
                                    </div>
                                </div>
                            </td>
                            <td>
                                <span class="badge badge-pending">Pending Approval</span>
                            </td>
                            <td>
                                <div class="action-btns" style="justify-content: flex-end;">
                                    <button type="button" class="icon-action-btn" title="Edit">
                                        <svg viewBox="0 0 24 24"><path d="M3 17.25V21h3.75L17.81 9.94l-3.75-3.75L3 17.25zM20.71 7.04c.39-.39.39-1.02 0-1.41l-2.34-2.34c-.39-.39-1.02-.39-1.41 0l-1.83 1.83 3.75 3.75 1.83-1.83z"/></svg>
                                    </button>
                                    <button type="button" class="icon-action-btn" title="More Options">
                                        <svg viewBox="0 0 24 24"><path d="M12 8c1.1 0 2-.9 2-2s-.9-2-2-2-2 .9-2 2 .9 2 2 2zm0 2c-1.1 0-2 .9-2 2s.9 2 2 2 2-.9 2-2-.9-2-2-2zm0 6c-1.1 0-2 .9-2 2s.9 2 2 2 2-.9 2-2-.9-2-2-2z"/></svg>
                                    </button>
                                </div>
                            </td>
                        </tr>

                        <!-- Row 3 -->
                        <tr>
                            <td>
                                <div class="campaign-cell">
                                    <div class="campaign-icon-box">
                                        <svg viewBox="0 0 24 24" width="24" height="24" fill="#777"><path d="M14 2H6c-1.1 0-1.99.9-1.99 2L4 20c0 1.1.89 2 1.99 2H18c1.1 0 2-.9 2-2V8l-6-6zm2 16H8v-2h8v2zm0-4H8v-2h8v2zm-3-5V3.5L18.5 9H13z"/></svg>
                                    </div>
                                    <div>
                                        <div class="campaign-title">Local Artisan Coop</div>
                                        <div class="campaign-cat">Crafts & Trade</div>
                                    </div>
                                </div>
                            </td>
                            <td>
                                <span style="color: #888888; font-size: 14px;">-</span>
                            </td>
                            <td>
                                <span class="badge badge-draft">Draft</span>
                            </td>
                            <td>
                                <div class="action-btns" style="justify-content: flex-end;">
                                    <button type="button" class="icon-action-btn" title="Edit">
                                        <svg viewBox="0 0 24 24"><path d="M3 17.25V21h3.75L17.81 9.94l-3.75-3.75L3 17.25zM20.71 7.04c.39-.39.39-1.02 0-1.41l-2.34-2.34c-.39-.39-1.02-.39-1.41 0l-1.83 1.83 3.75 3.75 1.83-1.83z"/></svg>
                                    </button>
                                    <button type="button" class="icon-action-btn" title="Delete">
                                        <svg viewBox="0 0 24 24"><path d="M6 19c0 1.1.9 2 2 2h8c1.1 0 2-.9 2-2V7H6v12zM19 4h-3.5l-1-1h-5l-1 1H5v2h14V4z"/></svg>
                                    </button>
                                </div>
                            </td>
                        </tr>

                    </tbody>
                </table>
            </div>

        </div>

    </form>
</body>
</html>