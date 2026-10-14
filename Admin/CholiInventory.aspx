<%@ Page Title="Choli Inventory"
    Language="C#"
    MasterPageFile="~/Admin/AdminMaster.Master"
    AutoEventWireup="true"
    CodeFile="CholiInventory.aspx.cs"
    Inherits="Style_On_Rent.Admin.CholiInventory" %>

<asp:Content ID="HeadContent" ContentPlaceHolderID="head" runat="server">
    <!-- Font Awesome Icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" />
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
            font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, "Helvetica Neue", Arial, sans-serif;
            background-color: var(--page-bg);
            color: var(--text-dark);
            margin: 0;
            padding: 0;
        }

        .inventory-wrapper {
            padding: 24px 32px;
            max-width: 1200px;
            margin: 0 auto;
        }

        /* Top Header */
        .inventory-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 24px;
        }

        .brand-section {
            display: flex;
            align-items: center;
            gap: 20px;
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

        .btn-add-choli {
            background-color: var(--primary-maroon);
            color: #ffffff;
            border: none;
            padding: 10px 18px;
            font-size: 13px;
            font-weight: 600;
            border-radius: 6px;
            cursor: pointer;
            display: inline-flex;
            align-items: center;
            gap: 8px;
            transition: background-color 0.2s ease;
        }

        .btn-add-choli:hover {
            background-color: var(--primary-maroon-hover);
        }

        /* Controls */
        .inventory-controls {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 20px;
            gap: 16px;
            position: relative;
        }

        .search-box-container {
            position: relative;
            width: 380px;
        }

        .search-icon {
            position: absolute;
            left: 12px;
            top: 50%;
            transform: translateY(-50%);
            color: #9ca3af;
            font-size: 13px;
        }

        .search-input {
            width: 100%;
            padding: 9px 12px 9px 36px;
            border: 1px solid #ebdcd0;
            border-radius: 6px;
            font-size: 13px;
            background-color: #fffaf7;
            color: var(--text-dark);
            outline: none;
            box-sizing: border-box;
        }

        .search-input:focus {
            border-color: var(--primary-maroon);
        }

        .btn-filter {
            border: 1px solid #d1d5db;
            background: #ffffff;
            color: #374151;
            padding: 8px 16px;
            font-size: 13px;
            border-radius: 6px;
            cursor: pointer;
            display: inline-flex;
            align-items: center;
            gap: 8px;
            text-decoration: none;
        }

        .btn-filter:hover {
            background-color: #f9fafb;
        }

        /* Filter Popup Menu */
        .filter-popup-box {
            position: absolute;
            top: 48px;
            right: 0;
            background: #ffffff;
            border: 1px solid #ebdcd0;
            box-shadow: 0 10px 15px -3px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
            padding: 16px;
            width: 280px;
            z-index: 100;
        }

        .filter-popup-box label {
            display: block;
            font-size: 12px;
            font-weight: 600;
            margin-bottom: 4px;
            color: var(--text-dark);
        }

        .filter-select {
            width: 100%;
            padding: 8px;
            border: 1px solid #d1d5db;
            border-radius: 5px;
            margin-bottom: 12px;
            font-size: 13px;
            background-color: #faf7f2;
        }

        .filter-actions {
            display: flex;
            justify-content: flex-end;
            gap: 8px;
        }

        .btn-sm-apply {
            background-color: var(--primary-maroon);
            color: #fff;
            border: none;
            padding: 6px 14px;
            font-size: 12px;
            border-radius: 4px;
            cursor: pointer;
            font-weight: 500;
        }

        .btn-sm-reset {
            background-color: #e5e7eb;
            color: #374151;
            border: none;
            padding: 6px 14px;
            font-size: 12px;
            border-radius: 4px;
            cursor: pointer;
            font-weight: 500;
        }

        /* Red Button for Close & Delete */
        .btn-sm-red {
            background-color: #dc2626;
            color: #ffffff;
            border: none;
            padding: 6px 16px;
            font-size: 12px;
            border-radius: 4px;
            cursor: pointer;
            font-weight: 600;
            transition: background-color 0.2s;
        }

        .btn-sm-red:hover {
            background-color: #b91c1c;
        }

        /* Table */
        .table-container {
            background: #ffffff;
            border-radius: 8px;
            border: 1px solid #f3ece4;
            overflow: hidden;
        }

        .inventory-table {
            width: 100%;
            border-collapse: collapse;
            font-size: 13px;
        }

        .inventory-table th {
            font-weight: 600;
            color: var(--primary-maroon);
            padding: 14px 16px;
            text-align: left;
            border-bottom: 2px solid #ebdcd0;
            background-color: #fdfaf6;
        }

        .inventory-table td {
            padding: 16px;
            vertical-align: middle;
            border-bottom: 1px solid #f3ece4;
            color: #1f2937;
        }

        .inventory-table tr:last-child td {
            border-bottom: none;
        }

        /* Garment Details */
        .garment-info {
            display: flex;
            align-items: center;
            gap: 14px;
        }

        .garment-thumbnail {
            width: 48px;
            height: 52px;
            object-fit: cover;
            border-radius: 6px;
            background-color: #f3f4f6;
            border: 1px solid #f0eae1;
        }

        .garment-title {
            font-weight: 600;
            font-size: 14px;
            color: #111827;
            margin-bottom: 2px;
        }

        .garment-sku {
            font-size: 11px;
            color: #9ca3af;
        }

        .price-text {
            font-weight: 600;
            color: #111827;
        }

        .price-unit {
            font-weight: 400;
            font-size: 11px;
            color: #6b7280;
        }

        /* Badges */
        .status-badge {
            display: inline-block;
            padding: 4px 12px;
            border-radius: 14px;
            font-size: 11px;
            font-weight: 500;
            text-align: center;
        }

        .badge-available {
            background-color: #fbf5e6;
            color: #b48227;
        }

        .badge-rented {
            background-color: #fde8e8;
            color: #d03d3d;
        }

        .badge-maintenance {
            background-color: #f3f4f6;
            color: #9ca3af;
        }

        /* Action Buttons */
        .action-group {
            display: flex;
            align-items: center;
            gap: 12px;
        }

        .action-icon {
            font-size: 14px;
            text-decoration: none;
            background: none;
            border: none;
            cursor: pointer;
            padding: 2px;
        }

        .action-view { color: #2563eb; }
        .action-edit { color: #f59e0b; }
        .action-delete { color: #dc2626; }

        /* Empty State */
        .empty-row {
            text-align: center;
            padding: 40px !important;
            color: var(--text-muted);
            font-size: 14px;
        }

        /* Modal Backdrop & Popup Window */
        .modal-backdrop {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: rgba(0, 0, 0, 0.5);
            display: flex;
            align-items: center;
            justify-content: center;
            z-index: 1000;
        }

        .modal-box {
            background: #ffffff;
            padding: 24px;
            border-radius: 8px;
            width: 440px;
            max-width: 90%;
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.2);
            border-top: 5px solid var(--primary-maroon);
        }

        .modal-box.delete-box {
            border-top: 5px solid #dc2626;
            text-align: center;
        }

        .modal-title {
            font-size: 18px;
            font-weight: 700;
            color: var(--primary-maroon);
            margin: 0 0 16px 0;
        }

        .form-group {
            margin-bottom: 12px;
            text-align: left;
        }

        .form-group label {
            display: block;
            font-size: 12px;
            font-weight: 600;
            margin-bottom: 4px;
            color: var(--text-dark);
        }

        .form-control {
            width: 100%;
            padding: 8px 10px;
            border: 1px solid #d1d5db;
            border-radius: 5px;
            font-size: 13px;
            box-sizing: border-box;
            background-color: #fffaf7;
        }

        .form-control:focus {
            outline: none;
            border-color: var(--primary-maroon);
        }

        .modal-footer {
            display: flex;
            justify-content: flex-end;
            gap: 10px;
            margin-top: 18px;
        }

        /* Exact Pagination Styling from Screenshot */
        .pagination-container {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 16px 20px;
            border-top: 1px solid #f3ece4;
            background-color: #ffffff;
            font-size: 13px;
            color: #6b7280;
        }

        .pagination-controls {
            display: inline-flex !important;
            align-items: center !important;
            gap: 8px !important;
        }

        /* Arrow Box (< and >) with Light Pink Border */
        .p-nav-btn {
            display: inline-flex !important;
            align-items: center !important;
            justify-content: center !important;
            width: 22px !important;
            height: 30px !important;
            border: 1px solid #f2d7da !important;
            border-radius: 4px !important;
            background-color: #ffffff !important;
            color: #888888 !important;
            font-size: 13px !important;
            text-decoration: none !important;
            line-height: 1 !important;
        }

        .p-nav-btn:hover {
            border-color: #590017 !important;
            color: #590017 !important;
        }

        /* Active Page (1) - Solid Dark Maroon Box */
        .p-num-active {
            display: inline-flex !important;
            align-items: center !important;
            justify-content: center !important;
            width: 32px !important;
            height: 32px !important;
            background-color: #590017 !important;
            color: #ffffff !important;
            font-weight: 600 !important;
            font-size: 13px !important;
            border-radius: 4px !important;
            text-decoration: none !important;
            line-height: 1 !important;
        }

        /* Normal Pages (2, 3) - Plain Text, No Underline */
        .p-num-link {
            display: inline-flex !important;
            align-items: center !important;
            justify-content: center !important;
            min-width: 20px !important;
            height: 32px !important;
            background: transparent !important;
            color: #4b5563 !important;
            font-size: 13px !important;
            font-weight: 500 !important;
            text-decoration: none !important;
        }

        .p-num-link:hover {
            color: #590017 !important;
        }

        /* Dots (...) */
        .p-dots {
            display: inline-flex !important;
            align-items: center !important;
            color: #4b5563 !important;
            font-size: 13px !important;
            padding: 0 2px !important;
            user-select: none !important;
        }
    </style>
</asp:Content>

<asp:Content ID="MainContent" ContentPlaceHolderID="MainContent" runat="server">
    <!-- ASP.NET AJAX ScriptManager (No JS files needed) -->
    <asp:ScriptManager ID="smInventory" runat="server" />

    <asp:UpdatePanel ID="upnlInventory" runat="server" UpdateMode="Conditional">
        <ContentTemplate>
            <div class="inventory-wrapper">
                <!-- Header -->
                <div class="inventory-header">
                    <div class="brand-section">
                        <asp:Image ID="imgLogo" runat="server" ImageUrl="~/Images/logo.png" AlternateText="Style On Rent" CssClass="brand-logo" />
                        <div class="header-title-box">
                            <h1>Choli Inventory</h1>
                            <p>Manage rental collection, track status, and update pricing.</p>
                        </div>
                    </div>
                    <asp:Button ID="btnAddCholi" runat="server" Text="+ Add New Choli" CssClass="btn-add-choli" OnClick="btnAddCholi_Click" />
                </div>

                <!-- Controls: ASP.NET Live Search & Filter -->
                <div class="inventory-controls">
                    <div class="search-box-container">
                        <i class="fa-solid fa-magnifying-glass search-icon"></i>
                        <asp:TextBox ID="txtSearch" runat="server" CssClass="search-input" Placeholder="Search by name or SKU..." AutoPostBack="true" OnTextChanged="txtSearch_TextChanged"></asp:TextBox>
                    </div>

                    <!-- Filter Toggle -->
                    <asp:LinkButton ID="btnToggleFilter" runat="server" CssClass="btn-filter" OnClick="btnToggleFilter_Click">
                        <i class="fa-solid fa-sliders"></i> Filters
                    </asp:LinkButton>

                    <!-- Filter Popup Menu -->
                    <asp:Panel ID="pnlFilterBox" runat="server" CssClass="filter-popup-box" Visible="false">
                        <label>Category</label>
                        <asp:DropDownList ID="ddlCategoryFilter" runat="server" CssClass="filter-select" AutoPostBack="true" OnSelectedIndexChanged="ddlFilter_SelectedIndexChanged">
                            <asp:ListItem Text="All Categories" Value="" />
                            <asp:ListItem Text="Bridal Wear" Value="Bridal Wear" />
                            <asp:ListItem Text="Navratri Special" Value="Navratri Special" />
                            <asp:ListItem Text="Party Wear" Value="Party Wear" />
                        </asp:DropDownList>

                        <label>Status</label>
                        <asp:DropDownList ID="ddlStatusFilter" runat="server" CssClass="filter-select" AutoPostBack="true" OnSelectedIndexChanged="ddlFilter_SelectedIndexChanged">
                            <asp:ListItem Text="All Statuses" Value="" />
                            <asp:ListItem Text="Available" Value="Available" />
                            <asp:ListItem Text="Rented" Value="Rented" />
                            <asp:ListItem Text="Maintenance" Value="Maintenance" />
                        </asp:DropDownList>

                        <div class="filter-actions">
                            <asp:Button ID="btnResetFilter" runat="server" Text="Reset" CssClass="btn-sm-reset" OnClick="btnResetFilter_Click" />
                            <asp:Button ID="btnApplyFilter" runat="server" Text="Apply" CssClass="btn-sm-apply" OnClick="btnApplyFilter_Click" />
                        </div>
                    </asp:Panel>
                </div>

                <!-- Inventory Table Card -->
                <div class="table-container">
                    <asp:Repeater ID="rptInventory" runat="server" OnItemCommand="rptInventory_ItemCommand">
                        <HeaderTemplate>
                            <table class="inventory-table">
                                <thead>
                                    <tr>
                                        <th style="width: 35%;">Garment</th>
                                        <th style="width: 15%;">Category</th>
                                        <th style="width: 10%;">Size</th>
                                        <th style="width: 15%;">Rental Price</th>
                                        <th style="width: 13%;">Status</th>
                                        <th style="width: 12%;">Actions</th>
                                    </tr>
                                </thead>
                                <tbody>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <tr>
                                <td>
                                    <div class="garment-info">
                                        <img src='<%# Eval("ImageUrl") %>' alt='<%# Eval("Title") %>' class="garment-thumbnail" />
                                        <div>
                                            <div class="garment-title"><%# Eval("Title") %></div>
                                            <div class="garment-sku">SKU: <%# Eval("Sku") %></div>
                                        </div>
                                    </div>
                                </td>
                                <td><%# Eval("Category") %></td>
                                <td><%# Eval("Size") %></td>
                                <td>
                                    <span class="price-text">&#8377;<%# Eval("Price", "{0:N0}") %></span>
                                    <span class="price-unit">/<%# Eval("RentalDays") %> days</span>
                                </td>
                                <td>
                                    <span class='<%# GetStatusClass(Eval("Status").ToString()) %>'>
                                        <%# Eval("Status") %>
                                    </span>
                                </td>
                                <td>
                                    <div class="action-group">
                                        <!-- Action: View -->
                                        <asp:LinkButton ID="btnView" runat="server" CommandName="View" CommandArgument='<%# Eval("Id") %>' CssClass="action-icon action-view" ToolTip="View Details">
                                            <i class="fa-regular fa-eye"></i>
                                        </asp:LinkButton>

                                        <!-- Action: Edit Modal -->
                                        <asp:LinkButton ID="btnEdit" runat="server" CommandName="Edit" CommandArgument='<%# Eval("Id") %>' CssClass="action-icon action-edit" ToolTip="Edit Choli">
                                            <i class="fa-solid fa-pen-to-square"></i>
                                        </asp:LinkButton>

                                        <!-- Action: Delete Modal Trigger -->
                                        <asp:LinkButton ID="btnDelete" runat="server" CommandName="ConfirmDelete" CommandArgument='<%# Eval("Id") %>' CssClass="action-icon action-delete" ToolTip="Delete Choli">
                                            <i class="fa-regular fa-trash-can"></i>
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

                    <!-- Server-side Empty Data Row -->
                    <asp:Panel ID="pnlNoData" runat="server" Visible="false">
                        <div class="empty-row">
                            <i class="fa-regular fa-folder-open" style="font-size: 28px; margin-bottom: 8px; display: block; color: #9ca3af;"></i>
                            No choli inventory records found matching your query.
                        </div>
                    </asp:Panel>

                    <!-- Table Footer / Pagination (Exact Match with Image) -->
                    <div class="pagination-container">
                        <div>
                            <span id="lblLiveCount"><asp:Literal ID="litShowingEntries" runat="server">Showing 1 to 10 of 145 entries</asp:Literal></span>
                        </div>
                        
                        <div class="pagination-controls">
                            <!-- Previous Arrow (<) -->
                            <a href="?page=1" class="p-nav-btn" style="text-decoration: none !important;">&lsaquo;</a>

                            <!-- Active Page 1 (Dark Maroon Filled Box) -->
                            <a href="?page=1" class="p-num-active" style="text-decoration: none !important; color: #ffffff !important;">1</a>

                            <!-- Normal Pages (2, 3) -->
                            <a href="?page=2" class="p-num-link" style="text-decoration: none !important; color: #4b5563 !important;">2</a>
                            <a href="?page=3" class="p-num-link" style="text-decoration: none !important; color: #4b5563 !important;">3</a>

                            <!-- Dots (...) -->
                            <span class="p-dots">...</span>

                            <!-- Next Arrow (>) -->
                            <a href="?page=2" class="p-nav-btn" style="text-decoration: none !important;">&rsaquo;</a>
                        </div>
                    </div>
                </div>
            </div>

            <!-- 1. VIEW MODAL POPUP (Full View of Choli) -->
            <asp:Panel ID="pnlViewModal" runat="server" CssClass="modal-backdrop" Visible="false">
                <div class="modal-box" style="width: 480px; max-height: 90vh; overflow-y: auto;">
                    <div style="width: 100%; height: 380px; background-color: #faf7f2; border-radius: 8px; border: 1px solid #ebdcd0; display: flex; align-items: center; justify-content: center; margin-bottom: 16px; padding: 8px; box-sizing: border-box;">
                        <asp:Image ID="imgModalCholi" runat="server" Style="max-width: 100%; max-height: 100%; width: auto; height: auto; object-fit: contain; display: block;" />
                    </div>

                    <h3 class="modal-title" style="margin-bottom: 12px;">
                        <asp:Label ID="lblModalTitle" runat="server" />
                    </h3>
                    
                    <div style="font-size: 13px; line-height: 1.6; color: #374151;">
                        <p style="margin: 4px 0;"><strong>SKU:</strong> <asp:Label ID="lblModalSku" runat="server" /></p>
                        <p style="margin: 4px 0;"><strong>Category:</strong> <asp:Label ID="lblModalCategory" runat="server" /></p>
                        <p style="margin: 4px 0;"><strong>Size:</strong> <asp:Label ID="lblModalSize" runat="server" /></p>
                        <p style="margin: 4px 0;"><strong>Rental Price:</strong> &#8377;<asp:Label ID="lblModalPrice" runat="server" /> (<asp:Label ID="lblModalDays" runat="server" /> days)</p>
                        <p style="margin: 4px 0;"><strong>Status:</strong> <asp:Label ID="lblModalStatus" runat="server" /></p>
                    </div>

                    <div class="modal-footer" style="margin-top: 16px;">
                        <!-- RED CLOSE BUTTON -->
                        <asp:Button ID="btnCloseModal" runat="server" Text="Close" CssClass="btn-sm-red" OnClick="btnCloseModal_Click" />
                    </div>
                </div>
            </asp:Panel>

            <!-- 2. DELETE CONFIRMATION MODAL POPUP -->
            <asp:Panel ID="pnlDeleteModal" runat="server" CssClass="modal-backdrop" Visible="false">
                <div class="modal-box delete-box">
                    <asp:HiddenField ID="hfDeleteId" runat="server" />
                    <i class="fa-solid fa-triangle-exclamation" style="font-size: 40px; color: #dc2626; margin-bottom: 12px; display: inline-block;"></i>
                    <h3 style="font-size: 18px; margin: 0 0 8px 0; color: #111827;">Delete Choli</h3>
                    <p style="font-size: 13px; color: var(--text-muted); margin: 0 0 16px 0;">
                        Are you sure you want to permanently delete <strong style="color: #111827;"><asp:Label ID="lblDeleteCholiName" runat="server"></asp:Label></strong>?
                    </p>
                    <div style="display: flex; justify-content: center; gap: 12px;">
                        <asp:Button ID="btnCancelDelete" runat="server" Text="Cancel" CssClass="btn-sm-reset" OnClick="btnCancelDelete_Click" />
                        <asp:Button ID="btnConfirmDelete" runat="server" Text="Yes, Delete" CssClass="btn-sm-red" OnClick="btnConfirmDelete_Click" />
                    </div>
                </div>
            </asp:Panel>

            <!-- 3. EDIT MODAL POPUP -->
            <asp:Panel ID="pnlEditModal" runat="server" CssClass="modal-backdrop" Visible="false">
                <div class="modal-box">
                    <h3 class="modal-title">Edit Choli Details</h3>
                    <asp:HiddenField ID="hfEditId" runat="server" />

                    <div class="form-group">
                        <label>Garment Title</label>
                        <asp:TextBox ID="txtEditTitle" runat="server" CssClass="form-control" />
                    </div>

                    <div class="form-group">
                        <label>SKU Code</label>
                        <asp:TextBox ID="txtEditSku" runat="server" CssClass="form-control" />
                    </div>

                    <div style="display: flex; gap: 10px;">
                        <div class="form-group" style="flex: 1;">
                            <label>Category</label>
                            <asp:DropDownList ID="ddlEditCategory" runat="server" CssClass="form-control">
                                <asp:ListItem Text="Bridal Wear" Value="Bridal Wear" />
                                <asp:ListItem Text="Navratri Special" Value="Navratri Special" />
                                <asp:ListItem Text="Party Wear" Value="Party Wear" />
                            </asp:DropDownList>
                        </div>
                        <div class="form-group" style="flex: 1;">
                            <label>Size</label>
                            <asp:TextBox ID="txtEditSize" runat="server" CssClass="form-control" />
                        </div>
                    </div>

                    <div style="display: flex; gap: 10px;">
                        <div class="form-group" style="flex: 1;">
                            <label>Rental Price (₹)</label>
                            <asp:TextBox ID="txtEditPrice" runat="server" CssClass="form-control" TextMode="Number" />
                        </div>
                        <div class="form-group" style="flex: 1;">
                            <label>Rental Days</label>
                            <asp:TextBox ID="txtEditDays" runat="server" CssClass="form-control" TextMode="Number" />
                        </div>
                    </div>

                    <div class="form-group">
                        <label>Status</label>
                        <asp:DropDownList ID="ddlEditStatus" runat="server" CssClass="form-control">
                            <asp:ListItem Text="Available" Value="Available" />
                            <asp:ListItem Text="Rented" Value="Rented" />
                            <asp:ListItem Text="Maintenance" Value="Maintenance" />
                        </asp:DropDownList>
                    </div>

                    <div class="modal-footer">
                        <asp:Button ID="btnCancelEdit" runat="server" Text="Cancel" CssClass="btn-sm-reset" OnClick="btnCancelEdit_Click" />
                        <asp:Button ID="btnSaveEdit" runat="server" Text="Save Changes" CssClass="btn-sm-apply" OnClick="btnSaveEdit_Click" />
                    </div>
                </div>
            </asp:Panel>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
