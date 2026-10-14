<%@ Page Title="Send Notification" 
    Language="C#" 
    MasterPageFile="~/Admin/AdminMaster.Master" 
    AutoEventWireup="true" 
    CodeFile="AddCampaign.aspx.cs" 
    Inherits="Style_On_Rent.Admin.AddCampaign" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" />

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

        .campaign-wrapper {
            padding: 32px 40px;
            max-width: 950px;
            margin: 0 auto;
            box-sizing: border-box;
        }

        /* Top Page Header */
        .campaign-header {
            margin-bottom: 24px;
        }

        .campaign-title {
            font-size: 26px;
            font-weight: 700;
            color: var(--text-dark);
            margin: 0 0 6px 0;
        }

        .campaign-subtitle {
            font-size: 13.5px;
            color: var(--text-muted);
            margin: 0;
        }

        /* Main Form Card Box */
        .campaign-card {
            background: #ffffff;
            border-radius: 8px;
            border: 1px solid #ebdcd0;
            padding: 36px 42px;
            box-shadow: 0 2px 8px rgba(0, 0, 0, 0.02);
            box-sizing: border-box;
        }

        /* Section Headings */
        .section-title {
            font-size: 15px;
            font-weight: 700;
            color: var(--primary-maroon);
            margin: 0 0 16px 0;
            padding-bottom: 8px;
            border-bottom: 1px solid #f3ece4;
        }

        .section-block {
            margin-bottom: 28px;
        }

        /* Form Controls */
        .form-group {
            margin-bottom: 18px;
        }

        .form-label {
            display: block;
            font-size: 11px;
            font-weight: 700;
            letter-spacing: 0.6px;
            color: #374151;
            text-transform: uppercase;
            margin-bottom: 8px;
        }

        .form-input {
            width: 100%;
            height: 42px;
            padding: 0 14px;
            border: 1px solid #e5e7eb;
            border-radius: 6px;
            font-size: 13.5px;
            background-color: #fafbfc;
            color: var(--text-dark);
            outline: none;
            box-sizing: border-box;
            transition: border-color 0.2s, background-color 0.2s;
        }

        .form-input:focus {
            border-color: var(--primary-maroon);
            background-color: #ffffff;
        }

        .form-textarea {
            width: 100%;
            height: 110px;
            padding: 12px 14px;
            border: 1px solid #e5e7eb;
            border-radius: 6px;
            font-size: 13.5px;
            background-color: #fafbfc;
            color: var(--text-dark);
            outline: none;
            box-sizing: border-box;
            resize: vertical;
            font-family: inherit;
            transition: border-color 0.2s, background-color 0.2s;
        }

        .form-textarea:focus {
            border-color: var(--primary-maroon);
            background-color: #ffffff;
        }

        .form-select {
            width: 100%;
            height: 42px;
            padding: 0 14px;
            border: 1px solid #e5e7eb;
            border-radius: 6px;
            font-size: 13.5px;
            background-color: #fafbfc;
            color: var(--text-dark);
            outline: none;
            box-sizing: border-box;
            cursor: pointer;
            transition: border-color 0.2s, background-color 0.2s;
        }

        .form-select:focus {
            border-color: var(--primary-maroon);
            background-color: #ffffff;
        }

        /* Scheduling Choice Card */
        .schedule-choice-box {
            display: flex;
            align-items: center;
            gap: 14px;
            padding: 16px 20px;
            border: 1px solid #ebdcd0;
            border-radius: 6px;
            background-color: #ffffff;
        }

        .custom-radio-icon {
            width: 18px;
            height: 18px;
            border-radius: 50%;
            border: 2px solid var(--primary-maroon);
            display: flex;
            align-items: center;
            justify-content: center;
            flex-shrink: 0;
        }

        .custom-radio-icon::after {
            content: "";
            width: 8px;
            height: 8px;
            border-radius: 50%;
            background-color: var(--primary-maroon);
        }

        .schedule-text-wrap {
            display: flex;
            flex-direction: column;
        }

        .schedule-title {
            font-size: 13.5px;
            font-weight: 600;
            color: #111827;
        }

        .schedule-desc {
            font-size: 12px;
            color: var(--text-muted);
            margin-top: 2px;
        }

        /* Actions Bar */
        .form-actions-row {
            display: flex;
            justify-content: flex-end;
            align-items: center;
            gap: 16px;
            margin-top: 28px;
            padding-top: 18px;
            border-top: 1px solid #f3ece4;
        }

        .btn-cancel-action {
            background: transparent;
            color: #4b5563;
            border: none;
            padding: 10px 20px;
            font-size: 12px;
            font-weight: 700;
            cursor: pointer;
            letter-spacing: 0.5px;
            text-transform: uppercase;
            text-decoration: none;
            transition: color 0.2s;
        }

        .btn-cancel-action:hover {
            color: #111827;
        }

        .btn-send-notification {
            background-color: var(--primary-maroon);
            color: #ffffff !important;
            border: none;
            padding: 10px 26px;
            font-size: 12px;
            font-weight: 700;
            border-radius: 6px;
            cursor: pointer;
            display: inline-flex;
            align-items: center;
            gap: 8px;
            text-transform: uppercase;
            letter-spacing: 0.5px;
            transition: background-color 0.2s ease;
        }

        .btn-send-notification:hover {
            background-color: var(--primary-maroon-hover);
        }

        .asp-val-error {
            display: block;
            color: #dc2626;
            font-size: 11px;
            margin-top: 4px;
            font-weight: 500;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="campaign-wrapper">

        <!-- Page Header -->
        <div class="campaign-header">
            <h1 class="campaign-title">Send Notification</h1>
            <p class="campaign-subtitle">Draft and schedule communications to your client base.</p>
        </div>

        <!-- Main Card Form -->
        <div class="campaign-card">

            <!-- Section 1: Message Details -->
            <div class="section-block">
                <h2 class="section-title">Message Details</h2>

                <div class="form-group">
                    <label class="form-label">NOTIFICATION TITLE</label>
                    <asp:TextBox 
                        ID="txtNotificationTitle" 
                        runat="server" 
                        CssClass="form-input" 
                        placeholder="e.g., Summer Collection Now Available" />
                    <asp:RequiredFieldValidator 
                        ID="rfvNotificationTitle" 
                        runat="server" 
                        ControlToValidate="txtNotificationTitle" 
                        ErrorMessage="Notification title is required." 
                        ValidationGroup="SendNotificationGroup" 
                        EnableClientScript="false" 
                        CssClass="asp-val-error" 
                        Display="Dynamic" />
                </div>

                <div class="form-group" style="margin-bottom: 0;">
                    <label class="form-label">MESSAGE CONTENT</label>
                    <asp:TextBox 
                        ID="txtMessageContent" 
                        runat="server" 
                        TextMode="MultiLine" 
                        CssClass="form-textarea" 
                        placeholder="Enter the main message body here..." />
                    <asp:RequiredFieldValidator 
                        ID="rfvMessageContent" 
                        runat="server" 
                        ControlToValidate="txtMessageContent" 
                        ErrorMessage="Message content cannot be blank." 
                        ValidationGroup="SendNotificationGroup" 
                        EnableClientScript="false" 
                        CssClass="asp-val-error" 
                        Display="Dynamic" />
                </div>
            </div>

            <!-- Section 2: Targeting & Delivery -->
            <div class="section-block">
                <h2 class="section-title">Targeting & Delivery</h2>

                <div class="form-group" style="margin-bottom: 0;">
                    <label class="form-label">TARGET AUDIENCE</label>
                    <asp:DropDownList ID="ddlTargetAudience" runat="server" CssClass="form-select">
                        <asp:ListItem Text="Select audience..." Value="" Selected="True" />
                        <asp:ListItem Text="All Subscribers" Value="All Subscribers" />
                        <asp:ListItem Text="Premium Members" Value="Premium Members" />
                        <asp:ListItem Text="Rentals due tomorrow" Value="Rentals due tomorrow" />
                        <asp:ListItem Text="Male Segment (Recent Browsers)" Value="Male Segment (Recent Browsers)" />
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator 
                        ID="rfvTargetAudience" 
                        runat="server" 
                        ControlToValidate="ddlTargetAudience" 
                        InitialValue="" 
                        ErrorMessage="Please select a target audience." 
                        ValidationGroup="SendNotificationGroup" 
                        EnableClientScript="false" 
                        CssClass="asp-val-error" 
                        Display="Dynamic" />
                </div>
            </div>

            <!-- Section 3: Scheduling -->
            <div class="section-block" style="margin-bottom: 12px;">
                <h2 class="section-title">Scheduling</h2>

                <div class="schedule-choice-box">
                    <div class="custom-radio-icon"></div>
                    <div class="schedule-text-wrap">
                        <span class="schedule-title">Send Now</span>
                        <span class="schedule-desc">Deliver immediately to selected audience</span>
                    </div>
                </div>
            </div>

            <!-- Bottom Actions -->
            <div class="form-actions-row">
                <asp:Button 
                    ID="btnCancel" 
                    runat="server" 
                    Text="CANCEL" 
                    CssClass="btn-cancel-action" 
                    CausesValidation="false" 
                    OnClick="btnCancel_Click" />

                <asp:LinkButton 
                    ID="btnSendNotification" 
                    runat="server" 
                    CssClass="btn-send-notification" 
                    ValidationGroup="SendNotificationGroup" 
                    OnClick="btnSendNotification_Click">
                    <i class="fa-regular fa-paper-plane"></i> SEND NOTIFICATION
                </asp:LinkButton>
            </div>

        </div>

    </div>
</asp:Content>