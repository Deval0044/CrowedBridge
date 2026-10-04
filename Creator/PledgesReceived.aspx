<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PledgesReceived.aspx.cs" Inherits="CrowedBridge.Creator.PledgesReceived" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Pledges Received - Creator Hub</title>
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

        /* App Container */
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
            font-size: 18px;
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
            padding: 10px 14px;
            border-radius: 8px;
            color: #555555;
            text-decoration: none;
            font-size: 13px;
            font-weight: 600;
            transition: all 0.15s ease;
        }

        .nav-link:hover {
            background-color: #F8F8F6;
            color: #111111;
        }

        .nav-link.active {
            background-color: #FDF2E9;
            color: #A34E00;
        }

        .nav-link svg {
            width: 16px;
            height: 16px;
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

        /* Main Body Area */
        .main-content {
            flex-grow: 1;
            padding: 40px 60px;
            max-width: 1200px;
        }

        .back-btn {
            background: transparent;
            border: none;
            color: #A34E00;
            font-size: 13px;
            font-weight: 700;
            cursor: pointer;
            display: inline-flex;
            align-items: center;
            gap: 6px;
            margin-bottom: 24px;
            text-decoration: none;
        }

        .back-btn:hover {
            color: #7A3B00;
        }

        /* Header & Search Bar */
        .header-bar {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 32px;
        }

        .page-title {
            font-size: 32px;
            font-weight: 800;
            color: #111111;
            letter-spacing: -0.5px;
        }

        .search-box {
            position: relative;
            width: 300px;
        }

        .search-box svg {
            position: absolute;
            left: 14px;
            top: 50%;
            transform: translateY(-50%);
            width: 15px;
            height: 15px;
            stroke: #888888;
            fill: none;
            stroke-width: 2;
        }

        .search-input {
            width: 100%;
            padding: 9px 14px 9px 38px;
            border: 1px solid #E2E2E0;
            border-radius: 8px;
            font-size: 13px;
            outline: none;
            background-color: #FFFFFF;
            transition: border-color 0.2s;
        }

        .search-input:focus {
            border-color: #FA6400;
        }

        /* Pledges Table Card */
        .card {
            background: #FFFFFF;
            border: 1px solid #EFEFEF;
            border-radius: 12px;
            box-shadow: 0px 2px 10px rgba(0, 0, 0, 0.02);
            overflow: hidden;
        }

        .pledges-table {
            width: 100%;
            border-collapse: collapse;
        }

        .pledges-table th {
            text-align: left;
            font-size: 12px;
            font-weight: 600;
            color: #555555;
            padding: 16px 24px;
            background-color: #F8F8F6;
            border-bottom: 1px solid #EFEFEF;
        }

        .pledges-table td {
            padding: 18px 24px;
            font-size: 13px;
            color: #333333;
            border-bottom: 1px solid #F4F4F2;
            vertical-align: middle;
        }

        .pledges-table tr:last-child td {
            border-bottom: none;
        }

        /* Cell Styling */
        .backer-cell {
            display: flex;
            align-items: center;
            gap: 12px;
        }

        .avatar-circle {
            width: 36px;
            height: 36px;
            border-radius: 50%;
            background-color: #F1E2D7;
            color: #A34E00;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 12px;
            font-weight: 700;
            flex-shrink: 0;
        }

        .backer-name {
            font-weight: 700;
            color: #111111;
        }

        .email-col {
            color: #666666;
        }

        .amount-col {
            font-weight: 800;
            color: #111111;
        }

        .date-col {
            color: #555555;
        }

        /* Tier Badges */
        .tier-badge {
            display: inline-block;
            padding: 8px 12px;
            border-radius: 6px;
            font-size: 11px;
            font-weight: 600;
            text-align: center;
            line-height: 1.25;
            width: 86px;
            word-wrap: break-word;
        }

        .badge-gray {
            background-color: #EFEFEF;
            color: #444444;
        }

        .badge-orange {
            background-color: #A33300;
            color: #FFFFFF;
        }

        /* Pagination Footer */
        .card-footer {
            padding: 14px 24px;
            background-color: #F8F8F6;
            border-top: 1px solid #EFEFEF;
            display: flex;
            justify-content: space-between;
            align-items: center;
            font-size: 12px;
            color: #666666;
        }

        .pagination-controls {
            display: flex;
            gap: 12px;
            align-items: center;
        }

        .page-btn {
            background: transparent;
            border: none;
            cursor: pointer;
            color: #666666;
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 2px;
            border-radius: 4px;
            text-decoration: none;
        }

        .page-btn:hover {
            color: #111111;
        }

        .page-btn svg {
            width: 14px;
            height: 14px;
            stroke: currentColor;
            fill: none;
            stroke-width: 2;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="app-container">
            <!-- Sidebar Navigation -->
            <div class="sidebar">
                <div>
                    <div class="brand-title">Creator Hub</div>
                    <div class="brand-subtitle">Manage Campaigns</div>

                    <ul class="nav-list">
                        <li>
                            <a href="Dashboard.aspx" class="nav-link">
                                <svg viewBox="0 0 24 24"><rect x="3" y="3" width="7" height="7"></rect><rect x="14" y="3" width="7" height="7"></rect><rect x="14" y="14" width="7" height="7"></rect><rect x="3" y="14" width="7" height="7"></rect></svg>
                                Hub Dashboard
                            </a>
                        </li>
                        <li>
                            <a href="BuildReward.aspx" class="nav-link">
                                <svg viewBox="0 0 24 24"><path d="M11 5L6 9H2v6h4l5 4V5z"></path><path d="M15.54 8.46a5 5 0 0 1 0 7.07"></path></svg>
                                Build Reward
                            </a>
                        </li>
                        <li>
                            <a href="PledgesReceived.aspx" class="nav-link active">
                                <svg viewBox="0 0 24 24"><rect x="2" y="6" width="20" height="12" rx="2"></rect><circle cx="12" cy="12" r="2"></circle><path d="M6 12h.01M18 12h.01"></path></svg>
                                Pledges Received
                            </a>
                        </li>
                        <li>
                            <a href="Payout.aspx" class="nav-link">
                                <svg viewBox="0 0 24 24"><rect x="2" y="4" width="20" height="16" rx="2"></rect><line x1="2" y1="10" x2="22" y2="10"></line></svg>
                                Payouts
                            </a>
                        </li>
                    </ul>
                </div>

                <a href="Login.aspx" class="signout-link">
                    <svg viewBox="0 0 24 24" width="16" height="16" stroke="currentColor" fill="none" stroke-width="2"><path d="M9 21H5a2 2 0 0 1-2-2V5a2 2 0 0 1 2-2h4"></path><polyline points="16 17 21 12 16 7"></polyline><line x1="21" y1="12" x2="9" y2="12"></line></svg>
                    Sign Out
                </a>
            </div>

            <!-- Main Content Area -->
            <div class="main-content">
                <!-- Direct redirect link to Dashboard.aspx -->
                <a href="Dashboard.aspx" class="back-btn">&mdash; Back to Creator Dashboard</a>

                <div class="header-bar">
                    <h1 class="page-title">Pledges Received</h1>
                    <div class="search-box">
                        <svg viewBox="0 0 24 24"><circle cx="11" cy="11" r="8"></circle><line x1="21" y1="21" x2="16.65" y2="16.65"></line></svg>
                        <asp:TextBox ID="txtSearch" runat="server" CssClass="search-input" Placeholder="Search backers by name or email..." AutoPostBack="true" OnTextChanged="txtSearch_TextChanged"></asp:TextBox>
                    </div>
                </div>

                <!-- Table Container Card -->
                <div class="card">
                    <table class="pledges-table">
                        <thead>
                            <tr>
                                <th>Backer Name</th>
                                <th>Email</th>
                                <th>Project</th>
                                <th>Amount (&#x20B9;)</th>
                                <th>Tier</th>
                                <th>Date</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>
                                    <div class="backer-cell">
                                        <div class="avatar-circle">RS</div>
                                        <span class="backer-name">Rahul Sharma</span>
                                    </div>
                                </td>
                                <td class="email-col">rahul.s@example.in</td>
                                <td>Rural Solar Electrification</td>
                                <td class="amount-col">&#x20B9;15,000</td>
                                <td>
                                    <span class="tier-badge badge-gray">Solar Champion</span>
                                </td>
                                <td class="date-col">24 Oct, 2024</td>
                            </tr>
                            <tr>
                                <td>
                                    <div class="backer-cell">
                                        <div class="avatar-circle">PN</div>
                                        <span class="backer-name">Priya Nair</span>
                                    </div>
                                </td>
                                <td class="email-col">priya.nair88@mail.com</td>
                                <td>Community Water Well</td>
                                <td class="amount-col">&#x20B9;5,000</td>
                                <td>
                                    <span class="tier-badge badge-gray">Early Supporter</span>
                                </td>
                                <td class="date-col">22 Oct, 2024</td>
                            </tr>
                            <tr>
                                <td>
                                    <div class="backer-cell">
                                        <div class="avatar-circle">AK</div>
                                        <span class="backer-name">Amit Kumar</span>
                                    </div>
                                </td>
                                <td class="email-col">amitk.tech@domain.in</td>
                                <td>Rural Solar Electrification</td>
                                <td class="amount-col">&#x20B9;25,000</td>
                                <td>
                                    <span class="tier-badge badge-orange">Village Patron</span>
                                </td>
                                <td class="date-col">20 Oct, 2024</td>
                            </tr>
                        </tbody>
                    </table>

                    <div class="card-footer">
                        <div>Showing 1 to 3 of 124 pledges</div>
                        <div class="pagination-controls">
                            <asp:LinkButton ID="btnPrev" runat="server" CssClass="page-btn" OnClick="btnPrev_Click" ToolTip="Previous Page">
                                <svg viewBox="0 0 24 24"><polyline points="15 18 9 12 15 6"></polyline></svg>
                            </asp:LinkButton>
                            <asp:LinkButton ID="btnNext" runat="server" CssClass="page-btn" OnClick="btnNext_Click" ToolTip="Next Page">
                                <svg viewBox="0 0 24 24"><polyline points="9 18 15 12 9 6"></polyline></svg>
                            </asp:LinkButton>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>
</body>
</html>