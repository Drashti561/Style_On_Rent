<%@ Page Title="Category Management"
    Language="C#"
    MasterPageFile="~/Admin/AdminMaster.Master"
    AutoEventWireup="true"
    CodeFile="CholiCategories.aspx.cs"
    Inherits="Style_On_Rent.Admin.CholiCategories" %>

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

        .category-wrapper {
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

        /* Direct Redirect Link Button */
        .btn-add-category {
            background-color: var(--primary-maroon);
            color: #ffffff !important;
            border: none;
            padding: 9px 20px;
            font-size: 13px;
            font-weight: 600;
            border-radius: 6px;
            cursor: pointer;
            display: inline-flex;
            align-items: center;
            gap: 8px;
            text-decoration: none !important;
            transition: background-color 0.2s ease;
        }

        .btn-add-category:hover {
            background-color: var(--primary-maroon-hover);
        }

        /* Table Card Container */
        .table-card {
            background: #ffffff;
            border-radius: 8px;
            border: 1px solid #ebdcd0;
            overflow: hidden;
            box-shadow: 0 1px 3px rgba(0, 0, 0, 0.02);
        }

        .category-table {
            width: 100%;
            border-collapse: collapse;
            font-size: 13px;
        }

        .category-table th {
            font-weight: 600;
            color: #6b7280;
            padding: 14px 20px;
            text-align: left;
            border-bottom: 1px solid #e5e7eb;
            background-color: #fafbfc;
            font-size: 11px;
            letter-spacing: 0.5px;
            text-transform: uppercase;
        }

        .category-table td {
            padding: 16px 20px;
            vertical-align: middle;
            border-bottom: 1px solid #f3ece4;
            color: #374151;
        }

        .category-table tr:last-child td {
            border-bottom: none;
        }

        .category-table tr:hover {
            background-color: #fdfcfb;
        }

        /* Gallery Cluster */
        .image-cluster-cell {
            display: inline-flex;
            align-items: center;
            gap: 4px;
        }

        .category-thumb-img {
            width: 38px;
            height: 38px;
            border-radius: 4px;
            object-fit: cover;
            border: 1px solid #ebdcd0;
            display: block;
        }

        .cluster-count-badge {
            min-width: 32px;
            height: 38px;
            background-color: #f3f4f6;
            color: #4b5563;
            font-size: 11px;
            font-weight: 600;
            display: inline-flex;
            align-items: center;
            justify-content: center;
            border-radius: 4px;
            border: 1px solid #e5e7eb;
            padding: 0 4px;
            box-sizing: border-box;
        }

        .category-name-text {
            font-size: 13.5px;
            font-weight: 700;
            color: #111827;
        }

        .inventory-count-text {
            color: #4b5563;
            font-size: 13px;
        }

        /* Status Badges */
        .status-pill {
            display: inline-block;
            padding: 3px 10px;
            border-radius: 4px;
            font-size: 10.5px;
            font-weight: 700;
            letter-spacing: 0.5px;
            text-transform: uppercase;
        }

        .status-active {
            background-color: #fdf2f4;
            color: var(--primary-maroon);
            border: 1px solid #f9dbe1;
        }

        .status-premium {
            background-color: #fef9ee;
            color: #b45309;
            border: 1px solid #fde68a;
        }

        /* Action Buttons */
        .actions-cell {
            display: inline-flex;
            align-items: center;
            gap: 16px;
        }

        .actions-cell a.btn-act,
        .actions-cell a.btn-act:visited,
        .actions-cell a.btn-act:active,
        .actions-cell a.btn-act:focus {
            background: transparent !important;
            border: none !important;
            padding: 0 !important;
            margin: 0 !important;
            text-decoration: none !important;
            display: inline-flex !important;
            align-items: center;
            justify-content: center;
            cursor: pointer;
            font-size: 15px;
            line-height: 1;
            transition: transform 0.15s ease, opacity 0.15s ease;
        }

        .actions-cell a.btn-act:hover {
            transform: scale(1.2);
            opacity: 0.85;
        }

        .actions-cell a.btn-act-view,
        .actions-cell a.btn-act-view i,
        .actions-cell a.btn-act-view:visited i {
            color: #1d68ed !important;
        }

        .actions-cell a.btn-act-edit,
        .actions-cell a.btn-act-edit i,
        .actions-cell a.btn-act-edit:visited i {
            color: #d97706 !important;
        }

        .actions-cell a.btn-act-delete,
        .actions-cell a.btn-act-delete i,
        .actions-cell a.btn-act-delete:visited i {
            color: #c5161d !important;
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
            border-radius: 10px;
            width: 540px;
            max-width: 90vw;
            box-shadow: 0 20px 25px -5px rgba(0, 0, 0, 0.2);
            border-top: 5px solid var(--primary-maroon);
            overflow: hidden;
            animation: modalFadeIn 0.2s ease-out;
        }

        .modal-card-danger {
            width: 420px;
            border-top: 5px solid #dc2626;
        }

        @keyframes modalFadeIn {
            from { opacity: 0; transform: translateY(-8px) scale(0.98); }
            to { opacity: 1; transform: translateY(0) scale(1); }
        }

        .modal-header {
            display: flex;
            align-items: center;
            justify-content: space-between;
            padding: 18px 24px;
            border-bottom: 1px solid #ebdcd0;
        }

        .modal-header h2 {
            font-size: 17px;
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
            padding: 20px 24px;
            max-height: 75vh;
            overflow-y: auto;
        }

        .modal-footer {
            display: flex;
            justify-content: flex-end;
            gap: 10px;
            padding: 16px 24px;
            background-color: #fafbfc;
            border-top: 1px solid #ebdcd0;
        }

        .form-group {
            margin-bottom: 14px;
        }

        .form-group label {
            display: block;
            font-size: 12px;
            font-weight: 600;
            color: #374151;
            margin-bottom: 5px;
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
        }

        .form-input:focus {
            border-color: var(--primary-maroon);
            background-color: #ffffff;
        }

        /* Multiple Photo Upload Box */
        .modal-photo-upload-box {
            display: flex;
            flex-direction: column;
            gap: 10px;
            padding: 14px;
            background: #faf7f2;
            border: 1px dashed #ebdcd0;
            border-radius: 6px;
            margin-bottom: 14px;
        }

        .modal-preview-gallery {
            display: flex;
            align-items: center;
            gap: 8px;
            flex-wrap: wrap;
        }

        .modal-preview-thumb {
            width: 48px;
            height: 48px;
            border-radius: 6px;
            object-fit: cover;
            border: 1px solid #ebdcd0;
            background: #ffffff;
        }

        /* View Modal Gallery Grid */
        .view-gallery-grid {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(75px, 1fr));
            gap: 10px;
            margin-bottom: 16px;
        }

        .view-large-thumb {
            width: 100%;
            height: 75px;
            border-radius: 6px;
            object-fit: cover;
            border: 1px solid #ebdcd0;
            background-color: #ffffff;
        }

        .btn-modal-close-red {
            background-color: #dc2626 !important;
            color: #ffffff !important;
            border: none !important;
            padding: 8px 24px;
            border-radius: 5px;
            font-size: 13px;
            font-weight: 600;
            cursor: pointer;
            transition: background-color 0.2s ease;
        }

        .btn-modal-close-red:hover {
            background-color: #b91c1c !important;
        }

        .btn-modal-cancel {
            background: #ffffff;
            color: #4b5563;
            border: 1px solid #d1d5db;
            padding: 8px 18px;
            border-radius: 5px;
            font-size: 13px;
            font-weight: 500;
            cursor: pointer;
        }

        .btn-modal-save {
            background: var(--primary-maroon);
            color: #ffffff;
            border: none;
            padding: 8px 22px;
            border-radius: 5px;
            font-size: 13px;
            font-weight: 600;
            cursor: pointer;
        }

        .btn-modal-save:hover {
            background: var(--primary-maroon-hover);
        }

        .detail-row-grid {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 14px;
            margin-bottom: 14px;
        }

        .detail-box {
            background: #faf7f2;
            border: 1px solid #ebdcd0;
            padding: 12px 14px;
            border-radius: 6px;
        }

        .detail-title {
            font-size: 11px;
            font-weight: 600;
            color: #6b7280;
            text-transform: uppercase;
            letter-spacing: 0.5px;
            margin-bottom: 4px;
        }

        .detail-val {
            font-size: 14px;
            font-weight: 700;
            color: #111827;
        }

        .delete-dialog-content {
            text-align: center;
            padding: 10px 0;
        }

        .delete-icon-box {
            width: 54px;
            height: 54px;
            border-radius: 50%;
            background-color: #fee2e2;
            color: #dc2626;
            display: inline-flex;
            align-items: center;
            justify-content: center;
            font-size: 24px;
            margin-bottom: 14px;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <asp:ScriptManager ID="smCategories" runat="server" />

    <asp:UpdatePanel ID="upnlCategories" runat="server" UpdateMode="Conditional">
        <ContentTemplate>
            <div class="category-wrapper">

                <!-- Header -->
                <div class="page-header-row">
                    <div class="header-brand-box">
                        <img src="Images/logo.png" class="brand-logo" alt="Style On Rent" />
                        <div class="header-title-box">
                            <h1>Category Management</h1>
                            <p>Manage choli collections, imagery, and structural metadata.</p>
                        </div>
                    </div>

                    <!-- Direct Navigation to AddCategory.aspx -->
                    <a href="AddCategory.aspx" class="btn-add-category">
                        <i class="fa-solid fa-plus"></i> Add New Category
                    </a>
                </div>

                <!-- Categories Table Card -->
                <div class="table-card">
                    <asp:Repeater ID="rptCategories" runat="server" OnItemCommand="rptCategories_ItemCommand">
                        <HeaderTemplate>
                            <table class="category-table">
                                <thead>
                                    <tr>
                                        <th style="width: 20%;">IMAGE</th>
                                        <th style="width: 36%;">CATEGORY NAME</th>
                                        <th style="width: 14%;">STATUS</th>
                                        <th style="width: 18%;">INVENTORY COUNT</th>
                                        <th style="width: 12%;">ACTIONS</th>
                                    </tr>
                                </thead>
                                <tbody>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <tr>
                                <td>
                                    <!-- Dynamic Image Cluster -->
                                    <div class="image-cluster-cell">
                                        <img src='<%# Eval("PrimaryImage") %>' class="category-thumb-img" alt='<%# Eval("CategoryName") %>' />
                                        <asp:PlaceHolder ID="phSecondary" runat="server" Visible='<%# !string.IsNullOrEmpty(Eval("SecondaryImage").ToString()) %>'>
                                            <img src='<%# Eval("SecondaryImage") %>' class="category-thumb-img" alt="Secondary Preview" />
                                        </asp:PlaceHolder>
                                        <span class="cluster-count-badge"><%# Eval("CountBadge") %></span>
                                    </div>
                                </td>
                                <td class="category-name-text"><%# Eval("CategoryName") %></td>
                                <td>
                                    <span class='status-pill <%# Eval("Status").ToString() == "PREMIUM" ? "status-premium" : "status-active" %>'>
                                        <%# Eval("Status") %>
                                    </span>
                                </td>
                                <td class="inventory-count-text"><%# Eval("InventoryCount") %> items</td>
                                <td>
                                    <!-- 3 Standard Actions -->
                                    <div class="actions-cell">
                                        <asp:LinkButton 
                                            ID="btnView" 
                                            runat="server" 
                                            CommandName="ViewCategory" 
                                            CommandArgument='<%# Eval("Id") %>' 
                                            CssClass="btn-act btn-act-view" 
                                            ToolTip="View Details">
                                            <i class="fa-solid fa-eye"></i>
                                        </asp:LinkButton>

                                        <asp:LinkButton 
                                            ID="btnEdit" 
                                            runat="server" 
                                            CommandName="EditCategory" 
                                            CommandArgument='<%# Eval("Id") %>' 
                                            CssClass="btn-act btn-act-edit" 
                                            ToolTip="Edit Category">
                                            <i class="fa-solid fa-pen-to-square"></i>
                                        </asp:LinkButton>

                                        <asp:LinkButton 
                                            ID="btnDelete" 
                                            runat="server" 
                                            CommandName="DeleteCategory" 
                                            CommandArgument='<%# Eval("Id") %>' 
                                            CssClass="btn-act btn-act-delete" 
                                            ToolTip="Delete Category">
                                            <i class="fa-solid fa-trash-can"></i>
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

            </div>

            <!-- POPUP 1: VIEW DETAILS MODAL -->
            <asp:Panel ID="pnlViewModal" runat="server" CssClass="modal-overlay" Visible="false">
                <div class="modal-card">
                    <div class="modal-header">
                        <h2>Category Information</h2>
                        <asp:LinkButton ID="btnCloseViewX" runat="server" CssClass="btn-modal-close" CausesValidation="false" OnClick="btnCloseView_Click">
                            <i class="fa-solid fa-xmark"></i>
                        </asp:LinkButton>
                    </div>

                    <div class="modal-body">
                        <div style="font-size: 11px; color: #6b7280; font-weight: 600; text-transform: uppercase; margin-bottom: 8px;">
                            UPLOADED GALLERY PHOTOS (<asp:Literal ID="litViewPhotoCount" runat="server" />)
                        </div>

                        <div class="view-gallery-grid">
                            <asp:Repeater ID="rptViewGallery" runat="server">
                                <ItemTemplate>
                                    <img src='<%# Container.DataItem %>' class="view-large-thumb" alt="Gallery Photo" />
                                </ItemTemplate>
                            </asp:Repeater>
                        </div>

                        <div style="margin-bottom: 18px;">
                            <div style="font-size: 11px; color: #6b7280; font-weight: 600; text-transform: uppercase;">CATEGORY NAME</div>
                            <h3 style="font-size: 20px; margin: 4px 0 6px 0; color: #111827;">
                                <asp:Literal ID="litViewCatName" runat="server" />
                            </h3>
                        </div>

                        <div class="detail-row-grid">
                            <div class="detail-box">
                                <div class="detail-title">Catalog Status</div>
                                <div class="detail-val">
                                    <asp:Literal ID="litViewStatus" runat="server" />
                                </div>
                            </div>
                            <div class="detail-box">
                                <div class="detail-title">Stock Count</div>
                                <div class="detail-val">
                                    <asp:Literal ID="litViewInventory" runat="server" /> Items
                                </div>
                            </div>
                        </div>

                        <div class="detail-box">
                            <div class="detail-title">Gallery Variants</div>
                            <div class="detail-val" style="font-size: 13.5px;">
                                <asp:Literal ID="litViewGalleryBadge" runat="server" /> registered choli variants
                            </div>
                        </div>
                    </div>

                    <div class="modal-footer">
                        <asp:Button ID="btnCloseViewBtn" runat="server" Text="Close" CssClass="btn-modal-close-red" CausesValidation="false" OnClick="btnCloseView_Click" />
                    </div>
                </div>
            </asp:Panel>

            <!-- POPUP 2: EDIT CATEGORY MODAL -->
            <asp:Panel ID="pnlEditModal" runat="server" CssClass="modal-overlay" Visible="false">
                <div class="modal-card">
                    <div class="modal-header">
                        <h2>Edit Category</h2>
                        <asp:LinkButton ID="btnCloseEditX" runat="server" CssClass="btn-modal-close" CausesValidation="false" OnClick="btnCancelEdit_Click">
                            <i class="fa-solid fa-xmark"></i>
                        </asp:LinkButton>
                    </div>

                    <div class="modal-body">
                        <asp:HiddenField ID="hfEditCategoryId" runat="server" Value="0" />
                        <asp:HiddenField ID="hfAllImageUrls" runat="server" Value="" />

                        <label class="field-label" style="font-size: 12px; font-weight: 600; color: #374151; margin-bottom: 6px; display: block;">
                            CATEGORY PHOTOS (MULTIPLE)
                        </label>
                        <div class="modal-photo-upload-box">
                            <div>
                                <span style="font-size: 11px; font-weight: 600; color: #374151; display: block; margin-bottom: 4px;">
                                    Upload new / additional images:
                                </span>
                                <asp:FileUpload ID="fuCategoryImages" runat="server" AllowMultiple="true" CssClass="form-input" style="padding-top: 6px; height: 42px;" />
                                <span style="font-size: 10px; color: #9ca3af; display: block; margin-top: 3px;">
                                    Hold Ctrl / Shift to select multiple JPG, PNG, WEBP files. (Leave empty to keep existing images)
                                </span>
                            </div>

                            <asp:Panel ID="pnlCurrentThumbs" runat="server" Visible="false">
                                <span style="font-size: 11px; font-weight: 600; color: #6b7280; display: block; margin-bottom: 4px;">
                                    Current Images:
                                </span>
                                <div class="modal-preview-gallery">
                                    <asp:Repeater ID="rptCurrentEditThumbs" runat="server">
                                        <ItemTemplate>
                                            <img src='<%# Container.DataItem %>' class="modal-preview-thumb" alt="Current Photo" />
                                        </ItemTemplate>
                                    </asp:Repeater>
                                </div>
                            </asp:Panel>
                        </div>

                        <div class="form-group">
                            <label>Category Name *</label>
                            <asp:TextBox ID="txtEditCatName" runat="server" CssClass="form-input" placeholder="e.g. Blush Floral Applique" />
                        </div>

                        <div class="form-group">
                            <label>Status</label>
                            <asp:DropDownList ID="ddlEditStatus" runat="server" CssClass="form-input">
                                <asp:ListItem Text="ACTIVE" Value="ACTIVE" Selected="True" />
                                <asp:ListItem Text="PREMIUM" Value="PREMIUM" />
                            </asp:DropDownList>
                        </div>

                        <div class="form-group">
                            <label>Inventory Count</label>
                            <asp:TextBox ID="txtEditInventory" runat="server" CssClass="form-input" placeholder="e.g. 12" />
                        </div>
                    </div>

                    <div class="modal-footer">
                        <asp:Button ID="btnCancelEdit" runat="server" Text="Cancel" CssClass="btn-modal-cancel" CausesValidation="false" OnClick="btnCancelEdit_Click" />
                        <asp:Button ID="btnSaveEdit" runat="server" Text="Save Category" CssClass="btn-modal-save" OnClick="btnSaveEdit_Click" />
                    </div>
                </div>
            </asp:Panel>

            <!-- POPUP 3: DELETE CONFIRMATION MODAL -->
            <asp:Panel ID="pnlDeleteModal" runat="server" CssClass="modal-overlay" Visible="false">
                <div class="modal-card modal-card-danger">
                    <div class="modal-header" style="border-bottom: none; padding-bottom: 0;">
                        <span></span>
                        <asp:LinkButton ID="btnCloseDeleteX" runat="server" CssClass="btn-modal-close" CausesValidation="false" OnClick="btnCancelDelete_Click">
                            <i class="fa-solid fa-xmark"></i>
                        </asp:LinkButton>
                    </div>

                    <div class="modal-body">
                        <asp:HiddenField ID="hfDeleteCategoryId" runat="server" Value="0" />
                        <div class="delete-dialog-content">
                            <div class="delete-icon-box">
                                <i class="fa-solid fa-triangle-exclamation"></i>
                            </div>
                            <h3 style="font-size: 16px; font-weight: 700; color: #111827; margin: 0 0 6px 0;">
                                Are you sure you want to delete this category?
                            </h3>
                            <p style="font-size: 13px; color: #6b7280; margin: 0; line-height: 1.4;">
                                Category <strong><asp:Literal ID="litDeleteTargetName" runat="server" /></strong> and all associated images will be removed.
                            </p>
                        </div>
                    </div>

                    <div class="modal-footer" style="justify-content: center; background: #ffffff;">
                        <asp:Button ID="btnCancelDelete" runat="server" Text="No, Keep It" CssClass="btn-modal-cancel" CausesValidation="false" OnClick="btnCancelDelete_Click" />
                        <asp:Button ID="btnConfirmDelete" runat="server" Text="Yes, Delete" CssClass="btn-modal-close-red" CausesValidation="false" OnClick="btnConfirmDelete_Click" />
                    </div>
                </div>
            </asp:Panel>

        </ContentTemplate>
        <Triggers>
            <asp:PostBackTrigger ControlID="btnSaveEdit" />
        </Triggers>
    </asp:UpdatePanel>
</asp:Content>