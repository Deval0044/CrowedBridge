<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Dashboard.aspx.cs" Inherits="CrowedBridge.Creator.Dashboard" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Creator Hub - CrowdBridge</title>
    <style>
        * { box-sizing: border-box; margin: 0; padding: 0; font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, Helvetica, Arial, sans-serif; }
        html, body, form { height: 100%; margin: 0; padding: 0; background-color: #F8F8F6; color: #333333; }

        /* Main Flex Container */
        .creator-layout { display: flex; min-height: 100vh; width: 100%; }

        /* Sidebar Navigation */
        .sidebar { width: 240px; background: #FFFFFF; border-right: 1px solid #EAEAEA; display: flex; flex-direction: column; justify-content: space-between; padding: 24px 16px; flex-shrink: 0; position: sticky; top: 0; height: 100vh; }
        .sidebar-brand { font-size: 20px; font-weight: 800; color: #FA6400; text-decoration: none; margin-bottom: 4px; display: block; }
        .sidebar-sub { font-size: 11px; color: #888888; font-weight: 600; margin-bottom: 32px; }

        .nav-menu { display: flex; flex-direction: column; gap: 8px; }
        .nav-item { display: flex; align-items: center; gap: 10px; padding: 10px 14px; border-radius: 8px; font-size: 13px; font-weight: 600; color: #555555; text-decoration: none; transition: all 0.2s; }
        .nav-item.active { background-color: #FA6400; color: #FFFFFF; }
        .nav-item:hover:not(.active) { background-color: #F3F4F6; color: #111111; }

        .btn-signout { background: none; border: none; color: #666666; font-size: 13px; font-weight: 600; cursor: pointer; text-align: left; padding: 10px 14px; width: 100%; border-radius: 8px; transition: background 0.2s; }
        .btn-signout:hover { background: #F3F4F6; color: #DC2626; }

        /* Main Workspace Content Area */
        .workspace { flex: 1; padding: 32px 48px; min-width: 0; }
        .top-row { display: flex; justify-content: space-between; align-items: center; margin-bottom: 24px; }
        .back-link { font-size: 13px; font-weight: 600; color: #666666; text-decoration: none; }
        .back-link:hover { color: #FA6400; }
        .btn-start-new { background-color: #FA6400; color: #FFFFFF; border: none; padding: 10px 20px; border-radius: 8px; font-size: 13px; font-weight: 700; text-decoration: none; cursor: pointer; display: inline-block; }

        .page-title { font-size: 28px; font-weight: 800; color: #111111; margin-bottom: 24px; }

        /* Dashboard Metrics */
        .overview-grid { display: grid; grid-template-columns: repeat(3, 1fr); gap: 20px; margin-bottom: 36px; }
        .metric-card { background: #FFFFFF; border: 1px solid #EFEFEF; border-radius: 12px; padding: 20px; box-shadow: 0px 2px 6px rgba(0, 0, 0, 0.015); }
        .metric-lbl { font-size: 12px; font-weight: 700; color: #666666; margin-bottom: 10px; }
        .metric-val { font-size: 28px; font-weight: 800; color: #111111; margin-bottom: 4px; }
        .metric-val.highlight { color: #FA6400; }
        .metric-sub { font-size: 11px; color: #10B981; font-weight: 600; }
        .metric-sub.neutral { color: #888888; }

        /* Campaign Table */
        .section-title { font-size: 18px; font-weight: 800; color: #111111; margin-bottom: 16px; }
        .table-card { background: #FFFFFF; border: 1px solid #EFEFEF; border-radius: 12px; overflow: hidden; box-shadow: 0px 2px 6px rgba(0, 0, 0, 0.015); }
        
        .campaign-table { width: 100%; border-collapse: collapse; text-align: left; }
        .campaign-table th { background: #F9FAFB; padding: 12px 20px; font-size: 11px; font-weight: 700; color: #666666; text-transform: uppercase; border-bottom: 1px solid #EFEFEF; }
        .campaign-table td { padding: 16px 20px; border-bottom: 1px solid #F3F4F6; font-size: 13px; vertical-align: middle; }
        .campaign-table tr:last-child td { border-bottom: none; }

        .project-cell { display: flex; align-items: center; gap: 12px; }
        .project-img { width: 44px; height: 44px; border-radius: 8px; object-fit: cover; background: #E5E7EB; }
        .project-name { font-weight: 700; color: #111111; font-size: 13px; }
        .project-cat { font-size: 11px; color: #777777; }

        .status-badge { font-size: 11px; font-weight: 700; padding: 4px 10px; border-radius: 12px; display: inline-block; }
        .status-badge.live { background: #ECFDF5; color: #059669; }
        .status-badge.pending { background: #FEF3C7; color: #D97706; }
        .status-badge.draft { background: #F3F4F6; color: #6B7280; }

        .progress-bar-bg { background: #E5E7EB; height: 6px; border-radius: 3px; width: 120px; margin-top: 6px; overflow: hidden; }
        .progress-bar-fill { background: #FA6400; height: 100%; }

        .action-link { color: #6B7280; text-decoration: none; font-weight: 700; font-size: 13px; margin-right: 12px; }
        .action-link:hover { color: #FA6400; }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="creator-layout">
            <!-- Sidebar -->
            <aside class="sidebar">
                <div>
                    <a href="Dashboard.aspx" class="sidebar-brand">Creator Hub</a>
                    <div class="sidebar-sub">Manage Campaigns</div>

                    <div class="nav-menu">
                        <a href="Dashboard.aspx" class="nav-item active">Hub Dashboard</a>
                        <a href="BuildReward.aspx" class="nav-item">Build Reward</a>
                        <a href="PledgesReceived.aspx" class="nav-item">Pledges Received</a>
                        <a href="Payouts.aspx" class="nav-item">Payouts</a>
                    </div>
                </div>

                <div>
                    <asp:Button ID="btnSignOut" runat="server" Text="Sign Out" CssClass="btn-signout" OnClick="btnSignOut_Click" CausesValidation="false" />
                </div>
            </aside>

            <!-- Main Workspace -->
            <main class="workspace">
                <div class="top-row">
                    <a href="../Backers/AuthenticatedHomepage.aspx" class="back-link">&larr; Back to Home</a>
                    <a href="CreateCampaign.aspx" class="btn-start-new">+ Start New Campaign</a>
                </div>

                <h1 class="page-title">Dashboard Overview</h1>

                <!-- Overview Metrics -->
                <div class="overview-grid">
                    <div class="metric-card">
                        <div class="metric-lbl">Total Raised</div>
                        <div class="metric-val highlight">&#x20B9;8,20,000</div>
                        <div class="metric-sub">+12% this month</div>
                    </div>

                    <div class="metric-card">
                        <div class="metric-lbl">Total Backers</div>
                        <div class="metric-val">142</div>
                        <div class="metric-sub neutral">Across 3 campaigns</div>
                    </div>

                    <div class="metric-card">
                        <div class="metric-lbl">Page Views</div>
                        <div class="metric-val">4.2K</div>
                        <div class="metric-sub neutral">Last 30 days</div>
                    </div>
                </div>

                <!-- Campaign List Table -->
                <h2 class="section-title">Your Campaigns</h2>
                <div class="table-card">
                    <table class="campaign-table">
                        <thead>
                            <tr>
                                <th>Project Name</th>
                                <th>Raised</th>
                                <th>Status</th>
                                <th>Actions</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>
                                    <div class="project-cell">
                                        <asp:Image ID="imgProj1" runat="server" ImageUrl="~/Images/2.jpg" CssClass="project-img" AlternateText="Rural Education Initiative" />
                                        <div>
                                            <div class="project-name">Rural Education Initiative</div>
                                            <div class="project-cat">Education in Bihar</div>
                                        </div>
                                    </div>
                                </td>
                                <td>
                                    <strong>&#x20B9;4,50,000</strong>
                                    <div class="progress-bar-bg"><div class="progress-bar-fill" style="width: 90%;"></div></div>
                                </td>
                                <td><span class="status-badge live">Live</span></td>
                                <td>
                                    <a href="EditCampaign.aspx?id=1" class="action-link">Edit</a>
                                </td>
                            </tr>

                            <tr>
                                <td>
                                    <div class="project-cell">
                                        <asp:Image ID="imgProj2" runat="server" ImageUrl="~/Images/7.jpg" CssClass="project-img" AlternateText="Clean Water Tech" />
                                        <div>
                                            <div class="project-name">Clean Water Tech</div>
                                            <div class="project-cat">Innovation Startup</div>
                                        </div>
                                    </div>
                                </td>
                                <td>
                                    <strong>&#x20B9;0</strong>
                                    <div class="progress-bar-bg"><div class="progress-bar-fill" style="width: 0%;"></div></div>
                                </td>
                                <td><span class="status-badge pending">Pending Approval</span></td>
                                <td>
                                    <a href="EditCampaign.aspx?id=2" class="action-link">Edit</a>
                                </td>
                            </tr>

                            <tr>
                                <td>
                                    <div class="project-cell">
                                        <asp:Image ID="imgProj3" runat="server" ImageUrl="~/Images/3.jpg" CssClass="project-img" AlternateText="Local Artisan Coop" />
                                        <div>
                                            <div class="project-name">Local Artisan Coop</div>
                                            <div class="project-cat">Crafts & Trade</div>
                                        </div>
                                    </div>
                                </td>
                                <td>&mdash;</td>
                                <td><span class="status-badge draft">Draft</span></td>
                                <td>
                                    <a href="EditCampaign.aspx?id=3" class="action-link">Edit</a>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </main>
        </div>
    </form>
</body>
</html>