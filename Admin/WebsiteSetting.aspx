<%@ Page Title="Website Settings"
    Language="C#"
    MasterPageFile="~/Admin/AdminMaster.Master"
    AutoEventWireup="true"
    CodeFile="WebsiteSetting.aspx.cs"
    Inherits="Style_On_Rent.Admin.WebsiteSetting" %>

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

        .settings-wrapper {
            padding: 28px 40px 60px 40px;
            max-width: 1200px;
            margin: 0 auto;
            box-sizing: border-box;
        }

        /* Top Page Header */
        .page-header-box {
            margin-bottom: 28px;
        }

        .page-header-box h1 {
            font-size: 26px;
            font-weight: 700;
            color: var(--text-dark);
            margin: 0 0 6px 0;
        }

        .page-header-box p {
            font-size: 13.5px;
            color: var(--text-muted);
            margin: 0;
        }

        /* Content Sections */
        .settings-section-card {
            margin-bottom: 36px;
        }

        .section-header-block {
            margin-bottom: 20px;
        }

        .section-header-title {
            font-size: 17px;
            font-weight: 700;
            color: #111827;
            margin: 0 0 4px 0;
            display: flex;
            align-items: center;
            gap: 10px;
        }

        .section-header-title i {
            color: #b08d79;
            font-size: 18px;
        }

        .section-header-subtitle {
            font-size: 13px;
            color: var(--text-muted);
            margin: 0;
        }

        /* Form Row Grids */
        .form-row-2col {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 24px;
            margin-bottom: 16px;
        }

        /* Input Group with Prefix Label */
        .prefixed-input-box {
            display: flex;
            align-items: center;
            border: 1px solid #ebdcd0;
            border-radius: 6px;
            background-color: #ffffff;
            height: 42px;
            overflow: hidden;
            box-sizing: border-box;
            transition: border-color 0.2s;
        }

        .prefixed-input-box:focus-within {
            border-color: var(--primary-maroon);
        }

        .input-prefix-label {
            padding: 0 14px;
            background-color: #ffffff;
            color: #374151;
            font-size: 13px;
            font-weight: 500;
            border-right: 1px solid #ebdcd0;
            white-space: nowrap;
            display: flex;
            align-items: center;
            height: 100%;
        }

        .prefixed-input-box input {
            border: none;
            outline: none;
            padding: 0 14px;
            font-size: 13.5px;
            color: var(--text-dark);
            width: 100%;
            height: 100%;
            background: transparent;
        }

        /* Save Button Bars */
        .section-action-bar {
            display: flex;
            justify-content: flex-end;
            margin-top: 14px;
        }

        .btn-maroon-save {
            background-color: transparent;
            color: #111827 !important;
            border: none;
            font-size: 13px;
            font-weight: 600;
            cursor: pointer;
            display: inline-flex;
            align-items: center;
            gap: 8px;
            text-decoration: none !important;
            padding: 6px 12px;
            border-radius: 4px;
            transition: all 0.15s ease;
        }

        .btn-maroon-save i {
            font-size: 14px;
            color: var(--primary-maroon);
        }

        .btn-maroon-save:hover {
            color: var(--primary-maroon) !important;
            background-color: #f6eee9;
        }

        /* Branding Dropzones */
        .branding-grid {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 24px;
            margin-bottom: 16px;
        }

        .branding-item-column label {
            display: block;
            font-size: 13px;
            font-weight: 600;
            color: #374151;
            margin-bottom: 8px;
        }

        .upload-dashed-card {
            border: 1.5px dashed #ebdcd0;
            border-radius: 8px;
            background-color: #ffffff;
            height: 160px;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            cursor: pointer;
            text-align: center;
            padding: 16px;
            box-sizing: border-box;
            transition: border-color 0.2s, background-color 0.2s;
        }

        .upload-dashed-card:hover {
            border-color: var(--primary-maroon);
            background-color: #faf7f2;
        }

        .dropzone-icon-box {
            width: 38px;
            height: 38px;
            border-radius: 50%;
            background-color: #fdf6f2;
            color: #b08d79;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 18px;
            margin-bottom: 10px;
        }

        .dropzone-main-text {
            font-size: 13px;
            font-weight: 600;
            color: #111827;
            margin-bottom: 3px;
        }

        .dropzone-sub-text {
            font-size: 11px;
            color: var(--text-muted);
        }

        /* Current Logo Row */
        .current-asset-row {
            display: flex;
            align-items: center;
            gap: 16px;
            margin-top: 14px;
        }

        .current-logo-preview {
            width: 80px;
            height: 40px;
            border: 1px solid #ebdcd0;
            border-radius: 6px;
            padding: 4px;
            background-color: #ffffff;
            object-fit: contain;
        }

        .current-asset-label {
            font-size: 12.5px;
            color: #6b7280;
        }

        /* Divider */
        .section-divider {
            height: 1px;
            background-color: #ebdcd0;
            margin: 28px 0;
            border: none;
        }

        /* Success Alert */
        .alert-success-banner {
            background-color: #ecfdf5;
            color: #065f46;
            border: 1px solid #a7f3d0;
            padding: 12px 18px;
            border-radius: 6px;
            font-size: 13px;
            margin-bottom: 22px;
            display: flex;
            align-items: center;
            gap: 8px;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="settings-wrapper">

        <!-- Top Header[cite: 8] -->
        <div class="page-header-box">
            <h1>Website Settings</h1>
            <p>Manage your storefront's global configuration, branding, and legal policies.</p>
        </div>

        <!-- Success Alert -->
        <asp:Panel ID="pnlSuccessAlert" runat="server" CssClass="alert-success-banner" Visible="false">
            <i class="fa-solid fa-circle-check"></i>
            <asp:Literal ID="litAlertMessage" runat="server">Settings have been updated successfully!</asp:Literal>
        </asp:Panel>

        <!-- SECTION 1: General Information[cite: 8] -->
        <div class="settings-section-card">
            <div class="section-header-block">
                <h2 class="section-header-title">
                    <i class="bi bi-window"></i> General Information
                </h2>
                <p class="section-header-subtitle">Basic details about your rental business visible to customers.</p>
            </div>

            <!-- Row 1: Site Name & Tagline[cite: 8] -->
            <div class="form-row-2col">
                <div class="prefixed-input-box">
                    <span class="input-prefix-label">Site Name</span>
                    <asp:TextBox ID="txtSiteName" runat="server" Text="Style On Rent" />
                </div>

                <div class="prefixed-input-box">
                    <span class="input-prefix-label">Tagline</span>
                    <asp:TextBox ID="txtTagline" runat="server" Text="Premium Ethnic Wear on Rent" />
                </div>
            </div>

            <!-- Row 2: Business Email & Support Phone[cite: 8] -->
            <div class="form-row-2col">
                <div class="prefixed-input-box">
                    <span class="input-prefix-label">Business Email</span>
                    <asp:TextBox ID="txtBusinessEmail" runat="server" Text="contact@styleonrent.com" />
                </div>

                <div class="prefixed-input-box">
                    <span class="input-prefix-label">Support Phone</span>
                    <asp:TextBox ID="txtSupportPhone" runat="server" Text="+91 98765 43210" />
                </div>
            </div>

            <!-- Action 1[cite: 8] -->
            <div class="section-action-bar">
                <asp:LinkButton ID="btnSaveGeneral" runat="server" CssClass="btn-maroon-save" OnClick="btnSaveGeneral_Click">
                    <i class="bi bi-floppy"></i> Save General Settings
                </asp:LinkButton>
            </div>
        </div>

        <hr class="section-divider" />

        <!-- SECTION 2: Branding & Identity[cite: 8] -->
        <div class="settings-section-card">
            <div class="section-header-block">
                <h2 class="section-header-title">
                    <i class="bi bi-palette"></i> Branding & Identity
                </h2>
                <p class="section-header-subtitle">Customize visual assets like logos and brand colors.</p>
            </div>

            <!-- Hidden FileUploads -->
            <asp:FileUpload ID="fuMainLogo" runat="server" Style="display: none;" onchange="this.form.submit();" />
            <asp:FileUpload ID="fuFavicon" runat="server" Style="display: none;" onchange="this.form.submit();" />

            <div class="branding-grid">
                <!-- Main Logo Column[cite: 8] -->
                <div class="branding-item-column">
                    <label>Main Logo</label>
                    <div class="upload-dashed-card" onclick="document.getElementById('<%= fuMainLogo.ClientID %>').click();">
                        <div class="dropzone-icon-box">
                            <i class="bi bi-cloud-arrow-up"></i>
                        </div>
                        <div class="dropzone-main-text">Click to upload or drag and drop</div>
                        <div class="dropzone-sub-text">SVG, PNG, JPG (max. 800×400px)</div>
                    </div>

                    <!-- Current Logo Thumbnail[cite: 8] -->
                    <div class="current-asset-row">
                        <asp:Image ID="imgCurrentLogo" runat="server" CssClass="current-logo-preview" ImageUrl="~/Images/logo.png" />
                        <span class="current-asset-label">Current logo</span>
                    </div>
                </div>

                <!-- Favicon Column[cite: 8] -->
                <div class="branding-item-column">
                    <label>Favicon</label>
                    <div class="upload-dashed-card" onclick="document.getElementById('<%= fuFavicon.ClientID %>').click();">
                        <div class="dropzone-icon-box">
                            <i class="bi bi-image"></i>
                        </div>
                        <div class="dropzone-main-text">Upload Favicon (.ico, .png)</div>
                        <div class="dropzone-sub-text">Must be square, e.g., 32×32px</div>
                    </div>
                </div>
            </div>

            <!-- Action 2[cite: 8] -->
            <div class="section-action-bar">
                <asp:LinkButton ID="btnSaveBranding" runat="server" CssClass="btn-maroon-save" OnClick="btnSaveBranding_Click">
                    <i class="bi bi-floppy"></i> Save Branding
                </asp:LinkButton>
            </div>
        </div>

    </div>
</asp:Content>