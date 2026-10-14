<%@ Page Title="Admin Profile"
    Language="C#"
    MasterPageFile="~/Admin/AdminMaster.Master"
    AutoEventWireup="true"
    CodeFile="Admin_Profile.aspx.cs"
    Inherits="Style_On_Rent.Admin.Admin_Profile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css" />

    <style>
        :root {
            --primary-maroon: #73001e;
            --primary-maroon-hover: #590017;
            --text-dark: #1f2937;
            --text-muted: #6b7280;
            --border-color: #f0eae1;
            --page-bg: #faf7f2;
        }
        body {
            font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, Arial, sans-serif;
            background-color: var(--page-bg);
            color: var(--text-dark);
            margin: 0;
            padding: 0;
        }
        .profile-wrap {
            padding: 28px 36px 60px 36px;
            max-width: 1280px;
            margin: 0 auto;
            box-sizing: border-box;
        }
        .page-title {
            font-size: 30px;
            font-weight: 800;
            color: #111827;
            margin: 0 0 6px 0;
            letter-spacing: -0.5px;
        }
        .page-subtitle {
            font-size: 14px;
            color: var(--text-muted);
            margin: 0 0 28px 0;
            line-height: 1.5;
            max-width: 720px;
        }

        .profile-grid {
            display: grid;
            grid-template-columns: 1.7fr 1fr;
            gap: 24px;
            align-items: start;
        }

        .panel {
            background: #ffffff;
            border: 1px solid #ece3d8;
            border-radius: 10px;
            padding: 26px 28px;
            box-sizing: border-box;
            margin-bottom: 24px;
        }
        .panel:last-child { margin-bottom: 0; }

        .panel-title {
            display: flex;
            align-items: center;
            gap: 10px;
            font-size: 18px;
            font-weight: 700;
            color: #111827;
            margin: 0 0 20px 0;
            padding-bottom: 16px;
            border-bottom: 1px solid #f0eae1;
        }
        .panel-title i {
            color: var(--primary-maroon);
            font-size: 18px;
        }

        /* --- Profile Picture Row --- */
        .pic-row {
            display: flex;
            align-items: flex-start;
            gap: 22px;
            margin-bottom: 26px;
        }
        .pic-avatar {
            width: 110px;
            height: 110px;
            border-radius: 8px;
            overflow: hidden;
            background: #f5ede5;
            flex-shrink: 0;
            border: 1px solid #ece3d8;
            display: flex;
            align-items: center;
            justify-content: center;
        }
        .pic-avatar img {
            width: 100%;
            height: 100%;
            object-fit: cover;
            display: block;
        }
        .pic-info h4 {
            margin: 4px 0 6px 0;
            font-size: 15px;
            font-weight: 700;
            color: #111827;
        }
        .pic-info p {
            margin: 0 0 14px 0;
            font-size: 12.5px;
            color: var(--text-muted);
            line-height: 1.4;
        }
        .pic-actions {
            display: flex;
            align-items: center;
            gap: 16px;
        }
        .btn-upload {
            display: inline-flex;
            align-items: center;
            gap: 6px;
            padding: 8px 18px;
            border: 1px solid #d1d5db;
            background: #ffffff;
            color: #374151;
            font-size: 12.5px;
            font-weight: 600;
            border-radius: 6px;
            cursor: pointer;
            transition: all 0.15s;
        }
        .btn-upload:hover {
            border-color: var(--primary-maroon);
            color: var(--primary-maroon);
        }
        .btn-remove {
            background: none;
            border: none;
            color: #dc2626;
            font-size: 12.5px;
            font-weight: 600;
            cursor: pointer;
            padding: 0;
        }
        .btn-remove:hover { text-decoration: underline; }

        /* --- Form fields --- */
        .form-row {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 18px;
            margin-bottom: 18px;
        }
        .form-row.single {
            grid-template-columns: 1fr;
        }
        .form-group { margin-bottom: 18px; }
        .form-row .form-group { margin-bottom: 0; }

        .form-label {
            display: block;
            font-size: 12.5px;
            font-weight: 600;
            color: #374151;
            margin-bottom: 7px;
        }
        .input-wrap {
            position: relative;
        }
        .input-wrap i {
            position: absolute;
            left: 14px;
            top: 50%;
            transform: translateY(-50%);
            color: #9ca3af;
            font-size: 15px;
            pointer-events: none;
        }
        .form-input {
            width: 100%;
            height: 46px;
            padding: 0 14px;
            border: 1px solid #ebdcd0;
            border-radius: 6px;
            font-size: 14px;
            color: var(--text-dark);
            background: #fffaf7;
            outline: none;
            box-sizing: border-box;
            font-family: inherit;
        }
        .form-input.has-icon {
            padding-left: 42px;
        }
        .form-input:focus {
            border-color: var(--primary-maroon);
            background: #ffffff;
        }

        .form-footer {
            display: flex;
            justify-content: flex-end;
            margin-top: 8px;
        }
        .btn-save {
            background: var(--primary-maroon);
            color: #ffffff;
            border: none;
            padding: 12px 26px;
            font-size: 13px;
            font-weight: 700;
            border-radius: 6px;
            cursor: pointer;
            letter-spacing: 0.3px;
        }
        .btn-save:hover { background: var(--primary-maroon-hover); }

        /* --- Sidebar panels --- */
        .side-panel {
            background: #ffffff;
            border: 1px solid #ece3d8;
            border-radius: 10px;
            padding: 24px 26px;
            margin-bottom: 24px;
            box-sizing: border-box;
        }
        .side-panel:last-child { margin-bottom: 0; }

        .side-title {
            display: flex;
            align-items: center;
            gap: 10px;
            font-size: 17px;
            font-weight: 700;
            color: #111827;
            margin: 0 0 18px 0;
            padding-bottom: 14px;
            border-bottom: 1px solid #f0eae1;
        }
        .side-title i {
            color: var(--primary-maroon);
            font-size: 17px;
        }

        .btn-update-pass {
            width: 100%;
            height: 44px;
            background: #ffffff;
            border: 1px solid var(--primary-maroon);
            color: var(--primary-maroon);
            font-size: 13px;
            font-weight: 700;
            border-radius: 6px;
            cursor: pointer;
            margin-top: 8px;
            transition: all 0.15s;
        }
        .btn-update-pass:hover {
            background: var(--primary-maroon);
            color: #ffffff;
        }

        /* --- Toggle switches --- */
        .pref-row {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 12px 0;
        }
        .pref-row:not(:last-child) {
            border-bottom: 1px solid #f5ede5;
        }
        .pref-label {
            font-size: 13.5px;
            color: #374151;
            font-weight: 500;
        }

        .switch {
            position: relative;
            display: inline-block;
            width: 42px;
            height: 24px;
            flex-shrink: 0;
        }
        .switch input { opacity: 0; width: 0; height: 0; }
        .slider {
            position: absolute;
            cursor: pointer;
            top: 0; left: 0; right: 0; bottom: 0;
            background-color: #d1d5db;
            border-radius: 24px;
            transition: 0.2s;
        }
        .slider:before {
            position: absolute;
            content: "";
            height: 18px;
            width: 18px;
            left: 3px;
            bottom: 3px;
            background-color: #ffffff;
            border-radius: 50%;
            transition: 0.2s;
        }
        .switch input:checked + .slider {
            background-color: #590017;
        }
        .switch input:checked + .slider:before {
            transform: translateX(18px);
        }

        @media (max-width: 980px) {
            .profile-grid { grid-template-columns: 1fr; }
            .form-row { grid-template-columns: 1fr; }
            .pic-row { flex-direction: column; align-items: center; text-align: center; }
            .pic-actions { justify-content: center; }
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="profile-wrap">

        <h1 class="page-title">Admin Profile</h1>
        <p class="page-subtitle">
            Manage your administrative profile, security preferences, and global notifications
            for the Style On Rent platform.
        </p>

        <div class="profile-grid">

            <!-- ============ LEFT COLUMN ============ -->
            <div>

                <!-- Personal Information Panel -->
                <div class="panel">
                    <h3 class="panel-title">
                        <i class="bi bi-person"></i> Personal Information
                    </h3>

                    <!-- Profile Picture -->
                    <div class="pic-row">
                        <div class="pic-avatar">
                            <asp:Image ID="imgProfile" runat="server"
                                ImageUrl="Images/profile.jpg"
                                AlternateText="Profile Picture" />
                        </div>
                        <div class="pic-info">
                            <h4>Profile Picture</h4>
                            <p>PNG, JPG up to 5MB. 1:1 aspect ratio recommended.</p>
                            <div class="pic-actions">
                                <asp:FileUpload ID="fuProfilePic" runat="server" Style="display:none;" />
                                <button type="button" class="btn-upload"
                                    onclick="document.getElementById('<%= fuProfilePic.ClientID %>').click();">
                                    Upload New
                                </button>
                                <asp:LinkButton ID="btnRemovePic" runat="server"
                                    CssClass="btn-remove" CausesValidation="false">
                                    Remove
                                </asp:LinkButton>
                            </div>
                        </div>
                    </div>

                    <!-- Name -->
                    <div class="form-row">
                        <div class="form-group">
                            <label class="form-label">First Name</label>
                            <asp:TextBox ID="txtFirstName" runat="server"
                                CssClass="form-input" placeholder="First name" />
                        </div>
                        <div class="form-group">
                            <label class="form-label">Last Name</label>
                            <asp:TextBox ID="txtLastName" runat="server"
                                CssClass="form-input" placeholder="Last name" />
                        </div>
                    </div>

                    <!-- Email -->
                    <div class="form-group">
                        <label class="form-label">Email Address</label>
                        <div class="input-wrap">
                            <i class="bi bi-envelope"></i>
                            <asp:TextBox ID="txtEmail" runat="server"
                                CssClass="form-input has-icon" TextMode="Email"
                                placeholder="admin@styleonrent.com" />
                        </div>
                    </div>

                    <!-- Phone -->
                    <div class="form-group">
                        <label class="form-label">Phone Number</label>
                        <div class="input-wrap">
                            <i class="bi bi-telephone"></i>
                            <asp:TextBox ID="txtPhone" runat="server"
                                CssClass="form-input has-icon" placeholder="+91 98765 43210" />
                        </div>
                    </div>

                    <div class="form-footer">
                        <asp:Button ID="btnSaveChanges" runat="server"
                            Text="Save Changes" CssClass="btn-save"
                            OnClick="btnSaveChanges_Click" />
                    </div>
                </div>

            </div>

            <!-- ============ RIGHT COLUMN ============ -->
            <div>

                <!-- Security Panel -->
                <div class="side-panel">
                    <h3 class="side-title">
                        <i class="bi bi-lock"></i> Security
                    </h3>

                    <div class="form-group">
                        <label class="form-label">Current Password</label>
                        <asp:TextBox ID="txtCurrentPass" runat="server"
                            CssClass="form-input" TextMode="Password" />
                    </div>

                    <div class="form-group">
                        <label class="form-label">New Password</label>
                        <asp:TextBox ID="txtNewPass" runat="server"
                            CssClass="form-input" TextMode="Password" />
                    </div>

                    <div class="form-group">
                        <label class="form-label">Confirm New Password</label>
                        <asp:TextBox ID="txtConfirmPass" runat="server"
                            CssClass="form-input" TextMode="Password" />
                    </div>

                    <asp:Button ID="btnUpdatePassword" runat="server"
                        Text="Update Password" CssClass="btn-update-pass"
                        OnClick="btnUpdatePassword_Click" />
                </div>

                <!-- Preferences Panel -->
                <div class="side-panel">
                    <h3 class="side-title">
                        <i class="bi bi-sliders"></i> Preferences
                    </h3>

                    <div class="form-group">
                        <label class="form-label">System Language</label>
                        <asp:DropDownList ID="ddlLanguage" runat="server" CssClass="form-input">
                            <asp:ListItem Text="English (US)" Value="en-US" Selected="True" />
                            <asp:ListItem Text="English (UK)" Value="en-GB" />
                            <asp:ListItem Text="हिन्दी" Value="hi-IN" />
                            <asp:ListItem Text="ગુજરાતી" Value="gu-IN" />
                        </asp:DropDownList>
                    </div>

                    <div class="form-group" style="margin-bottom:6px;">
                        <label class="form-label" style="margin-bottom:0;">Email Notifications</label>
                    </div>

                    <div class="pref-row">
                        <span class="pref-label">New Orders</span>
                        <label class="switch">
                            <asp:CheckBox ID="chkNewOrders" runat="server" Checked="true" />
                            <span class="slider"></span>
                        </label>
                    </div>

                    <div class="pref-row">
                        <span class="pref-label">Inventory Alerts</span>
                        <label class="switch">
                            <asp:CheckBox ID="chkInventoryAlerts" runat="server" Checked="true" />
                            <span class="slider"></span>
                        </label>
                    </div>

                    <div class="pref-row">
                        <span class="pref-label">Daily Summary</span>
                        <label class="switch">
                            <asp:CheckBox ID="chkDailySummary" runat="server" Checked="false" />
                            <span class="slider"></span>
                        </label>
                    </div>
                </div>

            </div>

        </div>

    </div>
</asp:Content>