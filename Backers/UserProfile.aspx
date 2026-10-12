<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UserProfile.aspx.cs" Inherits="CrowedBridge.Backers.UserProfile" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>CrowdBridge - Profile & Contribution History</title>
    <style>
        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
            font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, Helvetica, Arial, sans-serif;
        }

        body {
            background-color: #F8F9FA;
            color: #333333;
            min-height: 100vh;
            display: flex;
            flex-direction: column;
        }

        /* Top Navigation Bar */
        .top-nav {
            padding: 20px 80px;
            background-color: transparent;
        }

        .back-link {
            display: inline-flex;
            align-items: center;
            gap: 8px;
            color: #4B5563;
            font-size: 14px;
            font-weight: 500;
            text-decoration: none;
            transition: color 0.2s ease;
        }

        .back-link:hover {
            color: #111827;
        }

        /* Main Layout */
        .container {
            max-width: 1040px;
            margin: 0 auto;
            padding: 10px 24px 60px 24px;
            width: 100%;
            flex: 1;
        }

        /* Top Summary Cards Grid */
        .summary-grid {
            display: grid;
            grid-template-columns: 280px 1fr 1fr;
            gap: 20px;
            margin-bottom: 32px;
        }

        .card {
            background: #FFFFFF;
            border-radius: 12px;
            border: 1px solid #E5E7EB;
            padding: 24px;
            box-shadow: 0 1px 3px rgba(0,0,0,0.02);
        }

        /* Profile Card */
        .profile-card {
            display: flex;
            flex-direction: column;
            align-items: center;
            text-align: center;
        }

        .profile-avatar-wrapper {
            position: relative;
            width: 88px;
            height: 88px;
            border-radius: 50%;
            padding: 3px;
            border: 2px solid #E85D04;
            margin-bottom: 12px;
        }

        .profile-avatar {
            width: 100%;
            height: 100%;
            border-radius: 50%;
            object-fit: cover;
        }

        .user-name {
            font-size: 18px;
            font-weight: 700;
            color: #111827;
            margin-bottom: 4px;
        }

        .user-role {
            font-size: 13px;
            color: #6B7280;
            margin-bottom: 16px;
        }

        .btn-edit-profile {
            width: 100%;
            background: #FFFFFF;
            border: 1px solid #D1D5DB;
            border-radius: 8px;
            padding: 8px 16px;
            font-size: 13px;
            font-weight: 600;
            color: #374151;
            cursor: pointer;
            transition: all 0.2s ease;
        }

        .btn-edit-profile:hover {
            background-color: #F9FAFB;
            border-color: #9CA3AF;
        }

        /* Stat Cards */
        .stat-card {
            display: flex;
            flex-direction: column;
            justify-content: flex-start;
        }

        .stat-icon {
            width: 28px;
            height: 28px;
            margin-bottom: 12px;
            color: #E85D04;
        }

        .stat-label {
            font-size: 13px;
            color: #6B7280;
            font-weight: 500;
            margin-bottom: 8px;
        }

        .stat-value {
            font-size: 36px;
            font-weight: 800;
            color: #111827;
            line-height: 1;
        }

        /* Contribution Table Card */
        .table-card {
            background: #FFFFFF;
            border-radius: 12px;
            border: 1px solid #E5E7EB;
            overflow: hidden;
            box-shadow: 0 1px 3px rgba(0,0,0,0.02);
        }

        .table-header-row {
            padding: 20px 24px;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .table-title {
            font-size: 18px;
            font-weight: 700;
            color: #111827;
        }

        .search-box {
            position: relative;
            width: 240px;
        }

        .search-box input {
            width: 100%;
            padding: 8px 12px 8px 34px;
            border-radius: 8px;
            border: 1px solid #E5E7EB;
            font-size: 13px;
            outline: none;
        }

        .search-box input:focus {
            border-color: #E85D04;
        }

        .search-box-icon {
            position: absolute;
            left: 10px;
            top: 50%;
            transform: translateY(-50%);
            color: #9CA3AF;
            width: 16px;
            height: 16px;
        }

        /* Table Design */
        .data-table {
            width: 100%;
            border-collapse: collapse;
            font-size: 13px;
        }

        .data-table th {
            background-color: #FAFAFA;
            color: #6B7280;
            font-weight: 600;
            text-align: left;
            padding: 12px 24px;
            border-top: 1px solid #E5E7EB;
            border-bottom: 1px solid #E5E7EB;
        }

        .data-table td {
            padding: 14px 24px;
            border-bottom: 1px solid #F3F4F6;
            color: #111827;
            vertical-align: middle;
        }

        .data-table tr:last-child td {
            border-bottom: none;
        }

        .project-cell {
            display: flex;
            align-items: center;
            gap: 12px;
            font-weight: 600;
        }

        .project-thumb {
            width: 32px;
            height: 32px;
            border-radius: 6px;
            object-fit: cover;
        }

        .badge-success {
            background: #ECFDF5;
            color: #10B981;
            font-size: 11px;
            font-weight: 600;
            padding: 4px 10px;
            border-radius: 12px;
            display: inline-block;
        }

        .btn-receipt {
            color: #C2410C;
            text-decoration: none;
            font-weight: 600;
            display: inline-flex;
            align-items: center;
            gap: 4px;
            background: none;
            border: none;
            cursor: pointer;
            font-size: 13px;
        }

        .btn-receipt:hover {
            text-decoration: underline;
        }

        /* Table Pagination Footer */
        .table-footer {
            padding: 16px 24px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            background-color: #FFFFFF;
            border-top: 1px solid #E5E7EB;
            font-size: 13px;
            color: #6B7280;
        }

        .pagination-btns {
            display: flex;
            gap: 8px;
        }

        .btn-page {
            background: #FFFFFF;
            border: 1px solid #E5E7EB;
            padding: 6px 12px;
            border-radius: 6px;
            font-size: 12px;
            color: #9CA3AF;
            cursor: not-allowed;
        }

        /* Main Site Footer */
        .site-footer {
            background-color: #FFFFFF;
            border-top: 1px solid #EAEAEA;
            padding: 24px 80px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            font-size: 13px;
            color: #6B7280;
            margin-top: auto;
        }

        .footer-brand {
            font-size: 18px;
            font-weight: 800;
            color: #C2410C;
            margin-bottom: 4px;
        }

        .footer-links {
            display: flex;
            gap: 24px;
        }

        .footer-link {
            color: #4B5563;
            text-decoration: none;
            font-weight: 500;
        }

        .footer-link:hover {
            color: #111827;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        
        <!-- Top Back Link -->
        <div class="top-nav">
            <asp:LinkButton ID="btnBack" runat="server" CssClass="back-link" OnClick="btnBack_Click">
                &larr; Back to Previous Page
            </asp:LinkButton>
        </div>

        <div class="container">
            
            <!-- Summary Header Grid -->
            <div class="summary-grid">
                
                <!-- Profile Card -->
                <div class="card profile-card">
                    <div class="profile-avatar-wrapper">
                        <img src="https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?auto=format&fit=crop&q=80&w=200" class="profile-avatar" alt="Profile" />
                    </div>
                    <h2 class="user-name">
                        <asp:Label ID="lblFullName" runat="server" Text="Rahul Verma"></asp:Label>
                    </h2>
                    <p class="user-role">Philanthropist & Community Supporter</p>
                    <asp:Button ID="btnEditProfile" runat="server" Text="Edit Profile" CssClass="btn-edit-profile" OnClick="btnEditProfile_Click" />
                </div>

                <!-- Total Pledges Card -->
                <div class="card stat-card">
                    <svg class="stat-icon" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M14 10h4.764a2 2 0 011.789 2.894l-3.5 7A2 2 0 0115.263 21h-4.017c-.163 0-.326-.02-.485-.06L7 20m7-10V5a2 2 0 00-2-2h-.095c-.5 0-.905.405-.905.905 0 .714-.211 1.412-.608 2.006L7 11v9m7-10h-2M7 20H5a2 2 0 01-2-2v-6a2 2 0 012-2h2"></path>
                    </svg>
                    <div class="stat-label">Total Pledges</div>
                    <div class="stat-value">
                        <asp:Label ID="lblTotalPledges" runat="server" Text="4"></asp:Label>
                    </div>
                </div>

                <!-- Total Contributed Card -->
                <div class="card stat-card">
                    <svg class="stat-icon" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M3 10h18M7 15h1m4 0h1m-7 4h12a2 2 0 002-2V8a2 2 0 00-2-2H5a2 2 0 00-2 2v8a2 2 0 002 2z"></path>
                    </svg>
                    <div class="stat-label">Total Contributed</div>
                    <div class="stat-value">
                        &#x20B9;<asp:Label ID="lblTotalContributed" runat="server" Text="14,500"></asp:Label>
                    </div>
                </div>

            </div>

            <!-- Contribution History Section -->
            <div class="table-card">
                <div class="table-header-row">
                    <h3 class="table-title">Contribution History</h3>
                    <div class="search-box">
                        <svg class="search-box-icon" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M21 21l-6-6m2-5a7 7 0 11-14 0 7 7 0 0114 0z"></path>
                        </svg>
                        <input type="text" placeholder="Search pledges..." />
                    </div>
                </div>

                <table class="data-table">
                    <thead>
                        <tr>
                            <th>Project Name</th>
                            <th>Date</th>
                            <th>Amount</th>
                            <th>Status</th>
                            <th style="text-align: right;">Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>
                                <div class="project-cell">
                                    <img src="https://images.unsplash.com/photo-1577896851231-70ef18881754?auto=format&fit=crop&q=80&w=100" class="project-thumb" alt="Rural Education" />
                                    <span>Rural Education Initiative</span>
                                </div>
                            </td>
                            <td>12/10/2023</td>
                            <td style="font-weight: 600;">&#x20B9;5,000</td>
                            <td><span class="badge-success">Success</span></td>
                            <td style="text-align: right;">
                                <asp:LinkButton ID="btnReceipt1" runat="server" CssClass="btn-receipt" OnClick="btnReceipt_Click" CommandArgument="1">
                                    &#128190; Receipt
                                </asp:LinkButton>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <div class="project-cell">
                                    <img src="https://images.unsplash.com/photo-1508873696983-2df515122519?auto=format&fit=crop&q=80&w=100" class="project-thumb" alt="Solar Village" />
                                    <span>Solar Village Project</span>
                                </div>
                            </td>
                            <td>05/08/2023</td>
                            <td style="font-weight: 600;">&#x20B9;3,500</td>
                            <td><span class="badge-success">Success</span></td>
                            <td style="text-align: right;">
                                <asp:LinkButton ID="btnReceipt2" runat="server" CssClass="btn-receipt" OnClick="btnReceipt_Click" CommandArgument="2">
                                    &#128190; Receipt
                                </asp:LinkButton>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <div class="project-cell">
                                    <img src="https://images.unsplash.com/photo-1541888946425-d0fbb186a5b3?auto=format&fit=crop&q=80&w=100" class="project-thumb" alt="Clean Water" />
                                    <span>Clean Water for All</span>
                                </div>
                            </td>
                            <td>22/04/2023</td>
                            <td style="font-weight: 600;">&#x20B9;4,000</td>
                            <td><span class="badge-success">Success</span></td>
                            <td style="text-align: right;">
                                <asp:LinkButton ID="btnReceipt3" runat="server" CssClass="btn-receipt" OnClick="btnReceipt_Click" CommandArgument="3">
                                    &#128190; Receipt
                                </asp:LinkButton>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <div class="project-cell">
                                    <img src="https://images.unsplash.com/photo-1565193566173-7a0ee3dbe261?auto=format&fit=crop&q=80&w=100" class="project-thumb" alt="Artisan Support" />
                                    <span>Artisan Support Fund</span>
                                </div>
                            </td>
                            <td>10/01/2023</td>
                            <td style="font-weight: 600;">&#x20B9;2,000</td>
                            <td><span class="badge-success">Success</span></td>
                            <td style="text-align: right;">
                                <asp:LinkButton ID="btnReceipt4" runat="server" CssClass="btn-receipt" OnClick="btnReceipt_Click" CommandArgument="4">
                                    &#128190; Receipt
                                </asp:LinkButton>
                            </td>
                        </tr>
                    </tbody>
                </table>

                <div class="table-footer">
                    <span>Showing 1 to 4 of 4 entries</span>
                    <div class="pagination-btns">
                        <button type="button" class="btn-page">Prev</button>
                        <button type="button" class="btn-page">Next</button>
                    </div>
                </div>
            </div>

        </div>

        <!-- Site Footer -->
        <footer class="site-footer">
            <div>
                <div class="footer-brand">CrowdBridge</div>
                <div>&copy; 2026 CrowdBridge India. Empowering communities together.</div>
            </div>
            <div class="footer-links">
                <a href="#" class="footer-link">Support</a>
                <a href="#" class="footer-link">About Us</a>
            </div>
        </footer>

    </form>
</body>
</html>