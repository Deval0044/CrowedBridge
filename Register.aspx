<%@ Page Title="Create Account" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="CrowedBridge.Register" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="min-h-screen bg-gray-50 flex flex-col justify-between">
        
        <!-- Top Back Navigation -->
        <div class="max-w-7xl mx-auto w-full px-6 py-4">
            <a href="Default.aspx" class="text-xs font-semibold text-gray-600 hover:text-gray-900 flex items-center gap-1.5 transition">
                ← Back to Previous Page
            </a>
        </div>

        <!-- Main Content Area -->
        <div class="max-w-6xl mx-auto w-full px-4 sm:px-6 py-4">
            <div class="grid grid-cols-1 lg:grid-cols-12 bg-white rounded-3xl border border-gray-200/80 shadow-xl overflow-hidden min-h-[620px]">
                
                <!-- Left Banner Image Panel (Figma) -->
                <div class="lg:col-span-6 relative bg-gray-900 flex flex-col justify-end p-10 text-white min-h-[320px] lg:min-h-full">
                    <img src="https://images.unsplash.com/photo-1497366216548-37526070297c?auto=format&fit=crop&w=1200&q=80" alt="Office workspace" class="absolute inset-0 w-full h-full object-cover opacity-60" />
                    <div class="absolute inset-0 bg-gradient-to-t from-black/80 via-black/30 to-transparent"></div>
                    
                    <div class="relative z-10 space-y-3">
                        <h2 class="text-3xl font-black leading-tight tracking-tight">Empowering communities together.</h2>
                        <p class="text-gray-200 text-xs sm:text-sm max-w-md leading-relaxed">
                            Join the leading platform connecting visionary creators with passionate backers across India.
                        </p>
                    </div>
                </div>

                <!-- Right Registration Form Panel -->
                <div class="lg:col-span-6 p-8 sm:p-10 flex flex-col justify-center bg-white">
                    <div class="mb-6">
                        <h1 class="text-3xl font-extrabold text-gray-900 tracking-tight">Create an Account</h1>
                        <p class="text-xs text-gray-500 mt-1">Enter your details to register and get started.</p>
                    </div>

                    <div class="space-y-4">
                        <!-- Full Name -->
                        <div>
                            <label class="block text-xs font-bold text-gray-800 mb-1">Full Name</label>
                            <asp:TextBox ID="txtFullName" runat="server" CssClass="w-full px-4 py-2.5 border border-gray-300 rounded-xl text-sm focus:ring-2 focus:ring-orange-500 focus:outline-none placeholder-gray-300" placeholder="Rahul Sharma"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvFullName" runat="server" ControlToValidate="txtFullName" ErrorMessage="Please enter your full name" CssClass="text-xs text-red-600 font-bold mt-1 block" Display="Dynamic"></asp:RequiredFieldValidator>
                        </div>

                        <!-- Email Address -->
                        <div>
                            <label class="block text-xs font-bold text-gray-800 mb-1">Email Address</label>
                            <asp:TextBox ID="txtRegEmail" runat="server" CssClass="w-full px-4 py-2.5 border border-gray-300 rounded-xl text-sm focus:ring-2 focus:ring-orange-500 focus:outline-none placeholder-gray-300" placeholder="rahul@example.com"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvRegEmail" runat="server" ControlToValidate="txtRegEmail" ErrorMessage="Please enter your email address" CssClass="text-xs text-red-600 font-bold mt-1 block" Display="Dynamic"></asp:RequiredFieldValidator>
                        </div>

                        <!-- Mobile Number -->
                        <div>
                            <label class="block text-xs font-bold text-gray-800 mb-1">Mobile Number</label>
                            <div class="flex">
                                <span class="inline-flex items-center px-3.5 rounded-l-xl border border-r-0 border-gray-300 bg-gray-50 text-gray-500 text-xs font-bold">+91</span>
                                <asp:TextBox ID="txtMobile" runat="server" CssClass="w-full px-4 py-2.5 border border-gray-300 rounded-r-xl text-sm focus:ring-2 focus:ring-orange-500 focus:outline-none placeholder-gray-300" placeholder="98765 43210"></asp:TextBox>
                            </div>
                            <asp:RequiredFieldValidator ID="rfvMobile" runat="server" ControlToValidate="txtMobile" ErrorMessage="Please enter mobile number" CssClass="text-xs text-red-600 font-bold mt-1 block" Display="Dynamic"></asp:RequiredFieldValidator>
                        </div>

                        <!-- Role Selector -->
                        <div>
                            <label class="block text-xs font-bold text-gray-800 mb-1">I want to register as a</label>
                            <asp:DropDownList ID="ddlRole" runat="server" CssClass="w-full px-4 py-2.5 border border-gray-300 rounded-xl text-sm focus:ring-2 focus:ring-orange-500 focus:outline-none bg-white text-gray-700">
                                <asp:ListItem Text="Select your role..." Value="" Selected="True"></asp:ListItem>
                                <asp:ListItem Text="Backer (Support Projects)" Value="Backer"></asp:ListItem>
                                <asp:ListItem Text="Creator (Raise Funds)" Value="Creator"></asp:ListItem>
                                <asp:ListItem Text="Administrator" Value="Admin"></asp:ListItem>
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator ID="rfvRole" runat="server" ControlToValidate="ddlRole" InitialValue="" ErrorMessage="Please select a role" CssClass="text-xs text-red-600 font-bold mt-1 block" Display="Dynamic"></asp:RequiredFieldValidator>
                        </div>

                        <!-- Password Fields Side-by-Side -->
                        <div class="grid grid-cols-1 sm:grid-cols-2 gap-3">
                            <div>
                                <label class="block text-xs font-bold text-gray-800 mb-1">Password</label>
                                <asp:TextBox ID="txtRegPass" runat="server" TextMode="Password" CssClass="w-full px-4 py-2.5 border border-gray-300 rounded-xl text-sm focus:ring-2 focus:ring-orange-500 focus:outline-none placeholder-gray-300" placeholder="••••••••"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rfvRegPass" runat="server" ControlToValidate="txtRegPass" ErrorMessage="Enter password" CssClass="text-xs text-red-600 font-bold mt-1 block" Display="Dynamic"></asp:RequiredFieldValidator>
                            </div>

                            <div>
                                <label class="block text-xs font-bold text-gray-800 mb-1">Confirm Password</label>
                                <asp:TextBox ID="txtConfirmPass" runat="server" TextMode="Password" CssClass="w-full px-4 py-2.5 border border-gray-300 rounded-xl text-sm focus:ring-2 focus:ring-orange-500 focus:outline-none placeholder-gray-300" placeholder="••••••••"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rfvConfirmPass" runat="server" ControlToValidate="txtConfirmPass" ErrorMessage="Confirm password" CssClass="text-xs text-red-600 font-bold mt-1 block" Display="Dynamic"></asp:RequiredFieldValidator>
                                <asp:CompareValidator ID="cvPasswordMatch" runat="server" ControlToValidate="txtConfirmPass" ControlToCompare="txtRegPass" ErrorMessage="Passwords do not match" CssClass="text-xs text-red-600 font-bold mt-1 block" Display="Dynamic"></asp:CompareValidator>
                            </div>
                        </div>

                        <!-- Register Button -->
                        <div class="pt-4">
                            <asp:Button ID="btnRegister" runat="server" Text="Register Account →" OnClick="btnRegister_Click" CssClass="w-full py-3 px-4 bg-orange-500 hover:bg-orange-600 text-white font-bold text-sm rounded-xl shadow-md transition cursor-pointer" />
                        </div>
                    </div>
                </div>

            </div>
        </div>

        <div></div>
    </div>
</asp:Content>