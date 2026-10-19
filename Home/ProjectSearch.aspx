<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ProjectSearch.aspx.cs" Inherits="CrowedBridge.Home.ProjectSearch" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Explore Projects - CrowdBridge</title>
    <style>
        * { box-sizing: border-box; margin: 0; padding: 0; font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, sans-serif; }
        body { background-color: #F8F8F6; color: #333333; min-height: 100vh; display: flex; flex-direction: column; }
        
        /* Top Navigation Header */
        .navbar { background: #FFFFFF; border-bottom: 1px solid #EFEFEF; padding: 16px 48px; display: flex; justify-content: space-between; align-items: center; z-index: 20; position: relative; }
        .nav-left { display: flex; align-items: center; gap: 32px; }
        .brand-logo { font-size: 22px; font-weight: 800; color: #FA6400; text-decoration: none; }
        .nav-link { color: #FA6400; text-decoration: none; font-size: 14px; font-weight: 700; }
        .nav-right { display: flex; align-items: center; gap: 16px; }
        .btn-signin-nav { background: #FA6400; color: #FFFFFF; text-decoration: none; font-weight: 700; font-size: 13px; padding: 10px 20px; border-radius: 8px; }

        .container { max-width: 1280px; margin: 0 auto; padding: 32px 24px; width: 100%; flex-grow: 1; }
        .back-btn { background: transparent; border: none; color: #555555; font-size: 14px; font-weight: 600; cursor: pointer; text-decoration: none; margin-bottom: 24px; display: inline-flex; align-items: center; gap: 8px; }
        .back-btn:hover { color: #FA6400; }

        .filter-bar { display: flex; gap: 12px; align-items: center; margin-bottom: 20px; flex-wrap: wrap; }
        .search-box-wrap { flex-grow: 1; position: relative; min-width: 300px; }
        .search-box-wrap svg { position: absolute; left: 14px; top: 50%; transform: translateY(-50%); fill: #9CA3AF; }
        .search-input { width: 100%; padding: 12px 16px 12px 40px; border-radius: 10px; border: 1px solid #E5E7EB; background: #FFFFFF; font-size: 14px; outline: none; }
        
        .dropdown-select { background: #FFFFFF; border: 1px solid #E5E7EB; border-radius: 10px; padding: 12px 16px; font-size: 13px; font-weight: 600; color: #333; outline: none; cursor: pointer; }
        .status-pills { display: flex; background: #FFFFFF; border: 1px solid #E5E7EB; border-radius: 10px; padding: 4px; gap: 4px; }
        .status-pill { padding: 8px 16px; font-size: 13px; font-weight: 600; border-radius: 8px; cursor: pointer; border: none; background: transparent; color: #555555; transition: all 0.2s; }
        .status-pill.active { background: #FA6400; color: #FFFFFF; }

        .category-bar { display: flex; gap: 10px; margin-bottom: 28px; flex-wrap: wrap; }
        .chip { background: #FFFFFF; border: 1px solid #E5E7EB; padding: 8px 18px; border-radius: 20px; font-size: 13px; font-weight: 600; color: #555555; cursor: pointer; transition: all 0.2s; display: inline-flex; align-items: center; gap: 6px; }
        .chip.active { background: #FA6400; color: #FFFFFF; border-color: #FA6400; }

        .results-count { font-size: 15px; font-weight: 700; color: #333333; margin-bottom: 24px; }

        .grid { display: grid; grid-template-columns: repeat(4, 1fr); gap: 24px; margin-bottom: 40px; }
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
        
        /* Unified View Details Button Style */
        .btn-action { width: 100%; padding: 12px; border-radius: 10px; font-size: 13px; font-weight: 700; cursor: pointer; text-align: center; text-decoration: none; display: block; margin-top: auto; box-sizing: border-box; background: #FA6400; color: #FFFFFF; border: none; transition: background 0.2s; }
        .btn-action:hover { background: #E05800; }

        .site-footer { background: #FFFFFF; border-top: 1px solid #EFEFEF; padding: 32px 48px; display: flex; justify-content: space-between; align-items: center; margin-top: auto; }
        .brand-name { font-size: 18px; font-weight: 800; color: #FA6400; margin-bottom: 4px; }
        .copyright { font-size: 12px; color: #666666; }
        .footer-links { display: flex; gap: 24px; }
        .footer-link { text-decoration: none; color: #555555; font-size: 13px; font-weight: 500; }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <nav class="navbar">
            <div class="nav-left">
                <a href="../Default.aspx" class="brand-logo">CrowdBridge</a>
                <a href="ProjectSearch.aspx" class="nav-link">Explore Projects</a>
            </div>
            <div class="nav-right">
                <asp:HyperLink ID="hlSignIn" runat="server" NavigateUrl="~/Home/Login.aspx" CssClass="btn-signin-nav">Sign In</asp:HyperLink>
            </div>
        </nav>

        <div class="container">
            <a href="../Default.aspx" class="back-btn">&larr; Back to Home</a>

            <asp:HiddenField ID="hfCategory" runat="server" Value="All Projects" />
            <asp:HiddenField ID="hfStatus" runat="server" Value="All Statuses" />

            <div class="filter-bar">
                <div class="search-box-wrap">
                    <svg width="16" height="16" viewBox="0 0 24 24"><path d="M15.5 14h-.79l-.28-.27C15.41 12.59 16 11.11 16 9.5 16 5.91 13.09 3 9.5 3S3 5.91 3 9.5 5.91 16 9.5 16c1.61 0 3.09-.59 4.23-1.57l.27.28v.79l5 4.99L20.49 19l-4.99-5zm-6 0C7.01 14 5 11.99 5 9.5S7.01 5 9.5 5 14 7.01 14 9.5 11.99 14 9.5 14z"/></svg>
                    <asp:TextBox ID="txtSearch" runat="server" CssClass="search-input" Placeholder="Search projects by title, keyword, or city..." AutoPostBack="true" OnTextChanged="FilterProjects"></asp:TextBox>
                </div>

                <asp:DropDownList ID="ddlCity" runat="server" CssClass="dropdown-select" AutoPostBack="true" OnSelectedIndexChanged="FilterProjects">
                    <asp:ListItem Text="All India" Value="All"></asp:ListItem>
                    <asp:ListItem Text="Pune" Value="PUNE"></asp:ListItem>
                    <asp:ListItem Text="Bangalore" Value="BANGALORE"></asp:ListItem>
                    <asp:ListItem Text="Jaipur" Value="JAIPUR"></asp:ListItem>
                    <asp:ListItem Text="Delhi" Value="DELHI"></asp:ListItem>
                </asp:DropDownList>

                <div class="status-pills">
                    <asp:Button ID="btnStatAll" runat="server" Text="All Statuses" CssClass="status-pill active" OnClick="Status_Click" CommandArgument="All Statuses" />
                    <asp:Button ID="btnStatLive" runat="server" Text="Live Funding" CssClass="status-pill" OnClick="Status_Click" CommandArgument="Live Funding" />
                    <asp:Button ID="btnStatDone" runat="server" Text="Completed" CssClass="status-pill" OnClick="Status_Click" CommandArgument="Completed" />
                    <asp:Button ID="btnStatTrend" runat="server" Text="Trending" CssClass="status-pill" OnClick="Status_Click" CommandArgument="Trending" />
                </div>

                <asp:DropDownList ID="ddlSort" runat="server" CssClass="dropdown-select" AutoPostBack="true" OnSelectedIndexChanged="FilterProjects">
                    <asp:ListItem Text="Sort by: Most Recent" Value="Recent"></asp:ListItem>
                    <asp:ListItem Text="Sort by: Most Funded" Value="Funded"></asp:ListItem>
                </asp:DropDownList>
            </div>

            <div class="category-bar">
                <asp:Button ID="btnCatAll" runat="server" Text="All Projects" CssClass="chip active" OnClick="Category_Click" CommandArgument="All Projects" />
                <asp:Button ID="btnCatClean" runat="server" Text="🌱 CleanTech" CssClass="chip" OnClick="Category_Click" CommandArgument="CLEANTECH" />
                <asp:Button ID="btnCatAgri" runat="server" Text="🌾 AgriTech" CssClass="chip" OnClick="Category_Click" CommandArgument="AGRITECH" />
                <asp:Button ID="btnCatEdu" runat="server" Text="📚 EduTech" CssClass="chip" OnClick="Category_Click" CommandArgument="EDUTECH" />
                <asp:Button ID="btnCatArtisan" runat="server" Text="🎨 Artisans & Crafts" CssClass="chip" OnClick="Category_Click" CommandArgument="ARTISANS & CRAFTS" />
                <asp:Button ID="btnCatHealth" runat="server" Text="🩺 Healthcare" CssClass="chip" OnClick="Category_Click" CommandArgument="HEALTHCARE" />
            </div>

            <div class="results-count">
                <asp:Label ID="lblCount" runat="server" Text="Showing projects"></asp:Label>
            </div>

            <asp:Repeater ID="rptProjects" runat="server">
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
                            
                            <a href='<%# "ProjectDetails.aspx?id=" + Eval("Id") %>' class="btn-action">
                                View Details
                            </a>
                        </div>
                    </div>
                </ItemTemplate>
                <FooterTemplate></div></FooterTemplate>
            </asp:Repeater>
        </div>

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