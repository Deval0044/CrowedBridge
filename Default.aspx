<%@ Page Title="Home - CrowdBridge" Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="CrowedBridge.Default" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>CrowdBridge - Fund Grassroots Indian Innovations</title>
    <style>
        * { box-sizing: border-box; margin: 0; padding: 0; font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, sans-serif; }
        body { background-color: #F8F8F6; color: #333333; min-height: 100vh; display: flex; flex-direction: column; }
        
        /* Top Navigation Header */
        .navbar { background: #FFFFFF; border-bottom: 1px solid #EFEFEF; padding: 16px 48px; display: flex; justify-content: space-between; align-items: center; z-index: 20; position: relative; }
        .nav-left { display: flex; align-items: center; gap: 32px; }
        .brand-logo { font-size: 22px; font-weight: 800; color: #FA6400; text-decoration: none; }
        .nav-link { color: #555555; text-decoration: none; font-size: 14px; font-weight: 600; transition: color 0.2s; }
        .nav-link:hover { color: #FA6400; }
        .nav-right { display: flex; align-items: center; gap: 16px; }
        .btn-signin-nav { background: #FA6400; color: #FFFFFF; text-decoration: none; font-weight: 700; font-size: 13px; padding: 10px 20px; border-radius: 8px; }

        /* Figma Hero Banner */
        .hero-banner-wrap { position: relative; min-height: 480px; width: 100%; overflow: hidden; display: flex; align-items: center; background-color: #FA6400; }
        .hero-img-container { position: absolute; right: 0; top: 0; bottom: 0; width: 60%; z-index: 1; }
        .hero-img-container::before { content: ""; position: absolute; inset: 0; background: linear-gradient(to right, #FA6400 0%, rgba(250, 100, 0, 0.45) 50%, rgba(250, 100, 0, 0.2) 100%); z-index: 2; pointer-events: none; }
        .hero-bg-img { width: 100%; height: 100%; object-fit: cover; object-position: left center; mix-blend-mode: multiply; filter: saturate(1.2) contrast(1.05); }

        .hero-container-inner { max-width: 1280px; margin: 0 auto; width: 100%; padding: 40px 48px; position: relative; z-index: 10; }
        .hero-floating-card { background: #FFFFFF; border-radius: 20px; padding: 44px 48px; max-width: 520px; box-shadow: 0px 16px 40px rgba(0, 0, 0, 0.12); }
        .hero-title { font-size: 34px; font-weight: 800; color: #111111; line-height: 1.15; margin-bottom: 16px; }
        .hero-subtitle { font-size: 14px; color: #555555; line-height: 1.6; margin-bottom: 28px; }
        .hero-actions { display: flex; gap: 12px; }
        .btn-start-funding { background: #FA6400; color: #FFFFFF; font-weight: 700; font-size: 14px; padding: 12px 28px; border-radius: 10px; text-decoration: none; }
        .btn-learn-more { background: #FFFFFF; border: 1px solid #E2E8F0; color: #333333; font-weight: 600; font-size: 14px; padding: 12px 28px; border-radius: 10px; text-decoration: none; }

        /* Grid Section Styling */
        .main-content { max-width: 1280px; margin: 0 auto; padding: 48px 24px; width: 100%; flex-grow: 1; }
        .section-header { display: flex; justify-content: space-between; align-items: flex-end; margin-bottom: 28px; }
        .section-title { font-size: 24px; font-weight: 800; color: #111111; }
        .section-subtitle { font-size: 13px; color: #666666; margin-top: 4px; }
        .view-all { color: #FA6400; font-weight: 700; font-size: 13px; text-decoration: none; }

        .user-welcome-banner { background: #FFF3EB; border: 1px solid #FFD8BF; color: #D44000; padding: 12px 20px; border-radius: 10px; font-weight: 700; font-size: 13px; margin-bottom: 24px; }

        .grid { display: grid; grid-template-columns: repeat(4, 1fr); gap: 24px; }
        .card { background: #FFFFFF; border: 1px solid #EFEFEF; border-radius: 16px; overflow: hidden; display: flex; flex-direction: column; box-shadow: 0px 4px 12px rgba(0,0,0,0.03); }
        .card-img-wrap { position: relative; height: 180px; width: 100%; overflow: hidden; }
        .card-img { width: 100%; height: 100%; object-fit: cover; }
        
        .badge { position: absolute; top: 12px; right: 12px; padding: 4px 12px; border-radius: 12px; font-size: 11px; font-weight: 700; color: #FFFFFF; }
        .badge-funded { background-color: #10B981; }
        .badge-urgent { background-color: #FA6400; }

        .card-body { padding: 20px; display: flex; flex-direction: column; flex-grow: 1; }
        .meta-tag { font-size: 11px; font-weight: 800; color: #FA6400; text-transform: uppercase; letter-spacing: 0.5px; margin-bottom: 8px; }
        .card-title { font-size: 16px; font-weight: 800; color: #111111; margin-bottom: 8px; line-height: 1.3; }
        .card-desc { font-size: 12px; color: #666666; margin-bottom: 20px; line-height: 1.5; height: 36px; overflow: hidden; text-overflow: ellipsis; display: -webkit-box; -webkit-line-clamp: 2; -webkit-box-orient: vertical; }
        
        .progress-bar-bg { background: #E5E7EB; height: 6px; border-radius: 3px; margin-bottom: 16px; overflow: hidden; width: 100%; }
        .progress-bar-fill { height: 100%; background: #FA6400; border-radius: 3px; }
        .progress-bar-fill.funded { background: #10B981; }

        .stats-row { display: flex; justify-content: space-between; font-size: 12px; font-weight: 700; color: #111111; margin-bottom: 12px; }
        .goal-text { color: #777777; font-weight: 500; }
        .days-left { font-size: 12px; color: #666666; margin-bottom: 20px; }
        
        /* Consistent View Details Action Button */
        .btn-action { width: 100%; padding: 12px; border-radius: 10px; font-size: 13px; font-weight: 700; cursor: pointer; text-align: center; text-decoration: none; display: block; margin-top: auto; box-sizing: border-box; background: #FA6400; color: #FFFFFF; border: none; transition: background 0.2s; }
        .btn-action:hover { background: #E05800; }

        /* Site Footer */
        .site-footer { background: #FFFFFF; border-top: 1px solid #EFEFEF; padding: 32px 48px; display: flex; justify-content: space-between; align-items: center; margin-top: auto; }
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
                <a href="Default.aspx" class="brand-logo">CrowdBridge</a>
                <a href="Home/ProjectSearch.aspx" class="nav-link">Explore Projects</a>
            </div>
            <div class="nav-right">
                <asp:HyperLink ID="hlSignIn" runat="server" NavigateUrl="~/Home/Login.aspx" CssClass="btn-signin-nav">Sign In</asp:HyperLink>
            </div>
        </nav>

        <!-- Hero Section -->
        <div class="hero-banner-wrap">
            <div class="hero-img-container">
                <asp:Image ID="imgHeroBg" runat="server" ImageUrl="~/Images/hero-bg.jpg" CssClass="hero-bg-img" AlternateText="Agricultural Technology Banner" />
            </div>

            <div class="hero-container-inner">
                <div class="hero-floating-card">
                    <h1 class="hero-title">Fund Grassroots Indian Innovations</h1>
                    <p class="hero-subtitle">Empowering local communities by connecting visionary projects with global supporters. Join the movement to create sustainable impact across India.</p>
                    <div class="hero-actions">
                        <asp:HyperLink ID="hlStartFunding" runat="server" NavigateUrl="~/Home/UserRegister.aspx" CssClass="btn-start-funding">Start Funding</asp:HyperLink>
                        <a href="#trending" class="btn-learn-more">Learn More</a>
                    </div>
                </div>
            </div>
        </div>

        <!-- Trending Section -->
        <div class="main-content" id="trending">
            <asp:Panel ID="pnlUserBanner" runat="server" Visible="false" CssClass="user-welcome-banner">
                🎉 Welcome back! Additional exclusive backer projects have been unlocked for your account.
            </asp:Panel>

            <div class="section-header">
                <div>
                    <h2 class="section-title">Trending Initiatives</h2>
                    <p class="section-subtitle">Support these high-impact projects currently seeking funding.</p>
                </div>
                <a href="Home/ProjectSearch.aspx" class="view-all">View All Projects &rarr;</a>
            </div>

            <asp:Repeater ID="rptCampaigns" runat="server">
                <HeaderTemplate><div class="grid"></HeaderTemplate>
                <ItemTemplate>
                    <div class="card">
                        <div class="card-img-wrap">
                            <asp:Image ID="imgProject" runat="server" ImageUrl='<%# Eval("ImageUrl") %>' CssClass="card-img" AlternateText="Project Image" />
                            <%# GetBadgeMarkup(Eval("BadgeText").ToString()) %>
                        </div>
                        <div class="card-body">
                            <div class="meta-tag"><%# Eval("Category") %> &bull; <%# Eval("City") %></div>
                            <h3 class="card-title"><%# Eval("Title") %></h3>
                            <p class="card-desc"><%# Eval("Description") %></p>
                            
                            <div class="progress-bar-bg">
                                <asp:Panel ID="pnlProgress" runat="server" 
                                    CssClass='<%# Convert.ToInt32(Eval("Progress")) >= 100 ? "progress-bar-fill funded" : "progress-bar-fill" %>'
                                    Width='<%# Unit.Percentage(Convert.ToDouble(Eval("Progress")) > 100 ? 100 : Convert.ToDouble(Eval("Progress"))) %>'>
                                </asp:Panel>
                            </div>

                            <div class="stats-row">
                                <span>&#x20B9; <%# Eval("Raised") %> raised</span>
                                <span class="goal-text">Goal: &#x20B9; <%# Eval("Goal") %></span>
                            </div>
                            <div class="days-left">&#9202; <%# Eval("DaysLeft") %> days left</div>
                            
                            <a href='<%# "Home/ProjectDetails.aspx?id=" + Eval("Id") %>' class="btn-action">
                                View Details
                            </a>
                        </div>
                    </div>
                </ItemTemplate>
                <FooterTemplate></div></FooterTemplate>
            </asp:Repeater>
        </div>

        <!-- Site Footer -->
        <footer class="site-footer">
            <div>
                <div class="brand-name">CrowdBridge</div>
                <div class="copyright">&copy; 2026 CrowdBridge India. Empowering communities together.</div>
            </div>
            <div class="footer-links">
                <a href="Support.aspx" class="footer-link">Support</a>
                <a href="About.aspx" class="footer-link">About Us</a>
            </div>
        </footer>
    </form>
</body>
</html>