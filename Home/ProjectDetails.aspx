<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ProjectDetails.aspx.cs" Inherits="CrowedBridge.Home.ProjectDetails" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Urban Oasis Hydroponics - CrowdBridge</title>
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
            padding: 32px 48px;
        }

        .container {
            max-width: 1200px;
            margin: 0 auto;
        }

        /* Top Back Navigation */
        .back-btn {
            background: transparent;
            border: none;
            color: #A34E00;
            font-size: 13px;
            font-weight: 700;
            cursor: pointer;
            display: inline-flex;
            align-items: center;
            gap: 8px;
            text-decoration: none;
            margin-bottom: 24px;
        }

        /* Page Header */
        .project-header {
            margin-bottom: 24px;
        }

        .project-title {
            font-size: 36px;
            font-weight: 800;
            color: #111111;
            margin-bottom: 8px;
        }

        .project-author-meta {
            display: flex;
            align-items: center;
            gap: 12px;
            font-size: 13px;
            color: #555555;
            font-weight: 500;
        }

        .author-avatar {
            width: 24px;
            height: 24px;
            border-radius: 50%;
            object-fit: cover;
        }

        /* Main Content Layout */
        .main-layout {
            display: grid;
            grid-template-columns: 1fr 380px;
            gap: 32px;
        }

        /* Left Column */
        .left-col {
            display: flex;
            flex-direction: column;
            gap: 24px;
        }

        .banner-container {
            position: relative;
            border-radius: 12px;
            overflow: hidden;
            height: 380px;
            box-shadow: 0px 2px 8px rgba(0,0,0,0.04);
        }

        .banner-img {
            width: 100%;
            height: 100%;
            object-fit: cover;
        }

        .funded-badge {
            position: absolute;
            top: 16px;
            left: 16px;
            background-color: #10B981;
            color: #FFFFFF;
            padding: 6px 14px;
            border-radius: 16px;
            font-size: 12px;
            font-weight: 700;
        }

        /* Tabs Navigation */
        .tab-nav {
            display: flex;
            gap: 24px;
            border-bottom: 2px solid #EFEFEF;
            padding-bottom: 8px;
        }

        .tab-item {
            font-size: 14px;
            font-weight: 600;
            color: #666666;
            text-decoration: none;
            padding-bottom: 8px;
        }

        .tab-item.active {
            color: #FA6400;
            border-bottom: 2px solid #FA6400;
            margin-bottom: -10px;
        }

        /* About Section Card */
        .details-card {
            background: #FFFFFF;
            border: 1px solid #EFEFEF;
            border-radius: 12px;
            padding: 28px;
            box-shadow: 0px 2px 8px rgba(0,0,0,0.015);
        }

        .about-text {
            font-size: 14px;
            line-height: 1.6;
            color: #444444;
            margin-bottom: 16px;
        }

        /* Impact Highlights Grid */
        .impact-grid {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 16px;
        }

        .impact-card {
            background: #FFFFFF;
            border: 1px solid #EFEFEF;
            border-radius: 12px;
            padding: 20px;
            text-align: center;
            box-shadow: 0px 2px 8px rgba(0,0,0,0.015);
        }

        .impact-icon {
            margin-bottom: 8px;
            display: flex;
            justify-content: center;
        }

        .impact-value {
            font-size: 20px;
            font-weight: 800;
            color: #111111;
        }

        .impact-label {
            font-size: 12px;
            color: #777777;
            margin-top: 2px;
        }

        /* Right Sidebar Column */
        .right-col {
            display: flex;
            flex-direction: column;
            gap: 24px;
        }

        .funding-summary-card {
            background: #FFFFFF;
            border: 1px solid #EFEFEF;
            border-radius: 12px;
            padding: 28px;
            box-shadow: 0px 2px 8px rgba(0,0,0,0.015);
        }

        .amount-raised {
            font-size: 28px;
            font-weight: 800;
            color: #FA6400;
            margin-bottom: 4px;
        }

        .goal-label {
            font-size: 12px;
            color: #666666;
            margin-bottom: 16px;
        }

        .progress-bar-bg {
            background: #E5E7EB;
            height: 8px;
            border-radius: 4px;
            overflow: hidden;
            margin-bottom: 20px;
        }

        .progress-bar-fill {
            height: 100%;
            background: #FA6400;
            border-radius: 4px;
        }

        .stats-row {
            display: flex;
            justify-content: space-between;
            margin-bottom: 24px;
        }

        .stat-value {
            font-size: 20px;
            font-weight: 800;
            color: #111111;
        }

        .stat-label {
            font-size: 12px;
            color: #777777;
        }

        .btn-back-project {
            width: 100%;
            background: #FA6400;
            color: #FFFFFF;
            border: none;
            padding: 14px;
            border-radius: 8px;
            font-size: 14px;
            font-weight: 700;
            cursor: pointer;
        }

        .sidebar-section-title {
            font-size: 18px;
            font-weight: 800;
            color: #111111;
            margin-bottom: 12px;
        }

        /* Tier Cards */
        .tier-card {
            background: #FFFFFF;
            border: 1px solid #EFEFEF;
            border-radius: 12px;
            padding: 20px;
            position: relative;
            box-shadow: 0px 2px 8px rgba(0,0,0,0.015);
        }

        .tier-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 12px;
        }

        .tier-title {
            font-size: 14px;
            font-weight: 700;
            color: #111111;
        }

        .tier-price {
            font-size: 18px;
            font-weight: 800;
            color: #FA6400;
        }

        .tier-desc {
            font-size: 12px;
            color: #666666;
            line-height: 1.5;
        }

        .popular-badge {
            position: absolute;
            top: -10px;
            right: 16px;
            background: #FA6400;
            color: #FFFFFF;
            font-size: 10px;
            font-weight: 700;
            padding: 2px 8px;
            border-radius: 10px;
        }

        /* Footer */
        .footer {
            margin-top: 60px;
            padding-top: 24px;
            border-top: 1px solid #EFEFEF;
            display: flex;
            justify-content: space-between;
            align-items: center;
            font-size: 12px;
            color: #777777;
        }

        .footer-brand {
            font-size: 16px;
            font-weight: 800;
            color: #FA6400;
            margin-bottom: 4px;
        }

        .footer-links a {
            color: #555555;
            text-decoration: none;
            margin-left: 16px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <!-- Back Button -->
            <a href="ProjectSearch.aspx" class="back-btn">&larr; Back to Search Projects</a>

            <!-- Header Title -->
            <div class="project-header">
                <h1 class="project-title">Urban Oasis Hydroponics</h1>
                <div class="project-author-meta">
                    <img src="https://images.unsplash.com/photo-1534528741775-53994a69daeb?auto=format&fit=crop&q=80&w=100" alt="Ananya Sharma" class="author-avatar" />
                    <span>Ananya Sharma &#10004;</span>
                    <span>&bull; Pune, Maharashtra</span>
                </div>
            </div>

            <!-- Content Grid -->
            <div class="main-layout">
                
                <!-- Left Side -->
                <div class="left-col">
                    <div class="banner-container">
                        <img src="https://images.unsplash.com/photo-1530836369250-ef72a3f5cda8?auto=format&fit=crop&q=80&w=800" alt="Urban Oasis Hydroponics Banner" class="banner-img" />
                        <span class="funded-badge">126% Funded</span>
                    </div>

                    <div class="tab-nav">
                        <a href="#" class="tab-item active">About Project</a>
                        <a href="#" class="tab-item">Budget Breakup</a>
                        <a href="#" class="tab-item">Updates &amp; Timeline</a>
                        <a href="#" class="tab-item">Backer Community</a>
                    </div>

                    <div class="details-card">
                        <p class="about-text">
                            Empowering Pune's urban communities with sustainable vertical farming that uses 90% less water than traditional agriculture. Our mission is to bring fresh, pesticide-free produce to every doorstep while revitalizing urban spaces.
                        </p>
                        <p class="about-text">
                            By supporting this project, you're helping us scale our hydroponic systems to provide affordable nutrition and green jobs to local residents. Join us in building a greener, more resilient Pune.
                        </p>
                    </div>

                    <div class="impact-grid">
                        <div class="impact-card">
                            <div class="impact-icon">
                                <svg width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="#333" stroke-width="2"><path d="M12 22s8-4 8-10V5l-8-3-8 3v7c0 6 8 10 8 10z"></path></svg>
                            </div>
                            <div class="impact-value">5,000 kg</div>
                            <div class="impact-label">Yield per year</div>
                        </div>
                        <div class="impact-card">
                            <div class="impact-icon">
                                <svg width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="#333" stroke-width="2"><rect x="2" y="7" width="20" height="14" rx="2" ry="2"></rect><path d="M16 21V5a2 2 0 0 0-2-2h-4a2 2 0 0 0-2 2v16"></path></svg>
                            </div>
                            <div class="impact-value">12</div>
                            <div class="impact-label">Local jobs created</div>
                        </div>
                    </div>
                </div>

                <!-- Right Side -->
                <div class="right-col">
                    <div class="funding-summary-card">
                        <div class="amount-raised">&#x20B9;15,20,000</div>
                        <div class="goal-label">Raised of &#x20B9;12,000,000 goal</div>

                        <div class="progress-bar-bg">
                            <div class="progress-bar-fill" style="width: 100%;"></div>
                        </div>

                        <div class="stats-row">
                            <div>
                                <div class="stat-value">142</div>
                                <div class="stat-label">Backers</div>
                            </div>
                            <div>
                                <div class="stat-value">15</div>
                                <div class="stat-label">Days Left</div>
                            </div>
                        </div>

                        <asp:Button ID="btnBackProject" runat="server" Text="Back This Project Now" CssClass="btn-back-project" />
                    </div>

                    <h3 class="sidebar-section-title">Interactive Reward Tiers</h3>

                    <!-- Tier 1 -->
                    <div class="tier-card">
                        <div class="tier-header">
                            <span class="tier-title">Supporter Tier</span>
                            <span class="tier-price">&#x20B9;500</span>
                        </div>
                        <p class="tier-desc">Digital Certificate + Name on Farm Wall</p>
                    </div>

                    <!-- Tier 2 -->
                    <div class="tier-card">
                        <div class="tier-header">
                            <span class="tier-title">Pioneer Tier</span>
                            <span class="tier-price">&#x20B9;2,500</span>
                        </div>
                        <p class="tier-desc">Fresh Hydroponic Veggie Basket + Monthly Farm Newsletter</p>
                    </div>

                    <!-- Tier 3 -->
                    <div class="tier-card">
                        <span class="popular-badge">Popular</span>
                        <div class="tier-header">
                            <span class="tier-title">Sponsor Tier</span>
                            <span class="tier-price">&#x20B9;10,000</span>
                        </div>
                        <p class="tier-desc">1 Home Hydroponic Starter Kit + VIP Farm Tour in Pune</p>
                    </div>
                </div>

            </div>

            <!-- Footer -->
            <footer class="footer">
                <div>
                    <div class="footer-brand">CrowdBridge</div>
                    <div>&copy; 2024 CrowdBridge India. Empowering communities together.</div>
                </div>
                <div class="footer-links">
                    <a href="#">Support</a>
                    <a href="#">About Us</a>
                </div>
            </footer>
        </div>
    </form>
</body>
</html>