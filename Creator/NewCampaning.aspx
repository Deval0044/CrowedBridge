 <%@ Page Language="C#" AutoEventWireup="true" CodeBehind="NewCampaning.aspx.cs" Inherits="CrowedBridge.Creator.NewCampaning" %>

<!DOCTYPE html>
<script runat="server">
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            // Initialization logic if needed
        }
    }

    protected void btnSaveDraft_Click(object sender, EventArgs e)
    {
        // Logic to save campaign as draft (CausesValidation="false" lets it bypass validation)
    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {
            if (fileBanner.HasFile)
            {
                string fileName = System.IO.Path.GetFileName(fileBanner.FileName);
                string folderPath = Server.MapPath("~/Uploads/");
                
                if (!System.IO.Directory.Exists(folderPath))
                {
                    System.IO.Directory.CreateDirectory(folderPath);
                }

                fileBanner.SaveAs(folderPath + fileName);
            }
        }
    }
</script>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Create New Campaign - CrowedBridge</title>
    <style>
        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
            font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, Helvetica, Arial, sans-serif;
        }

        body {
            background-color: #F8F8F6;
            color: #111111;
            min-height: 100vh;
            padding: 24px 16px 60px;
        }

        .container {
            max-width: 800px;
            margin: 0 auto;
        }

        /* Back Link */
        .back-nav {
            margin-bottom: 24px;
        }

        .back-link {
            color: #333333;
            text-decoration: none;
            font-size: 14px;
            font-weight: 500;
            display: inline-flex;
            align-items: center;
            gap: 8px;
        }

        .back-link:hover {
            color: #000000;
        }

        /* Page Header */
        .page-header {
            margin-bottom: 32px;
        }

        .page-title {
            font-size: 32px;
            font-weight: 700;
            color: #111111;
            margin-bottom: 8px;
        }

        .page-subtitle {
            font-size: 15px;
            color: #666666;
        }

        /* Main Form Card */
        .form-card {
            background: #FFFFFF;
            border: 1px solid #EFEFEF;
            border-radius: 12px;
            padding: 36px 40px;
            box-shadow: 0px 2px 12px rgba(0, 0, 0, 0.02);
        }

        /* Form Group Styles */
        .form-group {
            margin-bottom: 20px;
        }

        .form-label {
            display: block;
            font-size: 14px;
            font-weight: 600;
            color: #111111;
            margin-bottom: 8px;
        }

        .required-star {
            color: #E53935;
            margin-left: 2px;
        }

        .form-control {
            width: 100%;
            padding: 12px 14px;
            font-size: 14px;
            border: 1px solid #D0D0D0;
            border-radius: 6px;
            outline: none;
            color: #333333;
            background-color: #FFFFFF;
            transition: border-color 0.2s, box-shadow 0.2s;
        }

        .form-control:focus {
            border-color: #FA6400;
            box-shadow: 0 0 0 2px rgba(250, 100, 0, 0.15);
        }

        .form-control::placeholder {
            color: #999999;
        }

        /* Validation Error Messages */
        .error-msg {
            color: #E53935;
            font-size: 12px;
            display: block;
            margin-top: 5px;
            font-weight: 500;
        }

        /* Form Row Layouts */
        .form-row {
            display: flex;
            gap: 24px;
        }

        .col-2-3 {
            flex: 2;
        }

        .col-1-3 {
            flex: 1;
        }

        .field-hint {
            font-size: 12px;
            color: #777777;
            margin-top: 6px;
        }

        /* Goal Amount Wrapper */
        .amount-input-wrap {
            position: relative;
            display: flex;
            align-items: center;
        }

        .currency-symbol {
            position: absolute;
            left: 14px;
            font-size: 15px;
            color: #555555;
            pointer-events: none;
        }

        .amount-input-wrap .form-control {
            padding-left: 32px;
        }

        /* Divider */
        .form-divider {
            height: 1px;
            background-color: #EFEFEF;
            border: none;
            margin: 32px 0;
        }

        /* Textarea */
        textarea.form-control {
            resize: vertical;
            min-height: 140px;
            line-height: 1.5;
        }

        .file-upload-box {
            border: 1px solid #D0D0D0;
            padding: 16px;
            border-radius: 6px;
            background-color: #FAFAFA;
        }

        /* Form Actions Buttons */
        .form-actions {
            display: flex;
            justify-content: flex-end;
            gap: 12px;
            margin-top: 32px;
        }

        .btn {
            padding: 12px 24px;
            font-size: 14px;
            font-weight: 600;
            border-radius: 6px;
            cursor: pointer;
            transition: all 0.2s;
            border: 1px solid transparent;
        }

        .btn-secondary {
            background-color: #FFFFFF;
            border-color: #D0D0D0;
            color: #333333;
        }

        .btn-secondary:hover {
            background-color: #F5F5F0;
            border-color: #BBB;
        }

        .btn-primary {
            background-color: #FA6400;
            color: #FFFFFF;
        }

        .btn-primary:hover {
            background-color: #E05500;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            
            <!-- Navigation Back Button -->
            <div class="back-nav">
                <asp:HyperLink ID="hlBack" runat="server" NavigateUrl="~/Creator/Dashboard.aspx" CssClass="back-link">
                    &larr; Back to Creator Dashboard
                </asp:HyperLink>
            </div>

            <!-- Page Title Header -->
            <div class="page-header">
                <h1 class="page-title">Create New Campaign</h1>
                <p class="page-subtitle">Fill in the details below to launch your project and start gathering support.</p>
            </div>

            <!-- Form Container -->
            <div class="form-card">
                
                <!-- Campaign Title -->
                <div class="form-group">
                    <label class="form-label" for="txtTitle">Campaign Title<span class="required-star">*</span></label>
                    <asp:TextBox ID="txtTitle" runat="server" CssClass="form-control" Placeholder="Give your project a clear, memorable name"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvTitle" runat="server" ControlToValidate="txtTitle" ErrorMessage="Campaign Title is required." CssClass="error-msg" Display="Dynamic"></asp:RequiredFieldValidator>
                </div>

                <!-- Category & Duration Row -->
                <div class="form-row">
                    <div class="form-group col-2-3">
                        <label class="form-label" for="ddlCategory">Category<span class="required-star">*</span></label>
                        <asp:DropDownList ID="ddlCategory" runat="server" CssClass="form-control">
                            <asp:ListItem Text="Select a category" Value="" Selected="True"></asp:ListItem>
                            <asp:ListItem Text="Education" Value="Education"></asp:ListItem>
                            <asp:ListItem Text="Technology & Innovation" Value="Technology"></asp:ListItem>
                            <asp:ListItem Text="Community & Social" Value="Community"></asp:ListItem>
                            <asp:ListItem Text="Creative Arts" Value="Creative"></asp:ListItem>
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="rfvCategory" runat="server" ControlToValidate="ddlCategory" InitialValue="" ErrorMessage="Please select a category." CssClass="error-msg" Display="Dynamic"></asp:RequiredFieldValidator>
                    </div>

                    <div class="form-group col-1-3">
                        <label class="form-label" for="txtDuration">Duration (Days)<span class="required-star">*</span></label>
                        <asp:TextBox ID="txtDuration" runat="server" CssClass="form-control" Placeholder="e.g., 30"></asp:TextBox>
                        <div class="field-hint">Recommended: 30-45 days</div>
                        <asp:RequiredFieldValidator ID="rfvDuration" runat="server" ControlToValidate="txtDuration" ErrorMessage="Duration is required." CssClass="error-msg" Display="Dynamic"></asp:RequiredFieldValidator>
                        <asp:CompareValidator ID="cvDuration" runat="server" ControlToValidate="txtDuration" Type="Integer" Operator="DataTypeCheck" ErrorMessage="Enter a valid number of days." CssClass="error-msg" Display="Dynamic"></asp:CompareValidator>
                    </div>
                </div>

                <!-- Goal Amount -->
                <div class="form-group">
                    <label class="form-label" for="txtGoalAmount">Goal Amount<span class="required-star">*</span></label>
                    <div class="amount-input-wrap">
                        <span class="currency-symbol">&#x20B9;</span>
                        <asp:TextBox ID="txtGoalAmount" runat="server" CssClass="form-control" Placeholder="100000"></asp:TextBox>
                    </div>
                    <asp:RequiredFieldValidator ID="rfvGoalAmount" runat="server" ControlToValidate="txtGoalAmount" ErrorMessage="Goal Amount is required." CssClass="error-msg" Display="Dynamic"></asp:RequiredFieldValidator>
                    <asp:CompareValidator ID="cvGoalAmount" runat="server" ControlToValidate="txtGoalAmount" Type="Double" Operator="DataTypeCheck" ErrorMessage="Enter a valid numeric amount." CssClass="error-msg" Display="Dynamic"></asp:CompareValidator>
                </div>

                <hr class="form-divider" />

                <!-- Campaign Banner Upload -->
                <div class="form-group">
                    <label class="form-label">Campaign Banner<span class="required-star">*</span></label>
                    <div class="file-upload-box">
                        <asp:FileUpload ID="fileBanner" runat="server" CssClass="form-control" />
                        <div class="field-hint">PNG, JPG, GIF up to 10MB</div>
                    </div>
                    <asp:RequiredFieldValidator ID="rfvBanner" runat="server" ControlToValidate="fileBanner" ErrorMessage="Campaign banner image is required." CssClass="error-msg" Display="Dynamic"></asp:RequiredFieldValidator>
                </div>

                <!-- Campaign Pitch -->
                <div class="form-group">
                    <label class="form-label" for="txtPitch">Campaign Pitch<span class="required-star">*</span></label>
                    <asp:TextBox ID="txtPitch" runat="server" TextMode="MultiLine" Rows="5" CssClass="form-control" Placeholder="Tell your story. Explain why you are raising funds, how the money will be used, and the impact it will create..."></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvPitch" runat="server" ControlToValidate="txtPitch" ErrorMessage="Campaign Pitch is required." CssClass="error-msg" Display="Dynamic"></asp:RequiredFieldValidator>
                </div>

                <hr class="form-divider" />

                <!-- Form Action Buttons -->
                <div class="form-actions">
                    <asp:Button ID="btnSaveDraft" runat="server" Text="Save Draft" CssClass="btn btn-secondary" OnClick="btnSaveDraft_Click" CausesValidation="false" />
                    <asp:Button ID="btnSubmit" runat="server" Text="Submit Campaign for Review" CssClass="btn btn-primary" OnClick="btnSubmit_Click" />
                </div>

            </div>
        </div>
    </form>
</body>
</html>