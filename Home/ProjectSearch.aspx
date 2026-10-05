<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ProjectSearch.aspx.cs" Inherits="CrowedBridge.Home.ProjectSearch" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Explore Projects - CrowdBridge</title>
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
            padding: 32px 48px;
        }

        .container {
            max-width: 1280px;
            margin: 0 auto;
        }

        /* Top Back Button */
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
            margin-bottom: 24px;
        }

        /* Search and Filter Controls */
        .filter-bar {
            display: flex;
            gap: 16px;
            align-items: center;
            margin-bottom: 16px;
        }

        .search-box {
            flex-grow: 1;
            position: relative;
        }

        .search-box input {
            width: 100%;
            padding: 12px 16px 12px 40px;
            border-radius: 8px;
            border: 1px solid #E2E8F0;
            background: #FFFFFF;
            font-size: 14px;
            outline: none;
        }

        .search-icon {
            position: absolute;
            left: 14px;
            top: 50%;
            transform: translateY(-50%);
            width: 16px;
            height: 16px;
            stroke: #94A3B8;
        }

        .dropdown-select {
            background: #FFFFFF;
            border: 1px solid #E2E8F0;
            border-radius: 8px;
            padding: 12px 16px;
            font-size: 13px;
            font-weight: 600;
            color: #333333;
            outline: none;
            cursor: pointer;
        }

        /* Status Tabs */
        .status-pills {
            display: flex;
            background: #EFEFEF;
            border-radius: 8px;
            padding: 4px;
            gap: 4px;
        }

        .status-pill {
            padding: 8px 16px;
            font-size: 12px;
            font-weight: 600;
            border-radius: 6px;
            cursor: pointer;
            border: none;
            background: transparent;
            color: #555555;
        }

        .status-pill.active {
            background: #FA6400;
            color: #FFFFFF;
        }

        /* Category Chips Bar */
        .category-bar {
            display: flex;
            gap: 10px;
            margin-bottom: 28px;
            overflow-x: auto;
            padding-bottom: 4px;
        }

        .chip {
            background: #FFFFFF;
            border: 1px solid #E2E8F0;
            padding: 8px 18px;
            border-radius: 20px;
            font-size: 13px;
            font-weight: 600;
            color: #444444;
            cursor: pointer;
            display: flex;
            align-items: center;
            gap: 6px;
            white-space: nowrap;
        }

        .chip.active {
            background: #FA6400;
            color: #FFFFFF;
            border-color: #FA6400;
        }

        /* Counter Label */
        .results-count {
            font-size: 14px;
            font-weight: 700;
            color: #444444;
            margin-bottom: 20px;
        }

        /* Projects Grid */
        .grid {
            display: grid;
            grid-template-columns: repeat(4, 1fr);
            gap: 20px;
            margin-bottom: 40px;
        }

        .card {
            background: #FFFFFF;
            border: 1px solid #EFEFEF;
            border-radius: 12px;
            overflow: hidden;
            box-shadow: 0px 2px 8px rgba(0,0,0,0.02);
            display: flex;
            flex-direction: column;
        }

        .card-img-wrap {
            position: relative;
            height: 180px;
            width: 100%;
        }

        .card-img {
            width: 100%;
            height: 100%;
            object-fit: cover;
        }

        .badge {
            position: absolute;
            top: 12px;
            right: 12px;
            padding: 4px 10px;
            border-radius: 12px;
            font-size: 11px;
            font-weight: 700;
            color: #FFFFFF;
        }

        .badge-funded { background-color: #10B981; }
        .badge-urgent { background-color: #EF4444; }

        .card-body {
            padding: 20px;
            display: flex;
            flex-direction: column;
            flex-grow: 1;
        }

        .meta-tag {
            font-size: 11px;
            font-weight: 700;
            color: #FA6400;
            text-transform: uppercase;
            letter-spacing: 0.5px;
            margin-bottom: 8px;
        }

        .card-title {
            font-size: 16px;
            font-weight: 700;
            color: #111111;
            margin-bottom: 8px;
            line-height: 1.3;
        }

        .card-desc {
            font-size: 12px;
            color: #666666;
            line-height: 1.5;
            margin-bottom: 20px;
        }

        .progress-bar-bg {
            background: #E5E7EB;
            height: 6px;
            border-radius: 3px;
            overflow: hidden;
            margin-bottom: 12px;
        }

        .progress-bar-fill {
            height: 100%;
            background: #FA6400;
            border-radius: 3px;
        }

        .stats-row {
            display: flex;
            justify-content: space-between;
            font-size: 12px;
            font-weight: 700;
            margin-bottom: 12px;
        }

        .raised { color: #111111; }
        .goal { color: #777777; font-weight: 500; }

        .days-left {
            font-size: 12px;
            color: #666666;
            margin-bottom: 16px;
        }

        .btn-action {
            width: 100%;
            padding: 10px;
            border-radius: 8px;
            font-size: 13px;
            font-weight: 600;
            cursor: pointer;
            margin-top: auto;
            text-align: center;
        }

        .btn-orange {
            background: #FA6400;
            color: #FFFFFF;
            border: none;
        }

        .btn-outline {
            background: #FFFFFF;
            border: 1px solid #E2E8F0;
            color: #333333;
        }

        /* Pagination Bar */
        .pagination {
            display: flex;
            justify-content: center;
            align-items: center;
            gap: 8px;
        }

        .page-item {
            width: 36px;
            height: 36px;
            display: flex;
            align-items: center;
            justify-content: center;
            border-radius: 8px;
            border: 1px solid #E2E8F0;
            background: #FFFFFF;
            font-size: 13px;
            font-weight: 600;
            color: #444444;
            cursor: pointer;
        }

        .page-item.active {
            background: #FA6400;
            color: #FFFFFF;
            border-color: #FA6400;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <!-- Back Link -->
            <a href="Default.aspx" class="back-btn">&larr; Back to Home</a>

            <!-- Search and Primary Filters -->
            <div class="filter-bar">
                <div class="search-box">
                    <svg class="search-icon" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><circle cx="11" cy="11" r="8"></circle><line x1="21" y1="21" x2="16.65" y2="16.65"></line></svg>
                    <asp:TextBox ID="txtSearch" runat="server" Placeholder="Search projects by title, keyword, or city..."></asp:TextBox>
                </div>
                
                <select class="dropdown-select">
                    <option>All India</option>
                </select>

                <div class="status-pills">
                    <button type="button" class="status-pill active">All Statuses</button>
                    <button type="button" class="status-pill">Live Funding</button>
                    <button type="button" class="status-pill">Completed</button>
                    <button type="button" class="status-pill">Trending</button>
                </div>

                <select class="dropdown-select">
                    <option>Sort by: Most Recent</option>
                </select>
            </div>

            <!-- Category Chips -->
            <div class="category-bar">
                <div class="chip active">All Projects</div>
                <div class="chip">CleanTech</div>
                <div class="chip">AgriTech</div>
                <div class="chip">EduTech</div>
                <div class="chip">Artisans &amp; Crafts</div>
                <div class="chip">Healthcare</div>
            </div>

            <div class="results-count">Showing 24 projects</div>

            <!-- Project Cards Grid -->
            <div class="grid">
                
                <!-- Card 1 -->
                <div class="card">
                    <div class="card-img-wrap">
                        <img src="https://images.unsplash.com/photo-1530836369250-ef72a3f5cda8?auto=format&fit=crop&q=80&w=400" alt="Urban Oasis Hydroponics" class="card-img" />
                        <span class="badge badge-funded">Funded</span>
                    </div>
                    <div class="card-body">
                        <div class="meta-tag">AGRITECH &bull; PUNE</div>
                        <h3 class="card-title">Urban Oasis Hydroponics</h3>
                        <p class="card-desc">Empowering urban communities to grow their own pesticide-free vegetables through modular...</p>
                        <div class="progress-bar-bg">
                            <div class="progress-bar-fill" style="width: 100%;"></div>
                        </div>
                        <div class="stats-row">
                            <span class="raised">&#x20B9; 15.2L raised</span>
                            <span class="goal">Goal: &#x20B9; 12.0L</span>
                        </div>
                        <div class="days-left">&#9202; 12 days left</div>
                        <button type="button" class="btn-action btn-orange">View Details</button>
                    </div>
                </div>

                <!-- Card 2 -->
                <div class="card">
                    <div class="card-img-wrap">
                        <img src="https://images.unsplash.com/photo-1509062522246-3755977927d7?auto=format&fit=crop&q=80&w=400" alt="NextGen Coding Academies" class="card-img" />
                        <span class="badge badge-urgent">Urgent</span>
                    </div>
                    <div class="card-body">
                        <div class="meta-tag">EDUTECH &bull; BANGALORE</div>
                        <h3 class="card-title">NextGen Coding Academies</h3>
                        <p class="card-desc">Bridging the digital divide by setting up state-of-the-art coding...</p>
                        <div class="progress-bar-bg">
                            <div class="progress-bar-fill" style="width: 75%;"></div>
                        </div>
                        <div class="stats-row">
                            <span class="raised">&#x20B9; 18.7L raised</span>
                            <span class="goal">Goal: &#x20B9; 25.0L</span>
                        </div>
                        <div class="days-left">&#9202; 5 days left</div>
                        <button type="button" class="btn-action btn-outline">Support Now</button>
                    </div>
                </div>

                <!-- Card 3 -->
                <div class="card">
                    <div class="card-img-wrap">
                        <img src="https://images.unsplash.com/photo-1593113598332-cd288d649433?auto=format&fit=crop&q=80&w=400" alt="Heritage Weavers Collective" class="card-img" />
                    </div>
                    <div class="card-body">
                        <div class="meta-tag">ARTISANS &bull; JAIPUR</div>
                        <h3 class="card-title">Heritage Weavers Collective</h3>
                        <p class="card-desc">Modernizing the supply chain for traditional artisans, providing them...</p>
                        <div class="progress-bar-bg">
                            <div class="progress-bar-fill" style="width: 45%;"></div>
                        </div>
                        <div class="stats-row">
                            <span class="raised">&#x20B9; 4.5L raised</span>
                            <span class="goal">Goal: &#x20B9; 10.0L</span>
                        </div>
                        <div class="days-left">&#9202; 28 days left</div>
                        <button type="button" class="btn-action btn-outline">Support Now</button>
                    </div>
                </div>

                <!-- Card 4 -->
                <div class="card">
                    <div class="card-img-wrap">
                        <img src="https://images.unsplash.com/photo-1508873696983-2df515122519?auto=format&fit=crop&q=80&w=400" alt="Surya Community Microgrids" class="card-img" />
                    </div>
                    <div class="card-body">
                        <div class="meta-tag">CLEANTECH &bull; DELHI</div>
                        <h3 class="card-title">Surya Community Microgrids</h3>
                        <p class="card-desc">Deploying affordable, decentralized solar microgrids to underserved...</p>
                        <div class="progress-bar-bg">
                            <div class="progress-bar-fill" style="width: 85%;"></div>
                        </div>
                        <div class="stats-row">
                            <span class="raised">&#x20B9; 42.5L raised</span>
                            <span class="goal">Goal: &#x20B9; 50.0L</span>
                        </div>
                        <div class="days-left">&#9202; 15 days left</div>
                        <button type="button" class="btn-action btn-outline">Support Now</button>
                    </div>
                </div>

            </div>

            <!-- Pagination -->
            <div class="pagination">
                <div class="page-item">&lt;</div>
                <div class="page-item active">1</div>
                <div class="page-item">2</div>
                <div class="page-item">3</div>
                <div class="page-item" style="border:none; background:transparent;">...</div>
                <div class="page-item">10</div>
                <div class="page-item">&gt;</div>
            </div>
        </div>
    </form>
</body>
</html>