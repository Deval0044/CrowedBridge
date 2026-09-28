<%@ Page Title="Sign In" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="CrowedBridge.Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="min-h-screen bg-gray-50 flex flex-col justify-between pb-8">
        
        <!-- Back Navigation -->
        <div class="max-w-7xl mx-auto w-full px-6 py-4">
            <a href="Default.aspx" class="text-xs font-semibold text-gray-600 hover:text-gray-900 flex items-center gap-1.5 transition">
                ← Back to Home
            </a>
        </div>

        <!-- Center Login Card -->
        <div class="max-w-md w-full mx-auto px-4 my-auto">
            <div class="bg-white rounded-3xl border border-gray-200/80 shadow-xl p-8 sm:p-10 space-y-6">
                
                <div class="text-center space-y-1">
                    <h1 class="text-3xl font-extrabold text-gray-900 tracking-tight">Welcome Back</h1>
                    <p class="text-xs text-gray-500">Sign in to your CrowdBridge account.</p>
                </div>

                <!-- Role Selector Tabs -->
                <div class="grid grid-cols-3 gap-1 bg-gray-100 p-1.5 rounded-2xl">
                    <asp:Button ID="btnRoleBacker" runat="server" Text="Backer" OnClick="SelectRole_Click" CommandArgument="Backer" CausesValidation="false" UseSubmitBehavior="false" />
                    <asp:Button ID="btnRoleCreator" runat="server" Text="Creator" OnClick="SelectRole_Click" CommandArgument="Creator" CausesValidation="false" UseSubmitBehavior="false" />
                    <asp:Button ID="btnRoleAdmin" runat="server" Text="Admin" OnClick="SelectRole_Click" CommandArgument="Admin" CausesValidation="false" UseSubmitBehavior="false" />
                </div>

                <asp:HiddenField ID="hfSelectedRole" runat="server" Value="Backer" />

                <div class="space-y-4">
                    <!-- Email Address -->
                    <div>
                        <label class="block text-xs font-bold text-gray-800 mb-1">Email Address</label>
                        <asp:TextBox ID="txtEmail" runat="server" CssClass="w-full px-4 py-2.5 border border-gray-300 rounded-xl text-sm focus:ring-2 focus:ring-orange-500 focus:outline-none placeholder-gray-300" placeholder="you@example.com"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvEmail" runat="server" ControlToValidate="txtEmail" ErrorMessage="Please enter your email" CssClass="text-xs text-red-600 font-bold mt-1 block" Display="Dynamic"></asp:RequiredFieldValidator>
                    </div>

                    <!-- Password -->
                    <div>
                        <div class="flex justify-between items-center mb-1">
                            <label class="block text-xs font-bold text-gray-800">Password</label>
                            <a href="#" class="text-xs text-orange-600 hover:underline font-medium">Forgot password?</a>
                        </div>
                        <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" CssClass="w-full px-4 py-2.5 border border-gray-300 rounded-xl text-sm focus:ring-2 focus:ring-orange-500 focus:outline-none placeholder-gray-300" placeholder="••••••••"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvPassword" runat="server" ControlToValidate="txtPassword" ErrorMessage="Please enter your password" CssClass="text-xs text-red-600 font-bold mt-1 block" Display="Dynamic"></asp:RequiredFieldValidator>
                    </div>

                    <!-- Sign In Button -->
                    <div class="pt-2">
                        <asp:Button ID="btnSignIn" runat="server" Text="Sign In ➔" OnClick="btnSignIn_Click" CssClass="w-full py-3 px-4 bg-orange-500 hover:bg-orange-600 text-white font-bold text-sm rounded-xl shadow-md transition cursor-pointer" />
                    </div>
                </div>

                <!-- Footer link to Register -->
                <div class="text-center pt-2">
                    <p class="text-xs text-gray-600">
                        Don't have an account? 
                        <a href="Register.aspx" class="text-orange-600 font-bold hover:underline">Register New Account</a>
                    </p>
                </div>

            </div>
        </div>

        <!-- Figma Bottom Branding Footer -->
        <div class="border-t border-gray-200 bg-white py-6 mt-12">
            <div class="max-w-7xl mx-auto px-6 flex flex-col md:flex-row justify-between items-center gap-4">
                <div>
                    <span class="text-lg font-black text-amber-900">CrowdBridge</span>
                    <p class="text-xs text-gray-500 mt-0.5">© 2026 CrowdBridge India. Empowering communities together.</p>
                </div>
                <div class="flex items-center gap-6 text-xs text-gray-600 font-medium">
                    <a href="#" class="hover:text-gray-900">Support</a>
                    <a href="#" class="hover:text-gray-900">About Us</a>
                </div>
            </div>
        </div>

    </div>
</asp:Content>