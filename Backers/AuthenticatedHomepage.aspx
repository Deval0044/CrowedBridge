<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AuthenticatedHomepage.aspx.cs" Inherits="CrowedBridge.Backers.AuthenticatedHomepage" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>CrowdBridge - Backer Portal</title>
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
            flex-direction: column;
        }

        /* Top Navigation Header */
        .navbar {
            background-color: #FFFFFF;
            border-bottom: 1px solid #EAEAEA;
            padding: 12px 64px;
            display: flex;
            align-items: center;
            justify-content: space-between;
            position: sticky;
            top: 0;
            z-index: 100;
        }

        .nav-left {
            display: flex;
            align-items: center;
            gap: 20px;
        }

        .brand-logo {
            font-size: 22px;
            font-weight: 800;
            color: #FA6400;
            text-decoration: none;
            letter-spacing: -0.5px;
        }

        .search-container {
            position: relative;
        }

        .search-input {
            background-color: #F3F4F6;
            border: 1px solid transparent;
            border-radius: 20px;
            padding: 8px 16px 8px 36px;
            font-size: 13px;
            width: 220px;
            outline: none;
            transition: all 0.2s ease;
        }

        .search-input:focus {
            background-color: #FFFFFF;
            border-color: #FA6400;
        }

        .search-icon {
            position: absolute;
            left: 14px;
            top: 50%;
            transform: translateY(-50%);
            color: #9CA3AF;
        }

        .nav-center {
            display: flex;
            align-items: center;
            gap: 24px;
            font-size: 13px;
            font-weight: 600;
        }

        .nav-link {
            text-decoration: none;
            color: #4B5563;
        }

        .nav-link.active {
            color: #111827;
            font-weight: 700;
            border-bottom: 2px solid #FA6400;
            padding-bottom: 2px;
        }

        .location-badge {
            display: inline-flex;
            align-items: center;
            gap: 5px;
            background: #F3F4F6;
            padding: 5px 12px;
            border-radius: 16px;
            color: #4B5563;
            font-size: 12px;
            font-weight: 500;
        }

        .nav-right {
            display: flex;
            align-items: center;
            gap: 16px;
        }

        .btn-start-project {
            background-color: #FA6400;
            color: #FFFFFF;
            border: none;
            padding: 8px 16px;
            border-radius: 6px;
            font-size: 12px;
            font-weight: 600;
            cursor: pointer;
            text-decoration: none;
            display: inline-block;
        }

        .icon-badge-wrap {
            position: relative;
            display: inline-flex;
            align-items: center;
        }

        .notification-badge {
            position: absolute;
            top: -2px;
            right: -2px;
            background-color: #FA6400;
            color: #FFFFFF;
            font-size: 9px;
            font-weight: 700;
            width: 14px;
            height: 14px;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            border: 1.5px solid #FFFFFF;
        }

        .icon-btn {
            background: none;
            border: none;
            cursor: pointer;
            color: #4B5563;
            padding: 6px;
            display: flex;
            align-items: center;
            justify-content: center;
            border-radius: 50%;
            transition: background-color 0.2s ease;
        }

        .icon-btn:hover {
            background-color: #F3F4F6;
            color: #111827;
        }

        .user-profile {
            display: flex;
            align-items: center;
            gap: 8px;
            font-size: 13px;
            font-weight: 600;
            color: #111827;
            text-decoration: none;
        }

        .profile-img {
            width: 32px;
            height: 32px;
            border-radius: 50%;
            object-fit: cover;
        }

        /* Main Container */
        .container {
            max-width: 1120px;
            margin: 0 auto;
            padding: 32px 24px 60px 24px;
            width: 100%;
            flex: 1;
        }

        /* Welcome Card Banner */
        .welcome-card {
            background-color: #FFFFFF;
            border-radius: 12px;
            padding: 28px 32px;
            border: 1px solid #EFEFEF;
            display: flex;
            justify-content: space-between;
            align-items: flex-start;
            margin-bottom: 36px;
            box-shadow: 0px 2px 6px rgba(0, 0, 0, 0.015);
        }

        .welcome-text h1 {
            font-size: 24px;
            font-weight: 800;
            color: #111827;
            margin-bottom: 8px;
        }

        .welcome-text p {
            font-size: 13px;
            color: #6B7280;
        }

        .pill-group {
            display: flex;
            gap: 8px;
            flex-wrap: wrap;
            max-width: 480px;
            justify-content: flex-end;
        }

        .pill {
            background: #F3F4F6;
            color: #4B5563;
            font-size: 12px;
            font-weight: 500;
            padding: 6px 14px;
            border-radius: 16px;
            border: none;
            cursor: pointer;
        }

        .pill.active {
            background: #FFEDD5;
            color: #C2410C;
            font-weight: 600;
        }

        /* Section Header */
        .section-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 18px;
        }

        .section-title {
            font-size: 18px;
            font-weight: 700;
            color: #111827;
        }

        .view-all-link {
            font-size: 12px;
            font-weight: 600;
            color: #FA6400;
            text-decoration: none;
        }

        /* Supported Projects Grid */
        .supported-grid {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 20px;
            margin-bottom: 40px;
        }

        .supported-card {
            background: #FFFFFF;
            border-radius: 12px;
            border: 1px solid #EFEFEF;
            padding: 16px;
            display: flex;
            gap: 16px;
            align-items: center;
        }

        .supported-img {
            width: 130px;
            height: 95px;
            border-radius: 8px;
            object-fit: cover;
            flex-shrink: 0;
            background-color: #E5E7EB;
        }

        .supported-body {
            flex: 1;
            display: flex;
            flex-direction: column;
            justify-content: space-between;
            height: 95px;
        }

        .card-top {
            display: flex;
            justify-content: space-between;
            align-items: flex-start;
        }

        .card-title-text {
            font-size: 14px;
            font-weight: 700;
            color: #111827;
        }

        .badge-funded {
            background: #ECFDF5;
            color: #059669;
            font-size: 11px;
            font-weight: 600;
            padding: 2px 8px;
            border-radius: 10px;
        }

        .badge-normal {
            background: #F3F4F6;
            color: #4B5563;
            font-size: 11px;
            font-weight: 600;
            padding: 2px 8px;
            border-radius: 10px;
        }

        .card-status-text {
            font-size: 12px;
            color: #6B7280;
            margin-top: 4px;
        }

        .status-urgent {
            color: #DC2626;
            font-weight: 600;
        }

        .progress-bar-bg {
            background: #E5E7EB;
            height: 6px;
            border-radius: 3px;
            width: 100%;
            margin: 8px 0;
            overflow: hidden;
        }

        .progress-bar-fill {
            background: #FA6400;
            height: 100%;
            border-radius: 3px;
        }

        .btn-update-action {
            background: #FFFFFF;
            border: 1px solid #E5E7EB;
            padding: 6px 12px;
            border-radius: 6px;
            font-size: 12px;
            font-weight: 600;
            color: #374151;
            cursor: pointer;
            width: 100%;
            text-align: center;
        }

        .btn-update-action:hover {
            background-color: #F9FAFB;
        }

        /* Recommended Campaigns Grid */
        .recommended-grid {
            display: grid;
            grid-template-columns: repeat(3, 1fr);
            gap: 20px;
            margin-bottom: 48px;
        }

        .campaign-card {
            background: #FFFFFF;
            border-radius: 12px;
            border: 1px solid #EFEFEF;
            overflow: hidden;
            display: flex;
            flex-direction: column;
        }

        .campaign-img {
            width: 100%;
            height: 150px;
            object-fit: cover;
            background-color: #E5E7EB;
        }

        .campaign-content {
            padding: 16px;
            flex: 1;
            display: flex;
            flex-direction: column;
            justify-content: space-between;
        }

        .campaign-meta {
            font-size: 11px;
            font-weight: 700;
            color: #FA6400;
            letter-spacing: 0.5px;
            margin-bottom: 6px;
        }

        .campaign-title-text {
            font-size: 14px;
            font-weight: 700;
            color: #111827;
            margin-bottom: 12px;
        }

        .campaign-raised {
            font-size: 11px;
            color: #6B7280;
            margin-top: 6px;
            margin-bottom: 12px;
        }

        .btn-view-details {
            background: #FFFFFF;
            border: 1px solid #E5E7EB;
            padding: 8px;
            border-radius: 6px;
            font-size: 12px;
            font-weight: 600;
            color: #374151;
            cursor: pointer;
            width: 100%;
            text-align: center;
        }

        .btn-view-details:hover {
            background-color: #FA6400;
            color: #FFFFFF;
            border-color: #FA6400;
        }

        /* Community Impact Section */
        .impact-section {
            background: #FFFFFF;
            border-radius: 12px;
            border: 1px solid #EFEFEF;
            padding: 36px 24px;
            text-align: center;
        }

        .impact-title {
            font-size: 20px;
            font-weight: 700;
            color: #111827;
            margin-bottom: 32px;
        }

        .impact-stats-grid {
            display: grid;
            grid-template-columns: repeat(3, 1fr);
            gap: 20px;
        }

        .stat-value {
            font-size: 26px;
            font-weight: 800;
            color: #111827;
            margin-bottom: 4px;
        }

        .stat-label {
            font-size: 11px;
            font-weight: 700;
            color: #9CA3AF;
            letter-spacing: 0.5px;
            text-transform: uppercase;
        }

        /* Footer */
        .footer {
            background: #FFFFFF;
            border-top: 1px solid #EAEAEA;
            padding: 20px 64px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            font-size: 12px;
            color: #6B7280;
            margin-top: auto;
        }

        .footer-brand {
            font-weight: 700;
            color: #111827;
            font-size: 13px;
        }

        .footer-links {
            display: flex;
            gap: 20px;
            align-items: center;
        }

        .footer-link {
            color: #6B7280;
            text-decoration: none;
            cursor: pointer;
        }
        .footer-link:hover {
            color: #FA6400;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <!-- Navigation Header -->
        <header class="navbar">
            <div class="nav-left">
                <a href="AuthenticatedHomepage.aspx" class="brand-logo">CrowdBridge</a>
                <div class="search-container">
                    <svg class="search-icon" width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5"><circle cx="11" cy="11" r="8"></circle><line x1="21" y1="21" x2="16.65" y2="16.65"></line></svg>
                    <input type="text" class="search-input" placeholder="Search campaigns..." />
                </div>
            </div>

            <div class="nav-center">
                <a href="AuthenticatedHomepage.aspx" class="nav-link active">Explore</a>
                <a href="#impact" class="nav-link">Impact</a>
                <span class="location-badge">
                    <svg width="12" height="12" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path d="M21 10c0 7-9 13-9 13s-9-6-9-13a9 9 0 0 1 18 0z"></path><circle cx="12" cy="10" r="3"></circle></svg>
                    Pune, Maharashtra
                </span>
            </div>

            <div class="nav-right">
                <asp:Button ID="btnStartProject" runat="server" Text="+ Start a Project" CssClass="btn-start-project" OnClick="btnStartProject_Click" />
                
                <div class="icon-badge-wrap">
                    <button type="button" class="icon-btn" title="Notifications">
                        <svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M18 8A6 6 0 0 0 6 8c0 7-3 9-3 9h18s-3-2-3-9"></path><path d="M13.73 21a2 2 0 0 1-3.46 0"></path></svg>
                    </button>
                    <span class="notification-badge">3</span>
                </div>

                <button type="button" class="icon-btn" title="Saved Projects">
                    <svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M19 21l-7-5-7 5V5a2 2 0 0 1 2-2h10a2 2 0 0 1 2 2z"></path></svg>
                </button>
                
                <a href="UserProfile.aspx" class="user-profile">
                    <asp:Label ID="lblProfileName" runat="server" Text="Rahul V."></asp:Label>
                    <img src="https://images.unsplash.com/photo-1534528741775-53994a69daeb?auto=format&fit=crop&q=80&w=100" class="profile-img" alt="Profile" />
                </a>
            </div>
        </header>

        <!-- Main Body Content -->
        <div class="container">
            
            <!-- Welcome Banner -->
            <div class="welcome-card">
                <div class="welcome-text">
                    <h1>Welcome back, <asp:Label ID="lblUserName" runat="server"></asp:Label>! </h1>
                    <p>You have backed 4 projects and helped raise &#x20B9;14,500 for local innovations.</p>
                </div>
                <div class="pill-group">
                    <button type="button" class="pill">Browse AgriTech</button>
                    <button type="button" class="pill">Recommended for You</button>
                    <button type="button" class="pill">Projects Ending Soon</button>
                    <button type="button" class="pill active"> Local to Pune</button>
                </div>
            </div>

            <!-- Supported Projects -->
            <div class="section-header">
                <h2 class="section-title">Projects You Support</h2>
                <a href="UserProfile.aspx" class="view-all-link">View All (4) &rarr;</a>
            </div>

            <div class="supported-grid">
                <!-- Card 1 -->
                <div class="supported-card">
                    <asp:Image ID="imgSupported1" runat="server" ImageUrl="~/Images/1.jpg" CssClass="supported-img" AlternateText="Urban Oasis Hydroponics" />
                    <div class="supported-body">
                        <div>
                            <div class="card-top">
                                <span class="card-title-text">Urban Oasis Hydroponics</span>
                                <span class="badge-funded">125% Funded</span>
                            </div>
                            <div class="card-status-text">Status: 15 Days Left</div>
                            <div class="progress-bar-bg">
                                <div class="progress-bar-fill" style="width: 100%;"></div>
                            </div>
                        </div>
                        <asp:Button ID="btnUpdate1" runat="server" Text="View Recent Update" CssClass="btn-update-action" OnClick="btnUpdate1_Click" />
                    </div>
                </div>

                <!-- Card 2 -->
                <div class="supported-card">
                    <asp:Image ID="imgSupported2" runat="server" ImageUrl="~/Images/8.jpg" CssClass="supported-img" AlternateText="Solar Cold Storage" />
                    <div class="supported-body">
                        <div>
                            <div class="card-top">
                                <span class="card-title-text">Solar Cold Storage</span>
                                <span class="badge-normal">85% Funded</span>
                            </div>
                            <div class="card-status-text status-urgent">Status: 8 Days Left (Urgent)</div>
                            <div class="progress-bar-bg">
                                <div class="progress-bar-fill" style="width: 85%;"></div>
                            </div>
                        </div>
                        <asp:Button ID="btnUpdate2" runat="server" Text="View Recent Update" CssClass="btn-update-action" OnClick="btnUpdate2_Click" />
                    </div>
                </div>
            </div>

            <!-- Recommended Campaigns -->
            <div class="section-header">
                <h2 class="section-title">Recommended Campaigns Based on Your Interests</h2>
            </div>

            <div class="recommended-grid">
                <!-- Rec Card 1 -->
                <div class="campaign-card">
                    <asp:Image ID="imgRec1" runat="server" ImageUrl="~/Images/6.jpg" CssClass="campaign-img" AlternateText="Smart Irrigation Sensors" />
                    <div class="campaign-content">
                        <div>
                            <div class="campaign-meta">AGRITECH &bull; NASHIK</div>
                            <div class="campaign-title-text">Smart Irrigation Sensors</div>
                        </div>
                        <div>
                            <div class="progress-bar-bg">
                                <div class="progress-bar-fill" style="width: 90%;"></div>
                            </div>
                            <div class="campaign-raised">Raised &#x20B9;4.5L of &#x20B9;5.0L</div>
                            <asp:Button ID="btnDetails1" runat="server" Text="View Details" CssClass="btn-view-details" OnClick="btnDetails1_Click" />
                        </div>
                    </div>
                </div>

                <!-- Rec Card 2 -->
                <div class="campaign-card">
                    <asp:Image ID="imgRec2" runat="server" ImageUrl="~/Images/7.jpg" CssClass="campaign-img" AlternateText="Eco Straws from Coconut Leaves" />
                    <div class="campaign-content">
                        <div>
                            <div class="campaign-meta">CLEANTECH &bull; KERALA</div>
                            <div class="campaign-title-text">Eco Straws from Coconut Leaves</div>
                        </div>
                        <div>
                            <div class="progress-bar-bg">
                                <div class="progress-bar-fill" style="width: 73%;"></div>
                            </div>
                            <div class="campaign-raised">Raised &#x20B9;2.2L of &#x20B9;3.0L</div>
                            <asp:Button ID="btnDetails2" runat="server" Text="View Details" CssClass="btn-view-details" OnClick="btnDetails2_Click" />
                        </div>
                    </div>
                </div>

                <!-- Rec Card 3 -->
                <div class="campaign-card">
                    <asp:Image ID="imgRec3" runat="server" ImageUrl="~/Images/3.jpg" CssClass="campaign-img" AlternateText="Handmade Pottery Collective" />
                    <div class="campaign-content">
                        <div>
                            <div class="campaign-meta">ARTISANS &bull; JAIPUR</div>
                            <div class="campaign-title-text">Handmade Pottery Collective</div>
                        </div>
                        <div>
                            <div class="progress-bar-bg">
                                <div class="progress-bar-fill" style="width: 90%;"></div>
                            </div>
                            <div class="campaign-raised">Raised &#x20B9;1.8L of &#x20B9;2.0L</div>
                            <asp:Button ID="btnDetails3" runat="server" Text="View Details" CssClass="btn-view-details" OnClick="btnDetails3_Click" />
                        </div>
                    </div>
                </div>
            </div>

            <!-- Collective Impact Banner -->
            <div class="impact-section" id="impact">
                <h2 class="impact-title">Your Collective Community Impact in 2026</h2>
                <div class="impact-stats-grid">
                    <div>
                        <div class="stat-value">12,400+</div>
                        <div class="stat-label">Total Backers</div>
                    </div>
                    <div>
                        <div class="stat-value">&#x20B9;4.8 Cr</div>
                        <div class="stat-label">Funds Raised</div>
                    </div>
                    <div>
                        <div class="stat-value">185</div>
                        <div class="stat-label">Local Jobs Created</div>
                    </div>
                </div>
            </div>

        </div>

        <!-- Footer -->
        <footer class="footer">
            <div>
                <span class="footer-brand">CrowdBridge</span> &nbsp;&bull;&nbsp; &copy; 2026 CrowdBridge. Built for impact.
            </div>
            <div class="footer-links">
                <a href="#" class="footer-link">Help Center</a>
                <a href="#" class="footer-link">Creator Knowledge Base</a>
                <a href="#" class="footer-link">Contact</a>
                <asp:LinkButton ID="btnSignOut" runat="server" CssClass="footer-link" OnClick="btnSignOut_Click">Sign Out</asp:LinkButton>
            </div>
        </footer>
    </form>
</body>
</html>