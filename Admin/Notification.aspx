<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMaster.Master"
    AutoEventWireup="true"
    CodeFile="Notification.aspx.cs"
    Inherits="Style_On_Rent.Admin.Notification" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" />
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

        .notify-wrapper {
            padding: 24px 32px;
            max-width: 1250px;
            margin: 0 auto;
            box-sizing: border-box;
        }

        /* Header */
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

        .btn-new-campaign {
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

        .btn-new-campaign:hover {
            background-color: var(--primary-maroon-hover);
        }

        /* Single Metric Card */
        .single-metric-container {
            margin-bottom: 24px;
        }

        .single-metric-card {
            background: #ffffff;
            border: 1px solid #ebdcd0;
            border-radius: 8px;
            padding: 22px 26px;
            width: 250px;
            box-sizing: border-box;
        }

        .metric-top {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 14px;
        }

        .metric-label {
            font-size: 11px;
            font-weight: 700;
            letter-spacing: 0.6px;
            color: var(--text-muted);
            text-transform: uppercase;
        }

        .metric-icon {
            font-size: 17px;
            color: #d19a66;
        }

        .metric-value {
            font-size: 32px;
            font-weight: 700;
            color: var(--text-dark);
            margin: 0;
            line-height: 1;
        }

        /* Table Card Container */
        .table-card {
            background: #ffffff;
            border-radius: 8px;
            border: 1px solid #ebdcd0;
            overflow: hidden;
        }

        .table-card-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 20px 24px;
            border-bottom: 1px solid #f3ece4;
        }

        .card-heading {
            font-size: 17px;
            font-weight: 700;
            color: #111827;
            margin: 0;
        }

        .filter-search-box {
            display: flex;
            align-items: center;
            gap: 10px;
        }

        .search-wrap {
            position: relative;
            width: 260px;
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
            height: 36px;
            padding: 0 12px 0 34px;
            border: 1px solid #d1d5db;
            border-radius: 6px;
            font-size: 13px;
            outline: none;
            box-sizing: border-box;
            background-color: #fafbfc;
        }

        .search-input:focus {
            border-color: var(--primary-maroon);
            background-color: #ffffff;
        }

        .btn-filter-icon {
            width: 36px;
            height: 36px;
            display: inline-flex;
            align-items: center;
            justify-content: center;
            border: 1px solid #d1d5db;
            border-radius: 6px;
            background: #ffffff;
            color: #4b5563 !important;
            text-decoration: none !important;
            cursor: pointer;
        }

        .btn-filter-icon:hover {
            background-color: #f9fafb;
        }

        /* Table Structure */
        .notify-table {
            width: 100%;
            border-collapse: collapse;
            font-size: 13px;
        }

        .notify-table th {
            font-weight: 600;
            color: #6b7280;
            padding: 14px 24px;
            text-align: left;
            border-bottom: 1px solid #e5e7eb;
            background-color: #ffffff;
            font-size: 11px;
            letter-spacing: 0.5px;
            text-transform: uppercase;
        }

        .notify-table td {
            padding: 16px 24px;
            vertical-align: middle;
            border-bottom: 1px solid #f3ece4;
            color: #374151;
        }

        .notify-table tr:last-child td {
            border-bottom: none;
        }

        .notify-table tr:hover {
            background-color: #fdfcfb;
        }

        .title-primary {
            font-weight: 600;
            color: #111827;
            margin-bottom: 2px;
        }

        .title-channel {
            font-size: 11px;
            color: #9ca3af;
        }

        .recipient-group-text {
            font-size: 13px;
            color: #374151;
        }

        .date-sent-text {
            font-size: 12.5px;
            color: #4b5563;
            line-height: 1.35;
        }

        /* Status Badges */
        .status-badge {
            display: inline-flex;
            align-items: center;
            gap: 5px;
            padding: 3px 10px;
            border-radius: 12px;
            font-size: 11.5px;
            font-weight: 600;
            line-height: 1;
        }

        .status-badge::before {
            content: "•";
            font-size: 14px;
            line-height: 0;
        }

        .status-sent {
            background-color: #ecfdf5;
            color: #059669;
        }
        .status-scheduled {
            background-color: #eff6ff;
            color: #2563eb;
        }
        .status-draft {
            background-color: #fef2f2;
            color: #dc2626;
        }

        /* Clean Action Icons */
       /* Exact Action Icons Matching Screenshot */
