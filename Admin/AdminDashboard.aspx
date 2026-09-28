<%@ Page Title="Platform Admin Panel" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AdminDashboard.aspx.cs" Inherits="CrowdBridge.AdminDashboard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div style="background-color: #f8fafc; min-height: 100vh; font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Helvetica, Arial, sans-serif; padding-bottom: 40px;">
        
        <!-- Top Navigation Bar -->
        <div style="background-color: #ffffff; border-bottom: 1px solid #e2e8f0; padding: 14px 48px; display: flex; align-items: center; justify-content: space-between;">
            <div style="display: flex; align-items: center; gap: 8px;">
                <span style="font-weight: 900; font-size: 22px; color: #7c2d12; letter-spacing: -0.02em;">CrowdBridge</span>
                <span style="background-color: #ffedd5; color: #c2410c; font-size: 11px; font-weight: 700; padding: 2px 10px; border-radius: 12px;">Admin</span>
            </div>

            <div style="display: flex; align-items: center; gap: 20px;">
                <a href="../Explore.aspx" style="text-decoration: none; color: #475569; font-size: 13px; font-weight: 500;">Explore Projects</a>
                
                <div style="background-color: #f3e8ff; border: 1px solid #e9d5ff; border-radius: 20px; padding: 6px 14px; display: flex; align-items: center; gap: 6px;">
                    <span style="width: 7px; height: 7px; background-color: #7e22ce; border-radius: 50%; display: inline-block;"></span>
                    <asp:Label ID="lblAdminName" runat="server" Text="Hi, devalsonagara01 (Admin)" style="color: #6b21a8; font-size: 13px; font-weight: 700;"></asp:Label>
                </div>

                <a href="AdminDashboard.aspx" style="background-color: #f3e8ff; color: #7e22ce; text-decoration: none; font-size: 13px; font-weight: 700; padding: 6px 16px; border-radius: 8px;">Admin Panel</a>

                <asp:LinkButton ID="btnSignOut" runat="server" OnClick="btnSignOut_Click" style="border: 1px solid #fca5a5; color: #dc2626; text-decoration: none; font-size: 13px; font-weight: 700; padding: 6px 16px; border-radius: 8px; background: transparent;">Sign Out</asp:LinkButton>
            </div>
        </div>

        <!-- Dashboard Body Content -->
        <div style="max-width: 1140px; margin: 36px auto 0 auto; padding: 0 16px;">
            
            <!-- Page Heading Section -->
            <div style="display: flex; justify-content: space-between; align-items: flex-start; margin-bottom: 28px;">
                <div>
                    <h1 style="font-size: 30px; font-weight: 900; color: #0f172a; margin: 0 0 6px 0; letter-spacing: -0.02em;">Platform Admin Panel</h1>
                    <p style="font-size: 13px; color: #64748b; margin: 0;">Review campaign approvals, platform health metrics, and user controls.</p>
                </div>
                <div>
                    <span style="background-color: #f3e8ff; color: #6b21a8; font-size: 12px; font-weight: 700; padding: 8px 18px; border-radius: 20px; display: inline-block;">System Administrator</span>
                </div>
            </div>

            <!-- Stats Metric Cards Grid -->
            <div style="display: grid; grid-template-columns: repeat(4, 1fr); gap: 18px; margin-bottom: 32px;">
                <div style="background: #ffffff; border: 1px solid #e2e8f0; border-radius: 14px; padding: 22px 20px; box-shadow: 0 1px 3px rgba(0,0,0,0.02);">
                    <div style="font-size: 11px; font-weight: 700; color: #94a3b8; text-transform: uppercase; letter-spacing: 0.05em; margin-bottom: 8px;">Total Campaigns</div>
                    <div style="font-size: 24px; font-weight: 900; color: #0f172a;">24 Active</div>
                </div>

                <div style="background: #ffffff; border: 1px solid #e2e8f0; border-radius: 14px; padding: 22px 20px; box-shadow: 0 1px 3px rgba(0,0,0,0.02);">
                    <div style="font-size: 11px; font-weight: 700; color: #94a3b8; text-transform: uppercase; letter-spacing: 0.05em; margin-bottom: 8px;">Pending Approvals</div>
                    <div style="font-size: 24px; font-weight: 900; color: #ea580c;">
                        <asp:Label ID="lblPendingCount" runat="server" Text="3 Pending"></asp:Label>
                    </div>
                </div>

                <div style="background: #ffffff; border: 1px solid #e2e8f0; border-radius: 14px; padding: 22px 20px; box-shadow: 0 1px 3px rgba(0,0,0,0.02);">
                    <div style="font-size: 11px; font-weight: 700; color: #94a3b8; text-transform: uppercase; letter-spacing: 0.05em; margin-bottom: 8px;">Total Volume</div>
                    <div style="font-size: 24px; font-weight: 900; color: #059669;">₹80.9 Lakhs</div>
                </div>

                <div style="background: #ffffff; border: 1px solid #e2e8f0; border-radius: 14px; padding: 22px 20px; box-shadow: 0 1px 3px rgba(0,0,0,0.02);">
                    <div style="font-size: 11px; font-weight: 700; color: #94a3b8; text-transform: uppercase; letter-spacing: 0.05em; margin-bottom: 8px;">Registered Users</div>
                    <div style="font-size: 24px; font-weight: 900; color: #2563eb;">1,250 Users</div>
                </div>
            </div>

            <!-- Campaign Approvals Table Card -->
            <div style="background: #ffffff; border: 1px solid #e2e8f0; border-radius: 16px; overflow: hidden; box-shadow: 0 1px 3px rgba(0,0,0,0.02);">
                <div style="padding: 20px 24px; border-bottom: 1px solid #f1f5f9;">
                    <h2 style="font-size: 15px; font-weight: 800; color: #0f172a; margin: 0;">Campaigns Awaiting Approval</h2>
                </div>

                <asp:GridView ID="gvPendingCampaigns" runat="server" AutoGenerateColumns="False" 
                    OnRowCommand="gvPendingCampaigns_RowCommand" GridLines="None" Width="100%"
                    style="border-collapse: collapse;">
                    <HeaderStyle style="background-color: #fafafa; color: #64748b; font-size: 11px; font-weight: 700; text-transform: uppercase; text-align: left; padding: 14px 24px; border-bottom: 1px solid #f1f5f9;" />
                    <RowStyle style="border-bottom: 1px solid #f1f5f9; font-size: 13px;" />
                    <Columns>
                        <asp:BoundField DataField="ID" HeaderText="ID" ItemStyle-style="padding: 18px 24px; color: #94a3b8; font-weight: 600;" />
                        <asp:BoundField DataField="Title" HeaderText="CAMPAIGN TITLE" ItemStyle-style="padding: 18px 24px; color: #0f172a; font-weight: 800;" />
                        <asp:BoundField DataField="Creator" HeaderText="CREATOR NAME" ItemStyle-style="padding: 18px 24px; color: #475569;" />
                        <asp:BoundField DataField="Category" HeaderText="CATEGORY" ItemStyle-style="padding: 18px 24px; color: #475569;" />
                        <asp:BoundField DataField="Goal" HeaderText="TARGET GOAL" ItemStyle-style="padding: 18px 24px; color: #0f172a; font-weight: 800;" />
                        
                        <asp:TemplateField HeaderText="ACTION" ItemStyle-style="padding: 18px 24px;">
                            <ItemTemplate>
                                <div style="display: flex; gap: 8px;">
                                    <asp:Button ID="btnApprove" runat="server" CommandName="ApproveCampaign" CommandArgument='<%# Eval("ID") %>' Text="Approve" style="background-color: #059669; color: #ffffff; border: none; padding: 8px 16px; border-radius: 8px; font-size: 12px; font-weight: 700; cursor: pointer;" />
                                    <asp:Button ID="btnReject" runat="server" CommandName="RejectCampaign" CommandArgument='<%# Eval("ID") %>' Text="Reject" style="background-color: #dc2626; color: #ffffff; border: none; padding: 8px 16px; border-radius: 8px; font-size: 12px; font-weight: 700; cursor: pointer;" />
                                </div>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </div>

            <!-- Page Footer -->
            <div style="text-align: center; margin-top: 48px;">
                <p style="font-size: 12px; color: #94a3b8; margin: 0;">© 2026 CrowdBridge India. All rights reserved.</p>
            </div>

        </div>
    </div>
</asp:Content>