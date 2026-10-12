<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PledgeSuccess.aspx.cs" Inherits="CrowedBridge.Backers.PledgeSuccess" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Pledge Successful - CrowdBridge</title>
    <style>
        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
            font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, Helvetica, Arial, sans-serif;
        }

        body {
            background-color: #F8F8F6;
            min-height: 100vh;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            padding: 32px 24px;
            position: relative;
        }

        /* Top Left Navigation Link */
        .top-nav {
            position: absolute;
            top: 28px;
            left: 36px;
        }

        .btn-back-dashboard {
            display: inline-flex;
            align-items: center;
            gap: 8px;
            color: #4B5563;
            font-size: 13px;
            font-weight: 600;
            text-decoration: none;
            transition: color 0.2s ease;
        }

        .btn-back-dashboard:hover {
            color: #111827;
        }

        /* Main Card */
        .success-card {
            background: #FFFFFF;
            width: 100%;
            max-width: 520px;
            border-radius: 16px;
            border: 1px solid #EFEFEF;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.02);
            padding: 44px 40px;
            text-align: center;
        }

        /* Success Checkmark Circle */
        .icon-circle {
            width: 60px;
            height: 60px;
            background: #FFF0E6;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            margin: 0 auto 24px auto;
        }

        .check-badge {
            width: 32px;
            height: 32px;
            background: #E85D04;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            color: #FFFFFF;
            font-size: 16px;
            font-weight: 800;
        }

        .success-title {
            font-size: 26px;
            font-weight: 800;
            color: #111827;
            margin-bottom: 8px;
            letter-spacing: -0.3px;
        }

        .success-subtitle {
            font-size: 13px;
            color: #6B7280;
            line-height: 1.5;
            margin-bottom: 28px;
        }

        /* Receipt Box */
        .receipt-box {
            background: #F3F4F6;
            border-radius: 12px;
            padding: 20px 24px;
            margin-bottom: 28px;
            text-align: left;
        }

        .receipt-row {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 10px 0;
        }

        .receipt-row:not(:last-child) {
            border-bottom: 1px solid #E5E7EB;
        }

        .receipt-label {
            font-size: 12px;
            color: #4B5563;
            font-weight: 600;
        }

        .receipt-val {
            font-size: 12px;
            color: #111827;
            font-weight: 700;
        }

        .receipt-amount {
            font-size: 18px;
            font-weight: 800;
            color: #C2410C;
        }

        /* Download Button */
        .btn-download {
            width: 100%;
            max-width: 240px;
            background-color: #E85D04;
            color: #FFFFFF;
            border: none;
            padding: 12px 20px;
            border-radius: 8px;
            font-size: 13px;
            font-weight: 700;
            cursor: pointer;
            display: inline-flex;
            align-items: center;
            justify-content: center;
            gap: 8px;
            transition: background-color 0.2s ease;
        }

        .btn-download:hover {
            background-color: #d05202;
        }

        /* Footer Email Hint */
        .footer-note {
            margin-top: 24px;
            font-size: 11px;
            color: #6B7280;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <!-- Top Navigation -->
        <div class="top-nav">
            <asp:LinkButton ID="btnBackDashboard" runat="server" CssClass="btn-back-dashboard" OnClick="btnBackDashboard_Click">
                &larr; Back to Dashboard
            </asp:LinkButton>
        </div>

        <!-- Success Card -->
        <div class="success-card">
            <div class="icon-circle">
                <div class="check-badge">&#x2713;</div>
            </div>

            <h1 class="success-title">Pledge Successful!</h1>
            <p class="success-subtitle">Thank you for supporting community initiatives on CrowdBridge.</p>

            <div class="receipt-box">
                <div class="receipt-row">
                    <span class="receipt-label">Transaction ID</span>
                    <span class="receipt-val"><asp:Label ID="lblTransactionID" runat="server" Text="#TXN-90812"></asp:Label></span>
                </div>
                <div class="receipt-row">
                    <span class="receipt-label">Date &amp; Time</span>
                    <span class="receipt-val"><asp:Label ID="lblDateTime" runat="server" Text="Oct 24, 2026, 14:30 IST"></asp:Label></span>
                </div>
                <div class="receipt-row">
                    <span class="receipt-label">Amount Paid</span>
                    <span class="receipt-amount">&#x20B9;<asp:Label ID="lblAmount" runat="server" Text="2,500"></asp:Label></span>
                </div>
            </div>

            <button type="button" class="btn-download" onclick="window.print();">
                <svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5"><path d="M21 15v4a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2v-4"></path><polyline points="7 10 12 15 17 10"></polyline><line x1="12" y1="15" x2="12" y2="3"></line></svg>
                Download Receipt (PDF)
            </button>
        </div>

        <div class="footer-note">
            A confirmation email has been sent to your registered address.
        </div>
    </form>
</body>
</html>