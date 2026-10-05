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
            color: #333333;
            min-height: 100vh;
            display: flex;
            flex-direction: column;
        }

        /* Top Navigation Link */
        .top-nav {
            padding: 24px 48px;
        }

        .back-link {
            text-decoration: none;
            color: #444444;
            font-size: 14px;
            font-weight: 600;
            display: inline-flex;
            align-items: center;
            gap: 8px;
        }

        .back-link:hover {
            color: #111111;
        }

        /* Center Wrapper */
        .page-center {
            flex: 1;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            padding: 20px;
            margin-top: -30px;
        }

        /* Success Card */
        .success-card {
            background: #FFFFFF;
            width: 100%;
            max-width: 520px;
            border-radius: 16px;
            border: 1px solid #EFEFEF;
            box-shadow: 0px 4px 20px rgba(0, 0, 0, 0.03);
            padding: 40px 32px 32px;
            text-align: center;
        }

        /* Check Icon Circle */
        .icon-circle {
            width: 64px;
            height: 64px;
            background-color: #FFF2EA;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            margin: 0 auto 24px;
        }

        .check-mark {
            width: 32px;
            height: 32px;
            background-color: #FA6400;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            color: #FFFFFF;
            font-size: 18px;
            font-weight: 800;
        }

        /* Headings */
        .card-title {
            font-size: 28px;
            font-weight: 800;
            color: #111111;
            margin-bottom: 8px;
        }

        .card-subtitle {
            font-size: 14px;
            color: #666666;
            margin-bottom: 28px;
        }

        /* Receipt Box Table */
        .receipt-box {
            background-color: #F8F8F6;
            border-radius: 12px;
            padding: 12px 20px;
            margin-bottom: 28px;
        }

        .receipt-row {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 12px 0;
        }

        .receipt-label {
            font-size: 13px;
            color: #555555;
            font-weight: 500;
        }

        .receipt-value {
            font-size: 13px;
            color: #111111;
            font-weight: 600;
        }

        .receipt-amount {
            font-size: 22px;
            font-weight: 800;
            color: #B44200;
        }

        /* Download Button */
        .btn-download {
            background-color: #FA6400;
            color: #FFFFFF;
            border: none;
            padding: 14px 24px;
            border-radius: 8px;
            font-size: 14px;
            font-weight: 700;
            cursor: pointer;
            display: inline-flex;
            align-items: center;
            justify-content: center;
            gap: 8px;
            transition: background-color 0.2s ease;
            text-decoration: none;
            width: 100%;
        }

        .btn-download:hover {
            background-color: #e05800;
        }

        /* Email Notice Footer */
        .email-notice {
            margin-top: 24px;
            font-size: 12px;
            color: #777777;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <!-- Top Nav -->
        <nav class="top-nav">
            <a href="AuthenticatedHomepage.aspx" class="back-link">&larr; Back to Dashboard</a>
        </nav>

        <!-- Main Center Area -->
        <div class="page-center">
            <div class="success-card">
                
                <!-- Orange Checkmark Badge -->
                <div class="icon-circle">
                    <div class="check-mark">&#10004;</div>
                </div>

                <!-- Titles -->
                <h1 class="card-title">Pledge Successful!</h1>
                <p class="card-subtitle">Thank you for supporting community initiatives on CrowdBridge.</p>

                <!-- Receipt Details Box -->
                <div class="receipt-box">
                    <div class="receipt-row">
                        <span class="receipt-label">Transaction ID</span>
                        <asp:Label ID="lblTransactionID" runat="server" CssClass="receipt-value" Text="#TXN-90812"></asp:Label>
                    </div>

                    <div class="receipt-row">
                        <span class="receipt-label">Date &amp; Time</span>
                        <asp:Label ID="lblDateTime" runat="server" CssClass="receipt-value" Text="Oct 24, 2024, 14:30 IST"></asp:Label>
                    </div>

                    <div class="receipt-row">
                        <span class="receipt-label">Amount Paid</span>
                        <asp:Label ID="lblAmountPaid" runat="server" CssClass="receipt-amount" Text="&#x20B9;2,500"></asp:Label>
                    </div>
                </div>

                <!-- Download Receipt Action -->
                <button type="button" class="btn-download" onclick="window.print();">
                    &#128229; Download Receipt (PDF)
                </button>

            </div>

            <!-- Bottom Confirmation Text -->
            <p class="email-notice">A confirmation email has been sent to your registered address.</p>
        </div>
    </form>
</body>
</html>