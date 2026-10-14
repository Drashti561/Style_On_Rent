<%@ Page Title="Manage About Us Content"
    Language="C#"
    MasterPageFile="~/Admin/AdminMaster.Master"
    AutoEventWireup="true"
    CodeFile="ManageAboutUs.aspx.cs"
    Inherits="Style_On_Rent.Admin.ManageAboutUs" %>

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

        .about-wrapper {
            padding: 24px 32px 48px 32px;
            max-width: 1250px;
            margin: 0 auto;
            box-sizing: border-box;
        }

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

        .about-layout-grid {
            display: grid;
            grid-template-columns: 1.8fr 1fr;
            gap: 24px;
            align-items: start;
        }

        .content-card {
            background: #ffffff;
            border: 1px solid #ebdcd0;
            border-radius: 8px;
            padding: 24px;
            box-sizing: border-box;
            margin-bottom: 24px;
        }

        .card-header-bar {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 18px;
            padding-bottom: 8px;
        }

        .card-header-bar h2 {
            font-size: 16px;
            font-weight: 700;
            color: #111827;
            margin: 0;
            display: flex;
            align-items: center;
            gap: 8px;
        }

        .card-header-bar h2 i {
            color: #b08d79;
            font-size: 16px;
        }

        .btn-add-inline {
            background: none;
            border: none;
            color: var(--primary-maroon);
            font-size: 12.5px;
            font-weight: 700;
            cursor: pointer;
            text-decoration: none !important;
            display: inline-flex;
            align-items: center;
            gap: 4px;
        }

        .field-group { margin-bottom: 16px; }
        .field-group:last-child { margin-bottom: 0; }

        .field-label {
            display: block;
            font-size: 11px;
            font-weight: 700;
            color: #4b5563;
            letter-spacing: 0.5px;
            text-transform: uppercase;
            margin-bottom: 6px;
        }

        .field-textarea {
            width: 100%;
            height: 72px;
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
        }

        .field-textarea:focus { border-color: var(--primary-maroon); }

        .values-grid {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 16px;
        }

        .value-card-box {
            background: #ffffff;
            border: 1px solid #ebdcd0;
            border-radius: 6px;
            padding: 16px;
        }

        .value-card-icon {
            font-size: 15px;
            color: #b08d79;
            margin-bottom: 8px;
        }

        .value-card-title {
            font-size: 13px;
            font-weight: 700;
            color: #111827;
            margin-bottom: 6px;
        }

        .value-card-desc {
            font-size: 12px;
            color: #6b7280;
            line-height: 1.45;
            margin: 0;
        }

        .image-drop-box {
            position: relative;
            border: 1.5px dashed #ebdcd0;
            border-radius: 8px;
            overflow: hidden;
            background: #faf7f2;
            text-align: center;
            cursor: pointer;
            height: 190px;
        }

        .image-preview {
            width: 100%;
            height: 100%;
            object-fit: cover;
            display: block;
        }

        .image-overlay {
            position: absolute;
            top: 0; left: 0;
            width: 100%; height: 100%;
            background: rgba(255, 255, 255, 0.55);
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            color: #374151;
            font-size: 12px;
            font-weight: 600;
        }

        .image-overlay i {
            font-size: 24px;
            margin-bottom: 6px;
            color: #6b7280;
        }

        .image-format-note {
            font-size: 11px;
            color: #6b7280;
            margin-top: 2px;
            font-weight: 400;
        }

        .leadership-list {
            display: flex;
            flex-direction: column;
            gap: 12px;
        }

        .leader-card-item {
            display: flex;
            align-items: center;
            gap: 14px;
            background: #faf7f2;
            border: 1px solid #ebdcd0;
            border-radius: 6px;
            padding: 10px 14px;
        }

        .leader-avatar {
            width: 42px;
            height: 42px;
            border-radius: 6px;
            object-fit: cover;
            border: 1px solid #ebdcd0;
        }

        .leader-info h4 {
            font-size: 13.5px;
            font-weight: 700;
            color: #111827;
            margin: 0 0 2px 0;
        }

        .leader-info p {
            font-size: 11.5px;
            color: var(--text-muted);
            margin: 0;
        }

        .btn-save-all {
            background-color: var(--primary-maroon);
            color: #ffffff !important;
            border: none;
            width: 100%;
            padding: 12px;
            font-size: 13px;
            font-weight: 700;
            border-radius: 6px;
            cursor: pointer;
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 8px;
            text-decoration: none !important;
        }

        .btn-save-all:hover { background-color: var(--primary-maroon-hover); }

        .modal-overlay {
            position: fixed;
            top: 0; left: 0;
            width: 100vw; height: 100vh;
            background: rgba(17, 24, 39, 0.55);
            display: flex;
            align-items: center;
            justify-content: center;
            z-index: 999999;
        }

        .modal-card {
            background: #ffffff;
            border-radius: 10px;
            width: 480px;
            max-width: 90vw;
            box-shadow: 0 20px 25px -5px rgba(0, 0, 0, 0.2);
            border-top: 5px solid var(--primary-maroon);
            overflow: hidden;
        }

        .modal-header {
            display: flex;
            align-items: center;
            justify-content: space-between;
            padding: 16px 20px;
            border-bottom: 1px solid #ebdcd0;
        }

        .modal-header h2 {
            font-size: 16px;
            font-weight: 700;
            color: var(--primary-maroon);
            margin: 0;
        }

        .btn-modal-close {
            background: none;
            border: none;
            font-size: 18px;
            color: #9ca3af;
            cursor: pointer;
            text-decoration: none !important;
        }

        .modal-body { padding: 20px; }

        .modal-footer {
            display: flex;
            justify-content: flex-end;
            gap: 10px;
            padding: 14px 20px;
            background-color: #fafbfc;
            border-top: 1px solid #ebdcd0;
        }

        .form-input {
            width: 100%;
            height: 38px;
            padding: 0 12px;
            border: 1px solid #d1d5db;
            border-radius: 5px;
            font-size: 13px;
            box-sizing: border-box;
            background-color: #fffaf7;
            outline: none;
            color: var(--text-dark);
            margin-bottom: 12px;
        }

        .form-input:focus { border-color: var(--primary-maroon); background-color: #ffffff; }

        .btn-modal-cancel {
            background: #ffffff;
            color: #4b5563;
            border: 1px solid #d1d5db;
            padding: 7px 18px;
            border-radius: 5px;
            font-size: 13px;
            font-weight: 500;
            cursor: pointer;
        }

        .btn-modal-save {
            background: var(--primary-maroon);
            color: #ffffff;
            border: none;
            padding: 7px 22px;
            border-radius: 5px;
            font-size: 13px;
            font-weight: 600;
            cursor: pointer;
        }

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
    <asp:ScriptManager ID="smAboutUs" runat="server" />

    <asp:UpdatePanel ID="upnlAboutUs" runat="server" UpdateMode="Conditional">
        <ContentTemplate>
            <div class="about-wrapper">

                <div class="page-header-row">
                    <img src="Images/logo.png" class="brand-logo" alt="Style On Rent" />
                    <div class="header-title-box">
                        <h1>Manage About Us Content</h1>
                        <p>Update the brand narrative, visuals, and leadership team displayed on the public About Us page.</p>
                    </div>
                </div>

                <asp:Panel ID="pnlAlertSuccess" runat="server" CssClass="alert-success-banner" Visible="false">
                    <i class="fa-solid fa-circle-check"></i>
                    All changes have been successfully saved and published!
                </asp:Panel>

                <div class="about-layout-grid">

                    <!-- LEFT -->
                    <div>
                        <div class="content-card">
                            <div class="card-header-bar">
                                <h2><i class="bi bi-journal-text"></i> Brand Narrative</h2>
                            </div>

                            <div class="field-group">
                                <label class="field-label">OUR STORY</label>
                                <asp:TextBox ID="txtOurStory" runat="server" TextMode="MultiLine" CssClass="field-textarea" />
                            </div>

                            <div class="field-group">
                                <label class="field-label">OUR MISSION</label>
                                <asp:TextBox ID="txtOurMission" runat="server" TextMode="MultiLine" CssClass="field-textarea" />
                            </div>

                            <div class="field-group">
                                <label class="field-label">OUR VISION</label>
                                <asp:TextBox ID="txtOurVision" runat="server" TextMode="MultiLine" CssClass="field-textarea" />
                            </div>
                        </div>

                        <div class="content-card">
                            <div class="card-header-bar">
                                <h2><i class="bi bi-tag"></i> Core Values</h2>
                                <asp:LinkButton ID="btnAddValueModal" runat="server" CssClass="btn-add-inline" CausesValidation="false" OnClick="btnAddValueModal_Click">
                                    + Add Value
                                </asp:LinkButton>
                            </div>

                            <div class="values-grid">
                                <asp:Repeater ID="rptCoreValues" runat="server">
                                    <ItemTemplate>
                                        <div class="value-card-box">
                                            <div class="value-card-icon">
                                                <i class='<%# Eval("IconClass") %>'></i>
                                            </div>
                                            <div class="value-card-title"><%# Eval("Title") %></div>
                                            <p class="value-card-desc"><%# Eval("Description") %></p>
                                        </div>
                                    </ItemTemplate>
                                </asp:Repeater>
                            </div>
                        </div>
                    </div>

                    <!-- RIGHT -->
                    <div>
                        <div class="content-card">
                            <div class="card-header-bar">
                                <h2><i class="bi bi-image"></i> Page Visuals</h2>
                            </div>

                            <div class="field-group">
                                <label class="field-label">HERO IMAGE</label>
                                <div class="image-drop-box" onclick="document.getElementById('<%= fuHeroImage.ClientID %>').click();">
                                    <asp:Image ID="imgHeroPreview" runat="server" CssClass="image-preview" ImageUrl="~/Images/about_hero.jpg" />
                                    <div class="image-overlay">
                                        <i class="bi bi-cloud-arrow-up"></i>
                                        <span>Click to replace Hero Image</span>
                                        <span class="image-format-note">JPG, PNG (Max 5MB)</span>
                                    </div>
                                </div>
                                <asp:FileUpload ID="fuHeroImage" runat="server" Style="display: none;" onchange="this.form.submit();" />
                            </div>
                        </div>

                        <div class="content-card">
                            <div class="card-header-bar">
                                <h2><i class="bi bi-people"></i> Leadership</h2>
                                <asp:LinkButton ID="btnAddLeaderModal" runat="server" CssClass="btn-add-inline" CausesValidation="false" OnClick="btnAddLeaderModal_Click">
                                    <i class="fa-solid fa-plus"></i>
                                </asp:LinkButton>
                            </div>

                            <div class="leadership-list">
                                <asp:Repeater ID="rptLeadership" runat="server">
                                    <ItemTemplate>
                                        <div class="leader-card-item">
                                            <img src='<%# Eval("AvatarUrl") %>' class="leader-avatar" alt='<%# Eval("Name") %>' />
                                            <div class="leader-info">
                                                <h4><%# Eval("Name") %></h4>
                                                <p><%# Eval("Role") %></p>
                                            </div>
                                        </div>
                                    </ItemTemplate>
                                </asp:Repeater>
                            </div>
                        </div>

                        <asp:LinkButton ID="btnSaveAllChanges" runat="server" CssClass="btn-save-all" OnClick="btnSaveAllChanges_Click">
                            <i class="bi bi-floppy"></i> Save All Changes
                        </asp:LinkButton>
                    </div>

                </div>
            </div>

            <!-- POPUP 1: ADD CORE VALUE MODAL -->
            <asp:Panel ID="pnlAddValueModal" runat="server" CssClass="modal-overlay" Visible="false">
                <div class="modal-card">
                    <div class="modal-header">
                        <h2>Add Core Value</h2>
                        <asp:LinkButton ID="btnCloseValueX" runat="server" CssClass="btn-modal-close" CausesValidation="false" OnClick="btnCloseValueModal_Click">
                            <i class="fa-solid fa-xmark"></i>
                        </asp:LinkButton>
                    </div>

                    <div class="modal-body">
                        <label class="field-label">ICON</label>
                        <asp:DropDownList ID="ddlValueIcon" runat="server" CssClass="form-input">
                            <asp:ListItem Text="Diamond / Quality" Value="bi bi-gem" Selected="True" />
                            <asp:ListItem Text="Leaf / Elegance" Value="bi bi-feather" />
                            <asp:ListItem Text="Sparkles / Hygiene" Value="bi bi-stars" />
                            <asp:ListItem Text="Heart / Passion" Value="bi bi-heart" />
                        </asp:DropDownList>

                        <label class="field-label">VALUE TITLE *</label>
                        <asp:TextBox ID="txtNewValueTitle" runat="server" CssClass="form-input" placeholder="e.g. Sustainable Elegance" />

                        <label class="field-label">DESCRIPTION *</label>
                        <asp:TextBox ID="txtNewValueDesc" runat="server" TextMode="MultiLine" CssClass="form-input" Style="height: 65px;" placeholder="Brief explanation..." />
                    </div>

                    <div class="modal-footer">
                        <asp:Button ID="btnCancelValue" runat="server" Text="Cancel" CssClass="btn-modal-cancel" CausesValidation="false" OnClick="btnCloseValueModal_Click" />
                        <asp:Button ID="btnSaveValue" runat="server" Text="Add Value" CssClass="btn-modal-save" OnClick="btnSaveValue_Click" />
                    </div>
                </div>
            </asp:Panel>

            <!-- POPUP 2: ADD LEADER MODAL -->
            <asp:Panel ID="pnlAddLeaderModal" runat="server" CssClass="modal-overlay" Visible="false">
                <div class="modal-card">
                    <div class="modal-header">
                        <h2>Add Leadership Member</h2>
                        <asp:LinkButton ID="btnCloseLeaderX" runat="server" CssClass="btn-modal-close" CausesValidation="false" OnClick="btnCloseLeaderModal_Click">
                            <i class="fa-solid fa-xmark"></i>
                        </asp:LinkButton>
                    </div>

                    <div class="modal-body">
                        <label class="field-label">FULL NAME *</label>
                        <asp:TextBox ID="txtNewLeaderName" runat="server" CssClass="form-input" placeholder="e.g. Ananya Sharma" />

                        <label class="field-label">ROLE / DESIGNATION *</label>
                        <asp:TextBox ID="txtNewLeaderRole" runat="server" CssClass="form-input" placeholder="e.g. Founder & CEO" />

                        <label class="field-label">AVATAR IMAGE URL</label>
                        <asp:TextBox ID="txtNewLeaderAvatar" runat="server" CssClass="form-input" placeholder="Images/leader1.jpg (optional)" />
                    </div>

                    <div class="modal-footer">
                        <asp:Button ID="btnCancelLeader" runat="server" Text="Cancel" CssClass="btn-modal-cancel" CausesValidation="false" OnClick="btnCloseLeaderModal_Click" />
                        <asp:Button ID="btnSaveLeader" runat="server" Text="Add Member" CssClass="btn-modal-save" OnClick="btnSaveLeader_Click" />
                    </div>
                </div>
            </asp:Panel>

        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>