<%@ Page Title="Create New Offer" 
    Language="C#" 
    MasterPageFile="~/Admin/AdminMaster.Master" 
    AutoEventWireup="true" 
    CodeFile="AddOffer.aspx.cs" 
    Inherits="Style_On_Rent.Admin.AddOffer" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" />

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

        .add-offer-container {
            padding: 40px 32px;
            max-width: 900px;
            margin: 0 auto;
            box-sizing: border-box;
        }

        .offer-form-card {
            background: #ffffff;
            border-radius: 8px;
            border: 1px solid #ebdcd0;
            border-top: 4px solid #a88b77;
            padding: 36px 44px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.03);
            box-sizing: border-box;
        }

        .form-header { margin-bottom: 28px; }

        .form-title {
            font-size: 20px;
            font-weight: 700;
            color: #111827;
            margin: 0 0 6px 0;
        }

        .form-subtitle {
            font-size: 13px;
            color: var(--text-muted);
            margin: 0;
        }

        .form-row {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 24px;
            margin-bottom: 22px;
        }

        .form-group { display: flex; flex-direction: column; }

        .form-label {
            font-size: 11px;
            font-weight: 700;
            color: #374151;
            text-transform: uppercase;
            letter-spacing: 0.6px;
            margin-bottom: 8px;
        }

        .form-input {
            width: 100%;
            height: 42px;
            padding: 0 14px;
            border: 1px solid #e5e7eb;
            border-radius: 5px;
            font-size: 13px;
            background-color: #fbfbfc;
            color: var(--text-dark);
            outline: none;
            box-sizing: border-box;
            transition: border-color 0.2s, background-color 0.2s;
        }
        .form-input:focus {
            border-color: var(--primary-maroon);
            background-color: #ffffff;
        }

        .form-select {
            width: 100%;
            height: 42px;
            padding: 0 14px;
            border: 1px solid #e5e7eb;
            border-radius: 5px;
            font-size: 13px;
            background-color: #fbfbfc;
            color: var(--text-dark);
            outline: none;
            box-sizing: border-box;
            cursor: pointer;
        }
        .form-select:focus {
            border-color: var(--primary-maroon);
            background-color: #ffffff;
        }

        .date-range-wrap {
            display: flex;
            align-items: center;
            gap: 16px;
        }

        .date-range-sep {
            font-size: 13px;
            color: var(--text-muted);
            font-weight: 500;
        }

        .form-actions {
            display: flex;
            justify-content: flex-end;
            align-items: center;
            gap: 14px;
            margin-top: 36px;
            padding-top: 10px;
        }

        .btn-cancel {
            background-color: #ffffff;
            color: #374151;
            border: 1px solid #d1d5db;
            padding: 9px 26px;
            font-size: 12px;
            font-weight: 700;
            border-radius: 4px;
            cursor: pointer;
            text-transform: uppercase;
            letter-spacing: 0.5px;
        }
        .btn-cancel:hover { background-color: #f9fafb; border-color: #9ca3af; }

        .btn-save {
            background-color: var(--primary-maroon);
            color: #ffffff;
            border: none;
            padding: 10px 28px;
            font-size: 12px;
            font-weight: 700;
            border-radius: 4px;
            cursor: pointer;
            text-transform: uppercase;
            letter-spacing: 0.5px;
        }
        .btn-save:hover { background-color: var(--primary-maroon-hover); }

        .asp-val-error {
            display: block;
            color: #dc2626;
            font-size: 11px;
            margin-top: 5px;
            font-weight: 500;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="add-offer-container">

        <div class="offer-form-card">

            <div class="form-header">
                <h1 class="form-title">Create New Offer</h1>
                <p class="form-subtitle">Configure discount details, validity, and usage limits.</p>
            </div>

            <!-- Row 1: Offer Name & Coupon Code -->
            <div class="form-row">
                <div class="form-group">
                    <label class="form-label">OFFER NAME</label>
                    <asp:TextBox ID="txtOfferName" runat="server" CssClass="form-input" placeholder="e.g., Summer Wedding Special" />
                    <asp:RequiredFieldValidator ID="rfvOfferName" runat="server" ControlToValidate="txtOfferName" ErrorMessage="Offer name is required." ValidationGroup="NewOfferGroup" EnableClientScript="false" CssClass="asp-val-error" Display="Dynamic" />
                    <asp:RegularExpressionValidator ID="revOfferName" runat="server" ControlToValidate="txtOfferName" ValidationExpression="^.{3,80}$" ErrorMessage="Offer name must be between 3 and 80 characters." ValidationGroup="NewOfferGroup" EnableClientScript="false" CssClass="asp-val-error" Display="Dynamic" />
                </div>

                <div class="form-group">
                    <label class="form-label">COUPON CODE</label>
                    <asp:TextBox ID="txtCouponCode" runat="server" CssClass="form-input" placeholder="E.G., SUMMER20" />
                    <asp:RequiredFieldValidator ID="rfvCouponCode" runat="server" ControlToValidate="txtCouponCode" ErrorMessage="Coupon code is required." ValidationGroup="NewOfferGroup" EnableClientScript="false" CssClass="asp-val-error" Display="Dynamic" />
                    <asp:RegularExpressionValidator ID="revCouponCode" runat="server" ControlToValidate="txtCouponCode" ValidationExpression="^[a-zA-Z0-9_-]{3,20}$" ErrorMessage="Code must be 3-20 alphanumeric characters." ValidationGroup="NewOfferGroup" EnableClientScript="false" CssClass="asp-val-error" Display="Dynamic" />
                </div>
            </div>

            <!-- Row 2: Discount Type & Discount Value -->
            <div class="form-row">
                <div class="form-group">
                    <label class="form-label">DISCOUNT TYPE</label>
                    <asp:DropDownList ID="ddlDiscountType" runat="server" CssClass="form-select">
                        <asp:ListItem Text="Percentage (%)" Value="Percentage" Selected="True" />
                        <asp:ListItem Text="Flat Amount (₹)" Value="Flat" />
                    </asp:DropDownList>
                </div>

                <div class="form-group">
                    <label class="form-label">DISCOUNT VALUE</label>
                    <asp:TextBox ID="txtDiscountValue" runat="server" CssClass="form-input" placeholder="e.g., 20" />
                    <asp:RequiredFieldValidator ID="rfvDiscountValue" runat="server" ControlToValidate="txtDiscountValue" ErrorMessage="Discount value is required." ValidationGroup="NewOfferGroup" EnableClientScript="false" CssClass="asp-val-error" Display="Dynamic" />
                    <asp:RegularExpressionValidator ID="revDiscountValue" runat="server" ControlToValidate="txtDiscountValue" ValidationExpression="^[1-9]\d*(\.\d{1,2})?$" ErrorMessage="Enter a valid positive number." ValidationGroup="NewOfferGroup" EnableClientScript="false" CssClass="asp-val-error" Display="Dynamic" />
                </div>
            </div>

            <!-- Row 3: Minimum Order Value & Usage Limit -->
            <div class="form-row">
                <div class="form-group">
                    <label class="form-label">MINIMUM ORDER VALUE</label>
                    <asp:TextBox ID="txtMinOrderValue" runat="server" CssClass="form-input" placeholder="Optional" />
                    <asp:RegularExpressionValidator ID="revMinOrderValue" runat="server" ControlToValidate="txtMinOrderValue" ValidationExpression="^\d+(\.\d{1,2})?$" ErrorMessage="Enter a valid numeric amount." ValidationGroup="NewOfferGroup" EnableClientScript="false" CssClass="asp-val-error" Display="Dynamic" />
                </div>

                <div class="form-group">
                    <label class="form-label">USAGE LIMIT (PER USER)</label>
                    <asp:TextBox ID="txtUsageLimit" runat="server" CssClass="form-input" placeholder="e.g., 1" />
                    <asp:RegularExpressionValidator ID="revUsageLimit" runat="server" ControlToValidate="txtUsageLimit" ValidationExpression="^[1-9]\d*$" ErrorMessage="Enter a valid positive integer." ValidationGroup="NewOfferGroup" EnableClientScript="false" CssClass="asp-val-error" Display="Dynamic" />
                </div>
            </div>

            <!-- Row 4: Validity Range -->
            <div class="form-group" style="margin-bottom: 22px;">
                <label class="form-label">VALIDITY RANGE</label>
                <div class="date-range-wrap">
                    <asp:TextBox ID="txtStartDate" runat="server" TextMode="Date" CssClass="form-input" />
                    <span class="date-range-sep">to</span>
                    <asp:TextBox ID="txtEndDate" runat="server" TextMode="Date" CssClass="form-input" />
                </div>

                <asp:RequiredFieldValidator ID="rfvStartDate" runat="server" ControlToValidate="txtStartDate" ErrorMessage="Start date is required." ValidationGroup="NewOfferGroup" EnableClientScript="false" CssClass="asp-val-error" Display="Dynamic" />

                <asp:CustomValidator ID="cvDateRange" runat="server" OnServerValidate="cvDateRange_ServerValidate" ErrorMessage="End date must be on or after start date." ValidationGroup="NewOfferGroup" EnableClientScript="false" CssClass="asp-val-error" Display="Dynamic" />
            </div>

            <!-- Action Buttons -->
            <div class="form-actions">
                <asp:Button ID="btnCancel" runat="server" Text="CANCEL" CssClass="btn-cancel" CausesValidation="false" OnClick="btnCancel_Click" />
                <asp:Button ID="btnSaveOffer" runat="server" Text="SAVE OFFER" CssClass="btn-save" ValidationGroup="NewOfferGroup" OnClick="btnSaveOffer_Click" />
            </div>

        </div>

    </div>
</asp:Content>