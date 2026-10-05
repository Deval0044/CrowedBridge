<%@ Page Language="C#" AutoEventWireup="true" %>

<!DOCTYPE html>
<script runat="server">
    protected void btnSaveBankDetails_Click(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {
            // Code to save bank details
        }
    }

    protected void btnExport_Click(object sender, EventArgs e)
    {
        // Code to export payout history
    }
</script>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Payout & Local Banking - CrowdBridge</title>
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
            padding: 40px 60px 0 60px;
            min-height: 100vh;
            display: flex;
            flex-direction: column;
            justify-content: space-between;
        }

        .back-btn {
            background: transparent;
            border: none;
            color: #A34E00;
            font-size: 15px;
            font-weight: 700;
            cursor: pointer;
            display: inline-flex;
            align-items: center;
            gap: 8px;
            margin-bottom: 24px;
            text-decoration: none;
        }

        .back-btn:hover {
            color: #7A3B00;
        }

        .page-header {
            margin-bottom: 36px;
        }

        .page-title {
            font-size: 38px;
            font-weight: 800;
            color: #111111;
            margin-bottom: 8px;
        }

        .page-subtitle {
            font-size: 15px;
            color: #666666;
            max-width: 650px;
            line-height: 1.5;
        }

        .layout-container {
            display: grid;
            grid-template-columns: 360px 1fr;
            gap: 30px;
            align-items: start;
            margin-bottom: 60px;
        }

        .card {
            background: #FFFFFF;
            border: 1px solid #EFEFEF;
            border-radius: 12px;
            padding: 24px;
            box-shadow: 0px 2px 10px rgba(0, 0, 0, 0.02);
        }

        .card-header-title {
            font-size: 20px;
            font-weight: 700;
            color: #111111;
            display: flex;
            align-items: center;
            gap: 10px;
            margin-bottom: 24px;
        }

        .card-header-title svg {
            width: 22px;
            height: 22px;
            stroke: #FA6400;
            fill: none;
            stroke-width: 2;
        }

        .form-group {
            margin-bottom: 18px;
        }

        .form-label {
            display: block;
            font-size: 13px;
            font-weight: 600;
            color: #333333;
            margin-bottom: 6px;
        }

        .form-input {
            width: 100%;
            padding: 12px 14px;
            border: 1px solid #E2E2E0;
            border-radius: 8px;
            font-size: 14px;
            outline: none;
            transition: border-color 0.2s;
            background-color: #FFFFFF;
            color: #333333;
        }

        .form-input::placeholder {
            color: #A0A0A0;
        }

        .form-input:focus {
            border-color: #FA6400;
        }

        .btn-submit {
            width: 100%;
            background-color: #FA6400;
            color: #FFFFFF;
            border: none;
            padding: 14px;
            border-radius: 8px;
            font-size: 14px;
            font-weight: 700;
            cursor: pointer;
            margin-top: 10px;
            transition: background 0.2s;
        }

        .btn-submit:hover {
            background-color: #E05500;
        }

        .info-card {
            background-color: #F1F1EF;
            border-radius: 12px;
            padding: 18px;
            margin-top: 20px;
            display: flex;
            gap: 12px;
            align-items: flex-start;
        }

        .info-card svg {
            width: 20px;
            height: 20px;
            stroke: #666666;
            fill: none;
            stroke-width: 2;
            flex-shrink: 0;
            margin-top: 2px;
        }

        .info-card p {
            font-size: 13px;
            color: #555555;
            line-height: 1.5;
        }

        .history-top {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 24px;
        }

        .btn-export {
            background: #FFFFFF;
            border: 1px solid #E2E2E0;
            padding: 8px 16px;
            border-radius: 6px;
            font-size: 13px;
            font-weight: 600;
            color: #333333;
            cursor: pointer;
            display: flex;
            align-items: center;
            gap: 6px;
            text-decoration: none;
        }

        .btn-export:hover {
            background: #F8F8F6;
        }

        .btn-export svg {
            width: 14px;
            height: 14px;
            stroke: #333333;
            fill: none;
            stroke-width: 2;
        }

        .history-table {
            width: 100%;
            border-collapse: collapse;
        }

        .history-table th {
            text-align: left;
            font-size: 13px;
            font-weight: 600;
            color: #555555;
            padding-bottom: 16px;
            border-bottom: 1px solid #EFEFEF;
        }

        .history-table td {
            padding: 18px 0;
            font-size: 14px;
            color: #333333;
            border-bottom: 1px solid #F4F4F2;
        }

        .history-table tr:last-child td {
            border-bottom: none;
        }

        .amount-col {
            font-weight: 700;
        }

        .utr-col {
            color: #666666;
            font-size: 13px;
        }

        .status-badge {
            display: inline-flex;
            align-items: center;
            gap: 6px;
            padding: 4px 10px;
            border-radius: 6px;
            font-size: 12px;
            font-weight: 600;
        }

        .status-processed {
            background-color: #E6F7ED;
            color: #0D8A43;
            border: 1px solid #B8E9CA;
        }

        .status-initiated {
            background-color: #FFF4E5;
            color: #D97706;
            border: 1px solid #FCD34D;
        }

        .status-badge svg {
            width: 12px;
            height: 12px;
        }

        .footer {
            border-top: 1px solid #EFEFEF;
            padding: 30px 0;
            display: flex;
            justify-content: space-between;
            align-items: center;
            background: transparent;
            margin-top: auto;
        }

        .footer-brand {
            font-size: 20px;
            font-weight: 800;
            color: #A34E00;
            margin-bottom: 6px;
        }

        .footer-copy {
            font-size: 13px;
            color: #666666;
        }

        .footer-links {
            display: flex;
            gap: 20px;
        }

        .footer-links a {
            color: #555555;
            text-decoration: none;
            font-size: 14px;
            font-weight: 500;
        }

        .footer-links a:hover {
            color: #111111;
        }

        .error-msg {
            color: #D93025;
            font-size: 12px;
            margin-top: 4px;
            display: block;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <a href="javascript:history.back()" class="back-btn">&larr; Back to Creator Dashboard</a>

            <div class="page-header">
                <h1 class="page-title">Payout & Local Banking</h1>
                <p class="page-subtitle">Manage your bank accounts and view payout history for your CrowdBridge campaigns.</p>
            </div>

            <div class="layout-container">
                <div>
                    <div class="card">
                        <div class="card-header-title">
                            <svg viewBox="0 0 24 24"><path d="M3 21h18M3 10h18M5 10v11M9 10v11M15 10v11M19 10v11M12 3L2 10h20L12 3z"></path></svg>
                            Bank Details
                        </div>

                        <div class="form-group">
                            <label class="form-label">Account Holder Name</label>
                            <asp:TextBox ID="txtHolderName" runat="server" CssClass="form-input" Placeholder="John Doe"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvHolder" runat="server" ControlToValidate="txtHolderName"
                                ErrorMessage="Account holder name is required." CssClass="error-msg" Display="Dynamic" />
                        </div>

                        <div class="form-group">
                            <label class="form-label">Bank Name</label>
                            <asp:TextBox ID="txtBankName" runat="server" CssClass="form-input" Placeholder="State Bank of India"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvBank" runat="server" ControlToValidate="txtBankName"
                                ErrorMessage="Bank name is required." CssClass="error-msg" Display="Dynamic" />
                        </div>

                        <div class="form-group">
                            <label class="form-label">Account Number</label>
                            <asp:TextBox ID="txtAccountNumber" runat="server" CssClass="form-input" Placeholder="123456789012"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvAccount" runat="server" ControlToValidate="txtAccountNumber"
                                ErrorMessage="Account number is required." CssClass="error-msg" Display="Dynamic" />
                        </div>

                        <div class="form-group">
                            <label class="form-label">IFSC Code</label>
                            <asp:TextBox ID="txtIFSC" runat="server" CssClass="form-input" Placeholder="SBIN0001234"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvIFSC" runat="server" ControlToValidate="txtIFSC"
                                ErrorMessage="IFSC code is required." CssClass="error-msg" Display="Dynamic" />
                        </div>

                        <asp:Button ID="btnSaveBankDetails" runat="server" Text="Save Bank Details" CssClass="btn-submit" OnClick="btnSaveBankDetails_Click" />
                    </div>

                    <div class="info-card">
                        <svg viewBox="0 0 24 24"><circle cx="12" cy="12" r="10"></circle><line x1="12" y1="16" x2="12" y2="12"></line><line x1="12" y1="8" x2="12.01" y2="8"></line></svg>
                        <p>Payouts are processed weekly. Ensure your IFSC code is correct to avoid delays in transferring funds to your local bank.</p>
                    </div>
                </div>

                <div class="card">
                    <div class="history-top">
                        <div class="card-header-title" style="margin-bottom: 0;">
                            <svg viewBox="0 0 24 24"><path d="M12 8v4l3 3m6-3a9 9 0 11-18 0 9 9 0 0118 0z"></path></svg>
                            Payout History
                        </div>
                        <asp:LinkButton ID="btnExport" runat="server" CssClass="btn-export" OnClick="btnExport_Click">
                            <svg viewBox="0 0 24 24"><path d="M21 15v4a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2v-4"></path><polyline points="7 10 12 15 17 10"></polyline><line x1="12" y1="15" x2="12" y2="3"></line></svg>
                            Export
                        </asp:LinkButton>
                    </div>

                    <table class="history-table">
                        <thead>
                            <tr>
                                <th>Date</th>
                                <th>Amount (&#x20B9;)</th>
                                <th>UTR Reference</th>
                                <th>Status</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>24 Oct, 2024</td>
                                <td class="amount-col">&#x20B9;1,25,000</td>
                                <td class="utr-col">HDFC0001234567</td>
                                <td>
                                    <span class="status-badge status-processed">
                                        <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="3"><polyline points="20 6 9 17 4 12"></polyline></svg>
                                        Processed
                                    </span>
                                </td>
                            </tr>
                            <tr>
                                <td>17 Oct, 2024</td>
                                <td class="amount-col">&#x20B9;75,500</td>
                                <td class="utr-col">HDFC0009876543</td>
                                <td>
                                    <span class="status-badge status-processed">
                                        <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="3"><polyline points="20 6 9 17 4 12"></polyline></svg>
                                        Processed
                                    </span>
                                </td>
                            </tr>
                            <tr>
                                <td>10 Oct, 2024</td>
                                <td class="amount-col">&#x20B9;2,10,000</td>
                                <td class="utr-col">Pending. . .</td>
                                <td>
                                    <span class="status-badge status-initiated">
                                        <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="3"><circle cx="12" cy="12" r="10"></circle><polyline points="12 6 12 12 16 14"></polyline></svg>
                                        Initiated
                                    </span>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>

        <div class="footer">
            <div>
                <div class="footer-brand">CrowdBridge</div>
                <div class="footer-copy">&copy; 2024 CrowdBridge India. Empowering communities together.</div>
            </div>
            <div class="footer-links">
                <a href="#">Support</a>
                <a href="#">About Us</a>
            </div>
        </div>
    </form>
</body>
</html>