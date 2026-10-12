<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PledgeModal.aspx.cs" Inherits="CrowedBridge.Backers.PledgeModal" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Complete Your Pledge - CrowdBridge</title>
    <style>
        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
            font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, Helvetica, Arial, sans-serif;
        }

        body {
            background-color: #8C929D;
            min-height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 24px;
        }

        .modal-card {
            background: #FFFFFF;
            width: 100%;
            max-width: 480px;
            border-radius: 12px;
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.15);
            overflow: hidden;
        }

        /* Modal Header */
        .modal-header {
            padding: 20px 24px;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .modal-title {
            font-size: 18px;
            font-weight: 700;
            color: #111827;
        }

        .close-btn {
            font-size: 18px;
            color: #4B5563;
            text-decoration: none;
            line-height: 1;
            font-weight: 600;
        }

        .modal-body {
            padding: 0 24px 24px 24px;
        }

        /* Selected Tier Header Box */
        .tier-summary-box {
            background: #F8F8F8;
            border-radius: 8px;
            padding: 16px 20px;
            margin-bottom: 24px;
            display: flex;
            justify-content: space-between;
            align-items: flex-start;
        }

        .tier-label {
            font-size: 10px;
            font-weight: 700;
            color: #E85D04;
            letter-spacing: 0.5px;
            text-transform: uppercase;
            margin-bottom: 4px;
        }

        .tier-title {
            font-size: 13px;
            font-weight: 700;
            color: #111827;
            margin-bottom: 6px;
        }

        .tier-sub {
            font-size: 11px;
            color: #6B7280;
            line-height: 1.45;
            max-width: 290px;
        }

        .tier-amount {
            font-size: 20px;
            font-weight: 800;
            color: #111827;
        }

        /* Form Controls */
        .form-group {
            margin-bottom: 20px;
        }

        .field-label {
            font-size: 12px;
            font-weight: 700;
            color: #111827;
            margin-bottom: 8px;
            display: block;
        }

        .text-input {
            width: 100%;
            padding: 12px 14px;
            border: 1px solid #E5E7EB;
            border-radius: 8px;
            font-size: 13px;
            outline: none;
            color: #111827;
            background-color: #FFFFFF;
        }

        .field-hint {
            font-size: 11px;
            color: #6B7280;
            margin-top: 8px;
        }

        /* Payment Option Cards */
        .payment-group {
            display: flex;
            flex-direction: column;
            gap: 12px;
        }

        .payment-card {
            border: 1px solid #E5E7EB;
            border-radius: 8px;
            padding: 14px 16px;
            display: flex;
            align-items: center;
            justify-content: space-between;
            cursor: pointer;
            transition: all 0.15s ease;
            background-color: #FAFAFA;
        }

        .payment-card.selected {
            border: 1px solid #E85D04;
            background-color: #F8F8F8;
        }

        .payment-left {
            display: flex;
            align-items: center;
            gap: 12px;
        }

        .radio-outer {
            width: 18px;
            height: 18px;
            border-radius: 50%;
            border: 1.5px solid #D1D5DB;
            display: flex;
            align-items: center;
            justify-content: center;
            flex-shrink: 0;
            background: #FFFFFF;
        }

        .payment-card.selected .radio-outer {
            border-color: #E85D04;
        }

        .radio-inner {
            width: 10px;
            height: 10px;
            border-radius: 50%;
            background-color: #E85D04;
            display: none;
        }

        .payment-card.selected .radio-inner {
            display: block;
        }

        .payment-info strong {
            display: block;
            font-size: 13px;
            color: #111827;
            font-weight: 700;
            margin-bottom: 2px;
        }

        .payment-info span {
            font-size: 11px;
            color: #6B7280;
        }

        .payment-icon-right {
            width: 20px;
            height: 20px;
            display: flex;
            align-items: center;
            justify-content: center;
            color: #374151;
        }

        .textarea-input {
            width: 100%;
            padding: 12px 14px;
            border: 1px solid #E5E7EB;
            border-radius: 8px;
            font-size: 13px;
            outline: none;
            color: #111827;
            resize: none;
            height: 72px;
        }

        /* Modal Footer matching image */
        .modal-footer {
            padding: 16px 24px;
            background-color: #F8F8F8;
            border-top: 1px solid #EFEFEF;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .secure-lock-wrap {
            display: flex;
            align-items: center;
            gap: 8px;
            color: #374151;
        }

        .lock-icon-svg {
            width: 16px;
            height: 16px;
            stroke: #374151;
        }

        .secure-text {
            font-size: 11px;
            color: #4B5563;
            line-height: 1.2;
            font-weight: 500;
        }

        .footer-actions {
            display: flex;
            gap: 12px;
            align-items: center;
        }

        .btn-cancel {
            background: #FFFFFF;
            border: 1px solid #E5E7EB;
            padding: 10px 20px;
            border-radius: 6px;
            font-size: 12px;
            font-weight: 600;
            color: #374151;
            cursor: pointer;
            text-decoration: none;
            display: inline-block;
        }

        .btn-confirm {
            background-color: #E85D04;
            color: #FFFFFF;
            border: none;
            padding: 12px 22px;
            border-radius: 8px;
            font-size: 12px;
            font-weight: 700;
            cursor: pointer;
            display: inline-flex;
            align-items: center;
            gap: 8px;
            text-decoration: none;
        }

        .btn-confirm:hover {
            background-color: #d05202;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="modal-card">
            
            <!-- Header -->
            <div class="modal-header">
                <h2 class="modal-title">Complete Your Pledge</h2>
                <a href="SmartIrrigationSensors.aspx" class="close-btn">&#x2715;</a>
            </div>

            <!-- Body -->
            <div class="modal-body">
                
                <!-- Selected Tier Summary -->
                <div class="tier-summary-box">
                    <div>
                        <div class="tier-label">Selected Tier</div>
                        <div class="tier-title"><asp:Label ID="lblTierTitle" runat="server" Text="Community Champion"></asp:Label></div>
                        <div class="tier-sub">Includes early access to platform features, an exclusive digital badge, and our deepest gratitude for supporting local initiatives.</div>
                    </div>
                    <div class="tier-amount">&#x20B9;<asp:Label ID="lblTierAmount" runat="server" Text="2,500"></asp:Label></div>
                </div>

                <!-- Pledge Amount -->
                <div class="form-group">
                    <label class="field-label">Pledge Amount (&#x20B9;)</label>
                    <asp:TextBox ID="txtPledgeAmount" runat="server" CssClass="text-input" Text="2500"></asp:TextBox>
                    <div class="field-hint">Minimum pledge for this tier is &#x20B9;<asp:Label ID="lblMinPledge" runat="server" Text="2,500"></asp:Label>.</div>
                </div>

                <!-- Payment Method Selection Cards -->
                <div class="form-group">
                    <label class="field-label">Payment Method</label>
                    <asp:HiddenField ID="hfPaymentMethod" runat="server" Value="UPI" ClientIDMode="Static" />

                    <div class="payment-group">
                        <!-- UPI -->
                        <div class="payment-card selected" id="cardUPI" onclick="selectPayment('UPI')">
                            <div class="payment-left">
                                <div class="radio-outer">
                                    <div class="radio-inner"></div>
                                </div>
                                <div class="payment-info">
                                    <strong>UPI</strong>
                                    <span>Google Pay, PhonePe, Paytm, BHIM</span>
                                </div>
                            </div>
                            <div class="payment-icon-right">
                                <svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><rect x="3" y="3" width="7" height="7"></rect><rect x="14" y="3" width="7" height="7"></rect><rect x="14" y="14" width="7" height="7"></rect><rect x="3" y="14" width="7" height="7"></rect></svg>
                            </div>
                        </div>

                        <!-- Net Banking -->
                        <div class="payment-card" id="cardNetBanking" onclick="selectPayment('NetBanking')">
                            <div class="payment-left">
                                <div class="radio-outer">
                                    <div class="radio-inner"></div>
                                </div>
                                <div class="payment-info">
                                    <strong>Net Banking</strong>
                                    <span>All major Indian banks supported</span>
                                </div>
                            </div>
                            <div class="payment-icon-right">
                                <svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path d="M3 21h18M3 10h18M5 10v11M9 10v11M15 10v11M19 10v11M12 3l9 7H3l9-7z"></path></svg>
                            </div>
                        </div>

                        <!-- Credit / Debit Card -->
                        <div class="payment-card" id="cardCard" onclick="selectPayment('Card')">
                            <div class="payment-left">
                                <div class="radio-outer">
                                    <div class="radio-inner"></div>
                                </div>
                                <div class="payment-info">
                                    <strong>Credit / Debit Card</strong>
                                    <span>Visa, Mastercard, RuPay</span>
                                </div>
                            </div>
                            <div class="payment-icon-right">
                                <svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><rect x="2" y="5" width="20" height="14" rx="2"></rect><line x1="2" y1="10" x2="22" y2="10"></line></svg>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Note -->
                <div class="form-group">
                    <label class="field-label">Add a note (Optional)</label>
                    <asp:TextBox ID="txtNote" runat="server" TextMode="MultiLine" CssClass="textarea-input" Placeholder="Cheer them on..."></asp:TextBox>
                </div>

            </div>

            <!-- Footer Matching Image exactly -->
            <div class="modal-footer">
                <div class="secure-lock-wrap">
                    <svg class="lock-icon-svg" viewBox="0 0 24 24" fill="none" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                        <rect x="3" y="11" width="18" height="11" rx="2" ry="2"></rect>
                        <path d="M7 11V7a5 5 0 0 1 10 0v4"></path>
                    </svg>
                    <div class="secure-text">
                        Secure<br />Payment
                    </div>
                </div>

                <div class="footer-actions">
                    <a href="SmartIrrigationSensors.aspx" class="btn-cancel">Cancel</a>
                    
                    <!-- Direct guaranteed postback redirect to PledgeSuccess.aspx -->
                    <asp:Button ID="btnConfirmPledge" runat="server" 
                        Text="Confirm &amp; Submit Pledge &rarr;" 
                        CssClass="btn-confirm" 
                        PostBackUrl="PledgeSuccess.aspx" 
                        CausesValidation="false" />
                </div>
            </div>

        </div>
    </form>

    <script type="text/javascript">
        function selectPayment(method) {
            document.getElementById('hfPaymentMethod').value = method;

            document.getElementById('cardUPI').className = method === 'UPI' ? 'payment-card selected' : 'payment-card';
            document.getElementById('cardNetBanking').className = method === 'NetBanking' ? 'payment-card selected' : 'payment-card';
            document.getElementById('cardCard').className = method === 'Card' ? 'payment-card selected' : 'payment-card';
        }
    </script>
</body>
</html>