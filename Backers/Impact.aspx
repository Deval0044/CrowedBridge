<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Impact.aspx.cs" Inherits="CrowedBridge.Backers.Impact" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>CrowdBridge - Backer Impact Dashboard</title>
    <style>
        * { box-sizing: border-box; margin: 0; padding: 0; font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, Helvetica, Arial, sans-serif; }
        body { background-color: #F8F8F6; color: #333333; min-height: 100vh; display: flex; flex-direction: column; }

        /* Top Navigation Header */
        .navbar { background-color: #FFFFFF; border-bottom: 1px solid #EAEAEA; padding: 12px 64px; display: flex; align-items: center; justify-content: space-between; position: sticky; top: 0; z-index: 100; }
        .nav-left { display: flex; align-items: center; gap: 20px; }
        .brand-logo { font-size: 22px; font-weight: 800; color: #FA6400; text-decoration: none; letter-spacing: -0.5px; }

        .nav-center { display: flex; align-items: center; gap: 24px; font-size: 13px; font-weight: 600; }
        .nav-link { text-decoration: none; color: #4B5563; }
        .nav-link.active { color: #111827; font-weight: 700; border-bottom: 2px solid #FA6400; padding-bottom: 2px; }

        .location-badge { display: inline-flex; align-items: center; gap: 5px; background: #F3F4F6; padding: 5px 12px; border-radius: 16px; color: #4B5563; font-size: 12px; font-weight: 500; }
        .nav-right { display: flex; align-items: center; gap: 16px; }

        .user-profile { display: flex; align-items: center; gap: 8px; font-size: 13px; font-weight: 600; color: #111827; text-decoration: none; }
        .profile-img { width: 32px; height: 32px; border-radius: 50%; object-fit: cover; }

        .container { max-width: 1120px; margin: 0 auto; padding: 36px 24px 60px 24px; width: 100%; flex: 1; }
        
        .page-header { text-align: center; margin-bottom: 36px; }
        .page-title { font-size: 30px; font-weight: 800; color: #111827; margin-bottom: 8px; }
        .page-subtitle { font-size: 14px; color: #6B7280; max-width: 620px; margin: 0 auto; line-height: 1.5; }

        /* Impact Metric Grid */
        .metrics-grid { display: grid; grid-template-columns: repeat(3, 1fr); gap: 20px; margin-bottom: 36px; }
        .metric-card { background: #FFFFFF; border: 1px solid #EFEFEF; border-radius: 16px; padding: 32px 24px; text-align: center; box-shadow: 0px 2px 8px rgba(0,0,0,0.02); }
        .metric-icon { font-size: 28px; margin-bottom: 12px; color: #FA6400; }
        .metric-val { font-size: 32px; font-weight: 800; color: #111827; margin-bottom: 4px; }
        .metric-lbl { font-size: 12px; font-weight: 700; color: #9CA3AF; text-transform: uppercase; letter-spacing: 0.5px; }

        /* Story Cards */
        .section-title { font-size: 20px; font-weight: 800; color: #111827; margin-bottom: 20px; }
        .story-grid { display: grid; grid-template-columns: 1fr 1fr; gap: 20px; }
        .story-card { background: #FFFFFF; border: 1px solid #EFEFEF; border-radius: 16px; padding: 28px; box-shadow: 0px 2px 8px rgba(0,0,0,0.02); }
        .story-tag { font-size: 11px; font-weight: 800; color: #FA6400; text-transform: uppercase; margin-bottom: 8px; }
        .story-title { font-size: 18px; font-weight: 800; color: #111827; margin-bottom: 10px; }
        .story-desc { font-size: 13px; color: #555555; line-height: 1.6; }

        /* Footer */
        .footer { background: #FFFFFF; border-top: 1px solid #EAEAEA; padding: 20px 64px; display: flex; justify-content: space-between; align-items: center; font-size: 12px; color: #6B7280; margin-top: auto; }
        .footer-brand { font-weight: 700; color: #111827; font-size: 13px; }
        .footer-link { color: #6B7280; text-decoration: none; }
        .footer-link:hover { color: #FA6400; }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <header class="navbar">
            <div class="nav-left">
                <a href="AuthenticatedHomepage.aspx" class="brand-logo">CrowdBridge</a>
            </div>

            <div class="nav-center">
                <a href="AuthenticatedHomepage.aspx" class="nav-link">Explore</a>
                <a href="Impact.aspx" class="nav-link active">Impact</a>
                <span class="location-badge">
                    <svg width="12" height="12" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path d="M21 10c0 7-9 13-9 13s-9-6-9-13a9 9 0 0 1 18 0z"></path><circle cx="12" cy="10" r="3"></circle></svg>
                    Pune, Maharashtra
                </span>
            </div>

            <div class="nav-right">
                <a href="#" class="user-profile">
                    <asp:Label ID="lblProfileName" runat="server" Text="Rahul V."></asp:Label>
                    <img src="https://images.unsplash.com/photo-1534528741775-53994a69daeb?auto=format&fit=crop&q=80&w=100" class="profile-img" alt="Profile" />
                </a>
            </div>
        </header>

        <div class="container">
            <div class="page-header">
                <h1 class="page-title">Backer Impact Dashboard</h1>
                <p class="page-subtitle">Track your community metrics, verified funding outcomes, and local job creations enabled through CrowdBridge backers in 2026.</p>
            </div>

            <div class="metrics-grid">
                <div class="metric-card">
                    <div class="metric-icon">👥</div>
                    <div class="metric-val">12,400+</div>
                    <div class="metric-lbl">Total Active Backers</div>
                </div>
                <div class="metric-card">
                    <div class="metric-icon">💰</div>
                    <div class="metric-val">₹4.8 Cr</div>
                    <div class="metric-lbl">Total Funds Deployed</div>
                </div>
                <div class="metric-card">
                    <div class="metric-icon">💼</div>
                    <div class="metric-val">185</div>
                    <div class="metric-lbl">Local Jobs Created</div>
                </div>
            </div>

            <h2 class="section-title">Verified Field Outcomes</h2>
            <div class="story-grid">
                <div class="story-card">
                    <div class="story-tag">AGRITECH &bull; PUNE</div>
                    <h3 class="story-title">Urban Hydroponic Farms</h3>
                    <p class="story-desc">Scaled 12 community vertical farms that yield 5,000 kg of pesticide-free vegetables per year for regional distribution.</p>
                </div>

                <div class="story-card">
                    <div class="story-tag">CLEANTECH &bull; DELHI</div>
                    <h3 class="story-title">Rural Cold Storage Units</h3>
                    <p class="story-desc">Installed solar-powered micro cold rooms reducing post-harvest crop loss by 40% across regional agricultural clusters.</p>
                </div>
            </div>
        </div>

        <footer class="footer">
            <div><span class="footer-brand">CrowdBridge</span> &nbsp;&bull;&nbsp; &copy; 2026 CrowdBridge. Built for impact.</div>
            <div>
                <asp:LinkButton ID="btnSignOut" runat="server" CssClass="footer-link" OnClick="btnSignOut_Click">Sign Out</asp:LinkButton>
            </div>
        </footer>
    </form>
</body>
</html>