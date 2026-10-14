<%@ Page Title="Order Management" Language="C#" MasterPageFile="~/Admin/AdminMaster.Master" AutoEventWireup="true" CodeFile="Orders.aspx.cs" Inherits="Style_On_Rent.Admin.Orders" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css" />

    <style>
        :root {
            --primary-maroon: #73001e;
            --primary-maroon-hover: #590017;
            --text-dark: #1f2937;
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

        .orders-wrapper {
            padding: 24px 32px;
            max-width: 1250px;
            margin: 0 auto;
            box-sizing: border-box;
        }

        /* Top Header */
        .orders-header {
            display: flex;
            align-items: center;
            justify-content: space-between;
            margin-bottom: 24px;
        }

        .header-left {
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

        /* + New Order Button */
        .btn-new-order {
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

        .btn-new-order:hover {
            background-color: var(--primary-maroon-hover);
        }

        /* Toolbar Controls */
        .orders-toolbar {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 20px;
            gap: 16px;
        }

        .search-container {
            position: relative;
            width: 420px;
        }

        .search-icon {
            position: absolute;
            left: 14px;
            top: 50%;
            transform: translateY(-50%);
            color: #9ca3af;
            font-size: 14px;
        }

        .search-input {
            width: 100%;
            height: 40px;
            padding: 0 14px 0 40px;
            border: 1px solid #ebdcd0;
            border-radius: 6px;
            font-size: 13px;
            background-color: #ffffff;
            color: var(--text-dark);
            outline: none;
            box-sizing: border-box;
        }

        .search-input:focus {
            border-color: var(--primary-maroon);
        }

        .toolbar-right-actions {
            display: flex;
            align-items: center;
            gap: 10px;
        }

        .btn-toolbar-outline {
            border: 1px solid #d1d5db;
            background: #ffffff;
            color: #374151 !important;
            padding: 0 16px;
            font-size: 13px;
            border-radius: 6px;
            cursor: pointer;
            display: inline-flex;
            align-items: center;
            gap: 8px;
            text-decoration: none !important;
            font-weight: 500;
            height: 40px;
            box-sizing: border-box;
        }

        .btn-toolbar-outline:hover {
            background-color: #f9fafb;
            border-color: #9ca3af;
        }

        .btn-icon-square {
            width: 40px;
            height: 40px;
            display: inline-flex;
            align-items: center;
            justify-content: center;
            border: 1px solid #d1d5db;
            border-radius: 6px;
            background-color: #ffffff;
            color: #4b5563 !important;
            cursor: pointer;
            text-decoration: none !important;
            font-size: 14px;
            box-sizing: border-box;
        }

        .btn-icon-square:hover {
            background-color: #f9fafb;
        }

        /* Status Filter Tabs */
        .status-tab-bar {
            display: flex !important;
            align-items: center !important;
            gap: 28px !important;
            border-bottom: 2px solid #ebdcd0 !important;
            margin-bottom: 24px !important;
            padding: 0 !important;
            background: transparent !important;
        }

        .status-tab-bar a.tab-btn {
            display: inline-flex !important;
            align-items: center !important;
            padding: 10px 4px 12px 4px !important;
            font-size: 13.5px !important;
            font-weight: 500 !important;
            color: #6b7280 !important;
            text-decoration: none !important;
            background: transparent !important;
            border: none !important;
            border-bottom: 3px solid transparent !important;
            margin-bottom: -2px !important;
            cursor: pointer !important;
            line-height: 1 !important;
            white-space: nowrap !important;
            visibility: visible !important;
            opacity: 1 !important;
        }

        .status-tab-bar a.tab-btn:hover {
            color: var(--primary-maroon) !important;
        }

        .status-tab-bar a.tab-btn.active {
            color: var(--primary-maroon) !important;
            font-weight: 700 !important;
            border-bottom: 3px solid var(--primary-maroon) !important;
        }

        /* Orders Table Container */
        .table-container {
            background: #ffffff;
            border-radius: 8px;
            border: 1px solid #f0eae1;
            overflow: hidden;
        }

        .orders-table {
            width: 100%;
            border-collapse: collapse;
            font-size: 13px;
        }

        .orders-table th {
            font-weight: 600;
            color: #6b7280;
            padding: 14px 18px;
            text-align: left;
            border-bottom: 1px solid #e5e7eb;
            background-color: #fafbfc;
            font-size: 11px;
            letter-spacing: 0.5px;
            text-transform: uppercase;
        }

        .orders-table td {
            padding: 16px 18px;
            vertical-align: middle;
            border-bottom: 1px solid #f3ece4;
            color: #374151;
        }

        .orders-table tr:last-child td {
            border-bottom: none;
        }

        .orders-table tr:hover {
            background-color: #fdfcfb;
        }

        .order-id {
            font-weight: 700;
            color: #111827;
        }

        /* Customer Cell */
        .customer-info-box {
            display: flex;
            align-items: center;
            gap: 12px;
        }

        .customer-avatar {
            width: 34px;
            height: 34px;
            border-radius: 50%;
            display: inline-flex;
            align-items: center;
            justify-content: center;
            font-size: 11px;
            font-weight: 700;
            flex-shrink: 0;
        }

        .avatar-orange { background-color: #fef3c7; color: #d97706; }
        .avatar-maroon { background-color: #ffe4e6; color: #9f1239; }
        .avatar-blue   { background-color: #e0f2fe; color: #0284c7; }
        .avatar-gray   { background-color: #f3f4f6; color: #6b7280; }

        .customer-name {
            font-weight: 600;
            color: #111827;
            font-size: 13px;
        }

        .customer-subtext {
            font-size: 11px;
            color: #9ca3af;
        }

        .item-title {
            font-weight: 500;
            color: #111827;
            margin-bottom: 2px;
            max-width: 260px;
            line-height: 1.35;
        }

        .item-count {
            font-size: 11px;
            color: #9ca3af;
        }

        .rental-dates {
            font-size: 12px;
            color: #4b5563;
            line-height: 1.4;
        }

        .price-text {
            font-weight: 700;
            color: #111827;
        }

        /* Status Badges */
        .status-pill {
            display: inline-block;
            padding: 4px 12px;
            border-radius: 12px;
            font-size: 11px;
            font-weight: 600;
            text-align: center;
        }

        .status-active { background-color: #ecfdf5; color: #059669; }
        .status-pending { background-color: #fef3c7; color: #d97706; }
        .status-returned { background-color: #f3f4f6; color: #6b7280; }
        .status-cancelled { background-color: #fee2e2; color: #dc2626; }

        /* Action Buttons */
        .action-cell {
            display: flex;
            align-items: center;
            gap: 8px;
        }

        .btn-action-approve {
            background-color: #15803d;
            color: #ffffff !important;
            border: none;
            padding: 6px 14px;
            font-size: 11px;
            font-weight: 600;
            border-radius: 4px;
            cursor: pointer;
            text-decoration: none !important;
            transition: background-color 0.2s;
        }

        .btn-action-approve:hover {
            background-color: #166534;
        }

        .btn-action-cancel {
            background-color: #dc2626;
            color: #ffffff !important;
            border: none;
            padding: 6px 14px;
            font-size: 11px;
            font-weight: 600;
            border-radius: 4px;
            cursor: pointer;
            text-decoration: none !important;
            transition: background-color 0.2s;
        }

        .btn-action-cancel:hover {
            background-color: #b91c1c;
        }

        .empty-row {
            text-align: center;
            padding: 40px !important;
            color: var(--text-muted);
            font-size: 13px;
        }

        /* Table Footer / Pagination */
        .table-footer {
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

        .p-nav-btn {
            display: inline-flex !important;
            align-items: center !important;
            justify-content: center !important;
            width: 24px !important;
            height: 30px !important;
            border: 1px solid #f2d7da !important;
            border-radius: 4px !important;
            background-color: #ffffff !important;
            color: #888888 !important;
            font-size: 13px !important;
            text-decoration: none !important;
        }

        .p-nav-btn:hover {
            border-color: #590017 !important;
            color: #590017 !important;
        }

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
        }

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

        .p-dots {
            display: inline-flex !important;
            align-items: center !important;
            color: #4b5563 !important;
            font-size: 13px !important;
            padding: 0 2px !important;
        }

        /* Date Range Modal */
        .modal-overlay {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: rgba(0, 0, 0, 0.4);
            display: flex;
            align-items: center;
            justify-content: center;
            z-index: 9999;
        }

        .modal-window {
            width: 360px;
            background: #ffffff;
            border-radius: 8px;
            padding: 22px;
            box-shadow: 0 10px 25px rgba(0,0,0,0.15);
            border-top: 5px solid var(--primary-maroon);
        }

        .modal-title {
            font-size: 16px;
            font-weight: 700;
            color: var(--primary-maroon);
            margin: 0 0 16px 0;
        }

        .modal-form-group {
            margin-bottom: 14px;
        }

        .modal-form-group label {
            display: block;
            font-size: 12px;
            font-weight: 600;
            color: #374151;
            margin-bottom: 5px;
        }

        .modal-input {
            width: 100%;
            height: 36px;
            padding: 0 10px;
            border: 1px solid #d1d5db;
            border-radius: 5px;
            font-size: 13px;
            box-sizing: border-box;
            background-color: #fffaf7;
        }

        .modal-btn-row {
            display: flex;
            justify-content: flex-end;
            gap: 10px;
            margin-top: 18px;
        }

        .btn-modal-cancel {
            height: 32px;
            padding: 0 14px;
            border: 1px solid #d1d5db;
            background: #e5e7eb;
            color: #374151;
            border-radius: 4px;
            font-size: 12px;
            font-weight: 500;
            cursor: pointer;
        }

        .btn-modal-apply {
            height: 32px;
            padding: 0 16px;
            border: none;
            background: var(--primary-maroon);
            color: #ffffff;
            border-radius: 4px;
            font-size: 12px;
            font-weight: 600;
            cursor: pointer;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <asp:ScriptManager ID="smOrders" runat="server" />

    <asp:UpdatePanel ID="upnlOrders" runat="server" UpdateMode="Conditional">
        <ContentTemplate>
            <div class="orders-wrapper">

                <!-- Top Header with + New Order Button -->
                <div class="orders-header">
                    <div class="header-left">
                        <img src="Images/logo.png" class="brand-logo" alt="Style On Rent" />
                        <div class="header-title-box">
                            <h1>Order Management</h1>
                            <p>View and manage all rental orders.</p>
                        </div>
                    </div>

                    <div>
                        <asp:LinkButton ID="btnNewOrder" runat="server" CssClass="btn-new-order" OnClick="btnNewOrder_Click">
                            <i class="fa-solid fa-plus"></i> New Order
                        </asp:LinkButton>
                    </div>
                </div>

                <!-- Search & Date Filter Toolbar -->
                <div class="orders-toolbar">
                    <div class="search-container">
                        <i class="fa-solid fa-magnifying-glass search-icon"></i>
                        <asp:TextBox 
                            ID="txtOrderSearch" 
                            runat="server" 
                            CssClass="search-input" 
                            placeholder="Search Order ID, Customer, or Item..." 
                            AutoPostBack="true" 
                            OnTextChanged="txtOrderSearch_TextChanged" />
                    </div>

                    <div class="toolbar-right-actions">
                        <asp:LinkButton ID="btnSelectDates" runat="server" CssClass="btn-toolbar-outline" OnClick="btnSelectDates_Click">
                            <i class="fa-regular fa-calendar"></i>
                            <asp:Literal ID="litSelectedDateText" runat="server">Select Dates</asp:Literal>
                        </asp:LinkButton>
                        <asp:LinkButton ID="btnClearDateFilter" runat="server" CssClass="btn-icon-square" Visible="false" ToolTip="Clear Date Filter" OnClick="btnClearDateFilter_Click">
                            <i class="fa-solid fa-xmark" style="color: #dc2626;"></i>
                        </asp:LinkButton>
                    </div>
                </div>

                <!-- Status Filter Tabs -->
                <div class="status-tab-bar">
                    <asp:LinkButton ID="tabAll" runat="server" CssClass="tab-btn active" CommandArgument="All" OnClick="StatusTab_Click" Text="All (4)" />
                    <asp:LinkButton ID="tabPending" runat="server" CssClass="tab-btn" CommandArgument="Pending" OnClick="StatusTab_Click" Text="Pending (1)" />
                    <asp:LinkButton ID="tabActive" runat="server" CssClass="tab-btn" CommandArgument="Active" OnClick="StatusTab_Click" Text="Active (1)" />
                    <asp:LinkButton ID="tabReturned" runat="server" CssClass="tab-btn" CommandArgument="Returned" OnClick="StatusTab_Click" Text="Returned (1)" />
                    <asp:LinkButton ID="tabCancelled" runat="server" CssClass="tab-btn" CommandArgument="Cancelled" OnClick="StatusTab_Click" Text="Cancelled (1)" />
                </div>

                <!-- Orders Table Card -->
                <div class="table-container">
                    <asp:Repeater ID="rptOrders" runat="server" OnItemCommand="rptOrders_ItemCommand">
                        <HeaderTemplate>
                            <table class="orders-table">
                                <thead>
                                    <tr>
                                        <th style="width: 10%;">Order ID</th>
                                        <th style="width: 22%;">Customer</th>
                                        <th style="width: 26%;">Items Rented</th>
                                        <th style="width: 14%;">Rental Dates</th>
                                        <th style="width: 10%;">Total Amount</th>
                                        <th style="width: 9%;">Status</th>
                                        <th style="width: 9%;">Actions</th>
                                    </tr>
                                </thead>
                                <tbody>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <tr>
                                <td class="order-id"><%# Eval("OrderId") %></td>
                                <td>
                                    <div class="customer-info-box">
                                        <span class='customer-avatar <%# Eval("AvatarClass") %>'><%# Eval("Initials") %></span>
                                        <div>
                                            <div class="customer-name"><%# Eval("CustomerName") %></div>
                                            <div class="customer-subtext"><%# Eval("CustomerContact") %></div>
                                        </div>
                                    </div>
                                </td>
                                <td>
                                    <div class="item-title"><%# Eval("ItemTitle") %></div>
                                    <div class="item-count"><%# Eval("ItemCount") %></div>
                                </td>
                                <td class="rental-dates"><%# Eval("RentalDates") %></td>
                                <td class="price-text">&#8377;<%# Eval("TotalAmount", "{0:N0}") %></td>
                                <td>
                                    <span class='status-pill <%# GetStatusPillClass(Eval("Status").ToString()) %>'>
                                        <%# Eval("Status") %>
                                    </span>
                                </td>
                                <td>
                                    <div class="action-cell">
                                        <asp:LinkButton ID="btnApprove" runat="server" CommandName="ApproveOrder" CommandArgument='<%# Eval("Id") %>' CssClass="btn-action-approve">Approve</asp:LinkButton>
                                        <asp:LinkButton ID="btnCancelOrder" runat="server" CommandName="CancelOrder" CommandArgument='<%# Eval("Id") %>' CssClass="btn-action-cancel">Cancel</asp:LinkButton>
                                    </div>
                                </td>
                            </tr>
                        </ItemTemplate>
                        <FooterTemplate>
                                </tbody>
                            </table>
                        </FooterTemplate>
                    </asp:Repeater>

                    <!-- Empty State Panel -->
                    <asp:Panel ID="pnlNoOrders" runat="server" Visible="false">
                        <div class="empty-row">
                            <i class="fa-regular fa-folder-open" style="font-size: 32px; color: #9ca3af; margin-bottom: 8px; display: block;"></i>
                            No orders found matching the criteria.
                        </div>
                    </asp:Panel>

                    <!-- Table Footer / Pagination -->
                    <div class="table-footer">
                        <div>
                            <asp:Literal ID="litShowingOrders" runat="server">Showing 1-4 of 4</asp:Literal>
                        </div>
                        <div class="pagination-controls">
                            <a href="?page=1" class="p-nav-btn">&lsaquo;</a>
                            <a href="?page=1" class="p-num-active">1</a>
                            <a href="?page=2" class="p-num-link">2</a>
                            <a href="?page=3" class="p-num-link">3</a>
                            <span class="p-dots">...</span>
                            <a href="?page=2" class="p-nav-btn">&rsaquo;</a>
                        </div>
                    </div>
                </div>

            </div>

            <!-- Date Selection Modal Popup -->
            <asp:Panel ID="pnlDateModal" runat="server" CssClass="modal-overlay" Visible="false">
                <div class="modal-window">
                    <h3 class="modal-title">Select Rental Date Range</h3>
                    <div class="modal-form-group">
                        <label>Start Date</label>
                        <asp:TextBox ID="txtStartDate" runat="server" TextMode="Date" CssClass="modal-input"></asp:TextBox>
                    </div>
                    <div class="modal-form-group">
                        <label>End Date</label>
                        <asp:TextBox ID="txtEndDate" runat="server" TextMode="Date" CssClass="modal-input"></asp:TextBox>
                    </div>
                    <div class="modal-btn-row">
                        <asp:Button ID="btnCancelDateModal" runat="server" Text="Cancel" CssClass="btn-modal-cancel" OnClick="btnCancelDateModal_Click" />
                        <asp:Button ID="btnApplyDateFilter" runat="server" Text="Apply Filter" CssClass="btn-modal-apply" OnClick="btnApplyDateFilter_Click" />
                    </div>
                </div>
            </asp:Panel>

        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
