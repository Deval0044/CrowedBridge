<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ProjectDetails.aspx.cs" Inherits="CrowedBridge.Backers.ProjectDetails" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Project Details - CrowdBridge</title>
    <style>
        * { box-sizing: border-box; margin: 0; padding: 0; font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, Helvetica, Arial, sans-serif; }
        body { background-color: #F8F8F6; color: #333333; min-height: 100vh; display: flex; flex-direction: column; }

        /* Top Navigation Header */
        .navbar { background-color: #FFFFFF; border-bottom: 1px solid #EAEAEA; padding: 12px 64px; display: flex; align-items: center; justify-content: space-between; position: sticky; top: 0; z-index: 100; }
        .nav-left { display: flex; align-items: center; gap: 20px; }
        .brand-logo { font-size: 22px; font-weight: 800; color: #FA6400; text-decoration: none; letter-spacing: -0.5px; }

        .back-btn { background: transparent; border: none; color: #555555; font-size: 13px; font-weight: 600; text-decoration: none; margin-bottom: 20px; display: inline-flex; align-items: center; gap: 6px; cursor: pointer; }
        .back-btn:hover { color: #FA6400; }

        .container { max-width: 1140px; margin: 0 auto; padding: 32px 24px; width: 100%; flex-grow: 1; }

        /* Header Info */
        .project-title { font-size: 34px; font-weight: 800; color: #111111; margin-bottom: 12px; letter-spacing: -0.5px; }
        .meta-row { display: flex; align-items: center; gap: 16px; font-size: 13px; color: #555555; margin-bottom: 28px; }
        .creator-name { font-weight: 700; color: #111111; display: flex; align-items: center; gap: 6px; }
        .author-avatar { width: 32px; height: 32px; border-radius: 50%; object-fit: cover; }
        .badge-verified { color: #10B981; font-size: 14px; font-weight: 700; }
        .location-badge { background: #EFEFEF; color: #555555; font-size: 12px; font-weight: 600; padding: 4px 10px; border-radius: 12px; display: inline-flex; align-items: center; gap: 4px; }

        /* Layout Grid */
        .main-layout { display: grid; grid-template-columns: 1fr 380px; gap: 32px; align-items: start; }

        /* Banner Container */
        .banner-container { position: relative; border-radius: 16px; overflow: hidden; height: 380px; box-shadow: 0 4px 16px rgba(0,0,0,0.04); }
        .banner-img { width: 100%; height: 100%; object-fit: cover; }
        .funded-badge { position: absolute; top: 16px; left: 16px; background-color: #10B981; color: #FFFFFF; padding: 6px 14px; border-radius: 20px; font-size: 12px; font-weight: 700; }
        .urgent-badge { position: absolute; top: 16px; left: 16px; background-color: #FA6400; color: #FFFFFF; padding: 6px 14px; border-radius: 20px; font-size: 12px; font-weight: 700; }

        /* Interactive Tabs */
        .content-tabs { display: flex; gap: 28px; border-bottom: 1px solid #E5E7EB; margin-top: 32px; margin-bottom: 24px; }
        .tab-item { background: none; border: none; font-size: 14px; font-weight: 700; color: #666666; padding-bottom: 12px; cursor: pointer; position: relative; }
        .tab-item.active { color: #FA6400; }
        .tab-item.active::after { content: ""; position: absolute; bottom: -1px; left: 0; right: 0; height: 2px; background: #FA6400; }

        .tab-content { display: none; }
        .tab-content.active { display: block; }

        .details-card { background: #FFFFFF; border: 1px solid #EFEFEF; border-radius: 16px; padding: 32px; margin-bottom: 24px; box-shadow: 0px 2px 8px rgba(0, 0, 0, 0.02); }
        .about-text { font-size: 14px; line-height: 1.7; color: #444444; margin-bottom: 16px; }

        /* Impact Metrics Grid */
        .impact-grid { display: grid; grid-template-columns: 1fr 1fr; gap: 20px; margin-bottom: 32px; }
        .impact-card { background: #FFFFFF; border: 1px solid #EFEFEF; border-radius: 16px; padding: 24px; text-align: center; box-shadow: 0px 2px 8px rgba(0, 0, 0, 0.02); }
        .impact-value { font-size: 24px; font-weight: 800; color: #111111; margin-bottom: 2px; }
        .impact-label { font-size: 11px; font-weight: 600; color: #777777; text-transform: uppercase; }

        /* Right Sidebar Card */
        .funding-summary-card { background: #FFFFFF; border: 1px solid #EFEFEF; border-radius: 16px; padding: 32px; box-shadow: 0 4px 16px rgba(0,0,0,0.03); margin-bottom: 32px; }
        .amount-raised { font-size: 32px; font-weight: 800; color: #FA6400; margin-bottom: 4px; }
        .goal-label { font-size: 13px; color: #666666; margin-bottom: 20px; font-weight: 500; }

        .progress-bar-bg { background: #E5E7EB; height: 8px; border-radius: 4px; overflow: hidden; margin-bottom: 24px; width: 100%; }
        .progress-bar-fill { height: 100%; background: #FA6400; border-radius: 4px; }
        .progress-bar-fill.funded { background: #10B981; }

        .stats-row { display: flex; gap: 48px; margin-bottom: 24px; }
        .stat-value { font-size: 22px; font-weight: 800; color: #111111; }
        .stat-label { font-size: 12px; color: #777777; font-weight: 500; }

        /* Custom Pledge Form with ASP.NET Validators */
        .pledge-box { background: #FFF3EB; border: 1px solid #FFD8BF; padding: 20px; border-radius: 12px; margin-bottom: 20px; }
        .pledge-title { font-size: 13px; font-weight: 700; color: #D44000; margin-bottom: 10px; }
        .input-group { display: flex; gap: 8px; }
        .amount-input { flex-grow: 1; border: 1px solid #E2E8F0; padding: 10px 12px; border-radius: 8px; font-size: 14px; outline: none; font-weight: 700; }
        .btn-fund-now { background: #FA6400; color: #FFFFFF; border: none; font-size: 13px; font-weight: 700; padding: 10px 18px; border-radius: 8px; cursor: pointer; transition: background 0.2s; }
        .btn-fund-now:hover { background: #E05800; }
        
        .validator-msg { color: #DC2626; font-size: 12px; font-weight: 600; margin-top: 6px; display: block; }

        /* Reward Tiers */
        .tiers-heading { font-size: 18px; font-weight: 800; color: #111111; margin-bottom: 16px; }
        .reward-tier-card { background: #FFFFFF; border: 1px solid #EFEFEF; border-radius: 12px; padding: 20px; margin-bottom: 16px; position: relative; box-shadow: 0px 2px 8px rgba(0, 0, 0, 0.02); }
        .tier-header { display: flex; justify-content: space-between; align-items: center; margin-bottom: 8px; border-bottom: 1px solid #F3F4F6; padding-bottom: 8px; }
        .tier-title { font-size: 13px; font-weight: 700; color: #333333; }
        .tier-amount { font-size: 18px; font-weight: 800; color: #FA6400; }
        .tier-desc { font-size: 12px; color: #666666; line-height: 1.5; margin-bottom: 14px; }
        
        .btn-select-tier { width: 100%; background: #FFFFFF; border: 1px solid #FA6400; color: #FA6400; font-size: 12px; font-weight: 700; padding: 10px; border-radius: 6px; cursor: pointer; transition: all 0.2s; }
        .btn-select-tier:hover { background: #FA6400; color: #FFFFFF; }

        .popular-badge { position: absolute; top: -10px; right: 16px; background: #FA6400; color: #FFFFFF; font-size: 10px; font-weight: 800; padding: 2px 8px; border-radius: 4px; text-transform: uppercase; }

        /* Footer */
        .site-footer { background: #FFFFFF; border-top: 1px solid #EFEFEF; padding: 32px 48px; display: flex; justify-content: space-between; align-items: center; margin-top: 48px; }
        .brand-name { font-size: 18px; font-weight: 800; color: #FA6400; margin-bottom: 4px; }
        .copyright { font-size: 12px; color: #666666; }
        .footer-links { display: flex; gap: 24px; }
        .footer-link { text-decoration: none; color: #555555; font-size: 13px; font-weight: 500; }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <!-- Top Navbar Header -->
        <header class="navbar">
            <div class="nav-left">
                <a href="AuthenticatedHomepage.aspx" class="brand-logo">CrowdBridge</a>
            </div>
        </header>

        <div class="container">
            <a href="AuthenticatedHomepage.aspx" class="back-btn">&larr; Back to Backer Dashboard</a>

            <!-- Header Title and Creator Meta -->
            <div class="project-header">
                <h1 class="project-title"><asp:Label ID="lblTitle" runat="server"></asp:Label></h1>
                <div class="meta-row">
                    <img src="https://images.unsplash.com/photo-1494790108377-be9c29b29330?w=100" class="author-avatar" alt="Author Avatar" />
                    <span class="creator-name"><asp:Label ID="lblCreatorName" runat="server" Text="Ananya Sharma"></asp:Label> <span class="badge-verified">v</span></span>
                    <span class="location-badge"><asp:Label ID="lblCity" runat="server"></asp:Label>, India</span>
                </div>
            </div>

            <!-- Main Layout Grid -->
            <div class="main-layout">
                <!-- Left Column -->
                <div class="left-col">
                    <div class="banner-container">
                        <asp:Image ID="imgBanner" runat="server" CssClass="banner-img" />
                        <asp:Label ID="lblBadge" runat="server" CssClass="funded-badge"></asp:Label>
                    </div>

                    <!-- Interactive Content Tabs -->
                    <div class="content-tabs">
                        <button type="button" class="tab-item active" onclick="switchTab(event, 'tabAbout')">About Project</button>
                        <button type="button" class="tab-item" onclick="switchTab(event, 'tabBudget')">Budget Breakup</button>
                        <button type="button" class="tab-item" onclick="switchTab(event, 'tabUpdates')">Updates & Field Logs</button>
                        <button type="button" class="tab-item" onclick="switchTab(event, 'tabCommunity')">Backer Community</button>
                    </div>

                    <!-- Tab Panel 1: About Project -->
                    <div id="tabAbout" class="tab-content active">
                        <div class="details-card">
                            <p class="about-text"><asp:Label ID="lblDescription" runat="server"></asp:Label></p>
                            <p class="about-text">By supporting this initiative on CrowdBridge, you are directly contributing to vetted field expansion, local employment generation, and sustainable community advancement. Track live progress directly through our backer dashboard.</p>
                        </div>
                    </div>

                    <!-- Tab Panel 2: Budget Breakup -->
                    <div id="tabBudget" class="tab-content">
                        <div class="details-card">
                            <h3 style="font-size: 16px; font-weight: 700; margin-bottom: 12px; color: #111111;">Fund Allocation Breakup</h3>
                            <ul style="padding-left: 20px; font-size: 13px; color: #555555; line-height: 1.8;">
                                <li><strong>60%</strong> - Hardware Procurement & Deployment</li>
                                <li><strong>25%</strong> - Field Engineering & Installation</li>
                                <li><strong>10%</strong> - Community Training & Onboarding</li>
                                <li><strong>5%</strong> - Platform & Maintenance Reserve</li>
                            </ul>
                        </div>
                    </div>

                    <!-- Tab Panel 3: Updates & Field Logs -->
                    <div id="tabUpdates" class="tab-content">
                        <div class="details-card">
                            <h3 style="font-size: 16px; font-weight: 700; margin-bottom: 12px; color: #111111;">Latest Field Log</h3>
                            <p class="about-text"><strong>October 2026 Update:</strong> Site survey completed across primary target clusters. Initial field hardware assembly is underway.</p>
                        </div>
                    </div>

                    <!-- Tab Panel 4: Backer Community -->
                    <div id="tabCommunity" class="tab-content">
                        <div class="details-card">
                            <h3 style="font-size: 16px; font-weight: 700; margin-bottom: 12px; color: #111111;">Backer Discussions</h3>
                            <p class="about-text">Join the community discussion and interact with campaign creators once your pledge is submitted.</p>
                        </div>
                    </div>

                    <!-- Dynamic Impact Metrics -->
                    <div class="impact-grid">
                        <div class="impact-card">
                            <div class="impact-value"><asp:Label ID="lblMetric1Val" runat="server" Text="5,000 kg"></asp:Label></div>
                            <div class="impact-label"><asp:Label ID="lblMetric1Lbl" runat="server" Text="Yield per year"></asp:Label></div>
                        </div>
                        <div class="impact-card">
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

                        <!-- Pledge Amount Entry with ASP.NET Server Controls -->
                        <div class="pledge-box">
                            <div class="pledge-title">Selected Pledge Amount (₹)</div>
                            <div class="input-group">
                                <asp:TextBox ID="txtPledgeAmount" runat="server" CssClass="amount-input" Text="500"></asp:TextBox>
                                <asp:Button ID="btnBackProject" runat="server" Text="Fund Now" CssClass="btn-fund-now" OnClick="btnBackProject_Click" ValidationGroup="PledgeGroup" />
                            </div>

                            <asp:RequiredFieldValidator ID="rfvPledge" runat="server" 
                                ControlToValidate="txtPledgeAmount" 
                                ErrorMessage="Please enter a funding amount." 
                                CssClass="validator-msg" Display="Dynamic" ValidationGroup="PledgeGroup">
                            </asp:RequiredFieldValidator>

                            <asp:RangeValidator ID="rvPledge" runat="server" 
                                ControlToValidate="txtPledgeAmount" 
                                Type="Integer" MinimumValue="100" MaximumValue="1000000" 
                                ErrorMessage="Minimum funding pledge is ₹100." 
                                CssClass="validator-msg" Display="Dynamic" ValidationGroup="PledgeGroup">
                            </asp:RangeValidator>
                        </div>
                    </div>

                    <!-- Interactive Reward Tiers Section -->
                    <h3 class="tiers-heading">Select a Reward Tier</h3>

                    <div class="reward-tier-card">
                        <div class="tier-header">
                            <span class="tier-title">Supporter Tier</span>
                            <span class="tier-amount">&#x20B9;500</span>
                        </div>
                        <p class="tier-desc">Digital Certificate + Name on Project Wall</p>
                        <asp:Button ID="btnTier500" runat="server" Text="Select Tier (₹500)" CssClass="btn-select-tier" OnClick="btnTier500_Click" CausesValidation="false" />
                    </div>

                    <div class="reward-tier-card">
                        <div class="tier-header">
                            <span class="tier-title">Pioneer Tier</span>
                            <span class="tier-amount">&#x20B9;2,500</span>
                        </div>
                        <p class="tier-desc">Early Access Field Kit + Monthly Progress Updates & Newsletter</p>
                        <asp:Button ID="btnTier2500" runat="server" Text="Select Tier (₹2,500)" CssClass="btn-select-tier" OnClick="btnTier2500_Click" CausesValidation="false" />
                    </div>

                    <div class="reward-tier-card">
                        <span class="popular-badge">Popular</span>
                        <div class="tier-header">
                            <span class="tier-title">Sponsor Tier</span>
                            <span class="tier-amount">&#x20B9;10,000</span>
                        </div>
                        <p class="tier-desc">1 Starter Innovation Kit + VIP On-Site Tour & Founder Session</p>
                        <asp:Button ID="btnTier10000" runat="server" Text="Select Tier (₹10,000)" CssClass="btn-select-tier" OnClick="btnTier10000_Click" CausesValidation="false" />
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

    <script type="text/javascript">
function switchTab(evt, tabId) {
    evt.preventDefault();
    var buttons = document.getElementsByClassName("tab-item");
    for (var i = 0; i < buttons.length; i++) {
        buttons[i].classList.remove("active");
    }
    var contents = document.getElementsByClassName("tab-content");
    for (var j = 0; j < contents.length; j++) {
        contents[j].classList.remove("active");
    }
    evt.currentTarget.classList.add("active");
    document.getElementById(tabId).classList.add("active");
        }
    </script>
</body>
</html>