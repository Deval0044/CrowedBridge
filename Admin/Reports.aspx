<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Reports.aspx.cs" Inherits="CrowedBridge.Admin.Reports" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Admin Console - Reports &amp; Analytics</title>
    <style>
        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
            font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, Helvetica, Arial, sans-serif;
        }

        html, body, form {
            height: 100%;
            width: 100%;
        }

        body {
            background-color: #F8F8F6;
            color: #333333;
        }

        .app-container {
            padding: 32px 48px;
            max-width: 1360px;
            margin: 0 auto;
        }

        /* Top Bar Navigation */
        .back-btn {
            background: transparent;
            border: none;
            color: #A34E00;
            font-size: 13px;
            font-weight: 700;
            cursor: pointer;
            display: inline-flex;
            align-items: center;
            gap: 8px;
            text-decoration: none;
            margin-bottom: 28px;
        }

        /* Header Section */
        .header-section {
            display: flex;
            justify-content: space-between;
            align-items: flex-start;
            margin-bottom: 32px;
        }

        .page-title {
            font-size: 32px;
            font-weight: 800;
            color: #111111;
            letter-spacing: -0.5px;
            margin-bottom: 6px;
        }

        .page-subtitle {
            font-size: 14px;
            color: #666666;
        }

        .header-controls {
            display: flex;
            gap: 12px;
        }

        .date-dropdown {
            background: #FFFFFF;
            border: 1px solid #E2E8F0;
            border-radius: 8px;
            padding: 10px 16px;
            font-size: 13px;
            font-weight: 600;
            color: #333333;
            display: flex;
            align-items: center;
            gap: 12px;
            cursor: pointer;
        }

        .btn-export {
            background: #FFFFFF;
            border: 1px solid #E2E8F0;
            border-radius: 8px;
            padding: 10px 18px;
            font-size: 13px;
            font-weight: 600;
            color: #333333;
            cursor: pointer;
            display: flex;
            align-items: center;
            gap: 8px;
        }

        /* KPI Cards Grid */
        .kpi-grid {
            display: grid;
            grid-template-columns: repeat(4, 1fr);
            gap: 20px;
            margin-bottom: 28px;
        }

        .kpi-card {
            background: #FFFFFF;
            border: 1px solid #EFEFEF;
            border-radius: 12px;
            padding: 24px;
            box-shadow: 0px 2px 8px rgba(0, 0, 0, 0.015);
        }

        .kpi-label {
            font-size: 13px;
            font-weight: 600;
            color: #555555;
            margin-bottom: 12px;
        }

        .kpi-value {
            font-size: 30px;
            font-weight: 800;
            color: #111111;
            margin-bottom: 8px;
            letter-spacing: -0.5px;
        }

        .kpi-trend {
            font-size: 12px;
            font-weight: 600;
            display: flex;
            align-items: center;
            gap: 4px;
        }

        .trend-up {
            color: #10B981;
        }

        .trend-neutral {
            color: #6B7280;
        }

        /* Visualization Layout Grid */
        .analytics-grid {
            display: grid;
            grid-template-columns: 2fr 1fr;
            gap: 20px;
        }

        .chart-card {
            background: #FFFFFF;
            border: 1px solid #EFEFEF;
            border-radius: 12px;
            padding: 24px 28px;
            box-shadow: 0px 2px 8px rgba(0, 0, 0, 0.015);
            display: flex;
            flex-direction: column;
            justify-content: space-between;
        }

        .chart-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 28px;
        }

        .chart-title {
            font-size: 20px;
            font-weight: 800;
            color: #111111;
        }

        .more-options {
            color: #666666;
            cursor: pointer;
            font-size: 18px;
            font-weight: bold;
        }

        /* Bar Chart Visual Mock */
        .bar-chart-container {
            display: flex;
            align-items: flex-end;
            gap: 16px;
            height: 240px;
            padding-left: 32px;
            position: relative;
        }

        .chart-y-axis {
            position: absolute;
            left: 0;
            top: 0;
            bottom: 28px;
            display: flex;
            flex-direction: column;
            justify-content: space-between;
            font-size: 11px;
            color: #94A3B8;
        }

        .bar-group {
            flex: 1;
            display: flex;
            flex-direction: column;
            align-items: center;
            height: 100%;
            justify-content: flex-end;
        }

        .bar {
            width: 100%;
            background-color: #FDBA74;
            border-radius: 4px 4px 0 0;
            transition: height 0.3s ease;
        }

        .bar.highlight {
            background-color: #FA6400;
        }

        .bar-label {
            margin-top: 12px;
            font-size: 12px;
            color: #555555;
            font-weight: 500;
        }

        /* Donut / Category Breakdown Mock */
        .donut-container {
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            padding: 20px 0;
            position: relative;
        }

        .donut-placeholder {
            width: 140px;
            height: 140px;
            border-radius: 50%;
            background: conic-gradient(#FA6400 0% 45%, #FED7AA 45% 75%, #E5E7EB 75% 90%, #CBD5E1 90% 100%);
            display: flex;
            align-items: center;
            justify-content: center;
            margin-bottom: 24px;
        }

        .donut-inner {
            width: 90px;
            height: 90px;
            background: #FFFFFF;
            border-radius: 50%;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
        }

        .donut-center-title {
            font-size: 10px;
            color: #777777;
            text-transform: uppercase;
            font-weight: 600;
        }

        .donut-center-value {
            font-size: 13px;
            font-weight: 800;
            color: #111111;
        }

        /* Category Legend */
        .category-legend {
            width: 100%;
            display: flex;
            flex-direction: column;
            gap: 12px;
        }

        .legend-item {
            display: flex;
            justify-content: space-between;
            align-items: center;
            font-size: 13px;
        }

        .legend-left {
            display: flex;
            align-items: center;
            gap: 10px;
            color: #444444;
            font-weight: 500;
        }

        .legend-dot {
            width: 10px;
            height: 10px;
            border-radius: 50%;
        }

        .legend-value {
            font-weight: 700;
            color: #111111;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="app-container">
            <!-- Top Navigation Link -->
            <a href="AdminDashbord.aspx" class="back-btn">&larr; Back to Previous Page</a>

            <!-- Page Title Bar -->
            <div class="header-section">
                <div>
                    <h1 class="page-title">Reports &amp; Analytics</h1>
                    <p class="page-subtitle">Platform performance overview for selected period.</p>
                </div>
                <div class="header-controls">
                    <div class="date-dropdown">
                        <span>Last 30 Days</span>
                        <svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><rect x="3" y="4" width="18" height="18" rx="2" ry="2"></rect><line x1="16" y1="2" x2="16" y2="6"></line><line x1="8" y1="2" x2="8" y2="6"></line><line x1="3" y1="10" x2="21" y2="10"></line></svg>
                    </div>
                    <button type="button" class="btn-export">
                        <svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path d="M21 15v4a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2v-4"></path><polyline points="7 10 12 15 17 10"></polyline><line x1="12" y1="15" x2="12" y2="3"></line></svg>
                        Export CSV
                    </button>
                </div>
            </div>

            <!-- Top Metric Cards -->
            <div class="kpi-grid">
                <div class="kpi-card">
                    <div class="kpi-label">Total Funding</div>
                    <div class="kpi-value">&#x20B9;42.5L</div>
                    <div class="kpi-trend trend-up">+12.4% vs last period</div>
                </div>
                <div class="kpi-card">
                    <div class="kpi-label">Platform Fees</div>
                    <div class="kpi-value">&#x20B9;2.1L</div>
                    <div class="kpi-trend trend-up">+8.2% vs last period</div>
                </div>
                <div class="kpi-card">
                    <div class="kpi-label">Active Projects</div>
                    <div class="kpi-value">128</div>
                    <div class="kpi-trend trend-neutral">&mdash; No change</div>
                </div>
                <div class="kpi-card">
                    <div class="kpi-label">New Backers</div>
                    <div class="kpi-value">3,450</div>
                    <div class="kpi-trend trend-up">+15.3% vs last period</div>
                </div>
            </div>

            <!-- Charts Section -->
            <div class="analytics-grid">
                <!-- Bar Chart Component -->
                <div class="chart-card">
                    <div class="chart-header">
                        <h2 class="chart-title">Funding Growth (&#x20B9; Lakhs)</h2>
                        <span class="more-options">&#8942;</span>
                    </div>

                    <div class="bar-chart-container">
                        <div class="chart-y-axis">
                            <span>50</span>
                            <span>40</span>
                            <span>25</span>
                            <span>10</span>
                        </div>

                        <div class="bar-group">
                            <div class="bar" style="height: 30%;"></div>
                            <span class="bar-label">Mon</span>
                        </div>
                        <div class="bar-group">
                            <div class="bar" style="height: 48%;"></div>
                            <span class="bar-label">Tue</span>
                        </div>
                        <div class="bar-group">
                            <div class="bar" style="height: 35%;"></div>
                            <span class="bar-label">Wed</span>
                        </div>
                        <div class="bar-group">
                            <div class="bar" style="height: 65%;"></div>
                            <span class="bar-label">Thu</span>
                        </div>
                        <div class="bar-group">
                            <div class="bar" style="height: 55%;"></div>
                            <span class="bar-label">Fri</span>
                        </div>
                        <div class="bar-group">
                            <div class="bar highlight" style="height: 85%;"></div>
                            <span class="bar-label">Sat</span>
                        </div>
                        <div class="bar-group">
                            <div class="bar" style="height: 72%;"></div>
                            <span class="bar-label">Sun</span>
                        </div>
                    </div>
                </div>

                <!-- Donut/Category Component -->
                <div class="chart-card">
                    <div class="chart-header">
                        <h2 class="chart-title">Category Split</h2>
                        <span class="more-options">&#8942;</span>
                    </div>

                    <div class="donut-container">
                        <div class="donut-placeholder">
                            <div class="donut-inner">
                                <span class="donut-center-title">Top</span>
                                <span class="donut-center-value">Tech</span>
                            </div>
                        </div>

                        <div class="category-legend">
                            <div class="legend-item">
                                <div class="legend-left">
                                    <span class="legend-dot" style="background-color: #FA6400;"></span>
                                    <span>Technology</span>
                                </div>
                                <span class="legend-value">45%</span>
                            </div>
                            <div class="legend-item">
                                <div class="legend-left">
                                    <span class="legend-dot" style="background-color: #FED7AA;"></span>
                                    <span>Community</span>
                                </div>
                                <span class="legend-value">30%</span>
                            </div>
                            <div class="legend-item">
                                <div class="legend-left">
                                    <span class="legend-dot" style="background-color: #E5E7EB;"></span>
                                    <span>Creative</span>
                                </div>
                                <span class="legend-value">15%</span>
                            </div>
                            <div class="legend-item">
                                <div class="legend-left">
                                    <span class="legend-dot" style="background-color: #CBD5E1;"></span>
                                    <span>Other</span>
                                </div>
                                <span class="legend-value">10%</span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>
</body>
</html>