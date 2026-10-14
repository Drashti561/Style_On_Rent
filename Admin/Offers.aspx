<%@ Page Title="Coupon Management"
    Language="C#"
    MasterPageFile="~/Admin/AdminMaster.Master"
    AutoEventWireup="true"
    CodeFile="Offers.aspx.cs"
    Inherits="Style_On_Rent.Admin.Offers" %>

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

        .offers-wrapper {
            padding: 24px 32px;
            max-width: 1250px;
            margin: 0 auto;
            box-sizing: border-box;
        }

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
            color: #111827;
            margin: 0 0 4px 0;
        }

        .header-title-box p {
            font-size: 13px;
            color: var(--text-muted);
            margin: 0;
        }

        .btn-create-offer {
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
        .btn-create-offer:hover { background-color: var(--primary-maroon-hover); }

        .metrics-grid {
            display: grid;
            grid-template-columns: repeat(3, 1fr);
            gap: 20px;
            margin-bottom: 24px;
        }

        .metric-card {
            background: #ffffff;
            border: 1px solid #ebdcd0;
            border-radius: 8px;
            padding: 22px 26px;
            box-sizing: border-box;
        }

        .metric-top {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 12px;
        }

        .metric-label {
            font-size: 11px;
            font-weight: 700;
            letter-spacing: 0.6px;
            color: var(--text-muted);
            text-transform: uppercase;
        }

        .metric-icon { font-size: 16px; color: #a89f91; }

        .metric-value {
            font-size: 32px;
            font-weight: 700;
            color: #111827;
            margin: 0;
            line-height: 1;
        }

        .offers-toolbar {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 16px;
        }

        .filter-input-wrap {
            position: relative;
            width: 360px;
        }

        .filter-icon {
            position: absolute;
            left: 14px;
            top: 50%;
            transform: translateY(-50%);
            color: #9ca3af;
            font-size: 13px;
        }

        .filter-input {
            width: 100%;
            height: 38px;
            padding: 0 14px 0 38px;
            border: 1px solid #ebdcd0;
            border-radius: 6px;
            font-size: 13px;
            background-color: #ffffff;
            color: var(--text-dark);
            outline: none;
            box-sizing: border-box;
        }
        .filter-input:focus { border-color: var(--primary-maroon); }

        .showing-text { font-size: 12.5px; color: var(--text-muted); }

        .table-card {
            background: #ffffff;
            border-radius: 8px;
            border: 1px solid #ebdcd0;
            overflow: hidden;
        }

        .offers-table {
            width: 100%;
            border-collapse: collapse;
            font-size: 13px;
        }

        .offers-table th {
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

        .offers-table td {
            padding: 16px 18px;
            vertical-align: middle;
            border-bottom: 1px solid #f3ece4;
            color: #374151;
        }
        .offers-table tr:last-child td { border-bottom: none; }
        .offers-table tr:hover { background-color: #fdfcfb; }

        .offer-name { font-weight: 600; color: #111827; }

        .coupon-code-pill {
            display: inline-block;
            background-color: #faecef;
            border: 1px dashed #e6b2be;
            color: var(--primary-maroon);
            padding: 4px 10px;
            font-size: 11px;
            font-weight: 700;
            border-radius: 4px;
            letter-spacing: 0.5px;
        }

        .discount-text { color: #b91c1c; font-weight: 700; }

        .status-pill {
            display: inline-block;
            padding: 4px 12px;
            border-radius: 12px;
            font-size: 11px;
            font-weight: 600;
            text-align: center;
        }

        .status-active { background-color: #ecfdf5; color: #059669; }
        .status-expired { background-color: #fee2e2; color: #dc2626; }

        .actions-cell {
            display: inline-flex;
            align-items: center;
            gap: 14px;
        }

        .btn-act {
            background: transparent !important;
            border: none !important;
            padding: 0 !important;
            width: auto !important;
            height: auto !important;
            font-size: 15px;
            text-decoration: none !important;
            display: inline-flex;
            align-items: center;
            justify-content: center;
            cursor: pointer;
        }
        .btn-act:hover { transform: scale(1.15); }

        .btn-act-view { color: #0284c7 !important; }
        .btn-act-edit { color: #d97706 !important; }
        .btn-act-delete { color: #dc2626 !important; }

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
            width: 520px;
            max-width: 90vw;
            box-shadow: 0 20px 25px -5px rgba(0, 0, 0, 0.2);
            border-top: 5px solid var(--primary-maroon);
            overflow: hidden;
        }

        .modal-card-danger {
            width: 420px;
            border-top: 5px solid #dc2626;
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

        .modal-body { padding: 20px 24px; }

        .modal-footer {
            display: flex;
            justify-content: flex-end;
            gap: 10px;
            padding: 16px 24px;
            background-color: #fafbfc;
            border-top: 1px solid #ebdcd0;
        }

        .form-group { margin-bottom: 14px; }
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
        .form-input:focus { border-color: var(--primary-maroon); background-color: #ffffff; }

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

        .btn-modal-delete {
            background: #dc2626;
            color: #ffffff;
            border: none;
            padding: 8px 22px;
            border-radius: 5px;
            font-size: 13px;
            font-weight: 600;
            cursor: pointer;
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

        .delete-dialog-content { text-align: center; padding: 10px 0; }

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

        .delete-title {
            font-size: 16px;
            font-weight: 700;
            color: #111827;
            margin: 0 0 6px 0;
        }

        .delete-desc {
            font-size: 13px;
            color: #6b7280;
            margin: 0;
            line-height: 1.4;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <asp:ScriptManager ID="smOffers" runat="server" />

    <asp:UpdatePanel ID="upnlOffers" runat="server" UpdateMode="Conditional">
        <ContentTemplate>
            <div class="offers-wrapper">

                <div class="page-header-row">
                    <div class="header-brand-box">
                        <img src="Images/logo.png" class="brand-logo" alt="Style On Rent" />
                        <div class="header-title-box">
                            <h1>Coupon Management</h1>
                            <p>Create and monitor promotional offers for your clientele.</p>
                        </div>
                    </div>

                    <asp:LinkButton ID="btnOpenCreatePage" runat="server" CssClass="btn-create-offer" CausesValidation="false" OnClick="btnOpenCreatePage_Click">
                        <i class="fa-solid fa-plus"></i> Create New Offer
                    </asp:LinkButton>
                </div>

                <div class="metrics-grid">
                    <div class="metric-card">
                        <div class="metric-top">
                            <span class="metric-label">ACTIVE OFFERS</span>
                            <i class="bi bi-tag metric-icon"></i>
                        </div>
                        <h2 class="metric-value">
                            <asp:Literal ID="litActiveOffers" runat="server">0</asp:Literal>
                        </h2>
                    </div>

                    <div class="metric-card">
                        <div class="metric-top">
                            <span class="metric-label">TOTAL USAGE (MTD)</span>
                            <i class="bi bi-graph-up-arrow metric-icon"></i>
                        </div>
                        <h2 class="metric-value">
                            <asp:Literal ID="litTotalUsage" runat="server">0</asp:Literal>
                        </h2>
                    </div>

                    <div class="metric-card">
                        <div class="metric-top">
                            <span class="metric-label">EST. SAVINGS PASSED</span>
                            <i class="bi bi-wallet2 metric-icon"></i>
                        </div>
                        <h2 class="metric-value">
                            &#8377;<asp:Literal ID="litSavingsPassed" runat="server">0</asp:Literal>
                        </h2>
                    </div>
                </div>

                <div class="offers-toolbar">
                    <div class="filter-input-wrap">
                        <i class="bi bi-funnel filter-icon"></i>
                        <asp:TextBox ID="txtFilter" runat="server" CssClass="filter-input" placeholder="Filter by code or name..." AutoPostBack="true" OnTextChanged="txtFilter_TextChanged" />
                    </div>

                    <div class="showing-text">
                        <asp:Literal ID="litShowingOffers" runat="server">Showing 0 of 0 offers</asp:Literal>
                    </div>
                </div>

                <div class="table-card">
                    <asp:Repeater ID="rptOffers" runat="server" OnItemCommand="rptOffers_ItemCommand">
                        <HeaderTemplate>
                            <table class="offers-table">
                                <thead>
                                    <tr>
                                        <th style="width: 24%;">OFFER NAME</th>
                                        <th style="width: 16%;">COUPON CODE</th>
                                        <th style="width: 14%;">DISCOUNT</th>
                                        <th style="width: 14%;">START DATE</th>
                                        <th style="width: 14%;">END DATE</th>
                                        <th style="width: 10%;">STATUS</th>
                                        <th style="width: 8%;">ACTIONS</th>
                                    </tr>
                                </thead>
                                <tbody>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <tr>
                                <td class="offer-name"><%# Eval("OfferName") %></td>
                                <td><span class="coupon-code-pill"><%# Eval("CouponCode") %></span></td>
                                <td><span class="discount-text"><%# Eval("Discount") %></span></td>
                                <td><%# Eval("StartDate") %></td>
                                <td><%# Eval("EndDate") %></td>
                                <td>
                                    <span class='status-pill <%# Eval("Status").ToString() == "Active" ? "status-active" : "status-expired" %>'>
                                        <%# Eval("Status") %>
                                    </span>
                                </td>
                                <td>
                                    <div class="actions-cell">
                                        <asp:LinkButton ID="btnView" runat="server" CommandName="ViewOffer" CommandArgument='<%# Eval("Id") %>' CssClass="btn-act btn-act-view" ToolTip="View Offer Details">
                                            <i class="fa-regular fa-eye"></i>
                                        </asp:LinkButton>

                                        <asp:LinkButton ID="btnEdit" runat="server" CommandName="EditOffer" CommandArgument='<%# Eval("Id") %>' CssClass="btn-act btn-act-edit" ToolTip="Edit Offer">
                                            <i class="fa-solid fa-pencil"></i>
                                        </asp:LinkButton>

                                        <asp:LinkButton ID="btnDelete" runat="server" CommandName="ConfirmDelete" CommandArgument='<%# Eval("Id") %>' CssClass="btn-act btn-act-delete" ToolTip="Delete Offer">
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
                </div>

            </div>

            <!-- 1. EDIT OFFER MODAL POPUP -->
            <asp:Panel ID="pnlEditModal" runat="server" CssClass="modal-overlay" Visible="false">
                <div class="modal-card">
                    <div class="modal-header">
                        <h2>Edit Promotional Offer</h2>
                        <asp:LinkButton ID="btnCloseEditX" runat="server" CssClass="btn-modal-close" CausesValidation="false" OnClick="btnCancelEdit_Click">
                            <i class="fa-solid fa-xmark"></i>
                        </asp:LinkButton>
                    </div>

                    <div class="modal-body">
                        <asp:HiddenField ID="hfEditOfferId" runat="server" Value="0" />

                        <div class="form-group">
                            <label>Offer Name *</label>
                            <asp:TextBox ID="txtEditOfferName" runat="server" CssClass="form-input" />
                            <asp:RequiredFieldValidator ID="rfvEditOfferName" runat="server" ControlToValidate="txtEditOfferName" ErrorMessage="Offer name is required." ValidationGroup="EditOfferGroup" EnableClientScript="false" CssClass="asp-val-error" Display="Dynamic" />
                        </div>

                        <div class="form-row">
                            <div class="form-group">
                                <label>Coupon Code *</label>
                                <asp:TextBox ID="txtEditCouponCode" runat="server" CssClass="form-input" />
                                <asp:RequiredFieldValidator ID="rfvEditCouponCode" runat="server" ControlToValidate="txtEditCouponCode" ErrorMessage="Coupon code is required." ValidationGroup="EditOfferGroup" EnableClientScript="false" CssClass="asp-val-error" Display="Dynamic" />
                            </div>

                            <div class="form-group">
                                <label>Discount Label *</label>
                                <asp:TextBox ID="txtEditDiscount" runat="server" CssClass="form-input" />
                                <asp:RequiredFieldValidator ID="rfvEditDiscount" runat="server" ControlToValidate="txtEditDiscount" ErrorMessage="Discount label is required." ValidationGroup="EditOfferGroup" EnableClientScript="false" CssClass="asp-val-error" Display="Dynamic" />
                            </div>
                        </div>

                        <div class="form-row">
                            <div class="form-group">
                                <label>Start Date *</label>
                                <asp:TextBox ID="txtEditStartDate" runat="server" TextMode="Date" CssClass="form-input" />
                                <asp:RequiredFieldValidator ID="rfvEditStartDate" runat="server" ControlToValidate="txtEditStartDate" ErrorMessage="Start date is required." ValidationGroup="EditOfferGroup" EnableClientScript="false" CssClass="asp-val-error" Display="Dynamic" />
                            </div>

                            <div class="form-group">
                                <label>End Date (Optional)</label>
                                <asp:TextBox ID="txtEditEndDate" runat="server" TextMode="Date" CssClass="form-input" />
                                <asp:CustomValidator ID="cvEditEndDate" runat="server" OnServerValidate="cvEditEndDate_ServerValidate" ErrorMessage="End date must be on or after start date." ValidationGroup="EditOfferGroup" EnableClientScript="false" CssClass="asp-val-error" Display="Dynamic" />
                            </div>
                        </div>

                        <div class="form-group">
                            <label>Status</label>
                            <asp:DropDownList ID="ddlEditStatus" runat="server" CssClass="form-input">
                                <asp:ListItem Text="Active" Value="Active" />
                                <asp:ListItem Text="Expired" Value="Expired" />
                            </asp:DropDownList>
                        </div>
                    </div>

                    <div class="modal-footer">
                        <asp:Button ID="btnCancelEdit" runat="server" Text="Cancel" CssClass="btn-modal-cancel" CausesValidation="false" OnClick="btnCancelEdit_Click" />
                        <asp:Button ID="btnUpdateOffer" runat="server" Text="Update Offer" CssClass="btn-modal-save" ValidationGroup="EditOfferGroup" OnClick="btnUpdateOffer_Click" />
                    </div>
                </div>
            </asp:Panel>

            <!-- 2. VIEW OFFER DETAILS POPUP -->
            <asp:Panel ID="pnlViewModal" runat="server" CssClass="modal-overlay" Visible="false">
                <div class="modal-card">
                    <div class="modal-header">
                        <h2>Offer Details</h2>
                        <asp:LinkButton ID="btnCloseView" runat="server" CssClass="btn-modal-close" CausesValidation="false" OnClick="btnCloseView_Click">
                            <i class="fa-solid fa-xmark"></i>
                        </asp:LinkButton>
                    </div>

                    <div class="modal-body">
                        <div style="margin-bottom: 18px;">
                            <div style="font-size: 11px; color: #6b7280; font-weight: 600; text-transform: uppercase;">PROMOTION NAME</div>
                            <h3 style="font-size: 18px; margin: 4px 0 10px 0; color: #111827;">
                                <asp:Literal ID="litViewName" runat="server" />
                            </h3>
                            <span class="coupon-code-pill" style="font-size: 13px; padding: 6px 14px;">
                                <i class="bi bi-tag" style="margin-right: 4px;"></i>
                                <asp:Literal ID="litViewCode" runat="server" />
                            </span>
                        </div>

                        <div class="detail-row-grid">
                            <div class="detail-box">
                                <div class="detail-title">Discount Value</div>
                                <div class="detail-val" style="color: #b91c1c;">
                                    <asp:Literal ID="litViewDiscount" runat="server" />
                                </div>
                            </div>
                            <div class="detail-box">
                                <div class="detail-title">Current Status</div>
                                <div class="detail-val">
                                    <asp:Literal ID="litViewStatus" runat="server" />
                                </div>
                            </div>
                        </div>

                        <div class="detail-row-grid">
                            <div class="detail-box">
                                <div class="detail-title">Start Date</div>
                                <div class="detail-val"><asp:Literal ID="litViewStart" runat="server" /></div>
                            </div>
                            <div class="detail-box">
                                <div class="detail-title">End Date</div>
                                <div class="detail-val"><asp:Literal ID="litViewEnd" runat="server" /></div>
                            </div>
                        </div>

                        <div class="detail-box" style="background-color: #fefce8; border-color: #fef08a;">
                            <div class="detail-title" style="color: #854d0e;">Client Eligibility</div>
                            <div style="font-size: 12px; color: #713f12; margin-top: 2px;">
                                Applicable on all Choli and Sherwani rental bookings during the active period.
                            </div>
                        </div>
                    </div>

                    <div class="modal-footer">
                        <asp:Button ID="btnCloseViewBtn" runat="server" Text="Close" CssClass="btn-modal-close-red" CausesValidation="false" OnClick="btnCloseView_Click" />
                    </div>
                </div>
            </asp:Panel>

            <!-- 3. DELETE CONFIRMATION POPUP -->
            <asp:Panel ID="pnlDeleteModal" runat="server" CssClass="modal-overlay" Visible="false">
                <div class="modal-card modal-card-danger">
                    <div class="modal-header" style="border-bottom: none; padding-bottom: 0;">
                        <span></span>
                        <asp:LinkButton ID="btnCloseDeleteX" runat="server" CssClass="btn-modal-close" CausesValidation="false" OnClick="btnCancelDelete_Click">
                            <i class="fa-solid fa-xmark"></i>
                        </asp:LinkButton>
                    </div>

                    <div class="modal-body">
                        <asp:HiddenField ID="hfDeleteId" runat="server" Value="0" />
                        <div class="delete-dialog-content">
                            <div class="delete-icon-box">
                                <i class="fa-solid fa-triangle-exclamation"></i>
                            </div>
                            <h3 class="delete-title">Are you sure you want to delete this?</h3>
                            <p class="delete-desc">
                                Coupon <strong><asp:Literal ID="litDeleteTargetName" runat="server" /></strong> will be permanently removed. This action cannot be undone.
                            </p>
                        </div>
                    </div>

                    <div class="modal-footer" style="justify-content: center; background: #ffffff;">
                        <asp:Button ID="btnCancelDelete" runat="server" Text="No, Keep It" CssClass="btn-modal-cancel" CausesValidation="false" OnClick="btnCancelDelete_Click" />
                        <asp:Button ID="btnConfirmDelete" runat="server" Text="Yes, Delete" CssClass="btn-modal-delete" CausesValidation="false" OnClick="btnConfirmDelete_Click" />
                    </div>
                </div>
            </asp:Panel>

        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>