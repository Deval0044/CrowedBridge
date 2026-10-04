<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="CrowdBridge.Default" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>CrowdBridge - Fund Grassroots Indian Innovations</title>
    <style>
        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
            font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, Helvetica, Arial, sans-serif;
        }

        body {
            background-color: #FAFAFA;
            color: #333333;
        }

        /* Navigation Header */
        .navbar {
            background-color: #FFFFFF;
            border-bottom: 1px solid #EFEFEF;
            padding: 16px 48px;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .nav-left {
            display: flex;
            align-items: center;
            gap: 32px;
        }

        .brand-logo {
            font-size: 20px;
            font-weight: 800;
            color: #E65100;
            text-decoration: none;
        }

        .nav-links {
            display: flex;
            gap: 24px;
            list-style: none;
        }

        .nav-links a {
            text-decoration: none;
            color: #555555;
            font-size: 14px;
            font-weight: 500;
        }

        .nav-right {
            display: flex;
            align-items: center;
            gap: 16px;
        }

        .search-container {
            position: relative;
        }

        .search-container input {
            padding: 8px 12px 8px 32px;
            border-radius: 6px;
            border: 1px solid #E2E8F0;
            background: #F8FAFC;
            font-size: 13px;
            outline: none;
            width: 220px;
        }

        .search-icon {
            position: absolute;
            left: 10px;
            top: 50%;
            transform: translateY(-50%);
            width: 14px;
            height: 14px;
            stroke: #94A3B8;
        }

        .btn-signin {
            background-color: #FA6400;
            color: #FFFFFF;
            border: none;
            padding: 8px 20px;
            border-radius: 6px;
            font-size: 13px;
            font-weight: 600;
            cursor: pointer;
        }

        /* Hero Banner */
        .hero-banner {
            background: linear-gradient(135deg, #FF6F00 0%, #FA6400 100%);
            padding: 60px 48px;
            position: relative;
            min-height: 420px;
            display: flex;
            align-items: center;
        }

        .hero-container {
            max-width: 1200px;
            margin: 0 auto;
            width: 100%;
            display: flex;
            align-items: center;
            justify-content: space-between;
            position: relative;
        }

        .hero-card {
            background: #FFFFFF;
            border-radius: 16px;
            padding: 40px;
            max-width: 520px;
            box-shadow: 0 10px 25px rgba(0,0,0,0.08);
            z-index: 2;
        }

        .hero-title {
            font-size: 36px;
            font-weight: 800;
            color: #111111;
            line-height: 1.2;
            margin-bottom: 16px;
        }

        .hero-desc {
            font-size: 14px;
            color: #666666;
            line-height: 1.6;
            margin-bottom: 28px;
        }

        .hero-buttons {
            display: flex;
            gap: 12px;
        }

        .btn-hero-primary {
            background-color: #FA6400;
            color: #FFFFFF;
            border: none;
            padding: 12px 24px;
            border-radius: 8px;
            font-size: 13px;
            font-weight: 600;
            cursor: pointer;
        }

        .btn-hero-secondary {
            background-color: #FFFFFF;
            color: #333333;
            border: 1px solid #E2E8F0;
            padding: 12px 24px;
            border-radius: 8px;
            font-size: 13px;
            font-weight: 600;
            cursor: pointer;
        }

        .hero-illustration {
            width: 550px;
            border-radius: 12px;
            object-fit: cover;
        }

        /* Main Content Section */
        .content-container {
            max-width: 1200px;
            margin: 48px auto;
            padding: 0 24px;
        }

        .section-header {
            display: flex;
            justify-content: space-between;
            align-items: flex-end;
            margin-bottom: 24px;
        }

        .section-title {
            font-size: 24px;
            font-weight: 800;
            color: #111111;
            margin-bottom: 6px;
        }

        .section-subtitle {
            font-size: 14px;
            color: #666666;
        }

        .view-all-link {
            color: #FA6400;
            font-size: 13px;
            font-weight: 600;
            text-decoration: none;
        }

        /* Project Cards Grid */
        .projects-grid {
            display: grid;
            grid-template-columns: repeat(3, 1fr);
            gap: 24px;
        }

        .project-card {
            background: #FFFFFF;
            border: 1px solid #EFEFEF;
            border-radius: 12px;
            overflow: hidden;
            box-shadow: 0px 2px 8px rgba(0,0,0,0.03);
            display: flex;
            flex-direction: column;
        }

        .card-img-wrapper {
            position: relative;
            height: 180px;
            width: 100%;
        }

        .card-img {
            width: 100%;
            height: 100%;
            object-fit: cover;
        }

        .status-badge {
            position: absolute;
            top: 12px;
            right: 12px;
            padding: 4px 10px;
            border-radius: 12px;
            font-size: 11px;
            font-weight: 600;
            color: #FFFFFF;
        }

        .badge-trending {
            background: #FA6400;
        }

        .badge-funded {
            background: #10B981;
        }

        .card-body {
            padding: 20px;
            flex-grow: 1;
            display: flex;
            flex-direction: column;
        }

        .category-tag {
            font-size: 11px;
            font-weight: 700;
            color: #FA6400;
            text-transform: uppercase;
            letter-spacing: 0.5px;
            margin-bottom: 6px;
        }

        .project-title {
            font-size: 18px;
            font-weight: 700;
            color: #111111;
            margin-bottom: 8px;
        }

        .project-desc {
            font-size: 13px;
            color: #666666;
            line-height: 1.5;
            margin-bottom: 20px;
        }

        .progress-meta {
            display: flex;
            justify-content: space-between;
            font-size: 12px;
            font-weight: 600;
            margin-bottom: 8px;
        }

        .raised-amount {
            color: #10B981;
        }

        .goal-amount {
            color: #777777;
        }

        .progress-bar-bg {
            background: #E5E7EB;
            height: 6px;
            border-radius: 3px;
            overflow: hidden;
            margin-bottom: 20px;
        }

        .progress-bar-fill {
            height: 100%;
            background: #FA6400;
            border-radius: 3px;
        }

        .progress-bar-fill.complete {
            background: #10B981;
        }

        .card-footer {
            display: flex;
            justify-content: space-between;
            align-items: center;
            font-size: 12px;
            color: #666666;
            padding-top: 12px;
            border-top: 1px solid #F4F4F2;
            margin-top: auto;
        }

        .action-link {
            color: #FA6400;
            font-weight: 700;
            text-decoration: none;
        }

        .action-closed {
            color: #888888;
            font-weight: 600;
        }

        /* Footer */
        .footer {
            background-color: #FFFFFF;
            border-top: 1px solid #EFEFEF;
            padding: 32px 48px;
            margin-top: 60px;
            display: flex;
            justify-content: space-between;
            align-items: flex-start;
        }

        .footer-brand {
            font-size: 18px;
            font-weight: 800;
            color: #FA6400;
            margin-bottom: 8px;
        }

        .footer-sub {
            font-size: 12px;
            color: #777777;
            margin-bottom: 12px;
        }

        .copyright {
            font-size: 11px;
            color: #999999;
        }

        .footer-links {
            display: flex;
            flex-direction: column;
            gap: 8px;
            align-items: flex-end;
        }

        .footer-links a {
            text-decoration: none;
            font-size: 13px;
            color: #555555;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <!-- Top Header Navigation -->
        <header class="navbar">
            <div class="nav-left">
                <a href="#" class="brand-logo">CrowdBridge</a>
                <ul class="nav-links">
                    <li><a href="#">Explore Projects</a></li>
                </ul>
            </div>
            <div class="nav-right">
                <div class="search-container">
                    <svg class="search-icon" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><circle cx="11" cy="11" r="8"></circle><line x1="21" y1="21" x2="16.65" y2="16.65"></line></svg>
                    <asp:TextBox ID="txtSearch" runat="server" Placeholder="Search..."></asp:TextBox>
                </div>
                <asp:Button ID="btnSignIn" runat="server" Text="Sign In" CssClass="btn-signin" />
            </div>
        </header>

        <!-- Main Banner -->
        <section class="hero-banner">
            <div class="hero-container">
                <div class="hero-card">
                    <h1 class="hero-title">Fund Grassroots Indian Innovations</h1>
                    <p class="hero-desc">Empowering local communities by connecting visionary projects with global supporters. Join the movement to create sustainable impact across India.</p>
                    <div class="hero-buttons">
                        <asp:Button ID="btnStartFunding" runat="server" Text="Start Funding" CssClass="btn-hero-primary" />
                        <asp:Button ID="btnLearnMore" runat="server" Text="Learn More" CssClass="btn-hero-secondary" />
                    </div>
                </div>
                <img src="https://images.unsplash.com/photo-1593113598332-cd288d649433?auto=format&fit=crop&q=80&w=800" alt="Grassroots Innovation" class="hero-illustration" />
            </div>
        </section>

        <!-- Projects Grid Section -->
        <main class="content-container">
            <div class="section-header">
                <div>
                    <h2 class="section-title">Trending Projects</h2>
                    <p class="section-subtitle">Support these high-impact initiatives currently seeking funding.</p>
                </div>
                <a href="#" class="view-all-link">View All &rarr;</a>
            </div>

            <div class="projects-grid">
                <!-- Project Card 1 -->
                <div class="project-card">
                    <div class="card-img-wrapper">
                        <img src="https://images.unsplash.com/photo-1530836369250-ef72a3f5cda8?auto=format&fit=crop&q=80&w=600" alt="Agriculture" class="card-img" />
                        <span class="status-badge badge-trending">Trending</span>
                    </div>
                    <div class="card-body">
                        <span class="category-tag">Agriculture</span>
                        <h3 class="project-title">Smart Urban Farming Hub</h3>
                        <p class="project-desc">Bringing sustainable hydroponic farming to urban spaces in Mumbai, reducing water usage by 90%.</p>
                        
                        <div class="progress-meta">
                            <span class="raised-amount">&#x20B9;4,50,000 raised</span>
                            <span class="goal-amount">of &#x20B9;5,00,000</span>
                        </div>
                        <div class="progress-bar-bg">
                            <div class="progress-bar-fill" style="width: 90%;"></div>
                        </div>

                        <div class="card-footer">
                            <span>&#9202; 5 days left</span>
                            <a href="#" class="action-link">Fund Project</a>
                        </div>
                    </div>
                </div>

                <!-- Project Card 2 -->
                <div class="project-card">
                    <div class="card-img-wrapper">
                        <img src="https://images.unsplash.com/photo-1509062522246-3755977927d7?auto=format&fit=crop&q=80&w=600" alt="Education" class="card-img" />
                    </div>
                    <div class="card-body">
                        <span class="category-tag">Education</span>
                        <h3 class="project-title">Digital Literacy for Rural Hubs</h3>
                        <p class="project-desc">Equipping 50 rural community centers with digital labs and localized software training modules.</p>
                        
                        <div class="progress-meta">
                            <span class="raised-amount">&#x20B9;1,20,000 raised</span>
                            <span class="goal-amount">of &#x20B9;3,00,000</span>
                        </div>
                        <div class="progress-bar-bg">
                            <div class="progress-bar-fill" style="width: 40%;"></div>
                        </div>

                        <div class="card-footer">
                            <span>&#9202; 21 days left</span>
                            <a href="#" class="action-link">Fund Project</a>
                        </div>
                    </div>
                </div>

                <!-- Project Card 3 -->
                <div class="project-card">
                    <div class="card-img-wrapper">
                        <img src="https://images.unsplash.com/photo-1541888946425-d0fbb186a5b3?auto=format&fit=crop&q=80&w=600" alt="Health" class="card-img" />
                        <span class="status-badge badge-funded">Funded</span>
                    </div>
                    <div class="card-body">
                        <span class="category-tag">Health</span>
                        <h3 class="project-title">Low-Cost Water Filtration</h3>
                        <p class="project-desc">Deploying locally manufactured, graphene-based water filters to 100 villages in Rajasthan.</p>
                        
                        <div class="progress-meta">
                            <span class="raised-amount">&#x20B9;2,00,000 raised</span>
                            <span class="goal-amount">of &#x20B9;2,00,000</span>
                        </div>
                        <div class="progress-bar-bg">
                            <div class="progress-bar-fill complete" style="width: 100%;"></div>
                        </div>

                        <div class="card-footer">
                            <span>&#10003; Goal Reached</span>
                            <span class="action-closed">Closed</span>
                        </div>
                    </div>
                </div>
            </div>
        </main>

        <!-- Footer -->
        <footer class="footer">
            <div>
                <div class="footer-brand">CrowdBridge</div>
                <p class="footer-sub">Empowering communities together.</p>
                <p class="copyright">&copy; 2024 CrowdBridge India.</p>
            </div>
            <div class="footer-links">
                <a href="#">Support</a>
                <a href="#">About Us</a>
            </div>
        </footer>
    </form>
</body>
</html>