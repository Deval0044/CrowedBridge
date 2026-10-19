<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ProjectDetails.aspx.cs" Inherits="CrowedBridge.Home.ProjectDetails" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Project Details - CrowdBridge</title>
    <style>
        * { box-sizing: border-box; margin: 0; padding: 0; font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, Helvetica, Arial, sans-serif; }
        body { background-color: #F8F8F6; color: #333333; min-height: 100vh; display: flex; flex-direction: column; }
        
        /* Top Navigation Navbar */
        .navbar { background: #FFFFFF; border-bottom: 1px solid #EFEFEF; padding: 16px 48px; display: flex; justify-content: space-between; align-items: center; z-index: 20; position: relative; }
        .nav-left { display: flex; align-items: center; gap: 32px; }
        .brand-logo { font-size: 22px; font-weight: 800; color: #FA6400; text-decoration: none; }
        .nav-link { color: #555555; text-decoration: none; font-size: 14px; font-weight: 600; transition: color 0.2s; }
        .nav-link:hover { color: #FA6400; }
        .nav-right { display: flex; align-items: center; gap: 16px; }
        .btn-signin-nav { background: #FA6400; color: #FFFFFF; text-decoration: none; font-weight: 700; font-size: 13px; padding: 10px 20px; border-radius: 8px; }

        .container { max-width: 1140px; margin: 0 auto; padding: 32px 24px; width: 100%; flex-grow: 1; }
        
        /* Back Navigation Link */
        .back-btn { background: transparent; border: none; color: #555555; font-size: 13px; font-weight: 600; text-decoration: none; margin-bottom: 20px; display: inline-flex; align-items: center; gap: 6px; cursor: pointer; }
        .back-btn:hover { color: #FA6400; }

        /* Header Title & Creator Meta */
        .project-title { font-size: 36px; font-weight: 800; color: #111111; letter-spacing: -0.5px; margin-bottom: 12px; }
        
        .creator-meta-row { display: flex; align-items: center; gap: 12px; margin-bottom: 28px; }
        .author-avatar { width: 32px; height: 32px; border-radius: 50%; object-fit: cover; }
        .author-name { font-size: 14px; font-weight: 700; color: #111111; display: flex; align-items: center; gap: 4px; }
        .verified-check { color: #10B981; font-size: 14px; }
        .location-badge { background: #EFEFEF; color: #555555; font-size: 12px; font-weight: 600; padding: 4px 10px; border-radius: 12px; display: inline-flex; align-items: center; gap: 4px; }

        /* Main Layout Grid */
        .main-layout { display: grid; grid-template-columns: 1fr 380px; gap: 32px; align-items: start; }
        
        /* Left Column Media Container */
        .banner-container { position: relative; border-radius: 16px; overflow: hidden; height: 380px; box-shadow: 0 4px 16px rgba(0,0,0,0.04); }
        .banner-img { width: 100%; height: 100%; object-fit: cover; }
        .funded-badge { position: absolute; top: 16px; left: 16px; background-color: #10B981; color: #FFFFFF; padding: 6px 14px; border-radius: 20px; font-size: 12px; font-weight: 700; }
        .urgent-badge { position: absolute; top: 16px; left: 16px; background-color: #FA6400; color: #FFFFFF; padding: 6px 14px; border-radius: 20px; font-size: 12px; font-weight: 700; }

        /* Tab Navigation Bar */
        .content-tabs { display: flex; gap: 28px; border-bottom: 1px solid #E5E7EB; margin-top: 32px; margin-bottom: 24px; }
        .tab-item { font-size: 14px; font-weight: 700; color: #666666; text-decoration: none; padding-bottom: 12px; position: relative; cursor: pointer; }
        .tab-item.active { color: #111111; }
        .tab-item.active::after { content: ""; position: absolute; bottom: -1px; left: 0; right: 0; height: 2px; background: #FA6400; }

        /* Detail Cards */
        .details-card { background: #FFFFFF; border: 1px solid #EFEFEF; border-radius: 16px; padding: 32px; margin-bottom: 24px; box-shadow: 0px 2px 8px rgba(0, 0, 0, 0.02); }
        .about-text { font-size: 14px; line-height: 1.7; color: #444444; margin-bottom: 16px; }

        /* Impact Metric Grid */
        .impact-grid { display: grid; grid-template-columns: 1fr 1fr; gap: 20px; }
        .impact-card { background: #FFFFFF; border: 1px solid #EFEFEF; border-radius: 16px; padding: 24px; text-align: center; box-shadow: 0px 2px 8px rgba(0, 0, 0, 0.02); }
        .impact-icon { font-size: 20px; margin-bottom: 8px; color: #FA6400; }
        .impact-value { font-size: 24px; font-weight: 800; color: #111111; margin-bottom: 2px; }
        .impact-label { font-size: 11px; font-weight: 600; color: #777777; text-transform: uppercase; }

        /* Right Sidebar Summary Card */
        .funding-summary-card { background: #FFFFFF; border: 1px solid #EFEFEF; border-radius: 16px; padding: 32px; box-shadow: 0 4px 16px rgba(0,0,0,0.03); margin-bottom: 32px; }
        .amount-raised { font-size: 32px; font-weight: 800; color: #FA6400; margin-bottom: 4px; }
        .goal-label { font-size: 13px; color: #666666; margin-bottom: 20px; font-weight: 500; }
        
        .progress-bar-bg { background: #E5E7EB; height: 8px; border-radius: 4px; overflow: hidden; margin-bottom: 24px; width: 100%; }
        .progress-bar-fill { height: 100%; background: #FA6400; border-radius: 4px; }
        .progress-bar-fill.funded { background: #10B981; }

        .stats-row { display: flex; gap: 48px; margin-bottom: 24px; }
        .stat-value { font-size: 22px; font-weight: 800; color: #111111; }
        .stat-label { font-size: 12px; color: #777777; font-weight: 500; }
        
        .btn-back-project { width: 100%; background: #FA6400; color: #FFFFFF; border: none; padding: 16px; border-radius: 10px; font-size: 15px; font-weight: 700; cursor: pointer; transition: background 0.2s; }
        .btn-back-project:hover { background: #E05800; }

        /* Reward Tiers Sidebar Cards */
        .tiers-heading { font-size: 18px; font-weight: 800; color: #111111; margin-bottom: 16px; }
        
        .reward-tier-card { background: #FFFFFF; border: 1px solid #EFEFEF; border-radius: 12px; padding: 20px; margin-bottom: 16px; position: relative; box-shadow: 0px 2px 8px rgba(0, 0, 0, 0.02); }
        .tier-header { display: flex; justify-content: space-between; align-items: center; margin-bottom: 12px; border-bottom: 1px solid #F3F4F6; padding-bottom: 8px; }
        .tier-title { font-size: 13px; font-weight: 700; color: #333333; }
        .tier-amount { font-size: 18px; font-weight: 800; color: #FA6400; }
        .tier-desc { font-size: 12px; color: #666666; line-height: 1.5; }
        
        .popular-badge { position: absolute; top: -10px; right: 16px; background: #FA6400; color: #FFFFFF; font-size: 10px; font-weight: 800; padding: 2px 8px; border-radius: 4px; text-transform: uppercase; }

        /* Site Footer */
        .site-footer { background: #FFFFFF; border-top: 1px solid #EFEFEF; padding: 32px 48px; display: flex; justify-content: space-between; align-items: center; margin-top: 48px; }
        .brand-name { font-size: 18px; font-weight: 800; color: #FA6400; margin-bottom: 4px; }
        .copyright { font-size: 12px; color: #666666; }
        .footer-links { display: flex; gap: 24px; }
        .footer-link { text-decoration: none; color: #555555; font-size: 13px; font-weight: 500; }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <!-- Top Navbar -->
        <nav class="navbar">
            <div class="nav-left">
                <a href="../Default.aspx" class="brand-logo">CrowdBridge</a>
                <a href="ProjectSearch.aspx" class="nav-link">Explore Projects</a>
            </div>
            <div class="nav-right">
                <asp:HyperLink ID="hlSignIn" runat="server" NavigateUrl="~/Home/Login.aspx" CssClass="btn-signin-nav">Sign In</asp:HyperLink>
            </div>
        </nav>

        <div class="container">
            <a href="ProjectSearch.aspx" class="back-btn">&larr; Back to Search Projects</a>

            <!-- Header Title and Creator Meta -->
            <div class="project-header">
                <h1 class="project-title"><asp:Label ID="lblTitle" runat="server"></asp:Label></h1>
                <div class="creator-meta-row">
                    <img src="https://images.unsplash.com/photo-1494790108377-be9c29b29330?w=100" class="author-avatar" alt="Author Avatar" />
                    <span class="author-name"><asp:Label ID="lblCreatorName" runat="server" Text="Ananya Sharma"></asp:Label> <span class="verified-check">✓</span></span>
                    <span class="location-badge">📍 <asp:Label ID="lblCity" runat="server"></asp:Label>, India</span>
                </div>
            </div>

            <!-- Main Grid Layout -->
            <div class="main-layout">
                <!-- Left Column -->
                <div class="left-col">
                    <div class="banner-container">
                        <asp:Image ID="imgBanner" runat="server" CssClass="banner-img" />
                        <asp:Label ID="lblBadge" runat="server" CssClass="funded-badge"></asp:Label>
                    </div>

                    <!-- Navigation Tabs -->
                    <div class="content-tabs">
                        <span class="tab-item active">About Project</span>
                        <span class="tab-item">Budget Breakup</span>
                        <span class="tab-item">Updates & Timeline</span>
                        <span class="tab-item">Backer Community</span>
                    </div>

                    <!-- Story Paragraphs -->
                    <div class="details-card">
                        <p class="about-text"><asp:Label ID="lblDescription" runat="server"></asp:Label></p>
                        <p class="about-text">By supporting this initiative on CrowdBridge, you are directly contributing to vetted field expansion, local employment generation, and sustainable community advancement. Track live progress directly through our backer dashboard.</p>
                    </div>

                    <!-- Dynamic Impact Metrics -->
                    <div class="impact-grid">
                        <div class="impact-card">
                            <div class="impact-icon">🌱</div>
                            <div class="impact-value"><asp:Label ID="lblMetric1Val" runat="server" Text="5,000 kg"></asp:Label></div>
                            <div class="impact-label"><asp:Label ID="lblMetric1Lbl" runat="server" Text="Yield per year"></asp:Label></div>
                        </div>
                        <div class="impact-card">
                            <div class="impact-icon">💼</div>
                            <div class="impact-value"><asp:Label ID="lblMetric2Val" runat="server" Text="12"></asp:Label></div>
                            <div class="impact-label"><asp:Label ID="lblMetric2Lbl" runat="server" Text="Jobs created"></asp:Label></div>
                        </div>
                    </div>
                </div>

                <!-- Right Sidebar Column -->
                <div class="right-col">
                    <div class="funding-summary-card">
                        <div class="amount-raised">&#x20B9;<asp:Label ID="lblRaised" runat="server"></asp:Label></div>
                        <div class="goal-label">Raised of &#x20B9;<asp:Label ID="lblGoal" runat="server"></asp:Label> goal</div>

                        <div class="progress-bar-bg">
                            <asp:Panel ID="pnlProgress" runat="server" CssClass="progress-bar-fill"></asp:Panel>
                        </div>

                        <div class="stats-row">
                            <div>
                                <div class="stat-value"><asp:Label ID="lblBackersCount" runat="server" Text="142"></asp:Label></div>
                                <div class="stat-label">Backers</div>
                            </div>
                            <div>
                                <div class="stat-value"><asp:Label ID="lblDaysLeft" runat="server"></asp:Label></div>
                                <div class="stat-label">Days Left</div>
                            </div>
                        </div>

                        <asp:Button ID="btnBackProject" runat="server" Text="Back This Project Now" CssClass="btn-back-project" OnClick="btnBackProject_Click" />
                    </div>

                    <!-- Interactive Reward Tiers Section -->
                    <h3 class="tiers-heading">Interactive Reward Tiers</h3>

                    <div class="reward-tier-card">
                        <div class="tier-header">
                            <span class="tier-title">Supporter Tier</span>
                            <span class="tier-amount">&#x20B9;500</span>
                        </div>
                        <p class="tier-desc">Digital Supporter Certificate + Wall of Fame Recognition</p>
                    </div>

                    <div class="reward-tier-card">
                        <div class="tier-header">
                            <span class="tier-title">Pioneer Tier</span>
                            <span class="tier-amount">&#x20B9;2,500</span>
                        </div>
                        <p class="tier-desc">Early Access Field Kit + Monthly Progress Updates & Newsletter</p>
                    </div>

                    <div class="reward-tier-card">
                        <span class="popular-badge">Popular</span>
                        <div class="tier-header">
                            <span class="tier-title">Sponsor Tier</span>
                            <span class="tier-amount">&#x20B9;10,000</span>
                        </div>
                        <p class="tier-desc">1 Starter Innovation Kit + VIP On-Site Tour & Founder Session</p>
                    </div>
                </div>
            </div>
        </div>

        <!-- Footer -->
        <footer class="site-footer">
            <div>
                <div class="brand-name">CrowdBridge</div>
                <div class="copyright">&copy; 2026 CrowdBridge India. Empowering communities together.</div>
            </div>
            <div class="footer-links">
                <a href="../Support.aspx" class="footer-link">Support</a>
                <a href="../About.aspx" class="footer-link">About Us</a>
            </div>
        </footer>
    </form>
</body>
</html>