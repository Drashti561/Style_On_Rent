<%@ Page Title="Customer Reviews Management"
    Language="C#"
    MasterPageFile="~/Admin/AdminMaster.Master"
    AutoEventWireup="true"
    CodeFile="AdminReviewManagement.aspx.cs"
    Inherits="Style_On_Rent.Admin.AdminReviewManagement" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css" />

    <style>
        :root {
            --primary-maroon: #73001e;
            --primary-maroon-hover: #590017;
            --gold-accent: #b45309;
            --star-gold: #f59e0b;
            --text-dark: #111827;
            --text-muted: #6b7280;
            --border-color: #ebdcd0;
            --page-bg: #faf7f2;
        }

        body {
            font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, "Helvetica Neue", Arial, sans-serif;
            background-color: var(--page-bg);
            color: var(--text-dark);
        }

        .review-admin-wrapper {
            padding: 24px 32px 48px 32px;
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

        /* Top Summary Cards */
        .kpi-grid {
            display: grid;
            grid-template-columns: repeat(4, 1fr);
            gap: 16px;
            margin-bottom: 22px;
        }

        .kpi-card {
            background: #ffffff;
            border: 1px solid var(--border-color);
            border-radius: 8px;
            padding: 16px 20px;
            box-shadow: 0 1px 3px rgba(0, 0, 0, 0.02);
        }

        .kpi-card .kpi-label {
            font-size: 11px;
            font-weight: 700;
            color: var(--text-muted);
            text-transform: uppercase;
            letter-spacing: 0.5px;
            margin-bottom: 6px;
        }

        .kpi-card .kpi-val {
            font-size: 22px;
            font-weight: 700;
            color: #111827;
        }

        /* Filter Row */
        .filter-bar {
            display: flex;
            justify-content: space-between;
            align-items: center;
            background: #ffffff;
            border: 1px solid var(--border-color);
            border-radius: 8px;
            padding: 14px 20px;
            margin-bottom: 20px;
        }

        .search-input-box {
            position: relative;
            width: 280px;
        }

        .search-input-box i {
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
            padding: 0 12px 0 34px;
            border: 1px solid var(--border-color);
            border-radius: 6px;
            font-size: 13px;
            outline: none;
            background-color: #fafbfc;
        }

        .search-input:focus {
            border-color: var(--primary-maroon);
            background-color: #ffffff;
        }

        .status-select {
            height: 38px;
            padding: 0 14px;
            border: 1px solid var(--border-color);
            border-radius: 6px;
            font-size: 13px;
            outline: none;
            background-color: #ffffff;
        }

        /* Reviews Table */
        .table-card {
            background: #ffffff;
            border-radius: 8px;
            border: 1px solid var(--border-color);
            overflow: hidden;
            box-shadow: 0 1px 3px rgba(0, 0, 0, 0.02);
        }

        .review-table {
            width: 100%;
            border-collapse: collapse;
            font-size: 13px;
        }

        .review-table th {
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

        .review-table td {
            padding: 16px 18px;
            vertical-align: middle;
            border-bottom: 1px solid #f3ece4;
            color: #374151;
        }

        .review-table tr:hover {
            background-color: #fdfcfb;
        }

        /* Elements inside Table */
        .item-info-cell {
            display: flex;
            align-items: center;
            gap: 12px;
        }

        .item-thumb {
            width: 44px;
            height: 44px;
            border-radius: 6px;
            object-fit: cover;
            border: 1px solid var(--border-color);
        }

        .item-title-text {
            font-weight: 700;
            color: #111827;
            font-size: 13.5px;
            margin-bottom: 2px;
        }

        .item-order-id {
            font-size: 11px;
            color: var(--text-muted);
        }

        .stars-container {
            color: var(--star-gold);
            font-size: 12px;
            margin-bottom: 2px;
        }

        .sentiment-text {
            font-size: 11px;
            font-weight: 600;
            color: #4b5563;
        }

        .fit-pill {
            display: inline-block;
            padding: 3px 8px;
            border-radius: 4px;
            font-size: 11px;
            font-weight: 600;
            background-color: #f3f4f6;
            color: #374151;
            border: 1px solid #e5e7eb;
        }

        .fit-true {
            background-color: #ecfdf5;
            color: #065f46;
            border-color: #a7f3d0;
        }

        .fit-small {
            background-color: #fffbeb;
            color: #b45309;
            border-color: #fde68a;
        }

        .fit-large {
            background-color: #eff6ff;
            color: #1e40af;
            border-color: #bfdbfe;
        }

        .review-title-text {
            font-weight: 700;
            color: #111827;
            margin-bottom: 4px;
        }

        .review-body-text {
            font-size: 12px;
            color: #4b5563;
            line-height: 1.45;
            max-width: 320px;
        }

        /* Status Badges */
        .status-badge {
            display: inline-block;
            padding: 4px 10px;
            border-radius: 4px;
            font-size: 10.5px;
            font-weight: 700;
            letter-spacing: 0.5px;
            text-transform: uppercase;
        }

        .status-badge-approved {
            background-color: #ecfdf5;
            color: #065f46;
            border: 1px solid #a7f3d0;
        }

        .status-badge-pending {
            background-color: #fffbeb;
            color: #b45309;
            border: 1px solid #fde68a;
        }

        .status-badge-rejected {
            background-color: #fef2f2;
            color: #991b1b;
            border: 1px solid #fecaca;
        }

        /* Actions */
        .actions-cell {
            display: inline-flex;
            align-items: center;
            gap: 12px;
        }

        .btn-act {
            background: none;
            border: none;
            font-size: 15px;
            cursor: pointer;
            padding: 0;
            transition: transform 0.15s ease;
        }

        .btn-act:hover {
            transform: scale(1.2);
        }

        .btn-act-view { color: #1d68ed !important; }
        .btn-act-approve { color: #16a34a !important; }
        .btn-act-reject { color: #d97706 !important; }
        .btn-act-delete { color: #dc2626 !important; }

        /* Modal Popup */
        .modal-overlay {
            position: fixed;
            top: 0;
            left: 0;
            width: 100vw;
            height: 100vh;
            background: rgba(17, 24, 39, 0.6);
            display: flex;
            align-items: center;
            justify-content: center;
            z-index: 999999;
            backdrop-filter: blur(2px);
        }

        .modal-card {
            background: #ffffff;
            border-radius: 10px;
            width: 550px;
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
            padding: 18px 24px;
            border-bottom: 1px solid var(--border-color);
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
        }

        .modal-body {
            padding: 22px 24px;
            max-height: 75vh;
            overflow-y: auto;
        }

        .modal-footer {
            display: flex;
            justify-content: flex-end;
            gap: 10px;
            padding: 16px 24px;
            background-color: #fafbfc;
            border-top: 1px solid var(--border-color);
        }

        .uploaded-photo-preview {
            width: 90px;
            height: 90px;
            border-radius: 6px;
            border: 1px solid var(--border-color);
            object-fit: cover;
            margin-right: 8px;
        }

        .detail-box {
            background: #faf7f2;
            border: 1px solid var(--border-color);
            padding: 14px 16px;
            border-radius: 6px;
            margin-bottom: 16px;
        }

        .detail-box-label {
            font-size: 11px;
            font-weight: 700;
            color: #6b7280;
            text-transform: uppercase;
            margin-bottom: 4px;
        }

        .btn-modal-maroon {
            background-color: var(--primary-maroon);
            color: #ffffff !important;
            border: none;
            padding: 8px 22px;
            border-radius: 5px;
            font-size: 13px;
            font-weight: 600;
            cursor: pointer;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <asp:ScriptManager ID="smReviews" runat="server" />

    <asp:UpdatePanel ID="upnlReviews" runat="server" UpdateMode="Conditional">
        <ContentTemplate>
            <div class="review-admin-wrapper">

                <!-- Header Row -->
                <div class="page-header-row">
                    <div class="header-title-box">
                        <h1>Customer Experience & Reviews</h1>
                        <p>Moderate customer feedback, fit details, star ratings, and uploaded customer snapshots.</p>
                    </div>
                </div>

                <!-- Summary Cards Row -->
                <div class="kpi-grid">
                    <div class="kpi-card">
                        <div class="kpi-label">Total Submissions</div>
                        <div class="kpi-val"><asp:Literal ID="litTotalReviews" runat="server">0</asp:Literal></div>
                    </div>
                    <div class="kpi-card">
                        <div class="kpi-label">Pending Approval</div>
                        <div class="kpi-val" style="color: #b45309;"><asp:Literal ID="litPendingReviews" runat="server">0</asp:Literal></div>
                    </div>
                    <div class="kpi-card">
                        <div class="kpi-label">Average Rating</div>
                        <div class="kpi-val" style="color: #f59e0b;">★ <asp:Literal ID="litAvgRating" runat="server">4.8</asp:Literal></div>
                    </div>
                    <div class="kpi-card">
                        <div class="kpi-label">Customer Snapshots</div>
                        <div class="kpi-val"><asp:Literal ID="litPhotoCount" runat="server">0</asp:Literal></div>
                    </div>
                </div>

                <!-- Filter & Search Bar -->
                <div class="filter-bar">
                    <div class="search-input-box">
                        <i class="bi bi-search"></i>
                        <asp:TextBox ID="txtSearch" runat="server" CssClass="search-input" placeholder="Search by item, reviewer, or text..." AutoPostBack="true" OnTextChanged="txtSearch_TextChanged" />
                    </div>

                    <div>
                        <span style="font-size: 13px; color: #4b5563; font-weight: 600; margin-right: 8px;">Moderation Status:</span>
                        <asp:DropDownList ID="ddlStatusFilter" runat="server" CssClass="status-select" AutoPostBack="true" OnSelectedIndexChanged="ddlStatusFilter_SelectedIndexChanged">
                            <asp:ListItem Text="All Reviews" Value="ALL" Selected="True" />
                            <asp:ListItem Text="Pending Moderation" Value="Pending" />
                            <asp:ListItem Text="Approved & Published" Value="Approved" />
                            <asp:ListItem Text="Rejected" Value="Rejected" />
                        </asp:DropDownList>
                    </div>
                </div>

                <!-- Reviews Table Card -->
                <div class="table-card">
                    <asp:Repeater ID="rptReviews" runat="server" OnItemCommand="rptReviews_ItemCommand">
                        <HeaderTemplate>
                            <table class="review-table">
                                <thead>
                                    <tr>
                                        <th style="width: 25%;">RENTED CHOLI ITEM</th>
                                        <th style="width: 15%;">RATING & SENTIMENT</th>
                                        <th style="width: 12%;">FIT FEEDBACK</th>
                                        <th style="width: 26%;">CUSTOMER REVIEW</th>
                                        <th style="width: 10%;">STATUS</th>
                                        <th style="width: 12%;">ACTIONS</th>
                                    </tr>
                                </thead>
                                <tbody>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <tr>
                                <td>
                                    <div class="item-info-cell">
                                        <img src='<%# Eval("ItemImage") %>' class="item-thumb" alt="Choli" />
                                        <div>
                                            <div class="item-title-text"><%# Eval("ItemTitle") %></div>
                                            <div class="item-order-id"><%# Eval("OrderCode") %> &bull; <%# Eval("CustomerName") %></div>
                                        </div>
                                    </div>
                                </td>
                                <td>
                                    <div class="stars-container">
                                        <%# RenderStars(Convert.ToInt32(Eval("Rating"))) %>
                                    </div>
                                    <div class="sentiment-text"><%# Eval("SentimentText") %></div>
                                </td>
                                <td>
                                    <span class='fit-pill <%# GetFitClass(Eval("FitFeedback").ToString()) %>'>
                                        <%# Eval("FitFeedback") %>
                                    </span>
                                </td>
                                <td>
                                    <div class="review-title-text"><%# Eval("ReviewTitle") %></div>
                                    <div class="review-body-text"><%# Eval("ReviewBody") %></div>
                                    <asp:PlaceHolder ID="phHasImage" runat="server" Visible='<%# !string.IsNullOrEmpty(Eval("CustomerPhotoUrl").ToString()) %>'>
                                        <div style="margin-top: 5px; font-size: 11px; color: var(--primary-maroon); font-weight: 600;">
                                            <i class="bi bi-camera"></i> Snapshot Included
                                        </div>
                                    </asp:PlaceHolder>
                                </td>
                                <td>
                                    <span class='status-badge status-badge-<%# Eval("Status").ToString().ToLower() %>'>
                                        <%# Eval("Status") %>
                                    </span>
                                </td>
                                <td>
                                    <div class="actions-cell">
                                        <!-- View Modal Trigger -->
                                        <asp:LinkButton ID="btnView" runat="server" CommandName="ViewReview" CommandArgument='<%# Eval("ReviewId") %>' CssClass="btn-act btn-act-view" ToolTip="View Detailed Review">
                                            <i class="fa-solid fa-eye"></i>
                                        </asp:LinkButton>

                                        <!-- Approve -->
                                        <asp:LinkButton ID="btnApprove" runat="server" CommandName="ApproveReview" CommandArgument='<%# Eval("ReviewId") %>' CssClass="btn-act btn-act-approve" ToolTip="Publish / Approve">
                                            <i class="fa-solid fa-circle-check"></i>
                                        </asp:LinkButton>

                                        <!-- Reject -->
                                        <asp:LinkButton ID="btnReject" runat="server" CommandName="RejectReview" CommandArgument='<%# Eval("ReviewId") %>' CssClass="btn-act btn-act-reject" ToolTip="Reject">
                                            <i class="fa-solid fa-circle-xmark"></i>
                                        </asp:LinkButton>

                                        <!-- Delete -->
                                        <asp:LinkButton ID="btnDelete" runat="server" CommandName="DeleteReview" CommandArgument='<%# Eval("ReviewId") %>' CssClass="btn-act btn-act-delete" ToolTip="Delete Permanently" OnClientClick="return confirm('Permanently remove this review?');">
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

            <!-- MODAL: FULL EXPERIENCE & PHOTO PREVIEW -->
            <asp:Panel ID="pnlReviewModal" runat="server" CssClass="modal-overlay" Visible="false">
                <div class="modal-card">
                    <div class="modal-header">
                        <h2>Experience Details</h2>
                        <asp:LinkButton ID="btnCloseModalX" runat="server" CssClass="btn-modal-close" CausesValidation="false" OnClick="btnCloseModal_Click">
                            <i class="fa-solid fa-xmark"></i>
                        </asp:LinkButton>
                    </div>

                    <div class="modal-body">
                        <!-- Rented Item Banner -->
                        <div class="detail-box">
                            <div class="detail-box-label">RENTED CHOLI</div>
                            <h3 style="font-size: 16px; margin: 4px 0; color: #111827;">
                                <asp:Literal ID="litModalItemTitle" runat="server" />
                            </h3>
                            <div style="font-size: 12px; color: var(--text-muted);">
                                Customer: <strong><asp:Literal ID="litModalCustomer" runat="server" /></strong> &bull; Order: <asp:Literal ID="litModalOrder" runat="server" />
                            </div>
                        </div>

                        <!-- Rating & Fit Block -->
                        <div style="display: grid; grid-template-columns: 1fr 1fr; gap: 14px; margin-bottom: 16px;">
                            <div class="detail-box" style="margin-bottom: 0;">
                                <div class="detail-box-label">SATISFACTION RATING</div>
                                <div style="color: var(--star-gold); font-size: 15px; margin: 4px 0;">
                                    <asp:Literal ID="litModalStars" runat="server" />
                                </div>
                                <div style="font-size: 12px; font-weight: 700; color: #374151;">
                                    <asp:Literal ID="litModalSentiment" runat="server" />
                                </div>
                            </div>

                            <div class="detail-box" style="margin-bottom: 0;">
                                <div class="detail-box-label">FIT FEEDBACK</div>
                                <div style="margin-top: 6px;">
                                    <asp:Literal ID="litModalFit" runat="server" />
                                </div>
                            </div>
                        </div>

                        <!-- Review Text -->
                        <div class="detail-box">
                            <div class="detail-box-label">REVIEW TITLE & COMMENTS</div>
                            <h4 style="font-size: 14.5px; margin: 6px 0 8px 0; color: #111827;">
                                <asp:Literal ID="litModalTitle" runat="server" />
                            </h4>
                            <p style="font-size: 13px; color: #4b5563; line-height: 1.5; margin: 0;">
                                <asp:Literal ID="litModalBody" runat="server" />
                            </p>
                        </div>

                        <!-- Customer Photos Section -->
                        <asp:Panel ID="pnlModalPhotos" runat="server" Visible="false">
                            <div class="detail-box-label" style="margin-bottom: 8px;">CUSTOMER ATTACHED SNAPSHOT</div>
                            <div>
                                <asp:Image ID="imgModalCustomerPhoto" runat="server" CssClass="uploaded-photo-preview" />
                            </div>
                        </asp:Panel>
                    </div>

                    <div class="modal-footer">
                        <asp:Button ID="btnModalClose" runat="server" Text="Close Window" CssClass="btn-modal-maroon" CausesValidation="false" OnClick="btnCloseModal_Click" />
                    </div>
                </div>
            </asp:Panel>

        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>