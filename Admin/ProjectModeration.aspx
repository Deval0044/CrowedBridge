<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ProjectModeration.aspx.cs" Inherits="CrowedBridge.Admin.ProjectModeration" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Admin Console - Project Moderation</title>
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

        /* Header Area */
        .page-header {
            margin-bottom: 24px;
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

        /* Tab Navigation Bar & Action Button */
        .toolbar {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 20px;
            border-bottom: 1px solid #E5E7EB;
        }

        .filter-tabs {
            display: flex;
            gap: 32px;
        }

        .tab-item {
            padding-bottom: 12px;
            font-size: 14px;
            font-weight: 600;
            color: #666666;
            cursor: pointer;
            text-decoration: none;
            position: relative;
        }

        .tab-item.active {
            color: #FA6400;
            font-weight: 700;
        }

        .tab-item.active::after {
            content: '';
            position: absolute;
            bottom: -1px;
            left: 0;
            right: 0;
            height: 2px;
            background-color: #FA6400;
        }

        .btn-add {
            background: #FA6400;
            border: none;
            border-radius: 8px;
            padding: 10px 18px;
            font-size: 13px;
            font-weight: 600;
            color: #FFFFFF;
            cursor: pointer;
            display: inline-flex;
            align-items: center;
            gap: 6px;
            margin-bottom: 8px;
        }

        /* Card Container */
        .card {
            background: #FFFFFF;
            border: 1px solid #EFEFEF;
            border-radius: 12px;
            box-shadow: 0px 2px 8px rgba(0, 0, 0, 0.015);
            overflow: hidden;
            margin-bottom: 24px;
        }

        /* Table Styling */
        .moderation-table {
            width: 100%;
            border-collapse: collapse;
            text-align: left;
        }

        .moderation-table th {
            background: #FAFAFA;
            padding: 16px 24px;
            font-size: 11px;
            font-weight: 700;
            color: #666666;
            letter-spacing: 0.5px;
            text-transform: uppercase;
            border-bottom: 1px solid #EFEFEF;
        }

        .moderation-table td {
            padding: 20px 24px;
            border-bottom: 1px solid #F4F4F2;
            vertical-align: middle;
            font-size: 14px;
        }

        .moderation-table tr:last-child td {
            border-bottom: none;
        }

        /* Project Info Cell */
        .project-info {
            display: flex;
            align-items: center;
            gap: 14px;
        }

        .icon-square {
            width: 44px;
            height: 44px;
            border-radius: 8px;
            background-color: #FDF4EC;
            display: flex;
            align-items: center;
            justify-content: center;
            flex-shrink: 0;
            color: #A34E00;
        }

        .icon-square svg {
            width: 20px;
            height: 20px;
            stroke: currentColor;
            fill: none;
            stroke-width: 2;
        }

        .project-title {
            font-weight: 700;
            color: #111111;
            font-size: 14px;
            line-height: 1.3;
        }

        .project-category {
            font-size: 12px;
            color: #777777;
            margin-top: 2px;
        }

        .creator-name {
            font-weight: 600;
            color: #333333;
            line-height: 1.3;
        }

        .amount-text {
            font-weight: 700;
            color: #111111;
        }

        .date-text {
            color: #555555;
            font-weight: 500;
        }

        /* Action Buttons */
        .action-cell {
            text-align: right;
            white-space: nowrap;
        }

        .btn-approve {
            background-color: #10B981;
            color: #FFFFFF;
            border: none;
            padding: 8px 16px;
            border-radius: 6px;
            font-size: 13px;
            font-weight: 600;
            cursor: pointer;
            margin-right: 8px;
        }

        .btn-reject {
            background-color: #DC2626;
            color: #FFFFFF;
            border: none;
            padding: 8px 16px;
            border-radius: 6px;
            font-size: 13px;
            font-weight: 600;
            cursor: pointer;
        }

        /* Pagination Footer */
        .table-footer {
            display: flex;
            justify-content: space-between;
            align-items: center;
            font-size: 13px;
            color: #666666;
        }

        .pagination {
            display: flex;
            gap: 6px;
            align-items: center;
        }

        .page-num {
            width: 32px;
            height: 32px;
            border-radius: 6px;
            border: 1px solid #E2E8F0;
            background: #FFFFFF;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 13px;
            font-weight: 600;
            color: #333333;
            cursor: pointer;
            text-decoration: none;
        }

        .page-num.active {
            background: #FA6400;
            color: #FFFFFF;
            border-color: #FA6400;
        }

        .page-nav {
            width: 32px;
            height: 32px;
            border-radius: 6px;
            border: 1px solid #E2E8F0;
            background: #FFFFFF;
            display: flex;
            align-items: center;
            justify-content: center;
            color: #94A3B8;
            cursor: pointer;
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
                            <a href="AdminDashbord.aspx" class="nav-link">
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
                            <a href="ProjectModeration.aspx" class="nav-link active">
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
                <a href="AdminDashbord.aspx" class="back-btn">&larr; Back to Admin Dashboard</a>

                <div class="page-header">
                    <h1 class="page-title">Project Moderation</h1>
                    <p class="page-subtitle">Review and manage community funding initiatives.</p>
                </div>

                <!-- Tabs & Quick Add -->
                <div class="toolbar">
                    <div class="filter-tabs">
                        <a href="#" class="tab-item active">Pending</a>
                        <a href="#" class="tab-item">Live</a>
                        <a href="#" class="tab-item">Rejected</a>
                    </div>
                    <button type="button" class="btn-add">
                        <svg viewBox="0 0 24 24" width="14" height="14" stroke="currentColor" fill="none" stroke-width="2"><line x1="12" y1="5" x2="12" y2="19"></line><line x1="5" y1="12" x2="19" y2="12"></line></svg>
                        Add New Project
                    </button>
                </div>

                <!-- Moderation Table -->
                <div class="card">
                    <table class="moderation-table">
                        <thead>
                            <tr>
                                <th>Project Title</th>
                                <th>Creator</th>
                                <th>Goal (&#x20B9;)</th>
                                <th>Raised (&#x20B9;)</th>
                                <th>Submission Date</th>
                                <th style="text-align: right;">Actions</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>
                                    <div class="project-info">
                                        <div class="icon-square">
                                            <svg viewBox="0 0 24 24"><path d="M22 10v6M2 10l10-5 10 5-10 5z"></path><path d="M6 12v5c3 3 9 3 12 0v-5"></path></svg>
                                        </div>
                                        <div>
                                            <div class="project-title">Rural Education Fund</div>
                                            <div class="project-category">Education</div>
                                        </div>
                                    </div>
                                </td>
                                <td><div class="creator-name">Aarav<br />Sharma</div></td>
                                <td><span class="amount-text">&#x20B9;5,000,000</span></td>
                                <td><span class="amount-text">&#x20B9;0</span></td>
                                <td><span class="date-text">Oct 24, 2024</span></td>
                                <td class="action-cell">
                                    <button type="button" class="btn-approve">Approve</button>
                                    <button type="button" class="btn-reject">Reject</button>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <div class="project-info">
                                        <div class="icon-square">
                                            <svg viewBox="0 0 24 24"><path d="M12 2.69l5.66 5.66a8 8 0 1 1-11.31 0z"></path></svg>
                                        </div>
                                        <div>
                                            <div class="project-title">Clean Water Initiative</div>
                                            <div class="project-category">Environment</div>
                                        </div>
                                    </div>
                                </td>
                                <td><div class="creator-name">Priya<br />Patel</div></td>
                                <td><span class="amount-text">&#x20B9;12,50,000</span></td>
                                <td><span class="amount-text">&#x20B9;1,25,000</span></td>
                                <td><span class="date-text">Oct 23, 2024</span></td>
                                <td class="action-cell">
                                    <button type="button" class="btn-approve">Approve</button>
                                    <button type="button" class="btn-reject">Reject</button>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <div class="project-info">
                                        <div class="icon-square">
                                            <svg viewBox="0 0 24 24"><path d="M11 15h2a2 2 0 1 0 0-4h-3c-.6 0-1.1.2-1.4.6L3 16"></path><path d="m7 21 1.6-1.4c.4-.4.9-.6 1.4-.6h4c1.7 0 3-1.3 3-3V7c0-1.7-1.3-3-3-3H7L3 8v8"></path></svg>
                                        </div>
                                        <div>
                                            <div class="project-title">Local Artisans Co-op</div>
                                            <div class="project-category">Community</div>
                                        </div>
                                    </div>
                                </td>
                                <td><div class="creator-name">Vikram<br />Singh</div></td>
                                <td><span class="amount-text">&#x20B9;2,00,000</span></td>
                                <td><span class="amount-text">&#x20B9;0</span></td>
                                <td><span class="date-text">Oct 21, 2024</span></td>
                                <td class="action-cell">
                                    <button type="button" class="btn-approve">Approve</button>
                                    <button type="button" class="btn-reject">Reject</button>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>

                <!-- Footer Pagination -->
                <div class="table-footer">
                    <span>Showing 1 to 3 of 12 pending projects</span>
                    <div class="pagination">
                        <span class="page-nav">&lsaquo;</span>
                        <a href="#" class="page-num active">1</a>
                        <a href="#" class="page-num">2</a>
                        <a href="#" class="page-num">3</a>
                        <span class="page-nav">&rsaquo;</span>
                    </div>
                </div>
            </div>
        </div>
    </form>
</body>
</html>