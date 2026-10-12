<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LearnMore.aspx.cs" Inherits="CrowedBridge.Home.LearnMore" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>About CrowdBridge - How It Works</title>
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

        /* Navigation Bar */
        .navbar {
            background: #FFFFFF;
            padding: 20px 48px;
            display: flex;
            align-items: center;
            justify-content: space-between;
            border-bottom: 1px solid #EFEFEF;
        }

        .brand-logo {
            font-size: 24px;
            font-weight: 800;
            color: #FA6400;
            text-decoration: none;
        }

        .nav-links {
            display: flex;
            gap: 24px;
        }

        .nav-link {
            text-decoration: none;
            color: #444444;
            font-size: 14px;
            font-weight: 600;
            transition: color 0.2s ease;
        }

        .nav-link:hover {
            color: #FA6400;
        }

        /* Hero Section */
        .hero-section {
            background: linear-gradient(135deg, #FA6400 0%, #D95300 100%);
            color: #FFFFFF;
            padding: 64px 48px;
            text-align: center;
        }

        .hero-title {
            font-size: 38px;
            font-weight: 800;
            margin-bottom: 16px;
            letter-spacing: -0.5px;
        }

        .hero-subtitle {
            font-size: 18px;
            max-width: 700px;
            margin: 0 auto;
            line-height: 1.6;
            opacity: 0.95;
        }

        /* Container */
        .container {
            max-width: 1100px;
            margin: 0 auto;
            padding: 48px 24px;
        }

        /* Section Styling */
        .section-title {
            font-size: 26px;
            font-weight: 700;
            color: #111111;
            text-align: center;
            margin-bottom: 36px;
        }

        /* Steps Grid */
        .steps-grid {
            display: grid;
            grid-template-columns: repeat(3, 1fr);
            gap: 24px;
            margin-bottom: 60px;
        }

        .step-card {
            background: #FFFFFF;
            border-radius: 12px;
            padding: 32px 24px;
            box-shadow: 0px 4px 12px rgba(0,0,0,0.03);
            border: 1px solid #EFEFEF;
            text-align: center;
        }

        .step-number {
            width: 48px;
            height: 48px;
            background: #FFF0E6;
            color: #FA6400;
            font-weight: 800;
            font-size: 20px;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            margin: 0 auto 20px auto;
        }

        .step-card h3 {
            font-size: 18px;
            font-weight: 700;
            margin-bottom: 12px;
            color: #111111;
        }

        .step-card p {
            font-size: 14px;
            color: #666666;
            line-height: 1.6;
        }

        /* Feature Cards */
        .features-grid {
            display: grid;
            grid-template-columns: repeat(2, 1fr);
            gap: 24px;
            margin-bottom: 60px;
        }

        .feature-box {
            background: #FFFFFF;
            padding: 28px;
            border-radius: 12px;
            border: 1px solid #EFEFEF;
            display: flex;
            gap: 20px;
            align-items: flex-start;
        }

        .feature-icon {
            font-size: 32px;
        }

        .feature-box h4 {
            font-size: 16px;
            font-weight: 700;
            margin-bottom: 8px;
            color: #111111;
        }

        .feature-box p {
            font-size: 13px;
            color: #666666;
            line-height: 1.5;
        }

        /* Call To Action Box */
        .cta-box {
            background: #FFFFFF;
            border-radius: 16px;
            padding: 48px;
            text-align: center;
            border: 1px solid #EFEFEF;
            box-shadow: 0px 4px 16px rgba(0,0,0,0.04);
        }

        .cta-box h2 {
            font-size: 28px;
            font-weight: 800;
            margin-bottom: 12px;
            color: #111111;
        }

        .cta-box p {
            font-size: 15px;
            color: #666666;
            margin-bottom: 28px;
        }

        .btn-group {
            display: flex;
            justify-content: center;
            gap: 16px;
        }

        .btn {
            padding: 12px 28px;
            border-radius: 8px;
            font-size: 14px;
            font-weight: 700;
            text-decoration: none;
            cursor: pointer;
            transition: transform 0.1s ease;
        }

        .btn:active {
            transform: scale(0.98);
        }

        .btn-primary {
            background: #FA6400;
            color: #FFFFFF;
        }

        .btn-secondary {
            background: #F1F5F9;
            color: #333333;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <!-- Navigation -->
        <div class="navbar">
            <a href="Default.aspx" class="brand-logo">CrowdBridge</a>
            <div class="nav-links">
                <a href="ProjectSearch.aspx" class="nav-link">Explore Projects</a>
                <a href="Default.aspx" class="nav-link">Home</a>
            </div>
        </div>

        <!-- Hero -->
        <div class="hero-section">
            <h1 class="hero-title">Empowering Grassroots Innovation</h1>
            <p class="hero-subtitle">
                CrowdBridge bridges the gap between visionary Indian innovators and supporters around the globe. Learn how our crowdfunding ecosystem works.
            </p>
        </div>

        <!-- Content Area -->
        <div class="container">
            <!-- How It Works Section -->
            <h2 class="section-title">How CrowdBridge Works</h2>
            
            <div class="steps-grid">
                <div class="step-card">
                    <div class="step-number">1</div>
                    <h3>Discover Projects</h3>
                    <p>Browse through verified projects in AgriTech, CleanTech, EduTech, and local artisan initiatives across India.</p>
                </div>

                <div class="step-card">
                    <div class="step-number">2</div>
                    <h3>Direct Support</h3>
                    <p>Contribute directly to projects you care about with transparent funding tracking and real-time goal updates.</p>
                </div>

                <div class="step-card">
                    <div class="step-number">3</div>
                    <h3>Create Impact</h3>
                    <p>Follow creator progress through milestones, updates, and community reports as real change takes shape.</p>
                </div>
            </div>

            <!-- Key Features Section -->
            <h2 class="section-title">Why CrowdBridge?</h2>

            <div class="features-grid">
                <div class="feature-box">
                    <div class="feature-icon">&#128274;</div>
                    <div>
                        <h4>100% Verified Innovations</h4>
                        <p>Every listed project undergoes a thorough verification process to ensure credibility and genuine community impact.</p>
                    </div>
                </div>

                <div class="feature-box">
                    <div class="feature-icon">&#9889;</div>
                    <div>
                        <h4>Transparent Goal Tracking</h4>
                        <p>Monitor funding progress live with full visibility into how contributions are allocated for each project milestone.</p>
                    </div>
                </div>

                <div class="feature-box">
                    <div class="feature-icon">&#127759;</div>
                    <div>
                        <h4>Local Solutions, Global Reach</h4>
                        <p>Connecting regional creators across Tier-2, Tier-3, and rural India with a worldwide network of supporters.</p>
                    </div>
                </div>

                <div class="feature-box">
                    <div class="feature-icon">&#128179;</div>
                    <div>
                        <h4>Seamless & Safe Payments</h4>
                        <p>Integrated with secure payment gateways supporting UPI, Net Banking, Credit/Debit cards, and international transfers.</p>
                    </div>
                </div>
            </div>

            <!-- Call to Action -->
            <div class="cta-box">
                <h2>Ready to Make a Difference?</h2>
                <p>Explore high-impact projects or start funding ground-breaking grassroots ideas today.</p>
                <div class="btn-group">
                    <a href="ProjectSearch.aspx" class="btn btn-primary">Explore Projects</a>
                    <a href="Default.aspx" class="btn btn-secondary">Back to Home</a>
                </div>
            </div>
        </div>
    </form>
</body>
</html>