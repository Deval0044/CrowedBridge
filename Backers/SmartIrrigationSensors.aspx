<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SmartIrrigationSensors.aspx.cs" Inherits="CrowedBridge.Backers.SmartIrrigationSensors" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Smart Irrigation Sensors - CrowdBridge</title>
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
        }

        /* Navigation Header */
        .top-nav {
            background: #FFFFFF;
            padding: 16px 48px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            border-bottom: 1px solid #EFEFEF;
        }

        .back-btn {
            background: transparent;
            border: none;
            color: #555555;
            font-size: 13px;
            font-weight: 600;
            cursor: pointer;
            display: inline-flex;
            align-items: center;
            gap: 6px;
            text-decoration: none;
        }

        .brand-logo {
            font-size: 20px;
            font-weight: 800;
            color: #FA6400;
            text-decoration: none;
        }

        .nav-icons {
            display: flex;
            gap: 16px;
            color: #666666;
            font-size: 18px;
            cursor: pointer;
        }

        /* Container */
        .container {
            max-width: 1100px;
            margin: 32px auto;
            padding: 0 20px;
        }

        /* Page Header Title */
        .project-title {
            font-size: 36px;
            font-weight: 800;
            color: #111111;
            margin-bottom: 12px;
        }

        .project-meta {
            display: flex;
            align-items: center;
            gap: 16px;
            font-size: 13px;
            color: #555555;
            font-weight: 500;
            margin-bottom: 28px;
        }

        .meta-creator {
            display: flex;
            align-items: center;
            gap: 6px;
            font-weight: 700;
            color: #111111;
        }

        .badge-verified {
            background-color: #D1FAE5;
            color: #059669;
            font-size: 10px;
            font-weight: 700;
            padding: 2px 8px;
            border-radius: 10px;
            text-transform: uppercase;
        }

        /* Main Grid Layout */
        .main-layout {
            display: grid;
            grid-template-columns: 1fr 380px;
            gap: 32px;
        }

        /* Left Column */
        .left-col {
            display: flex;
            flex-direction: column;
            gap: 28px;
        }

        /* Media Banner Card */
        .media-card {
            background: #FFFFFF;
            border: 1px solid #EFEFEF;
            border-radius: 12px;
            padding: 16px;
            box-shadow: 0px 2px 8px rgba(0,0,0,0.015);
        }

        .banner-wrapper {
            position: relative;
            border-radius: 8px;
            overflow: hidden;
            height: 320px;
            margin-bottom: 16px;
        }

        .banner-img {
            width: 100%;
            height: 100%;
            object-fit: cover;
        }

        .badge-funded {
            position: absolute;
            top: 12px;
            left: 12px;
            background-color: #10B981;
            color: #FFFFFF;
            padding: 6px 12px;
            border-radius: 16px;
            font-size: 12px;
            font-weight: 700;
            display: flex;
            align-items: center;
            gap: 4px;
        }

        /* Banner Overlay Stats */
        .banner-stats {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 16px;
        }

        .stat-box {
            background: #F8F8F6;
            border-radius: 8px;
            padding: 16px;
        }

        .stat-box-label {
            font-size: 10px;
            font-weight: 700;
            color: #777777;
            text-transform: uppercase;
        }

        .stat-box-value {
            font-size: 22px;
            font-weight: 800;
            color: #FA6400;
            margin-top: 4px;
        }

        /* Tab Navigation */
        .tab-nav {
            display: flex;
            gap: 28px;
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
            font-weight: 700;
        }

        /* Story Section */
        .section-heading {
            font-size: 22px;
            font-weight: 800;
            color: #111111;
            margin-bottom: 16px;
        }

        .story-text {
            font-size: 14px;
            line-height: 1.6;
            color: #444444;
            margin-bottom: 16px;
        }

        .story-text strong {
            color: #111111;
        }

        /* Impact Box Card */
        .impact-box {
            background: #FFFFFF;
            border: 1px solid #EFEFEF;
            border-radius: 12px;
            padding: 24px;
            box-shadow: 0px 2px 8px rgba(0,0,0,0.015);
        }

        .impact-header {
            font-size: 18px;
            font-weight: 800;
            color: #111111;
            margin-bottom: 12px;
        }

        .impact-content {
            display: flex;
            gap: 16px;
            align-items: flex-start;
        }

        .impact-icon {
            background: #FFF7ED;
            color: #FA6400;
            width: 36px;
            height: 36px;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 18px;
            flex-shrink: 0;
        }

        /* Right Column (Sidebar) */
        .right-col {
            display: flex;
            flex-direction: column;
            gap: 20px;
        }

        .funding-card {
            background: #FFFFFF;
            border: 1px solid #EFEFEF;
            border-radius: 12px;
            padding: 24px;
            box-shadow: 0px 2px 8px rgba(0,0,0,0.015);
        }

        .funding-header {
            display: flex;
            justify-content: space-between;
            align-items: flex-end;
            margin-bottom: 4px;
        }

        .amount-raised {
            font-size: 32px;
            font-weight: 800;
            color: #111111;
        }

        .percentage-text {
            font-size: 16px;
            font-weight: 700;
            color: #FA6400;
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
            gap: 40px;
            margin-bottom: 20px;
        }

        .stat-value {
            font-size: 20px;
            font-weight: 800;
            color: #111111;
        }

        .stat-label {
            font-size: 11px;
            color: #777777;
            font-weight: 700;
            text-transform: uppercase;
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
            margin-bottom: 12px;
        }

        .guarantee-note {
            text-align: center;
            font-size: 11px;
            color: #666666;
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 4px;
        }

        .sidebar-section-title {
            font-size: 16px;
            font-weight: 800;
            color: #111111;
            margin-top: 8px;
            margin-bottom: 4px;
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

        .tier-card-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 8px;
        }

        .tier-price {
            font-size: 20px;
            font-weight: 800;
            color: #111111;
        }

        .tier-badge {
            background: #F1F5F9;
            color: #666666;
            font-size: 10px;
            font-weight: 700;
            padding: 2px 8px;
            border-radius: 4px;
            text-transform: uppercase;
        }

        .badge-popular {
            position: absolute;
            top: -10px;
            right: 16px;
            background: #FA6400;
            color: #FFFFFF;
            font-size: 10px;
            font-weight: 700;
            padding: 2px 8px;
            border-radius: 10px;
            text-transform: uppercase;
        }

        .tier-title {
            font-size: 13px;
            font-weight: 700;
            color: #111111;
            margin-bottom: 6px;
        }

        .tier-desc {
            font-size: 12px;
            color: #666666;
            line-height: 1.5;
            margin-bottom: 16px;
        }

        .btn-select-tier {
            width: 100%;
            background: #FFFFFF;
            border: 1px solid #E2E8F0;
            color: #333333;
            padding: 10px;
            border-radius: 8px;
            font-size: 12px;
            font-weight: 700;
            cursor: pointer;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <!-- Navigation Header -->
        <header class="top-nav">
            <a href="AuthenticatedHomepage.aspx" class="back-btn">&larr; Back to Backer Dashboard</a>
            <a href="AuthenticatedHomepage.aspx" class="brand-logo">CrowdBridge</a>
            <div class="nav-icons">
                <span>&#128279;</span>
                <span>&#127883;</span>
            </div>
        </header>

        <div class="container">
            <!-- Project Header -->
            <h1 class="project-title">Smart Irrigation Sensors</h1>
            <div class="project-meta">
                <span class="meta-creator">&#128100; Rajesh Patel <span class="badge-verified">Verified Creator</span></span>
                <span>&#128204; Nashik, Maharashtra</span>
                <span>&#127811; AgriTech</span>
            </div>

            <!-- Content Layout -->
            <div class="main-layout">
                
                <!-- Left Main Content Column -->
                <div class="left-col">
                    <div class="media-card">
                        <div class="banner-wrapper">
                            <img src="https://images.unsplash.com/photo-1509062522246-3755977927d7?auto=format&fit=crop&q=80&w=800" alt="Smart Irrigation Sensors Banner" class="banner-img" />
                            <span class="badge-funded">&#10004; 80% Funded</span>
                        </div>
                        <div class="banner-stats">
                            <div class="stat-box">
                                <div class="stat-box-label">Water Saved</div>
                                <div class="stat-box-value">40%</div>
                            </div>
                            <div class="stat-box">
                                <div class="stat-box-label">Farms Tested</div>
                                <div class="stat-box-value">200+</div>
                            </div>
                        </div>
                    </div>

                    <!-- Tabs -->
                    <div class="tab-nav">
                        <a href="#" class="tab-item active">About Project</a>
                        <a href="#" class="tab-item">Budget Breakup</a>
                        <a href="#" class="tab-item">Updates &amp; Field Logs</a>
                        <a href="#" class="tab-item">Backer Community</a>
                    </div>

                    <!-- Story Text Section -->
                    <div>
                        <h2 class="section-heading">The Story</h2>
                        <p class="story-text">
                            Agriculture in Nashik faces a critical challenge: unpredictable rainfall and depleting groundwater levels. Farmers often over-irrigate, leading to water wastage and reduced crop yields. Our solution? <strong>Low-cost IoT soil moisture sensors.</strong>
                        </p>
                        <p class="story-text">
                            These rugged, solar-powered nodes monitor soil health in real-time, transmitting data to a simple mobile app. By empowering farmers with precise data on when and how much to water, we've seen incredible results during our pilot phase.
                        </p>
                    </div>

                    <!-- Impact Box -->
                    <div class="impact-box">
                        <h3 class="impact-header">The Impact So Far</h3>
                        <div class="impact-content">
                            <div class="impact-icon">&#128167;</div>
                            <p class="story-text" style="margin-bottom:0;">
                                Across 200+ test farms in the Nashik region, our sensors have demonstrated an average 40% reduction in water usage, while maintaining or even improving crop yields. We need your help to scale production and reach 1,000 more farmers before the next dry season.
                            </p>
                        </div>
                    </div>
                </div>

                <!-- Right Sidebar Column -->
                <div class="right-col">
                    <div class="funding-card">
                        <div class="funding-header">
                            <span class="amount-raised">&#x20B9;4,50,000</span>
                            <span class="percentage-text">90%</span>
                        </div>
                        <div class="goal-label">Raised of &#x20B9;5,000,000 Goal</div>

                        <div class="progress-bar-bg">
                            <div class="progress-bar-fill" style="width: 90%;"></div>
                        </div>

                        <div class="stats-row">
                            <div>
                                <div class="stat-value">98</div>
                                <div class="stat-label">Backers</div>
                            </div>
                            <div>
                                <div class="stat-value">8</div>
                                <div class="stat-label">Days Left</div>
                            </div>
                        </div>

                        <asp:Button ID="btnBackProject" runat="server" Text="Back This Project Now &rarr;" CssClass="btn-back-project" />
                        <div class="guarantee-note">
                            <span>&#128737;</span> All funds protected by CrowdBridge Guarantee
                        </div>
                    </div>

                    <h3 class="sidebar-section-title">Select a Reward Tier</h3>

                    <!-- Tier 1 -->
                    <div class="tier-card">
                        <div class="tier-card-header">
                            <span class="tier-price">&#x20B9;500</span>
                            <span class="tier-badge">Tier 1</span>
                        </div>
                        <div class="tier-title">Supporter Tier</div>
                        <p class="tier-desc">Digital Certificate + Name on Project Wall. Every drop counts!</p>
                        <button type="button" class="btn-select-tier">Select Tier</button>
                    </div>

                    <!-- Tier 2 -->
                    <div class="tier-card">
                        <span class="badge-popular">Popular</span>
                        <div class="tier-card-header">
                            <span class="tier-price">&#x20B9;2,500</span>
                            <span class="tier-badge">Tier 2</span>
                        </div>
                        <div class="tier-title">Early Bird Kit</div>
                        <p class="tier-desc">1 Sensor Node + Mobile App Access. Perfect for a small garden or test plot.</p>
                        <button type="button" class="btn-select-tier">Select Tier</button>
                    </div>

                    <!-- Tier 3 -->
                    <div class="tier-card">
                        <div class="tier-card-header">
                            <span class="tier-price">&#x20B9;10,000</span>
                            <span class="tier-badge">Tier 3</span>
                        </div>
                        <div class="tier-title">Farm Bundle</div>
                        <p class="tier-desc">5 Nodes + Solar Hub + On-site Setup. Equip a full medium-sized farm.</p>
                        <button type="button" class="btn-select-tier">Select Tier</button>
                    </div>
                </div>

            </div>
        </div>
    </form>
</body>
</html>