<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ProjectDetails.aspx.cs" Inherits="CrowedBridge.Backers.ProjectDetails" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Project Details - CrowdBridge</title>
    <style>
        * { box-sizing: border-box; margin: 0; padding: 0; font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, Helvetica, Arial, sans-serif; }
        body { background-color: #F8F8F6; color: #333333; min-height: 100vh; display: flex; flex-direction: column; }

        /* Top Bar Navigation */
        .top-bar { background: #FFFFFF; border-bottom: 1px solid #EFEFEF; padding: 14px 64px; display: flex; justify-content: space-between; align-items: center; position: sticky; top: 0; z-index: 100; }
        .back-nav { font-size: 13px; font-weight: 700; color: #555555; text-decoration: none; display: flex; align-items: center; gap: 6px; }
        .back-nav:hover { color: #FA6400; }
        .brand-logo { font-size: 20px; font-weight: 800; color: #FA6400; text-decoration: none; }

        .container { max-width: 1140px; margin: 0 auto; padding: 32px 24px; width: 100%; flex-grow: 1; }

        .project-title { font-size: 34px; font-weight: 800; color: #111111; margin-bottom: 12px; }
        .meta-row { display: flex; align-items: center; gap: 16px; font-size: 13px; color: #555555; margin-bottom: 28px; }
        .creator-name { font-weight: 700; color: #111111; display: flex; align-items: center; gap: 6px; }
        .badge-verified { background: #E6F4EA; color: #137333; font-size: 10px; font-weight: 800; padding: 2px 8px; border-radius: 4px; text-transform: uppercase; }

        .main-layout { display: grid; grid-template-columns: 1fr 380px; gap: 32px; align-items: start; }

        /* Media Card */
        .media-card { position: relative; border-radius: 16px; overflow: hidden; height: 360px; box-shadow: 0 4px 16px rgba(0,0,0,0.04); margin-bottom: 28px; }
        .media-img { width: 100%; height: 100%; object-fit: cover; }
        .status-badge { position: absolute; top: 16px; left: 16px; background: #FFFFFF; color: #10B981; font-size: 12px; font-weight: 800; padding: 6px 14px; border-radius: 20px; box-shadow: 0 2px 8px rgba(0,0,0,0.1); }

        .tabs-bar { display: flex; gap: 28px; border-bottom: 1px solid #E5E7EB; margin-bottom: 24px; }
        .tab-item { font-size: 13px; font-weight: 700; color: #666666; padding-bottom: 12px; cursor: pointer; }
        .tab-item.active { color: #FA6400; border-bottom: 2px solid #FA6400; }

        .story-header { font-size: 22px; font-weight: 800; color: #111111; margin-bottom: 16px; }
        .story-body { font-size: 14px; color: #444444; line-height: 1.7; margin-bottom: 24px; }

        /* Sidebar Widgets */
        .sidebar-card { background: #FFFFFF; border: 1px solid #EFEFEF; border-radius: 16px; padding: 28px; box-shadow: 0 4px 16px rgba(0,0,0,0.03); margin-bottom: 28px; }
        .raised-amount { font-size: 32px; font-weight: 800; color: #111111; }
        .raised-subtext { font-size: 12px; color: #666666; margin-bottom: 16px; }
        .pct-text { float: right; color: #FA6400; font-weight: 800; font-size: 16px; }

        .progress-bar-bg { background: #E5E7EB; height: 8px; border-radius: 4px; overflow: hidden; margin-bottom: 20px; width: 100%; clear: both; }
        .progress-bar-fill { height: 100%; background: #FA6400; border-radius: 4px; }

        .stats-grid { display: grid; grid-template-columns: 1fr 1fr; gap: 16px; margin-bottom: 24px; }
        .stat-num { font-size: 20px; font-weight: 800; color: #111111; }
        .stat-lbl { font-size: 11px; font-weight: 700; color: #888888; text-transform: uppercase; }

        .btn-main-pledge { width: 100%; background: #FA6400; color: #FFFFFF; border: none; padding: 14px; border-radius: 10px; font-size: 14px; font-weight: 700; cursor: pointer; transition: background 0.2s; }
        .btn-main-pledge:hover { background: #E05800; }

        /* Reward Tiers */
        .sidebar-heading { font-size: 16px; font-weight: 800; color: #111111; margin-bottom: 16px; }
        .tier-card { background: #FFFFFF; border: 1px solid #EFEFEF; border-radius: 12px; padding: 20px; margin-bottom: 16px; position: relative; }
        .tier-price-text { font-size: 20px; font-weight: 800; color: #111111; margin-bottom: 4px; }
        .tier-title-text { font-size: 13px; font-weight: 700; color: #333333; margin-bottom: 8px; }
        .tier-desc-text { font-size: 12px; color: #666666; line-height: 1.5; margin-bottom: 16px; }

        .btn-select-tier { width: 100%; background: #FFFFFF; border: 1px solid #E2E8F0; color: #333333; font-size: 12px; font-weight: 700; padding: 10px; border-radius: 8px; cursor: pointer; transition: all 0.2s; }
        .btn-select-tier:hover { background: #FA6400; color: #FFFFFF; border-color: #FA6400; }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="top-bar">
            <a href="AuthenticatedHomepage.aspx" class="back-nav">&larr; Back to Backer Dashboard</a>
            <a href="AuthenticatedHomepage.aspx" class="brand-logo">CrowdBridge</a>
        </div>

        <div class="container">
            <h1 class="project-title"><asp:Label ID="lblTitle" runat="server"></asp:Label></h1>
            <div class="meta-row">
                <span class="creator-name">Rajesh Patel <span class="badge-verified">Verified Creator</span></span>
                <span>📍 <asp:Label ID="lblCity" runat="server"></asp:Label>, Maharashtra</span>
                <span>🏷️ <asp:Label ID="lblCategory" runat="server"></asp:Label></span>
            </div>

            <div class="main-layout">
                <div class="left-col">
                    <div class="media-card">
                        <asp:Image ID="imgBanner" runat="server" CssClass="media-img" />
                        <div class="status-badge"><asp:Label ID="lblPctBadge" runat="server"></asp:Label></div>
                    </div>

                    <div class="tabs-bar">
                        <span class="tab-item active">About Project</span>
                        <span class="tab-item">Budget Breakup</span>
                        <span class="tab-item">Updates & Field Logs</span>
                        <span class="tab-item">Backer Community</span>
                    </div>

                    <h2 class="story-header">The Story</h2>
                    <p class="story-body"><asp:Label ID="lblDescription" runat="server"></asp:Label></p>
                </div>

                <div class="right-col">
                    <div class="sidebar-card">
                        <div class="raised-amount">&#x20B9;<asp:Label ID="lblRaised" runat="server"></asp:Label></div>
                        <div class="raised-subtext">
                            Raised of &#x20B9;<asp:Label ID="lblGoal" runat="server"></asp:Label> Goal
                            <span class="pct-text"><asp:Label ID="lblPct" runat="server"></asp:Label></span>
                        </div>

                        <div class="progress-bar-bg">
                            <asp:Panel ID="pnlProgress" runat="server" CssClass="progress-bar-fill"></asp:Panel>
                        </div>

                        <div class="stats-grid">
                            <div>
                                <div class="stat-num">98</div>
                                <div class="stat-lbl">Backers</div>
                            </div>
                            <div>
                                <div class="stat-num"><asp:Label ID="lblDaysLeft" runat="server"></asp:Label></div>
                                <div class="stat-lbl">Days Left</div>
                            </div>
                        </div>

                        <asp:Button ID="btnBackProjectNow" runat="server" Text="Back This Project Now →" CssClass="btn-main-pledge" OnClick="btnBackProjectNow_Click" />
                    </div>

                    <h3 class="sidebar-heading">Select a Reward Tier</h3>

                    <div class="tier-card">
                        <div class="tier-price-text">&#x20B9;500</div>
                        <div class="tier-title-text">Supporter Tier</div>
                        <p class="tier-desc-text">Digital Certificate + Name on Project Wall.</p>
                        <asp:Button ID="btnTier1" runat="server" Text="Select Tier" CssClass="btn-select-tier" OnClick="btnTier1_Click" />
                    </div>

                    <div class="tier-card">
                        <div class="tier-price-text">&#x20B9;2,500</div>
                        <div class="tier-title-text">Early Bird Kit</div>
                        <p class="tier-desc-text">1 Innovation Unit + Mobile App Access.</p>
                        <asp:Button ID="btnTier2" runat="server" Text="Select Tier" CssClass="btn-select-tier" OnClick="btnTier2_Click" />
                    </div>
                </div>
            </div>
        </div>
    </form>
</body>
</html>