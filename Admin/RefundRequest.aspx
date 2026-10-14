<%@ Page Title="Refund Requests"
    Language="C#"
    MasterPageFile="~/Admin/AdminMaster.Master"
    AutoEventWireup="true"
    CodeFile="RefundRequest.aspx.cs"
    Inherits="Style_On_Rent.Admin.RefundRequest" %>

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

        .refund-wrapper {
            padding: 24px 32px;
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
            color: var(--text-dark);
            margin: 0 0 4px 0;
        }

        .header-title-box p {
            font-size: 13px;
            color: var(--text-muted);
            margin: 0;
        }

        /* Single Metric Card */
        .single-metric-container {
            margin-bottom: 24px;
        }

        .metric-card {
            background: #ffffff;
            border: 1px solid #ebdcd0;
            border-radius: 8px;
            padding: 20px 24px;
            width: 250px;
            box-sizing: border-box;
        }

        .metric-top {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 10px;
        }

        .metric-label {
            font-size: 11px;
            font-weight: 700;
            letter-spacing: 0.6px;
            color: var(--text-muted);
            text-transform: uppercase;
        }

        .metric-icon-box {
            width: 32px;
            height: 32px;
            border-radius: 6px;
            background: #fff8f5;
            display: flex;
            align-items: center;
            justify-content: center;
            color: #b08d79;
            font-size: 15px;
        }

        .metric-value {
            font-size: 32px;
            font-weight: 700;
            color: var(--text-dark);
            margin: 0 0 6px 0;
            line-height: 1;
        }

        .metric-subtext {
            font-size: 11.5px;
            color: var(--text-muted);
        }

        /* Search & Filter Bar */
        .toolbar-row {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 18px;
        }

        .search-wrap {
            position: relative;
            width: 300px;
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
            height: 38px;
            padding: 0 14px 0 34px;
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

        .pill-filter-all {
            background-color: var(--primary-maroon);
            color: #ffffff !important;
            padding: 7px 18px;
            border-radius: 20px;
            font-size: 12px;
            font-weight: 600;
            text-decoration: none !important;
            display: inline-block;
        }

        /* Table Card Container */
        .table-card {
            background: #ffffff;
            border-radius: 8px;
            border: 1px solid #ebdcd0;
            overflow: hidden;
        }

        .refund-table {
            width: 100%;
            border-collapse: collapse;
            font-size: 13px;
        }

        .refund-table th {
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

        .refund-table td {
            padding: 16px 18px;
            vertical-align: middle;
            border-bottom: 1px solid #f3ece4;
            color: #374151;
        }

        .refund-table tr:last-child td {
            border-bottom: none;
        }

        .refund-table tr:hover {
            background-color: #fdfcfb;
        }

        .req-id {
            font-weight: 700;
            color: #111827;
            font-size: 12.5px;
        }

        /* Customer Cell with Initial Badge */
        .cust-cell {
            display: flex;
            align-items: center;
            gap: 10px;
        }

        .avatar-circle {
            width: 28px;
            height: 28px;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 10.5px;
            font-weight: 700;
            flex-shrink: 0;
        }

        .av-aj { background-color: #fde68a; color: #92400e; }
        .av-rm { background-color: #e5e7eb; color: #374151; }
        .av-sk { background-color: #dbeafe; color: #1e40af; }
        .av-vk { background-color: #f3f4f6; color: #4b5563; }
        .av-ps { background-color: #fce7f3; color: #831843; }

        .cust-name {
            font-weight: 600;
            color: #111827;
            line-height: 1.2;
        }

        .order-id-maroon {
            color: var(--primary-maroon);
            font-weight: 600;
        }

        .amount-text {
            font-weight: 700;
            color: #111827;
        }

        .reason-text {
            color: #4b5563;
            max-width: 170px;
            white-space: nowrap;
            overflow: hidden;
            text-overflow: ellipsis;
        }

        .date-text {
            color: #6b7280;
            font-size: 12px;
            line-height: 1.3;
        }

        /* Status Pills */
        .status-badge {
            display: inline-flex;
            align-items: center;
            gap: 5px;
            padding: 4px 12px;
            border-radius: 14px;
            font-size: 11.5px;
            font-weight: 600;
        }

        .status-badge::before {
            content: "•";
            font-size: 14px;
            line-height: 0;
        }

        .status-approved {
            background-color: #ecfdf5;
            color: #059669;
        }

        .status-rejected {
            background-color: #fee2e2;
            color: #dc2626;
        }

        .status-pending {
            background-color: #fef3c7;
            color: #d97706;
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

        .pagination-wrap {
            display: inline-flex;
            align-items: center;
            gap: 6px;
        }

        .p-btn-nav {
            padding: 4px 10px;
            color: #6b7280;
            background: #ffffff;
            border: 1px solid #e5e7eb;
            border-radius: 4px;
            text-decoration: none;
            font-size: 12px;
        }

        .p-btn {
            display: inline-flex;
            align-items: center;
            justify-content: center;
            width: 28px;
            height: 28px;
            border-radius: 4px;
            color: #4b5563;
            text-decoration: none;
            font-size: 12.5px;
            font-weight: 500;
        }

        .p-btn.active {
            background-color: var(--primary-maroon);
            color: #ffffff;
            font-weight: 700;
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
            width: 520px;
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

        .form-row {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 12px;
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
    <asp:ScriptManager ID="smRefund" runat="server" />

    <asp:UpdatePanel ID="upnlRefund" runat="server" UpdateMode="Conditional">
        <ContentTemplate>
            <div class="refund-wrapper">

                <!-- Header -->
                <div class="page-header-row">
                    <img src="Images/logo.png" class="brand-logo" alt="Style On Rent" />
                    <div class="header-title-box">
                        <h1>Refund Requests</h1>
                        <p>Manage and process customer refund claims.</p>
                    </div>
                </div>

                <!-- Single Metric Card -->
                <div class="single-metric-container">
                    <div class="metric-card">
                        <div class="metric-top">
                            <span class="metric-label">TOTAL REQUESTS</span>
                            <div class="metric-icon-box">
                                <i class="bi bi-bag"></i>
                            </div>
                        </div>
                        <h2 class="metric-value">
                            <asp:Literal ID="litTotalRequests" runat="server">24</asp:Literal>
                        </h2>
                        <div class="metric-subtext">Total pending value: &#8377;18,200</div>
                    </div>
                </div>

                <!-- Search & Filter Bar -->
                <div class="toolbar-row">
                    <div class="search-wrap">
                        <i class="fa-solid fa-magnifying-glass search-icon"></i>
                        <asp:TextBox 
                            ID="txtSearchRefund" 
                            runat="server" 
                            CssClass="search-input" 
                            placeholder="Search by Order ID or Name..." 
                            AutoPostBack="true" 
                            OnTextChanged="txtSearchRefund_TextChanged" />
                    </div>

                    <a href="#" class="pill-filter-all">All (24)</a>
                </div>

                <!-- Refund Table Card -->
                <div class="table-card">
                    <asp:Repeater ID="rptRefunds" runat="server" OnItemCommand="rptRefunds_ItemCommand">
                        <HeaderTemplate>
                            <table class="refund-table">
                                <thead>
                                    <tr>
                                        <th style="width: 12%;">REQUEST ID</th>
                                        <th style="width: 16%;">CUSTOMER</th>
                                        <th style="width: 12%;">ORDER ID</th>
                                        <th style="width: 12%;">REFUND AMOUNT</th>
                                        <th style="width: 20%;">REASON</th>
                                        <th style="width: 12%;">REQUEST DATE</th>
                                        <th style="width: 10%;">STATUS</th>
                                        <th style="width: 8%;">ACTIONS</th>
                                    </tr>
                                </thead>
                                <tbody>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <tr>
                                <td class="req-id"><%# Eval("RequestId") %></td>
                                <td>
                                    <div class="cust-cell">
                                        <div class='avatar-circle <%# Eval("AvatarClass") %>'>
                                            <%# Eval("Initials") %>
                                        </div>
                                        <div class="cust-name"><%# Eval("Customer") %></div>
                                    </div>
                                </td>
                                <td>
                                    <span class="order-id-maroon"><%# Eval("OrderId") %></span>
                                </td>
                                <td class="amount-text">&#8377;<%# Eval("RefundAmount") %></td>
                                <td class="reason-text" title='<%# Eval("Reason") %>'><%# Eval("Reason") %></td>
                                <td class="date-text"><%# Eval("RequestDate") %></td>
                                <td>
                                    <span class='status-badge <%# GetStatusBadgeClass(Eval("Status").ToString()) %>'>
                                        <%# Eval("Status") %>
                                    </span>
                                </td>
                                <td>
                                    <!-- Action Buttons -->
                                    <div class="actions-cell">
                                        <asp:LinkButton 
                                            ID="btnView" 
                                            runat="server" 
                                            CommandName="ViewRefund" 
                                            CommandArgument='<%# Eval("Id") %>' 
                                            CssClass="btn-act btn-act-view" 
                                            ToolTip="View Details">
                                            <i class="fa-solid fa-eye"></i>
                                        </asp:LinkButton>

                                        <asp:LinkButton 
                                            ID="btnEdit" 
                                            runat="server" 
                                            CommandName="EditRefund" 
                                            CommandArgument='<%# Eval("Id") %>' 
                                            CssClass="btn-act btn-act-edit" 
                                            ToolTip="Process Refund">
                                            <i class="fa-solid fa-pen-to-square"></i>
                                        </asp:LinkButton>

                                        <asp:LinkButton 
                                            ID="btnDelete" 
                                            runat="server" 
                                            CommandName="DeleteRefund" 
                                            CommandArgument='<%# Eval("Id") %>' 
                                            CssClass="btn-act btn-act-delete" 
                                            ToolTip="Delete Request">
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

                    <!-- Table Footer & Pagination -->
                    <div class="table-footer">
                        <div>
                            <asp:Literal ID="litShowingText" runat="server">Showing 1-5 of 24 requests</asp:Literal>
                        </div>
                        <div class="pagination-wrap">
                            <a href="#" class="p-btn-nav">Previous</a>
                            <a href="#" class="p-btn active">1</a>
                            <a href="#" class="p-btn">2</a>
                            <a href="#" class="p-btn">3</a>
                            <span>...</span>
                            <a href="#" class="p-btn-nav">Next</a>
                        </div>
                    </div>
                </div>

            </div>

            <!-- POPUP 1: VIEW DETAILS MODAL -->
            <asp:Panel ID="pnlViewModal" runat="server" CssClass="modal-overlay" Visible="false">
                <div class="modal-card">
                    <div class="modal-header">
                        <h2>Refund Claim Details</h2>
                        <asp:LinkButton ID="btnCloseViewX" runat="server" CssClass="btn-modal-close" CausesValidation="false" OnClick="btnCloseView_Click">
                            <i class="fa-solid fa-xmark"></i>
                        </asp:LinkButton>
                    </div>

                    <div class="modal-body">
                        <div style="margin-bottom: 18px;">
                            <div style="font-size: 11px; color: #6b7280; font-weight: 600; text-transform: uppercase;">REQUEST NUMBER</div>
                            <h3 style="font-size: 20px; margin: 4px 0 6px 0; color: #111827;">
                                <asp:Literal ID="litViewReqId" runat="server" />
                            </h3>
                            <div style="font-size: 13px; color: #4b5563;">
                                Customer: <strong><asp:Literal ID="litViewCustomer" runat="server" /></strong> | Order ID: <span class="order-id-maroon"><asp:Literal ID="litViewOrderId" runat="server" /></span>
                            </div>
                        </div>

                        <div class="detail-row-grid">
                            <div class="detail-box">
                                <div class="detail-title">Claim Amount</div>
                                <div class="detail-val" style="color: #dc2626;">
                                    &#8377;<asp:Literal ID="litViewAmount" runat="server" />
                                </div>
                            </div>
                            <div class="detail-box">
                                <div class="detail-title">Status</div>
                                <div class="detail-val">
                                    <asp:Literal ID="litViewStatus" runat="server" />
                                </div>
                            </div>
                        </div>

                        <div class="detail-box" style="margin-bottom: 14px;">
                            <div class="detail-title">Date Requested</div>
                            <div class="detail-val" style="font-size: 13.5px;">
                                <asp:Literal ID="litViewDate" runat="server" />
                            </div>
                        </div>

                        <div class="detail-box">
                            <div class="detail-title">Customer Reason</div>
                            <div style="font-size: 13px; color: #374151; margin-top: 4px;">
                                <asp:Literal ID="litViewReason" runat="server" />
                            </div>
                        </div>
                    </div>

                    <div class="modal-footer">
                        <asp:Button ID="btnCloseViewBtn" runat="server" Text="Close" CssClass="btn-modal-close-red" CausesValidation="false" OnClick="btnCloseView_Click" />
                    </div>
                </div>
            </asp:Panel>

            <!-- POPUP 2: EDIT / PROCESS MODAL -->
            <asp:Panel ID="pnlEditModal" runat="server" CssClass="modal-overlay" Visible="false">
                <div class="modal-card">
                    <div class="modal-header">
                        <h2>Process Refund Request</h2>
                        <asp:LinkButton ID="btnCloseEditX" runat="server" CssClass="btn-modal-close" CausesValidation="false" OnClick="btnCancelEdit_Click">
                            <i class="fa-solid fa-xmark"></i>
                        </asp:LinkButton>
                    </div>

                    <div class="modal-body">
                        <asp:HiddenField ID="hfEditRefundId" runat="server" Value="0" />

                        <div class="form-row">
                            <div class="form-group">
                                <label>Request ID</label>
                                <asp:TextBox ID="txtEditReqId" runat="server" CssClass="form-input" ReadOnly="true" />
                            </div>

                            <div class="form-group">
                                <label>Order ID</label>
                                <asp:TextBox ID="txtEditOrderId" runat="server" CssClass="form-input" ReadOnly="true" />
                            </div>
                        </div>

                        <div class="form-row">
                            <div class="form-group">
                                <label>Customer Name</label>
                                <asp:TextBox ID="txtEditCustomer" runat="server" CssClass="form-input" />
                            </div>

                            <div class="form-group">
                                <label>Refund Amount (₹)</label>
                                <asp:TextBox ID="txtEditAmount" runat="server" CssClass="form-input" />
                            </div>
                        </div>

                        <div class="form-group">
                            <label>Refund Decision / Status</label>
                            <asp:DropDownList ID="ddlEditStatus" runat="server" CssClass="form-input">
                                <asp:ListItem Text="Approved" Value="Approved" />
                                <asp:ListItem Text="Rejected" Value="Rejected" />
                                <asp:ListItem Text="Pending" Value="Pending" />
                            </asp:DropDownList>
                        </div>

                        <div class="form-group">
                            <label>Reason Description</label>
                            <asp:TextBox ID="txtEditReason" runat="server" CssClass="form-input" />
                        </div>
                    </div>

                    <div class="modal-footer">
                        <asp:Button ID="btnCancelEdit" runat="server" Text="Cancel" CssClass="btn-modal-cancel" CausesValidation="false" OnClick="btnCancelEdit_Click" />
                        <asp:Button ID="btnSaveEdit" runat="server" Text="Update Claim" CssClass="btn-modal-save" OnClick="btnSaveEdit_Click" />
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
                        <asp:HiddenField ID="hfDeleteRefundId" runat="server" Value="0" />
                        <div class="delete-dialog-content">
                            <div class="delete-icon-box">
                                <i class="fa-solid fa-triangle-exclamation"></i>
                            </div>
                            <h3 style="font-size: 16px; font-weight: 700; color: #111827; margin: 0 0 6px 0;">
                                Are you sure you want to delete this?
                            </h3>
                            <p style="font-size: 13px; color: #6b7280; margin: 0; line-height: 1.4;">
                                Refund request <strong><asp:Literal ID="litDeleteTargetReq" runat="server" /></strong> will be permanently deleted.
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
    </asp:UpdatePanel>
</asp:Content>