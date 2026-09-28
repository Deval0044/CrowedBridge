<%@ Page Title="Home" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="CrowedBridge.Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="bg-gradient-to-r from-orange-600 to-amber-600 text-white py-16 px-4">
        <div class="max-w-7xl mx-auto text-center space-y-4">
            <h1 class="text-4xl md:text-5xl font-black tracking-tight">Support High-Impact Grassroots Projects</h1>
            <p class="text-orange-100 max-w-2xl mx-auto text-sm md:text-base">Empowering social innovators, local artisans, and community leaders across India.</p>
            <div class="pt-2">
                <asp:HyperLink ID="hlStartCampaign" runat="server" NavigateUrl="~/Register.aspx" CssClass="bg-white text-orange-600 font-bold px-6 py-3 rounded-xl shadow-md hover:bg-orange-50 text-sm inline-block">Start a Campaign</asp:HyperLink>
            </div>
        </div>
    </div>

    <div class="max-w-7xl mx-auto px-4 py-12">
        <div class="flex justify-between items-center mb-8">
            <div>
                <h2 class="text-2xl font-black text-gray-900">Featured Campaigns</h2>
                <p class="text-xs text-gray-500">Explore active funding initiatives verified by platform admins.</p>
            </div>
        </div>

        <asp:Repeater ID="rptCampaigns" runat="server">
            <HeaderTemplate>
                <div class="grid grid-cols-1 md:grid-cols-3 gap-6">
            </HeaderTemplate>
            <ItemTemplate>
                <div class="bg-white rounded-2xl border border-gray-200 overflow-hidden shadow-sm hover:shadow-md transition">
                    <div class="p-6 space-y-4">
                        <span class="inline-block bg-orange-100 text-orange-800 text-xs font-bold px-2.5 py-1 rounded-full"><%# Eval("Category") %></span>
                        <h3 class="text-lg font-bold text-gray-900 line-clamp-1"><%# Eval("Title") %></h3>
                        <p class="text-xs text-gray-600 line-clamp-2"><%# Eval("Description") %></p>
                        
                        <div class="space-y-1">
                            <div class="flex justify-between text-xs font-bold">
                                <span class="text-orange-600"><%# Eval("Raised") %> Raised</span>
                                <span class="text-gray-500"><%# Eval("Progress") %>%</span>
                            </div>
                            <div class="w-full bg-gray-200 rounded-full h-2">
                                <div class="bg-orange-600 h-2 rounded-full" style='<%# "width: " + Eval("Progress") + "%;" %>'></div>
                            </div>
                        </div>

                        <div class="pt-2 flex justify-between items-center text-xs text-gray-500 border-t border-gray-100">
                            <span>By <strong><%# Eval("Creator") %></strong></span>
                            <a href="#" class="font-bold text-orange-600 hover:underline">View Project →</a>
                        </div>
                    </div>
                </div>
            </ItemTemplate>
            <FooterTemplate>
                </div>
            </FooterTemplate>
        </asp:Repeater>
    </div>
</asp:Content>