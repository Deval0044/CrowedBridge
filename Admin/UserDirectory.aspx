<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UserDirectory.aspx.cs" Inherits="CrowedBridge.Admin.UserDirectory" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Admin Console - User Directory</title>
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
            display: flex;
            justify-content: space-between;
            align-items: flex-start;
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

        .header-actions {
            display: flex;
            gap: 12px;
        }

        .btn-secondary {
            background: #FFFFFF;
            border: 1px solid #E2E8F0;
            border-radius: 8px;
            padding: 10px 16px;
            font-size: 13px;
            font-weight: 600;
            color: #333333;
            cursor: pointer;
            display: flex;
            align-items: center;
            gap: 8px;
        }

        .btn-primary {
            background: #FA6400;
            border: none;
            border-radius: 8px;
            padding: 10px 18px;
            font-size: 13px;
            font-weight: 600;
            color: #FFFFFF;
            cursor: pointer;
            display: flex;
            align-items: center;
            gap: 8px;
        }

        /* Card Container */
        .card {
            background: #FFFFFF;
            border: 1px solid #EFEFEF;
            border-radius: 12px;
            box-shadow: 0px 2px 8px rgba(0, 0, 0, 0.015);
            overflow: hidden;
        }

        /* Toolbar Filter & Search */
        .toolbar {
            padding: 20px 24px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            border-bottom: 1px solid #F4F4F2;
        }

        .filter-tabs {
            display: flex;
            gap: 8px;
        }

        .tab-btn {
            padding: 8px 18px;
            border-radius: 20px;
            font-size: 13px;
            font-weight: 600;
            border: 1px solid #EFEFEF;
            background: #FFFFFF;
            color: #333333;
            cursor: pointer;
        }

        .tab-btn.active {
            background: #FA6400;
            color: #FFFFFF;
            border-color: #FA6400;
        }

        .search-box {
            position: relative;
            width: 260px;
        }

        .search-box input {
            width: 100%;
            padding: 9px 12px 9px 36px;
            border-radius: 8px;
            border: 1px solid #E2E8F0;
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

        /* Table Design */
        .directory-table {
            width: 100%;
            border-collapse: collapse;
            text-align: left;
        }

        .directory-table th {
            background: #FAFAFA;
            padding: 14px 24px;
            font-size: 12px;
            font-weight: 700;
            color: #555555;
            border-bottom: 1px solid #EFEFEF;
        }

        .directory-table td {
            padding: 16px 24px;
            border-bottom: 1px solid #F4F4F2;
            vertical-align: middle;
            font-size: 13px;
        }

        .user-info {
            display: flex;
            align-items: center;
            gap: 12px;
        }

        .avatar {
            width: 40px;
            height: 40px;
            border-radius: 50%;
            background: #E5E7EB;
            color: #4B5563;
            font-weight: 700;
            font-size: 13px;
            display: flex;
            align-items: center;
            justify-content: center;
            object-fit: cover;
        }

        .user-name {
            font-weight: 700;
            color: #111111;
            font-size: 13px;
        }

        .user-email {
            font-size: 12px;
            color: #777777;
        }

        /* Role Badges */
        .badge-role {
            display: inline-block;
            padding: 4px 10px;
            border-radius: 6px;
            font-size: 11px;
            font-weight: 600;
            background: #EFEFEF;
            color: #444444;
        }

        .badge-role.creator {
            background: #FFEDD5;
            color: #9A3412;
        }

        /* Status Badges */
        .status-badge {
            display: inline-flex;
            align-items: center;
            gap: 6px;
            padding: 4px 10px;
            border-radius: 12px;
            font-size: 11px;
            font-weight: 600;
        }

        .status-active { background: #D1FAE5; color: #065F46; }
        .status-verified { background: #D1FAE5; color: #065F46; }
        .status-inactive { background: #E5E7EB; color: #374151; }

        .dot {
            width: 6px;
            height: 6px;
            border-radius: 50%;
            background: currentColor;
        }

        /* Pagination Footer */
        .table-footer {
            padding: 16px 24px;
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
                            <a href="UserDirectory.aspx" class="nav-link active">
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
                <a href="AdminDashbord.aspx" class="back-btn">&larr; Back to Admin Dashboard</a>

                <div class="page-header">
                    <div>
                        <h1 class="page-title">User Directory</h1>
                        <p class="page-subtitle">Manage and monitor all platform participants.</p>
                    </div>
                    <div class="header-actions">
                        <button type="button" class="btn-secondary">
                            <svg viewBox="0 0 24 24" width="14" height="14" stroke="currentColor" fill="none" stroke-width="2"><path d="M21 15v4a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2v-4"></path><polyline points="7 10 12 15 17 10"></polyline><line x1="12" y1="15" x2="12" y2="3"></line></svg>
                            Export CSV
                        </button>
                        <button type="button" class="btn-primary">
                            <svg viewBox="0 0 24 24" width="14" height="14" stroke="currentColor" fill="none" stroke-width="2"><line x1="12" y1="5" x2="12" y2="19"></line><line x1="5" y1="12" x2="19" y2="12"></line></svg>
                            Add User
                        </button>
                    </div>
                </div>

                <div class="card">
                    <!-- Toolbar Filter & Search -->
                    <div class="toolbar">
                        <div class="filter-tabs">
                            <button type="button" class="tab-btn active">All Users</button>
                            <button type="button" class="tab-btn">Backers</button>
                            <button type="button" class="tab-btn">Creators</button>
                        </div>
                        <div class="search-box">
                            <svg viewBox="0 0 24 24"><circle cx="11" cy="11" r="8"></circle><line x1="21" y1="21" x2="16.65" y2="16.65"></line></svg>
                            <asp:TextBox ID="txtSearch" runat="server" Placeholder="Search users..."></asp:TextBox>
                        </div>
                    </div>

                    <!-- User Table -->
                    <table class="directory-table">
                        <thead>
                            <tr>
                                <th>User</th>
                                <th>Role</th>
                                <th>Joined Date</th>
                                <th>Total Pledges (&#x20B9;)</th>
                                <th>Status</th>
                                <th>Actions</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>
                                    <div class="user-info">
                                        <div class="avatar">AR</div>
                                        <div>
                                            <div class="user-name">Aarav Sharma</div>
                                            <div class="user-email">aarav.s@example.com</div>
                                        </div>
                                    </div>
                                </td>
                                <td><span class="badge-role">Backer</span></td>
                                <td>Oct 12, 2023</td>
                                <td>&#x20B9;45,000</td>
                                <td><span class="status-badge status-active"><span class="dot"></span>Active</span></td>
                                <td></td>
                            </tr>
                            <tr>
                                <td>
                                    <div class="user-info">
                                        <img class="avatar" src="https://images.unsplash.com/photo-1494790108377-be9c29b29330?auto=format&fit=crop&q=80&w=120" alt="Priya Patel" />
                                        <div>
                                            <div class="user-name">Priya Patel</div>
                                            <div class="user-email">priya.creations@example.com</div>
                                        </div>
                                    </div>
                                </td>
                                <td><span class="badge-role creator">Creator</span></td>
                                <td>Sep 05, 2023</td>
                                <td>&#x20B9;12,500</td>
                                <td><span class="status-badge status-verified"><span class="dot"></span>Verified</span></td>
                                <td></td>
                            </tr>
                            <tr>
                                <td>
                                    <div class="user-info">
                                        <div class="avatar">VK</div>
                                        <div>
                                            <div class="user-name">Vikram Kumar</div>
                                            <div class="user-email">v.kumar99@example.com</div>
                                        </div>
                                    </div>
                                </td>
                                <td><span class="badge-role">Backer</span></td>
                                <td>Nov 22, 2023</td>
                                <td>&#x20B9;5,000</td>
                                <td><span class="status-badge status-inactive"><span class="dot"></span>Inactive</span></td>
                                <td></td>
                            </tr>
                        </tbody>
                    </table>

                    <!-- Table Footer Pagination -->
                    <div class="table-footer">
                        <span>Showing 1 to 3 of 1,245 entries</span>
                        <div class="pagination">
                            <span class="page-nav">&lsaquo;</span>
                            <a href="#" class="page-num active">1</a>
                            <a href="#" class="page-num">2</a>
                            <a href="#" class="page-num">3</a>
                            <span>...</span>
                            <span class="page-nav">&rsaquo;</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>
</body>
</html>