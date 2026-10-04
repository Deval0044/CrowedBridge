<%@ Page Language="C#" AutoEventWireup="true" %>

<!DOCTYPE html>
<script runat="server">
    protected void btnAddTier_Click(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {
            // Reset input fields after successful submission
            txtPledgeAmount.Text = string.Empty;
            txtTierTitle.Text = string.Empty;
            txtDescription.Text = string.Empty;
            txtDelivery.Text = string.Empty;
        }
    }
</script>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Build Reward Tiers</title>
    <style>
        * { box-sizing: border-box; margin: 0; padding: 0; font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, Helvetica, Arial, sans-serif; }
        body { background-color: #F8F8F6; color: #333333; padding: 40px 60px; min-height: 100vh; }
        .back-btn { background: transparent; border: none; color: #555555; font-size: 14px; font-weight: 500; cursor: pointer; display: inline-flex; align-items: center; gap: 8px; margin-bottom: 24px; text-decoration: none; }
        .back-btn:hover { color: #111111; }
        .page-header { margin-bottom: 36px; }
        .page-title { font-size: 36px; font-weight: 800; color: #FA6400; margin-bottom: 8px; }
        .page-subtitle { font-size: 15px; color: #666666; max-width: 650px; line-height: 1.5; }
        .layout-container { display: grid; grid-template-columns: 380px 1fr; gap: 40px; align-items: start; }
        .card { background: #FFFFFF; border: 1px solid #EFEFEF; border-radius: 12px; padding: 24px; box-shadow: 0px 2px 10px rgba(0, 0, 0, 0.02); }
        .form-title { font-size: 20px; font-weight: 700; color: #111111; margin-bottom: 20px; }
        .form-group { margin-bottom: 18px; }
        .form-label { display: block; font-size: 13px; font-weight: 600; color: #333333; margin-bottom: 6px; }
        .form-input, .form-textarea { width: 100%; padding: 12px 14px; border: 1px solid #E2E2E0; border-radius: 8px; font-size: 14px; outline: none; transition: border-color 0.2s; background-color: #FFFFFF; }
        .form-input:focus, .form-textarea:focus { border-color: #FA6400; }
        .form-textarea { resize: vertical; height: 100px; }
        .btn-submit { width: 100%; background-color: #FA6400; color: #FFFFFF; border: none; padding: 14px; border-radius: 8px; font-size: 14px; font-weight: 700; cursor: pointer; display: flex; align-items: center; justify-content: center; gap: 6px; margin-top: 10px; transition: background 0.2s; }
        .btn-submit:hover { background-color: #E05500; }
        .tiers-header { display: flex; align-items: center; justify-content: space-between; margin-bottom: 20px; }
        .tiers-title { font-size: 22px; font-weight: 700; color: #111111; }
        .badge-active { background-color: #EFEFEF; color: #555555; font-size: 12px; font-weight: 600; padding: 4px 12px; border-radius: 12px; }
        .tier-list { display: flex; flex-direction: column; gap: 20px; }
        .tier-card { background: #FFFFFF; border: 1px solid #EFEFEF; border-left: 5px solid #FA6400; border-radius: 12px; padding: 24px; box-shadow: 0px 2px 10px rgba(0, 0, 0, 0.02); }
        .tier-card-top { display: flex; justify-content: space-between; align-items: flex-start; margin-bottom: 8px; }
        .tier-price { font-size: 24px; font-weight: 800; color: #FA6400; }
        .tier-actions { display: flex; gap: 12px; }
        .icon-btn { background: transparent; border: none; cursor: pointer; color: #666666; padding: 2px; }
        .icon-btn svg { width: 18px; height: 18px; }
        .tier-name { font-size: 18px; font-weight: 700; color: #111111; margin-bottom: 12px; }
        .tier-desc { font-size: 14px; color: #555555; line-height: 1.5; margin-bottom: 20px; }
        .tier-delivery { display: flex; align-items: center; gap: 6px; font-size: 12px; color: #666666; font-weight: 500; }
        .tier-delivery svg { width: 14px; height: 14px; fill: #666666; }
        
        /* Validation Error Messaging Style */
        .error-msg { color: #D93025; font-size: 12px; margin-top: 4px; display: block; font-weight: 500; }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <a href="javascript:history.back()" class="back-btn">&larr; Back to Previous Page</a>

        <div class="page-header">
            <h1 class="page-title">Build Reward Tiers</h1>
            <p class="page-subtitle">Create compelling reward tiers to incentivize backers. Clearly define what they get for their support.</p>
        </div>

        <div class="layout-container">
            <div class="card">
                <h2 class="form-title">New Reward Tier</h2>

                <!-- Minimum Pledge -->
                <div class="form-group">
                    <label class="form-label">Minimum Pledge (&#x20B9;)</label>
                    <asp:TextBox ID="txtPledgeAmount" runat="server" CssClass="form-input" Placeholder="1000"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvPledge" runat="server" ControlToValidate="txtPledgeAmount"
                        ErrorMessage="Minimum pledge is required." CssClass="error-msg" Display="Dynamic" />
                    <asp:RangeValidator ID="rvPledge" runat="server" ControlToValidate="txtPledgeAmount"
                        Type="Integer" MinimumValue="1" MaximumValue="1000000" ErrorMessage="Enter a valid amount (minimum 1)."
                        CssClass="error-msg" Display="Dynamic" />
                </div>

                <!-- Tier Title -->
                <div class="form-group">
                    <label class="form-label">Tier Title</label>
                    <asp:TextBox ID="txtTierTitle" runat="server" CssClass="form-input" Placeholder="e.g., Early Bird Special"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvTitle" runat="server" ControlToValidate="txtTierTitle"
                        ErrorMessage="Tier title is required." CssClass="error-msg" Display="Dynamic" />
                </div>

                <!-- Description -->
                <div class="form-group">
                    <label class="form-label">Description</label>
                    <asp:TextBox ID="txtDescription" runat="server" TextMode="MultiLine" CssClass="form-textarea" Placeholder="Detail the rewards included in this tier..."></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvDesc" runat="server" ControlToValidate="txtDescription"
                        ErrorMessage="Description is required." CssClass="error-msg" Display="Dynamic" />
                </div>

                <!-- Estimated Delivery -->
                <div class="form-group">
                    <label class="form-label">Estimated Delivery</label>
                    <asp:TextBox ID="txtDelivery" runat="server" CssClass="form-input" Placeholder="Dec 2025"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvDelivery" runat="server" ControlToValidate="txtDelivery"
                        ErrorMessage="Estimated delivery is required." CssClass="error-msg" Display="Dynamic" />
                </div>

                <asp:Button ID="btnAddTier" runat="server" Text="+ Add Reward Tier" CssClass="btn-submit" OnClick="btnAddTier_Click" />
            </div>

            <div>
                <div class="tiers-header">
                    <h2 class="tiers-title">Existing Tiers</h2>
                    <span class="badge-active">2 Active</span>
                </div>

                <div class="tier-list">
                    <div class="tier-card">
                        <div class="tier-card-top">
                            <div class="tier-price">&#x20B9; 2,500</div>
                            <div class="tier-actions">
                                <button type="button" class="icon-btn" title="Edit">
                                    <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path d="M12 20h9"></path><path d="M16.5 3.5a2.121 2.121 0 0 1 3 3L7 19l-4 1 1-4L16.5 3.5z"></path></svg>
                                </button>
                                <button type="button" class="icon-btn" title="Delete">
                                    <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><polyline points="3 6 5 6 21 6"></polyline><path d="M19 6v14a2 2 0 0 1-2 2H7a2 2 0 0 1-2-2V6m3 0V4a2 2 0 0 1 2-2h4a2 2 0 0 1 2 2v2"></path></svg>
                                </button>
                            </div>
                        </div>
                        <div class="tier-name">Supporter Pack</div>
                        <div class="tier-desc">Get a digital shoutout, exclusive project updates, and a handwritten thank you note from the founders.</div>
                        <div class="tier-delivery">
                            <svg viewBox="0 0 24 24"><path d="M19 4h-1V2h-2v2H8V2H6v2H5c-1.11 0-1.99.9-1.99 2L3 20c0 1.1.89 2 2 2h14c1.1 0 2-.9 2-2V6c0-1.1-.9-2-2-2zm0 16H5V10h14v10zm0-12H5V6h14v2z"/></svg>
                            Est. Delivery: Dec 2024
                        </div>
                    </div>

                    <div class="tier-card">
                        <div class="tier-card-top">
                            <div class="tier-price">&#x20B9; 10,000</div>
                            <div class="tier-actions">
                                <button type="button" class="icon-btn" title="Edit">
                                    <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path d="M12 20h9"></path><path d="M16.5 3.5a2.121 2.121 0 0 1 3 3L7 19l-4 1 1-4L16.5 3.5z"></path></svg>
                                </button>
                                <button type="button" class="icon-btn" title="Delete">
                                    <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><polyline points="3 6 5 6 21 6"></polyline><path d="M19 6v14a2 2 0 0 1-2 2H7a2 2 0 0 1-2-2V6m3 0V4a2 2 0 0 1 2-2h4a2 2 0 0 1 2 2v2"></path></svg>
                                </button>
                            </div>
                        </div>
                        <div class="tier-name">Early Adopter Bundle</div>
                        <div class="tier-desc">Everything in the Supporter Pack, plus the first generation physical product and an invitation to our launch event.</div>
                        <div class="tier-delivery">
                            <svg viewBox="0 0 24 24"><path d="M19 4h-1V2h-2v2H8V2H6v2H5c-1.11 0-1.99.9-1.99 2L3 20c0 1.1.89 2 2 2h14c1.1 0 2-.9 2-2V6c0-1.1-.9-2-2-2zm0 16H5V10h14v10zm0-12H5V6h14v2z"/></svg>
                            Est. Delivery: Feb 2025
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>
</body>
</html>