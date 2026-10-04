<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PledgeModal.aspx.cs" Inherits="CrowedBridge.Backers.PledgeModal" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Complete Your Pledge</title>
    <style>
        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
            font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, Helvetica, Arial, sans-serif;
        }

        body {
            background-color: #9E9E9E;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            padding: 20px;
        }

        /* Modal Container */
        .modal-card {
            background: #FFFFFF;
            width: 100%;
            max-width: 480px;
            border-radius: 12px;
            box-shadow: 0px 10px 25px rgba(0, 0, 0, 0.15);
            overflow: hidden;
        }

        /* Header */
        .modal-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 20px 24px;
            border-bottom: 1px solid #EFEFEF;
        }

        .modal-title {
            font-size: 18px;
            font-weight: 700;
            color: #111111;
        }

        .close-btn {
            background: transparent;
            border: none;
            font-size: 20px;
            color: #888888;
            cursor: pointer;
            line-height: 1;
        }

        /* Body */
        .modal-body {
            padding: 24px;
            display: flex;
            flex-direction: column;
            gap: 20px;
        }

        /* Tier Banner */
        .tier-summary-box {
            background: #F9F8F6;
            border-radius: 8px;
            padding: 16px;
            display: flex;
            justify-content: space-between;
            align-items: flex-start;
        }

        .tier-info-left {
            display: flex;
            flex-direction: column;
            gap: 4px;
        }

        .tier-label {
            font-size: 10px;
            font-weight: 700;
            color: #A34E00;
            text-transform: uppercase;
            letter-spacing: 0.5px;
        }

        .tier-name {
            font-size: 14px;
            font-weight: 700;
            color: #111111;
        }

        .tier-desc {
            font-size: 11px;
            color: #666666;
            line-height: 1.4;
            margin-top: 4px;
            max-width: 300px;
        }

        .tier-price {
            font-size: 18px;
            font-weight: 800;
            color: #111111;
        }

        /* Input Group */
        .form-group {
            display: flex;
            flex-direction: column;
            gap: 6px;
        }

        .field-label {
            font-size: 12px;
            font-weight: 600;
            color: #333333;
        }

        .input-wrapper {
            position: relative;
            display: flex;
            align-items: center;
        }

        .currency-symbol {
            position: absolute;
            left: 14px;
            color: #666666;
            font-size: 14px;
        }

        .text-input {
            width: 100%;
            padding: 10px 14px 10px 30px;
            border: 1px solid #D1D5DB;
            border-radius: 8px;
            font-size: 14px;
            outline: none;
            color: #111111;
        }

        .text-input:focus {
            border-color: #FA6400;
        }

        .field-hint {
            font-size: 11px;
            color: #777777;
        }

        /* Payment Methods */
        .payment-options {
            display: flex;
            flex-direction: column;
            gap: 10px;
        }

        .payment-option {
            border: 1px solid #E5E7EB;
            border-radius: 8px;
            padding: 12px 16px;
            display: flex;
            align-items: center;
            justify-content: space-between;
            cursor: pointer;
            transition: all 0.2s ease;
            user-select: none;
        }

        /* Active / Selected Highlight Styling */
        .payment-option.selected {
            border-color: #FA6400;
            background-color: #FFFBF7;
        }

        .option-left {
            display: flex;
            align-items: center;
            gap: 12px;
        }

        .radio-btn {
            accent-color: #FA6400;
            width: 16px;
            height: 16px;
            cursor: pointer;
        }

        .option-title {
            font-size: 13px;
            font-weight: 700;
            color: #111111;
        }

        .option-sub {
            font-size: 11px;
            color: #777777;
            margin-top: 2px;
        }

        .option-icon {
            color: #555555;
            font-size: 16px;
        }

        /* Textarea */
        .textarea-input {
            width: 100%;
            padding: 10px 14px;
            border: 1px solid #D1D5DB;
            border-radius: 8px;
            font-size: 13px;
            outline: none;
            resize: vertical;
            min-height: 70px;
            color: #111111;
        }

        .textarea-input:focus {
            border-color: #FA6400;
        }

        /* Footer */
        .modal-footer {
            padding: 16px 24px 20px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            border-top: 1px solid #EFEFEF;
        }

        .security-note {
            display: flex;
            align-items: center;
            gap: 6px;
            font-size: 11px;
            color: #666666;
            line-height: 1.2;
        }

        .footer-actions {
            display: flex;
            gap: 10px;
        }

        .btn-cancel {
            background: #FFFFFF;
            border: 1px solid #D1D5DB;
            padding: 8px 16px;
            border-radius: 6px;
            font-size: 12px;
            font-weight: 600;
            color: #333333;
            cursor: pointer;
        }

        .btn-submit {
            background: #FA6400;
            border: none;
            padding: 10px 18px;
            border-radius: 6px;
            font-size: 12px;
            font-weight: 700;
            color: #FFFFFF;
            cursor: pointer;
            display: inline-flex;
            align-items: center;
            gap: 6px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="modal-card">
            <!-- Modal Header -->
            <div class="modal-header">
                <h2 class="modal-title">Complete Your Pledge</h2>
                <button type="button" class="close-btn">&times;</button>
            </div>

            <!-- Modal Body -->
            <div class="modal-body">
                <!-- Selected Tier Summary -->
                <div class="tier-summary-box">
                    <div class="tier-info-left">
                        <span class="tier-label">Selected Tier</span>
                        <span class="tier-name">Community Champion</span>
                        <p class="tier-desc">Includes early access to platform features, an exclusive digital badge, and our deepest gratitude for supporting local initiatives.</p>
                    </div>
                    <span class="tier-price">&#x20B9;2,500</span>
                </div>

                <!-- Pledge Amount Input -->
                <div class="form-group">
                    <label class="field-label">Pledge Amount (&#x20B9;)</label>
                    <div class="input-wrapper">
                        <span class="currency-symbol">&#x20B9;</span>
                        <asp:TextBox ID="txtPledgeAmount" runat="server" CssClass="text-input" Text="2500"></asp:TextBox>
                    </div>
                    <span class="field-hint">Minimum pledge for this tier is &#x20B9;2,500.</span>
                </div>

                <!-- Payment Method Options -->
                <div class="form-group">
                    <label class="field-label">Payment Method</label>
                    <div class="payment-options">
                        
                        <!-- UPI -->
                        <div class="payment-option selected" onclick="selectPaymentMethod(this, 'payUPI')">
                            <div class="option-left">
                                <input type="radio" id="payUPI" name="PaymentMethod" class="radio-btn" value="UPI" checked="checked" />
                                <div>
                                    <div class="option-title">UPI</div>
                                    <div class="option-sub">Google Pay, PhonePe, Paytm, BHIM</div>
                                </div>
                            </div>
                            <span class="option-icon">&#9638;</span>
                        </div>

                        <!-- Net Banking -->
                        <div class="payment-option" onclick="selectPaymentMethod(this, 'payNet')">
                            <div class="option-left">
                                <input type="radio" id="payNet" name="PaymentMethod" class="radio-btn" value="NetBanking" />
                                <div>
                                    <div class="option-title">Net Banking</div>
                                    <div class="option-sub">All major Indian banks supported</div>
                                </div>
                            </div>
                            <span class="option-icon">&#127963;</span>
                        </div>

                        <!-- Credit / Debit Card -->
                        <div class="payment-option" onclick="selectPaymentMethod(this, 'payCard')">
                            <div class="option-left">
                                <input type="radio" id="payCard" name="PaymentMethod" class="radio-btn" value="Card" />
                                <div>
                                    <div class="option-title">Credit / Debit Card</div>
                                    <div class="option-sub">Visa, Mastercard, RuPay</div>
                                </div>
                            </div>
                            <span class="option-icon">&#128179;</span>
                        </div>

                    </div>
                </div>

                <!-- Add Note Input -->
                <div class="form-group">
                    <label class="field-label">Add a note (Optional)</label>
                    <asp:TextBox ID="txtNote" runat="server" TextMode="MultiLine" CssClass="textarea-input" Placeholder="Cheer them on..."></asp:TextBox>
                </div>
            </div>

            <!-- Modal Footer -->
            <div class="modal-footer">
                <div class="security-note">
                    <span>&#128274;</span>
                    <span>Secure<br />Payment</span>
                </div>
                <div class="footer-actions">
                    <button type="button" class="btn-cancel">Cancel</button>
                    <asp:Button ID="btnConfirmPledge" runat="server" Text="Confirm &amp; Submit Pledge &rarr;" CssClass="btn-submit" />
                </div>
            </div>
        </div>
    </form>

    <script type="text/javascript">
        function selectPaymentMethod(element, radioId) {
            // Remove selected class from all options
            var options = document.querySelectorAll('.payment-option');
            options.forEach(function (opt) {
                opt.classList.remove('selected');
            });

            // Add selected class to the clicked box
            element.classList.add('selected');

            // Check the radio button inside
            var radioBtn = document.getElementById(radioId);
            if (radioBtn) {
                radioBtn.checked = true;
            }
        }
    </script>
</body>
</html>