<%@ Page Title="Manage Contact Us Content"
    Language="C#"
    MasterPageFile="~/Admin/AdminMaster.Master"
    AutoEventWireup="true"
    CodeFile="ManageContactUs.aspx.cs"
    Inherits="Style_On_Rent.Admin.ManageContactUs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css" />

    <style>
        :root {
            --primary-maroon: #73001e;
            --primary-maroon-hover: #590017;
            --text-dark: #111827;
            --text-muted: #6b7280;
            --border-color: #ebdcd0;
            --page-bg: #faf7f2;
        }

        body {
            font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, "Helvetica Neue", Arial, sans-serif;
            background-color: var(--page-bg);
            color: var(--text-dark);
            margin: 0;
            padding: 0;
        }

        .contact-wrapper {
            padding: 24px 32px 48px 32px;
            max-width: 1250px;
            margin: 0 auto;
            box-sizing: border-box;
        }

        /* Top Header */
        .page-header-row {
            display: flex;
            align-items: center;
            gap: 18px;
            margin-bottom: 24px;
        }

        .brand-logo {
            width: 70px;
            height: auto;
            object-fit: contain;
        }

        .header-title-box h1 {
            font-size: 24px;
            font-weight: 700;
            color: var(--primary-maroon);
            margin: 0 0 4px 0;
        }

        .header-title-box p {
            font-size: 13px;
            color: var(--text-muted);
            margin: 0;
        }

        /* 2-Column Responsive Layout */
        .contact-layout-grid {
            display: grid;
            grid-template-columns: 1.5fr 1fr;
            gap: 24px;
            align-items: start;
        }

        /* Content Card Panels */
        .content-card {
            background: #ffffff;
            border: 1px solid #ebdcd0;
            border-radius: 8px;
            padding: 24px;
            box-sizing: border-box;
            margin-bottom: 24px;
        }

        .card-header-bar {
            margin-bottom: 18px;
            padding-bottom: 8px;
            border-bottom: 1px solid #f3ece4;
        }

        .card-header-bar h2 {
            font-size: 15px;
            font-weight: 700;
            color: #111827;
            margin: 0;
            display: flex;
            align-items: center;
            gap: 8px;
        }

        .card-header-bar h2 i {
            color: #b08d79;
            font-size: 15px;
        }

        /* Form Controls */
        .form-row {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 16px;
            margin-bottom: 14px;
        }

        .form-row:last-child {
            margin-bottom: 0;
        }

        .field-group {
            margin-bottom: 14px;
        }

        .field-group:last-child {
            margin-bottom: 0;
        }

        .field-label {
            display: block;
            font-size: 11px;
            font-weight: 700;
            color: #4b5563;
            letter-spacing: 0.5px;
            text-transform: uppercase;
            margin-bottom: 6px;
        }

        .field-input {
            width: 100%;
            height: 38px;
            padding: 0 12px;
            border: 1px solid #ebdcd0;
            border-radius: 6px;
            font-size: 13px;
            color: #1f2937;
            background-color: #ffffff;
            outline: none;
            box-sizing: border-box;
            transition: border-color 0.2s;
        }

        .field-input:focus {
            border-color: var(--primary-maroon);
        }

        .field-textarea {
            width: 100%;
            height: 96px;
            padding: 10px 12px;
            border: 1px solid #ebdcd0;
            border-radius: 6px;
            font-size: 13px;
            line-height: 1.45;
            color: #1f2937;
            background-color: #ffffff;
            outline: none;
            box-sizing: border-box;
            resize: vertical;
            font-family: inherit;
            transition: border-color 0.2s;
        }

        .field-textarea:focus {
            border-color: var(--primary-maroon);
        }

        /* Social Prefix Input Wrap */
        .prefix-input-wrap {
            display: flex;
            align-items: center;
            border: 1px solid #ebdcd0;
            border-radius: 6px;
            overflow: hidden;
            background-color: #ffffff;
        }

        .prefix-badge {
            background-color: #faf7f2;
            color: #6b7280;
            padding: 0 12px;
            height: 38px;
            display: flex;
            align-items: center;
            font-size: 12px;
            font-weight: 600;
            border-right: 1px solid #ebdcd0;
        }

        .prefix-input-wrap input {
            border: none;
            flex: 1;
            height: 38px;
            padding: 0 12px;
            font-size: 13px;
            color: #1f2937;
            outline: none;
        }

        /* Toggle Switches */
        .toggle-item {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding-bottom: 14px;
            margin-bottom: 14px;
            border-bottom: 1px solid #f3ece4;
        }

        .toggle-item:last-child {
            padding-bottom: 0;
            margin-bottom: 0;
            border-bottom: none;
        }

        .toggle-info h4 {
            font-size: 13px;
            font-weight: 700;
            color: #111827;
            margin: 0 0 2px 0;
        }

        .toggle-info p {
            font-size: 11.5px;
            color: var(--text-muted);
            margin: 0;
            line-height: 1.35;
        }

        .switch {
            position: relative;
            display: inline-block;
            width: 36px;
            height: 20px;
            flex-shrink: 0;
        }

        .switch input {
            opacity: 0;
            width: 0;
            height: 0;
        }

        .slider {
            position: absolute;
            cursor: pointer;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background-color: #e5e7eb;
            transition: .3s;
            border-radius: 20px;
        }

        .slider:before {
            position: absolute;
            content: "";
            height: 14px;
            width: 14px;
            left: 3px;
            bottom: 3px;
            background-color: white;
            transition: .3s;
            border-radius: 50%;
        }

        input:checked + .slider {
            background-color: var(--primary-maroon);
        }

        input:checked + .slider:before {
            transform: translateX(16px);
        }

        /* Save Button */
        .btn-save-all {
            background-color: var(--primary-maroon);
            color: #ffffff !important;
            border: none;
            padding: 10px 24px;
            font-size: 13px;
            font-weight: 700;
            border-radius: 6px;
            cursor: pointer;
            display: inline-flex;
            align-items: center;
            gap: 8px;
            text-decoration: none !important;
            transition: background-color 0.2s ease;
        }

        .btn-save-all:hover {
            background-color: var(--primary-maroon-hover);
        }

        /* Success Alert Banner */
        .alert-success-banner {
            background-color: #ecfdf5;
            color: #065f46;
            border: 1px solid #a7f3d0;
            padding: 12px 18px;
            border-radius: 6px;
            font-size: 13px;
            margin-bottom: 20px;
            display: flex;
            align-items: center;
            gap: 8px;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <asp:ScriptManager ID="smContactUs" runat="server" />

    <asp:UpdatePanel ID="upnlContactUs" runat="server" UpdateMode="Conditional">
        <ContentTemplate>
            <div class="contact-wrapper">

                <!-- Page Header[cite: 10] -->
                <div class="page-header-row">
                    <img src="Images/logo.png" class="brand-logo" alt="Style On Rent" />
                    <div class="header-title-box">
                        <h1>Manage Contact Us Content</h1>
                        <p>Update your store's contact information, location, and social links.</p>
                    </div>
                </div>

                <!-- Success Alert -->
                <asp:Panel ID="pnlAlertSuccess" runat="server" CssClass="alert-success-banner" Visible="false">
                    <i class="fa-solid fa-circle-check"></i>
                    Contact details and settings have been saved successfully!
                </asp:Panel>

                <!-- 2-Column Content Grid[cite: 10] -->
                <div class="contact-layout-grid">

                    <!-- LEFT COLUMN[cite: 10] -->
                    <div>
                        <!-- Section 1: Contact Details[cite: 10] -->
                        <div class="content-card">
                            <div class="card-header-bar">
                                <h2><i class="bi bi-telephone"></i> Contact Details</h2>
                            </div>

                            <div class="form-row">
                                <div class="field-group">
                                    <label class="field-label">Business Phone</label>
                                    <asp:TextBox ID="txtBusinessPhone" runat="server" CssClass="field-input" placeholder="+91 98765 43210" />
                                </div>

                                <div class="field-group">
                                    <label class="field-label">Secondary Phone (Optional)</label>
                                    <asp:TextBox ID="txtSecondaryPhone" runat="server" CssClass="field-input" placeholder="+91 00000 00000" />
                                </div>
                            </div>

                            <div class="form-row">
                                <div class="field-group">
                                    <label class="field-label">WhatsApp Number</label>
                                    <asp:TextBox ID="txtWhatsappNumber" runat="server" CssClass="field-input" placeholder="+91 98765 43210" />
                                </div>

                                <div class="field-group">
                                    <label class="field-label">Business Email</label>
                                    <asp:TextBox ID="txtBusinessEmail" runat="server" CssClass="field-input" placeholder="hello@styleonrent.com" />
                                </div>
                            </div>
                        </div>

                        <!-- Section 2: Social Media Links[cite: 10] -->
                        <div class="content-card">
                            <div class="card-header-bar">
                                <h2><i class="bi bi-share"></i> Social Media Links</h2>
                            </div>

                            <div class="field-group">
                                <label class="field-label">Instagram URL</label>
                                <div class="prefix-input-wrap">
                                    <span class="prefix-badge">ig/</span>
                                    <asp:TextBox ID="txtInstagramUrl" runat="server" placeholder="https://instagram.com/styleonrent" />
                                </div>
                            </div>

                            <div class="field-group">
                                <label class="field-label">Facebook URL</label>
                                <div class="prefix-input-wrap">
                                    <span class="prefix-badge">fb/</span>
                                    <asp:TextBox ID="txtFacebookUrl" runat="server" placeholder="https://facebook.com/styleonrent" />
                                </div>
                            </div>
                        </div>

                        <!-- Save All Changes Button[cite: 10] -->
                        <asp:LinkButton ID="btnSaveAllChanges" runat="server" CssClass="btn-save-all" OnClick="btnSaveAllChanges_Click">
                            <i class="bi bi-floppy"></i> Save All Changes
                        </asp:LinkButton>
                    </div>

                    <!-- RIGHT COLUMN[cite: 10] -->
                    <div>
                        <!-- Section 3: Office Address[cite: 10] -->
                        <div class="content-card">
                            <div class="card-header-bar">
                                <h2><i class="bi bi-geo-alt"></i> Office Address</h2>
                            </div>

                            <div class="field-group">
                                <label class="field-label">Physical Store Address</label>
                                <asp:TextBox ID="txtStoreAddress" runat="server" TextMode="MultiLine" CssClass="field-textarea" placeholder="123 Heritage Lane, Silk District..." />
                            </div>
                        </div>

                        <!-- Section 4: Inquiry Settings[cite: 10] -->
                        <div class="content-card">
                            <div class="card-header-bar">
                                <h2><i class="bi bi-shield-check"></i> Inquiry Settings</h2>
                            </div>

                            <div class="toggle-item">
                                <div class="toggle-info">
                                    <h4>Email Notifications</h4>
                                    <p>Receive an email for every new contact form submission.</p>
                                </div>
                                <label class="switch">
                                    <asp:CheckBox ID="chkEmailNotifications" runat="server" Checked="true" />
                                    <span class="slider"></span>
                                </label>
                            </div>

                            <div class="toggle-item">
                                <div class="toggle-info">
                                    <h4>Auto-reply to Customers</h4>
                                    <p>Send an automated acknowledgment email immediately.</p>
                                </div>
                                <label class="switch">
                                    <asp:CheckBox ID="chkAutoReply" runat="server" />
                                    <span class="slider"></span>
                                </label>
                            </div>
                        </div>
                    </div>

                </div>

            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>