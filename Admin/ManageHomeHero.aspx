<%@ Page Title="Home Page Management"
    Language="C#"
    MasterPageFile="~/Admin/AdminMaster.Master"
    AutoEventWireup="true"
    CodeFile="ManageHomeHero.aspx.cs"
    Inherits="Style_On_Rent.Admin.ManageHomeHero" %>

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

        .home-wrapper {
            padding: 24px 32px 48px 32px;
            max-width: 1250px;
            margin: 0 auto;
            box-sizing: border-box;
        }

        /* Top Header */
        .page-header-row {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 24px;
        }

        .header-brand-box {
            display: flex;
            align-items: center;
            gap: 18px;
        }

        .brand-logo {
            width: 70px;
            height: auto;
            object-fit: contain;
        }

        .header-title-box h1 {
            font-size: 24px;
            font-weight: 700;
            color: var(--text-dark);
            margin: 0 0 4px 0;
        }

        .header-title-box p {
            font-size: 13px;
            color: var(--text-muted);
            margin: 0;
        }

        .btn-publish {
            background-color: var(--primary-maroon);
            color: #ffffff !important;
            border: none;
            padding: 9px 20px;
            font-size: 12.5px;
            font-weight: 700;
            border-radius: 6px;
            cursor: pointer;
            text-decoration: none !important;
            transition: background-color 0.2s ease;
        }

        .btn-publish:hover {
            background-color: var(--primary-maroon-hover);
        }

        /* Top 2-Column Grid */
        .top-hero-grid {
            display: grid;
            grid-template-columns: 2fr 1fr;
            gap: 24px;
            align-items: start;
            margin-bottom: 24px;
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
            border-bottom: 1px solid #f3ece4;
        }

        .card-header-bar h2 {
            font-size: 15px;
            font-weight: 700;
            color: var(--primary-maroon);
            margin: 0;
            display: flex;
            align-items: center;
            gap: 8px;
        }

        .badge-active-hero {
            background-color: #fef3c7;
            color: #92400e;
            font-size: 11px;
            font-weight: 700;
            padding: 3px 8px;
            border-radius: 4px;
        }

        .btn-icon-add {
            color: var(--primary-maroon);
            font-size: 16px;
            text-decoration: none !important;
            cursor: pointer;
        }

        /* Hero Configuration Inner Layout */
        .hero-config-grid {
            display: grid;
            grid-template-columns: 1fr 1.2fr;
            gap: 18px;
            align-items: start;
        }

        .hero-banner-thumb {
            width: 100%;
            height: 180px;
            border-radius: 6px;
            object-fit: cover;
            border: 1px solid #ebdcd0;
            display: block;
        }

        .field-group {
            margin-bottom: 12px;
        }

        .field-group:last-child {
            margin-bottom: 0;
        }

        .field-label {
            display: block;
            font-size: 10.5px;
            font-weight: 700;
            color: #4b5563;
            letter-spacing: 0.5px;
            text-transform: uppercase;
            margin-bottom: 5px;
        }

        .field-input {
            width: 100%;
            height: 36px;
            padding: 0 12px;
            border: 1px solid #ebdcd0;
            border-radius: 5px;
            font-size: 12.5px;
            color: #1f2937;
            background-color: #ffffff;
            outline: none;
            box-sizing: border-box;
            transition: border-color 0.2s;
        }

        .field-input:focus {
            border-color: var(--primary-maroon);
        }

        /* Collections Card */
        .collections-list {
            display: flex;
            flex-direction: column;
            gap: 12px;
        }

        .collection-item-box {
            display: flex;
            align-items: center;
            gap: 14px;
            padding: 10px 14px;
            border: 1px solid #ebdcd0;
            border-radius: 6px;
            background-color: #ffffff;
        }

        .collection-thumb {
            width: 48px;
            height: 48px;
            border-radius: 6px;
            object-fit: cover;
            border: 1px solid #ebdcd0;
        }

        .collection-info h4 {
            font-size: 13.5px;
            font-weight: 700;
            color: #111827;
            margin: 0 0 2px 0;
        }

        .collection-info p {
            font-size: 11.5px;
            color: var(--text-muted);
            margin: 0;
        }

        /* Trending Cholis Section */
        .btn-inline-outline {
            border: 1px solid var(--primary-maroon);
            color: var(--primary-maroon) !important;
            background: #ffffff;
            font-size: 11.5px;
            font-weight: 700;
            padding: 5px 12px;
            border-radius: 4px;
            cursor: pointer;
            text-decoration: none !important;
        }

        .btn-inline-outline:hover {
            background-color: #fdf8f6;
        }

        .trending-table {
            width: 100%;
            border-collapse: collapse;
            font-size: 13px;
        }

        .trending-table th {
            font-weight: 600;
            color: #6b7280;
            padding: 12px 16px;
            text-align: left;
            border-bottom: 1px solid #e5e7eb;
            background-color: #fafbfc;
            font-size: 11px;
            letter-spacing: 0.5px;
            text-transform: uppercase;
        }

        .trending-table td {
            padding: 14px 16px;
            vertical-align: middle;
            border-bottom: 1px solid #f3ece4;
            color: #374151;
        }

        .trending-table tr:last-child td {
            border-bottom: none;
        }

        .trending-thumb {
            width: 40px;
            height: 40px;
            border-radius: 4px;
            object-fit: cover;
            border: 1px solid #ebdcd0;
            display: block;
        }

        .choli-title {
            font-weight: 600;
            color: #111827;
        }

        .price-text {
            color: #111827;
            font-weight: 500;
        }

        .status-stock {
            display: inline-block;
            padding: 3px 10px;
            border-radius: 4px;
            font-size: 10.5px;
            font-weight: 700;
            letter-spacing: 0.4px;
            text-transform: uppercase;
        }

        .status-instock {
            background-color: #f0fdf4;
            color: #15803d;
            border: 1px solid #bbf7d0;
        }

        .status-rented {
            background-color: #fff1f2;
            color: #be123c;
            border: 1px solid #fecdd3;
        }

        .action-links-box {
            display: inline-flex;
            align-items: center;
            gap: 14px;
        }

        .btn-act-pencil {
            color: #4b5563 !important;
            font-size: 14px;
            text-decoration: none !important;
            cursor: pointer;
        }
        .btn-act-pencil:hover {
            color: var(--primary-maroon) !important;
        }

        .btn-act-cross {
            color: #9ca3af !important;
            font-size: 14px;
            text-decoration: none !important;
            cursor: pointer;
        }
        .btn-act-cross:hover {
            color: #dc2626 !important;
        }

        /* Brand Narrative Section */
        .narrative-grid {
            display: grid;
            grid-template-columns: 1.2fr 1fr;
            gap: 24px;
            align-items: start;
        }

        .field-textarea-narrative {
            width: 100%;
            height: 90px;
            padding: 10px 12px;
            border: 1px solid #ebdcd0;
            border-radius: 5px;
            font-size: 12.5px;
            color: #1f2937;
            outline: none;
            box-sizing: border-box;
            resize: vertical;
            font-family: inherit;
        }

        .narrative-media-row {
            display: flex;
            gap: 14px;
            align-items: stretch;
        }

        .narrative-collage {
            width: 150px;
            height: 140px;
            border-radius: 6px;
            object-fit: cover;
            border: 1px solid #ebdcd0;
        }

        .upload-drop-target {
            flex: 1;
            height: 140px;
            border: 1.5px dashed #ebdcd0;
            border-radius: 6px;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            background-color: #faf7f2;
            color: #6b7280;
            font-size: 12px;
            cursor: pointer;
            box-sizing: border-box;
        }

        .upload-drop-target i {
            font-size: 20px;
            margin-bottom: 6px;
            color: #9ca3af;
        }

        /* Modal Dialog Styles */
        .modal-overlay {
            position: fixed;
            top: 0;
            left: 0;
            width: 100vw;
            height: 100vh;
            background: rgba(17, 24, 39, 0.55);
            display: flex;
            align-items: center;
            justify-content: center;
            z-index: 999999;
            backdrop-filter: blur(2px);
        }

        .modal-card {
            background: #ffffff;
            border-radius: 8px;
            width: 480px;
            max-width: 90vw;
            box-shadow: 0 20px 25px -5px rgba(0, 0, 0, 0.2);
            border-top: 5px solid var(--primary-maroon);
            overflow: hidden;
            animation: modalFadeIn 0.2s ease-out;
        }

        @keyframes modalFadeIn {
            from { opacity: 0; transform: translateY(-8px) scale(0.98); }
            to { opacity: 1; transform: translateY(0) scale(1); }
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

        .btn-modal-close:hover {
            color: var(--primary-maroon);
        }

        .modal-body {
            padding: 20px;
        }

        .modal-footer {
            display: flex;
            justify-content: flex-end;
            gap: 10px;
            padding: 14px 20px;
            background-color: #fafbfc;
            border-top: 1px solid #ebdcd0;
        }

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

        /* Image Edit Section inside Modal */
        .modal-image-edit-box {
            display: flex;
            align-items: center;
            gap: 16px;
            padding: 12px;
            background: #faf7f2;
            border: 1px solid #ebdcd0;
            border-radius: 6px;
            margin-bottom: 14px;
        }

        .modal-preview-thumb {
            width: 56px;
            height: 56px;
            border-radius: 6px;
            object-fit: cover;
            border: 1px solid #ebdcd0;
            flex-shrink: 0;
            background: #ffffff;
        }

        .modal-upload-input {
            font-size: 12px;
            color: #4b5563;
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
    <asp:ScriptManager ID="smHomeHero" runat="server" />

    <asp:UpdatePanel ID="upnlHomeHero" runat="server" UpdateMode="Conditional">
        <ContentTemplate>
            <div class="home-wrapper">

                <!-- Header[cite: 11] -->
                <div class="page-header-row">
                    <div class="header-brand-box">
                        <img src="Images/logo.png" class="brand-logo" alt="Style On Rent" />
                        <div class="header-title-box">
                            <h1>Home Page Management</h1>
                            <p>Configure and update the main storefront landing page sections.</p>
                        </div>
                    </div>

                    <asp:Button 
                        ID="btnPublishChanges" 
                        runat="server" 
                        Text="Publish Changes" 
                        CssClass="btn-publish" 
                        OnClick="btnPublishChanges_Click" />
                </div>

                <!-- Success Alert -->
                <asp:Panel ID="pnlAlertSuccess" runat="server" CssClass="alert-success-banner" Visible="false">
                    <i class="fa-solid fa-circle-check"></i>
                    Landing page changes have been published successfully!
                </asp:Panel>

                <!-- TOP GRID: Hero Section & Collections[cite: 11] -->
                <div class="top-hero-grid">

                    <!-- Section 1: Hero Section[cite: 11] -->
                    <div class="content-card" style="margin-bottom: 0;">
                        <div class="card-header-bar">
                            <h2><i class="bi bi-aspect-ratio"></i> Hero Section</h2>
                            <span class="badge-active-hero">Active</span>
                        </div>

                        <div class="hero-config-grid">
                            <div>
                                <label class="field-label">BACKGROUND IMAGE</label>
                                <img src="Images/storefront_hero.jpg" class="hero-banner-thumb" alt="Storefront Banner" />
                            </div>

                            <div>
                                <div class="field-group">
                                    <label class="field-label">MAIN HEADING</label>
                                    <asp:TextBox ID="txtHeroMainHeading" runat="server" CssClass="field-input" Text="NEW ARRIVALS" />
                                </div>

                                <div class="field-group">
                                    <label class="field-label">SUBTEXT</label>
                                    <asp:TextBox ID="txtHeroSubtext" runat="server" CssClass="field-input" Text="Discover our latest designer Choli collection" />
                                </div>

                                <div class="field-group">
                                    <label class="field-label">CTA BUTTON TEXT</label>
                                    <asp:TextBox ID="txtHeroBtnText" runat="server" CssClass="field-input" Text="SHOP NOW" />
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Section 2: Collections[cite: 11] -->
                    <div class="content-card" style="margin-bottom: 0;">
                        <div class="card-header-bar">
                            <h2><i class="bi bi-collection"></i> Collections</h2>
                            <asp:LinkButton ID="btnAddCollectionModal" runat="server" CssClass="btn-icon-add" CausesValidation="false" OnClick="btnAddCollectionModal_Click">
                                <i class="bi bi-plus-circle"></i>
                            </asp:LinkButton>
                        </div>

                        <div class="collections-list">
                            <asp:Repeater ID="rptCollections" runat="server">
                                <ItemTemplate>
                                    <div class="collection-item-box">
                                        <img src='<%# Eval("ImageUrl") %>' class="collection-thumb" alt='<%# Eval("Title") %>' />
                                        <div class="collection-info">
                                            <h4><%# Eval("Title") %></h4>
                                            <p><%# Eval("ItemsCount") %> Items</p>
                                        </div>
                                    </div>
                                </ItemTemplate>
                            </asp:Repeater>
                        </div>
                    </div>

                </div>

                <!-- Section 3: Trending Cholis[cite: 11] -->
                <div class="content-card">
                    <div class="card-header-bar">
                        <h2><i class="bi bi-graph-up-arrow"></i> Trending Cholis</h2>
                        <asp:LinkButton ID="btnAddTrendingModal" runat="server" CssClass="btn-inline-outline" CausesValidation="false" OnClick="btnAddTrendingModal_Click">
                            + Add Trending Item
                        </asp:LinkButton>
                    </div>

                    <asp:Repeater ID="rptTrendingCholis" runat="server" OnItemCommand="rptTrendingCholis_ItemCommand">
                        <HeaderTemplate>
                            <table class="trending-table">
                                <thead>
                                    <tr>
                                        <th style="width: 10%;">ITEM</th>
                                        <th style="width: 44%;">NAME</th>
                                        <th style="width: 20%;">RENTAL PRICE</th>
                                        <th style="width: 14%;">STATUS</th>
                                        <th style="width: 12%;">ACTIONS</th>
                                    </tr>
                                </thead>
                                <tbody>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <tr>
                                <td>
                                    <img src='<%# Eval("ImageUrl") %>' class="trending-thumb" alt='<%# Eval("Name") %>' />
                                </td>
                                <td class="choli-title"><%# Eval("Name") %></td>
                                <td class="price-text">&#8377;<%# Eval("RentalPrice") %>/day</td>
                                <td>
                                    <span class='status-stock <%# Eval("Status").ToString() == "In Stock" ? "status-instock" : "status-rented" %>'>
                                        <%# Eval("Status") %>
                                    </span>
                                </td>
                                <td>
                                    <div class="action-links-box">
                                        <asp:LinkButton ID="btnEditTrending" runat="server" CommandName="EditTrending" CommandArgument='<%# Eval("Id") %>' CssClass="btn-act-pencil" ToolTip="Edit Item">
                                            <i class="fa-solid fa-pencil"></i>
                                        </asp:LinkButton>
                                        <asp:LinkButton ID="btnDeleteTrending" runat="server" CommandName="DeleteTrending" CommandArgument='<%# Eval("Id") %>' CssClass="btn-act-cross" ToolTip="Remove from Trending">
                                            <i class="fa-solid fa-xmark"></i>
                                        </asp:LinkButton>
                                    </div>
                                </td>
                            </tr>
                        </ItemTemplate>
                        <FooterTemplate>
                                </tbody>
                            </table>
                        </FooterTemplate>
                    </asp:Repeater>
                </div>

                <!-- Section 4: Brand Narrative[cite: 11] -->
                <div class="content-card">
                    <div class="card-header-bar">
                        <h2><i class="bi bi-stars"></i> Brand Narrative</h2>
                    </div>

                    <div class="narrative-grid">
                        <div>
                            <div class="field-group">
                                <label class="field-label">SECTION HEADING</label>
                                <asp:TextBox ID="txtNarrativeHeading" runat="server" CssClass="field-input" Text="Celebrate the Beauty of Indian Craftsmanship" />
                            </div>

                            <div class="field-group">
                                <label class="field-label">BODY COPY</label>
                                <asp:TextBox ID="txtNarrativeBody" runat="server" TextMode="MultiLine" CssClass="field-textarea-narrative" Text="Our latest collection is an ode to the timeless art of Indian weaving and embroidery. Each piece tells a story..." />
                            </div>
                        </div>

                        <div>
                            <label class="field-label">NARRATIVE IMAGERY (MAX 3)</label>
                            <div class="narrative-media-row">
                                <img src="Images/narrative_collage.jpg" class="narrative-collage" alt="Narrative Preview" />
                                <div class="upload-drop-target">
                                    <i class="bi bi-image"></i>
                                    <span>Upload Image</span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

            </div>

            <!-- POPUP 1: ADD / EDIT TRENDING CHOLI MODAL (WITH EDITABLE PHOTO) -->
            <asp:Panel ID="pnlTrendingModal" runat="server" CssClass="modal-overlay" Visible="false">
                <div class="modal-card">
                    <div class="modal-header">
                        <h2><asp:Literal ID="litTrendingModalTitle" runat="server">Edit Trending Item</asp:Literal></h2>
                        <asp:LinkButton ID="btnCloseTrendingX" runat="server" CssClass="btn-modal-close" CausesValidation="false" OnClick="btnCloseTrendingModal_Click">
                            <i class="fa-solid fa-xmark"></i>
                        </asp:LinkButton>
                    </div>

                    <div class="modal-body">
                        <asp:HiddenField ID="hfTrendingEditId" runat="server" Value="0" />
                        <asp:HiddenField ID="hfCurrentImageUrl" runat="server" Value="" />

                        <!-- PHOTO EDITING BLOCK -->
                        <label class="field-label">CHOLI PHOTO</label>
                        <div class="modal-image-edit-box">
                            <asp:Image ID="imgTrendingPreview" runat="server" CssClass="modal-preview-thumb" ImageUrl="Images/default_choli.jpg" />
                            <div>
                                <span style="font-size: 11px; font-weight: 600; color: #374151; display: block; margin-bottom: 4px;">Choose new image:</span>
                                <asp:FileUpload ID="fuTrendingImage" runat="server" CssClass="modal-upload-input" />
                                <span style="font-size: 10px; color: #9ca3af; display: block; margin-top: 3px;">JPG, PNG (Leave empty to keep current)</span>
                            </div>
                        </div>

                        <label class="field-label">CHOLI NAME *</label>
                        <asp:TextBox ID="txtTrendingName" runat="server" CssClass="field-input" placeholder="e.g. Velvet Floral Embroidery Choli" />

                        <label class="field-label">RENTAL PRICE / DAY (₹) *</label>
                        <asp:TextBox ID="txtTrendingPrice" runat="server" CssClass="field-input" placeholder="e.g. 1,500" />

                        <label class="field-label">STATUS</label>
                        <asp:DropDownList ID="ddlTrendingStatus" runat="server" CssClass="field-input">
                            <asp:ListItem Text="In Stock" Value="In Stock" Selected="True" />
                            <asp:ListItem Text="Rented" Value="Rented" />
                        </asp:DropDownList>
                    </div>

                    <div class="modal-footer">
                        <asp:Button ID="btnCancelTrending" runat="server" Text="Cancel" CssClass="btn-modal-cancel" CausesValidation="false" OnClick="btnCloseTrendingModal_Click" />
                        <asp:Button ID="btnSaveTrending" runat="server" Text="Save Item" CssClass="btn-modal-save" OnClick="btnSaveTrending_Click" />
                    </div>
                </div>
            </asp:Panel>

            <!-- POPUP 2: ADD COLLECTION MODAL -->
            <asp:Panel ID="pnlCollectionModal" runat="server" CssClass="modal-overlay" Visible="false">
                <div class="modal-card">
                    <div class="modal-header">
                        <h2>Add Collection Card</h2>
                        <asp:LinkButton ID="btnCloseCollectionX" runat="server" CssClass="btn-modal-close" CausesValidation="false" OnClick="btnCloseCollectionModal_Click">
                            <i class="fa-solid fa-xmark"></i>
                        </asp:LinkButton>
                    </div>

                    <div class="modal-body">
                        <label class="field-label">COLLECTION TITLE *</label>
                        <asp:TextBox ID="txtCollectionTitle" runat="server" CssClass="field-input" placeholder="e.g. Navratri Dandiya Special" />

                        <label class="field-label">ITEMS COUNT *</label>
                        <asp:TextBox ID="txtCollectionCount" runat="server" CssClass="field-input" placeholder="e.g. 32" />
                    </div>

                    <div class="modal-footer">
                        <asp:Button ID="btnCancelCollection" runat="server" Text="Cancel" CssClass="btn-modal-cancel" CausesValidation="false" OnClick="btnCloseCollectionModal_Click" />
                        <asp:Button ID="btnSaveCollection" runat="server" Text="Add Collection" CssClass="btn-modal-save" OnClick="btnSaveCollection_Click" />
                    </div>
                </div>
            </asp:Panel>

        </ContentTemplate>
        <Triggers>
            <asp:PostBackTrigger ControlID="btnSaveTrending" />
        </Triggers>
    </asp:UpdatePanel>
</asp:Content>