.actions-cell {
    display: inline-flex;
    align-items: center;
    gap: 16px;
}

.btn-act {
    background: transparent !important;
    border: none !important;
    padding: 0 !important;
    margin: 0 !important;
    width: auto !important;
    height: auto !important;
    font-size: 16px;
    text-decoration: none !important;
    display: inline-flex;
    align-items: center;
    justify-content: center;
    cursor: pointer;
    line-height: 1;
    transition: transform 0.15s ease, opacity 0.15s ease;
}

.btn-act:hover {
    transform: scale(1.18);
    opacity: 0.85;
}

/* 1. Solid Blue Eye */
.btn-act-view {
    color: #1d68ed !important;
}

/* 2. Orange Pen-to-Square */
.btn-act-edit {
    color: #d97706 !important;
}

/* 3. Deep Red Trash Can */
.btn-act-delete {
    color: #c5161d !important;
}

        /* Pagination & Footer */
        .table-footer {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 16px 24px;
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

        .p-btn {
            display: inline-flex;
            align-items: center;
            justify-content: center;
            width: 28px;
            height: 28px;
            border-radius: 4px;
            color: #4b5563;
            text-decoration: none;
            font-size: 13px;
            font-weight: 500;
        }

        .p-btn.active {
            background-color: var(--primary-maroon);
            color: #ffffff;
            font-weight: 700;
        }

        /* Modal Dialogs */
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

        .form-textarea {
            width: 100%;
            height: 70px;
            padding: 8px 12px;
            border: 1px solid #d1d5db;
            border-radius: 5px;
            font-size: 13px;
            box-sizing: border-box;
            background-color: #fffaf7;
            outline: none;
            color: var(--text-dark);
            resize: vertical;
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

        .asp-val-error {
            display: block;
            color: #dc2626;
            font-size: 11px;
            margin-top: 4px;
            font-weight: 500;
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
    <asp:ScriptManager ID="smNotification" runat="server" />

    <asp:UpdatePanel ID="upnlNotification" runat="server" UpdateMode="Conditional">
        <ContentTemplate>
            <div class="notify-wrapper">

                <!-- Header with + New Campaign Button -->
                <div class="page-header-row">
                    <div class="header-brand-box">
                        <img src="Images/logo.png" class="brand-logo" alt="Style On Rent" />
                        <div class="header-title-box">
                            <h1>Notification History</h1>
                            <p>Track and manage communications sent to your customers.</p>
                        </div>
                    </div>

                    <asp:LinkButton ID="btnNewCampaign" runat="server" CssClass="btn-new-campaign" CausesValidation="false" OnClick="btnNewCampaign_Click">
                        <i class="fa-solid fa-plus"></i> New Campaign
                    </asp:LinkButton>
                </div>

                <!-- Single Metric Card matching Desktop - 8 -->
                <div class="single-metric-container">
                    <div class="single-metric-card">
                        <div class="metric-top">
                            <span class="metric-label">TOTAL SENT</span>
                            <i class="bi bi-send metric-icon"></i>
                        </div>
                        <h2 class="metric-value">&#8377;12,450</h2>
                    </div>
                </div>

                <!-- Table Card Container -->
                <div class="table-card">
                    <!-- Table Card Header -->
                    <div class="table-card-header">
                        <h2 class="card-heading">Recent Activity</h2>
                        
                        <div class="filter-search-box">
                            <div class="search-wrap">
                                <i class="fa-solid fa-magnifying-glass search-icon"></i>
                                <asp:TextBox 
                                    ID="txtSearchTitle" 
                                    runat="server" 
                                    CssClass="search-input" 
                                    placeholder="Search titles..." 
                                    AutoPostBack="true" 
                                    OnTextChanged="txtSearchTitle_TextChanged" />
                            </div>

                            <asp:LinkButton ID="btnFilterOptions" runat="server" CssClass="btn-filter-icon" CausesValidation="false" OnClick="btnFilterOptions_Click">
                                <i class="bi bi-filter"></i>
                            </asp:LinkButton>
                        </div>
                    </div>

                    <!-- Notification Table -->
                    <asp:Repeater ID="rptNotifications" runat="server" OnItemCommand="rptNotifications_ItemCommand">
                        <HeaderTemplate>
                            <table class="notify-table">
                                <thead>
                                    <tr>
                                        <th style="width: 32%;">TITLE</th>
                                        <th style="width: 26%;">RECIPIENT GROUP</th>
                                        <th style="width: 14%;">STATUS</th>
                                        <th style="width: 16%;">DATE SENT</th>
                                        <th style="width: 12%;">ACTIONS</th>
                                    </tr>
                                </thead>
                                <tbody>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <tr>
                                <td>
                                    <div class="title-primary"><%# Eval("Title") %></div>
                                    <div class="title-channel"><%# Eval("Channels") %></div>
                                </td>
                                <td class="recipient-group-text"><%# Eval("RecipientGroup") %></td>
                                <td>
                                    <span class='status-badge <%# GetStatusClass(Eval("Status").ToString()) %>'>
                                        <%# Eval("Status") %>
                                    </span>
                                </td>
                                <td class="date-sent-text"><%# Eval("DateSent") %></td>
                                <td>
                                    <!-- 3 ACTION BUTTONS: Eye, Blue Pencil, Red Trash -->
                                    <div class="actions-cell">
    <!-- Blue Eye -->
    <asp:LinkButton ID="btnView" runat="server" CommandName="ViewNotification" CommandArgument='<%# Eval("Id") %>' CssClass="btn-act btn-act-view" ToolTip="View">
        <i class="fa-solid fa-eye"></i>
    </asp:LinkButton>

    <!-- Orange Edit -->
    <asp:LinkButton ID="btnEdit" runat="server" CommandName="EditNotification" CommandArgument='<%# Eval("Id") %>' CssClass="btn-act btn-act-edit" ToolTip="Edit">
        <i class="fa-solid fa-pen-to-square"></i>
    </asp:LinkButton>

    <!-- Red Delete -->
    <asp:LinkButton ID="btnDelete" runat="server" CommandName="DeleteNotification" CommandArgument='<%# Eval("Id") %>' CssClass="btn-act btn-act-delete" ToolTip="Delete">
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

                    <!-- Table Footer / Pagination -->
                    <div class="table-footer">
                        <div>
                            <asp:Literal ID="litShowingText" runat="server">Showing 1 to 4 of 48 entries</asp:Literal>
                        </div>
                        <div class="pagination-wrap">
                            <a href="#" class="p-btn">&lsaquo;</a>
                            <a href="#" class="p-btn active">1</a>
                            <a href="#" class="p-btn">2</a>
                            <a href="#" class="p-btn">3</a>
                            <span>...</span>
                            <a href="#" class="p-btn">&rsaquo;</a>
                        </div>
                    </div>
                </div>

            </div>

            <!-- POPUP 1: VIEW DETAILS MODAL -->
            <asp:Panel ID="pnlViewModal" runat="server" CssClass="modal-overlay" Visible="false">
                <div class="modal-card">
                    <div class="modal-header">
                        <h2>Campaign Details</h2>
                        <asp:LinkButton ID="btnCloseViewX" runat="server" CssClass="btn-modal-close" CausesValidation="false" OnClick="btnCloseView_Click">
                            <i class="fa-solid fa-xmark"></i>
                        </asp:LinkButton>
                    </div>

                    <div class="modal-body">
                        <div style="margin-bottom: 18px;">
                            <div style="font-size: 11px; color: #6b7280; font-weight: 600; text-transform: uppercase;">CAMPAIGN TITLE</div>
                            <h3 style="font-size: 18px; margin: 4px 0 6px 0; color: #111827;">
                                <asp:Literal ID="litViewTitle" runat="server" />
                            </h3>
                            <div style="font-size: 12px; color: #9ca3af;">
                                <asp:Literal ID="litViewChannels" runat="server" />
                            </div>
                        </div>

                        <div class="detail-row-grid">
                            <div class="detail-box">
                                <div class="detail-title">Target Audience</div>
                                <div class="detail-val">
                                    <asp:Literal ID="litViewAudience" runat="server" />
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
                            <div class="detail-title">Execution Timestamp</div>
                            <div class="detail-val" style="font-size: 13.5px;">
                                <asp:Literal ID="litViewDate" runat="server" />
                            </div>
                        </div>

                        <div class="detail-box" style="background-color: #faf7f2;">
                            <div class="detail-title">Message Body / Preview</div>
                            <div style="font-size: 12.5px; color: #4b5563; margin-top: 4px; line-height: 1.5;">
                                <asp:Literal ID="litViewBody" runat="server" />
                            </div>
                        </div>
                    </div>

                    <div class="modal-footer">
                        <asp:Button ID="btnCloseViewBtn" runat="server" Text="Close" CssClass="btn-modal-close-red" CausesValidation="false" OnClick="btnCloseView_Click" />
                    </div>
                </div>
            </asp:Panel>

            <!-- POPUP 2: EDIT MODAL -->
            <asp:Panel ID="pnlEditModal" runat="server" CssClass="modal-overlay" Visible="false">
                <div class="modal-card">
                    <div class="modal-header">
                        <h2>Edit Notification</h2>
                        <asp:LinkButton ID="btnCloseEditX" runat="server" CssClass="btn-modal-close" CausesValidation="false" OnClick="btnCancelEdit_Click">
                            <i class="fa-solid fa-xmark"></i>
                        </asp:LinkButton>
                    </div>

                    <div class="modal-body">
                        <asp:HiddenField ID="hfEditNotifyId" runat="server" Value="0" />

                        <div class="form-group">
                            <label>Campaign Title *</label>
                            <asp:TextBox ID="txtEditTitle" runat="server" CssClass="form-input" />
                            <asp:RequiredFieldValidator 
                                ID="rfvEditTitle" 
                                runat="server" 
                                ControlToValidate="txtEditTitle" 
                                ErrorMessage="Title is required." 
                                ValidationGroup="EditNotifyGroup" 
                                EnableClientScript="false" 
                                CssClass="asp-val-error" 
                                Display="Dynamic" />
                        </div>

                        <div class="form-row">
                            <div class="form-group">
                                <label>Channels</label>
                                <asp:TextBox ID="txtEditChannels" runat="server" CssClass="form-input" />
                            </div>

                            <div class="form-group">
                                <label>Recipient Group</label>
                                <asp:TextBox ID="txtEditRecipientGroup" runat="server" CssClass="form-input" />
                            </div>
                        </div>

                        <div class="form-group">
                            <label>Status</label>
                            <asp:DropDownList ID="ddlEditStatus" runat="server" CssClass="form-input">
                                <asp:ListItem Text="Sent" Value="Sent" />
                                <asp:ListItem Text="Scheduled" Value="Scheduled" />
                                <asp:ListItem Text="Draft" Value="Draft" />
                            </asp:DropDownList>
                        </div>

                        <div class="form-group">
                            <label>Message Content</label>
                            <asp:TextBox ID="txtEditMessageBody" runat="server" TextMode="MultiLine" CssClass="form-textarea" />
                        </div>
                    </div>

                    <div class="modal-footer">
                        <asp:Button ID="btnCancelEdit" runat="server" Text="Cancel" CssClass="btn-modal-cancel" CausesValidation="false" OnClick="btnCancelEdit_Click" />
                        <asp:Button ID="btnSaveEdit" runat="server" Text="Save Changes" CssClass="btn-modal-save" ValidationGroup="EditNotifyGroup" OnClick="btnSaveEdit_Click" />
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
                        <asp:HiddenField ID="hfDeleteNotifyId" runat="server" Value="0" />
                        <div class="delete-dialog-content">
                            <div class="delete-icon-box">
                                <i class="fa-solid fa-triangle-exclamation"></i>
                            </div>
                            <h3 style="font-size: 16px; font-weight: 700; color: #111827; margin: 0 0 6px 0;">
                                Are you sure you want to delete this?
                            </h3>
                            <p style="font-size: 13px; color: #6b7280; margin: 0; line-height: 1.4;">
                                Campaign <strong><asp:Literal ID="litDeleteTargetName" runat="server" /></strong> will be permanently removed.
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