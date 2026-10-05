<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AuthenticatedHomepage.aspx.cs" Inherits="CrowedBridge.Backers.AuthenticatedHomepage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Dashboard - CrowdBridge</title>
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

        /* Navbar */
        .navbar { 
            background: #FFFFFF; 
            padding: 12px 40px; 
            display: flex; 
            align-items: center; 
            justify-content: space-between; 
            border-bottom: 1px solid #EFEFEF; 
        }

        .logo { 
            font-size: 20px; 
            font-weight: 800; 
            color: #FA6400; 
            text-decoration: none; 
        }

        .search-bar { 
            background: #F1F5F9; 
            border: none; 
            padding: 8px 16px; 
            border-radius: 20px; 
            width: 220px; 
            font-size: 13px; 
            outline: none; 
        }

        .nav-links { 
            display: flex; 
            align-items: center; 
            gap: 20px; 
            font-size: 14px; 
            font-weight: 500; 
        }

        .nav-links a { 
            text-decoration: none; 
            color: #555555; 
        }

        .nav-links a.active { 
            color: #FA6400; 
            font-weight: 700; 
        }

        .btn-start { 
            background: #FA6400; 
            color: #FFFFFF !important; 
            padding: 8px 16px; 
            border-radius: 6px; 
            font-weight: 600; 
            font-size: 13px; 
        }

        .user-profile { 
            display: flex; 
            align-items: center; 
            gap: 8px; 
            font-weight: 600; 
            font-size: 14px; 
        }

        .avatar { 
            width: 32px; 
            height: 32px; 
            border-radius: 50%; 
            object-fit: cover; 
        }

        /* Main Container */
        .container { 
            max-width: 1100px; 
            margin: 30px auto; 
            padding: 0 20px; 
        }

        /* Welcome Banner */
        .welcome-card { 
            background: #FFFFFF; 
            border-radius: 12px; 
            padding: 24px; 
            display: flex; 
            justify-content: space-between; 
            align-items: center; 
            border: 1px solid #EFEFEF; 
            margin-bottom: 32px; 
            box-shadow: 0px 2px 8px rgba(0,0,0,0.015);
        }

        .welcome-title { 
            font-size: 22px; 
            font-weight: 800; 
            margin-bottom: 6px; 
        }

        .welcome-sub { 
            font-size: 13px; 
            color: #666666; 
        }

        .pills { 
            display: flex; 
            gap: 8px; 
            flex-wrap: wrap; 
        }

        .pill { 
            background: #F1F5F9; 
            border: none; 
            padding: 6px 12px; 
            border-radius: 16px; 
            font-size: 11px; 
            font-weight: 600; 
            color: #555555; 
            cursor: pointer; 
        }

        .pill.active { 
            background: #FFE8D6; 
            color: #D95300; 
        }

        /* Section Header */
        .section-header { 
            display: flex; 
            justify-content: space-between; 
            align-items: center; 
            margin-bottom: 16px; 
        }

        .section-title { 
            font-size: 18px; 
            font-weight: 700; 
            color: #111111; 
        }

        .view-all { 
            font-size: 13px; 
            color: #FA6400; 
            text-decoration: none; 
            font-weight: 600; 
        }

        /* Grids */
        .grid-2 { 
            display: grid; 
            grid-template-columns: 1fr 1fr; 
            gap: 20px; 
            margin-bottom: 36px; 
        }

        .grid-3 { 
            display: grid; 
            grid-template-columns: repeat(3, 1fr); 
            gap: 20px; 
            margin-bottom: 36px; 
        }

        /* Cards */
        .card { 
            background: #FFFFFF; 
            border-radius: 12px; 
            border: 1px solid #EFEFEF; 
            overflow: hidden; 
            padding: 16px; 
            box-shadow: 0px 2px 8px rgba(0,0,0,0.015);
        }

        .card-horizontal { 
            display: flex; 
            gap: 16px; 
        }

        .card-horizontal img { 
            width: 120px; 
            height: 90px; 
            border-radius: 8px; 
            object-fit: cover; 
        }

        .card-content { 
            flex: 1; 
            display: flex; 
            flex-direction: column; 
            justify-content: space-between; 
        }

        .badge { 
            font-size: 11px; 
            font-weight: 700; 
            padding: 3px 8px; 
            border-radius: 10px; 
            background: #D1FAE5; 
            color: #059669; 
        }

        .badge-urgent { 
            background: #FEE2E2; 
            color: #DC2626; 
        }

        .progress-bg { 
            background: #E5E7EB; 
            height: 6px; 
            border-radius: 3px; 
            margin: 10px 0 6px; 
        }

        .progress-fill { 
            background: #FA6400; 
            height: 100%; 
            border-radius: 3px; 
        }

        .btn-update { 
            display: block; 
            width: 100%; 
            text-align: center; 
            padding: 8px; 
            border: 1px solid #E2E8F0; 
            background: #FFFFFF; 
            border-radius: 6px; 
            font-size: 12px; 
            font-weight: 600; 
            cursor: pointer; 
            margin-top: 10px; 
            color: #333333; 
        }

        /* Recommendation Vertical Cards */
        .card-vertical { 
            padding: 0; 
        }

        .card-vertical img { 
            width: 100%; 
            height: 150px; 
            object-fit: cover; 
        }

        .card-body { 
            padding: 16px; 
        }

        .category { 
            font-size: 10px; 
            font-weight: 700; 
            color: #FA6400; 
            text-transform: uppercase; 
            margin-bottom: 4px; 
        }

        .card-vertical h4 { 
            font-size: 15px; 
            font-weight: 700; 
            margin-bottom: 12px; 
        }

        .raised-text { 
            font-size: 11px; 
            font-weight: 600; 
            color: #666666; 
            margin-top: 6px; 
        }

        /* Impact Section */
        .impact-card { 
            background: #FFFFFF; 
            border-radius: 12px; 
            border: 1px solid #EFEFEF; 
            padding: 32px; 
            text-align: center; 
            margin-bottom: 40px; 
            box-shadow: 0px 2px 8px rgba(0,0,0,0.015);
        }

        .impact-title { 
            font-size: 20px; 
            font-weight: 800; 
            margin-bottom: 24px; 
        }

        .impact-stats { 
            display: flex; 
            justify-content: space-around; 
        }

        .stat-num { 
            font-size: 26px; 
            font-weight: 800; 
            color: #111111; 
            margin-top: 8px; 
        }

        .stat-label { 
            font-size: 11px; 
            font-weight: 700; 
            color: #888888; 
            text-transform: uppercase; 
            margin-top: 4px; 
        }

        /* Footer */
        .footer { 
            display: flex; 
            justify-content: space-between; 
            align-items: center; 
            padding-top: 20px; 
            border-top: 1px solid #EFEFEF; 
            font-size: 12px; 
            color: #777777; 
        }

        .footer-links a { 
            color: #555555; 
            text-decoration: none; 
            margin-left: 12px; 
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <!-- Top Navbar -->
        <nav class="navbar">
            <a href="AuthenticatedHomepage.aspx" class="logo">CrowdBridge</a>
            <asp:TextBox ID="txtSearch" runat="server" CssClass="search-bar" Placeholder="Search campaigns..."></asp:TextBox>
            <div class="nav-links">
                <a href="#" class="active">Explore</a>
                <a href="#">Impact</a>
                <a href="#">📍 Pune, Maharashtra</a>
                <a href="#" class="btn-start">+ Start a Project</a>
                <div class="user-profile">
                    <img src="https://images.unsplash.com/photo-1534528741775-53994a69daeb?auto=format&fit=crop&q=80&w=100" alt="Rahul V." class="avatar" />
                    <span>Rahul V.</span>
                </div>
            </div>
        </nav>

        <div class="container">
            <!-- Welcome Banner -->
            <div class="welcome-card">
                <div>
                    <h2 class="welcome-title">Welcome back, Rahul! 👋</h2>
                    <p class="welcome-sub">You have backed 4 projects and helped raise &#x20B9;14,500 for local innovations.</p>
                </div>
                <div class="pills">
                    <button type="button" class="pill">Browse AgriTech</button>
                    <button type="button" class="pill">Recommended for You</button>
                    <button type="button" class="pill">Projects Ending Soon</button>
                    <button type="button" class="pill active">📍 Local to Pune</button>
                </div>
            </div>

            <!-- Projects You Support -->
            <div class="section-header">
                <h3 class="section-title">Projects You Support</h3>
                <a href="ProjectSearch.aspx" class="view-all">View All (4) &rarr;</a>
            </div>

            <div class="grid-2">
                <!-- Supported Item 1 -->
                <div class="card card-horizontal">
                    <img src="https://images.unsplash.com/photo-1530836369250-ef72a3f5cda8?auto=format&fit=crop&q=80&w=200" alt="Urban Oasis Hydroponics" />
                    <div class="card-content">
                        <div style="display:flex; justify-content:space-between; align-items:flex-start;">
                            <div>
                                <h4 style="font-size:14px;">Urban Oasis Hydroponics</h4>
                                <div style="font-size:11px; color:#666; margin-top:2px;">Status: 15 Days Left</div>
                            </div>
                            <span class="badge">126% Funded</span>
                        </div>
                        <div class="progress-bg"><div class="progress-fill" style="width:100%;"></div></div>
                        <button type="button" class="btn-update">View Recent Update</button>
                    </div>
                </div>

                <!-- Supported Item 2 -->
                <div class="card card-horizontal">
                    <img src="https://images.unsplash.com/photo-1508873696983-2df515122519?auto=format&fit=crop&q=80&w=200" alt="Solar Cold Storage" />
                    <div class="card-content">
                        <div style="display:flex; justify-content:space-between; align-items:flex-start;">
                            <div>
                                <h4 style="font-size:14px;">Solar Cold Storage</h4>
                                <div style="font-size:11px; color:#666; margin-top:2px;">Status: 8 Days Left (Urgent)</div>
                            </div>
                            <span class="badge badge-urgent">85% Funded</span>
                        </div>
                        <div class="progress-bg"><div class="progress-fill" style="width:85%;"></div></div>
                        <button type="button" class="btn-update">View Recent Update</button>
                    </div>
                </div>
            </div>

            <!-- Recommended Campaigns -->
            <div class="section-header">
                <h3 class="section-title">Recommended Campaigns Based on Your Interests</h3>
            </div>

            <div class="grid-3">
                <!-- Card 1 -->
                <div class="card card-vertical">
                    <img src="https://images.unsplash.com/photo-1509062522246-3755977927d7?auto=format&fit=crop&q=80&w=300" alt="Smart Irrigation" />
                    <div class="card-body">
                        <div class="category">AGRITECH &bull; NASHIK</div>
                        <h4>Smart Irrigation Sensors</h4>
                        <div class="progress-bg"><div class="progress-fill" style="width:90%;"></div></div>
                        <div class="raised-text">Raised &#x20B9;4.5L of &#x20B9;5.0L</div>
                        <button type="button" class="btn-update" style="margin-top:12px;">View Details</button>
                    </div>
                </div>

                <!-- Card 2 -->
                <div class="card card-vertical">
                    <img src="https://images.unsplash.com/photo-1508873696983-2df515122519?auto=format&fit=crop&q=80&w=300" alt="Eco Straws" />
                    <div class="card-body">
                        <div class="category">CLEANTECH &bull; KERALA</div>
                        <h4>Eco Straws from Coconut Leaves</h4>
                        <div class="progress-bg"><div class="progress-fill" style="width:70%;"></div></div>
                        <div class="raised-text">Raised &#x20B9;2.2L of &#x20B9;3.0L</div>
                        <button type="button" class="btn-update" style="margin-top:12px;">View Details</button>
                    </div>
                </div>

                <!-- Card 3 -->
                <div class="card card-vertical">
                    <img src="https://images.unsplash.com/photo-1593113598332-cd288d649433?auto=format&fit=crop&q=80&w=300" alt="Handmade Pottery Collective" />
                    <div class="card-body">
                        <div class="category">ARTISANS &bull; JAIPUR</div>
                        <h4>Handmade Pottery Collective</h4>
                        <div class="progress-bg"><div class="progress-fill" style="width:90%;"></div></div>
                        <div class="raised-text">Raised &#x20B9;1.8L of &#x20B9;2.0L</div>
                        <button type="button" class="btn-update" style="margin-top:12px;">View Details</button>
                    </div>
                </div>
            </div>

            <!-- Impact Section -->
            <div class="impact-card">
                <h3 class="impact-title">Your Collective Community Impact in 2026</h3>
                <div class="impact-stats">
                    <div>
                        <div style="font-size:20px;">👥</div>
                        <div class="stat-num">12,400+</div>
                        <div class="stat-label">Total Backers</div>
                    </div>
                    <div>
                        <div style="font-size:20px;">💳</div>
                        <div class="stat-num">&#x20B9;4.8 Cr</div>
                        <div class="stat-label">Funds Raised</div>
                    </div>
                    <div>
                        <div style="font-size:20px;">💼</div>
                        <div class="stat-num">185</div>
                        <div class="stat-label">Local Jobs Created</div>
                    </div>
                </div>
            </div>

            <!-- Footer -->
            <footer class="footer">
                <div><strong>CrowdBridge</strong><br />&copy; 2024 CrowdBridge. Built for impact.</div>
                <div class="footer-links">
                    <a href="#">Help Center</a>
                    <a href="#">Creator Knowledge Base</a>
                    <a href="#">Contact</a>
                    <a href="#">Sign Out</a>
                </div>
            </footer>
        </div>
    </form>
</body>
</html>