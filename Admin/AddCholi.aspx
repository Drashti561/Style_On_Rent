<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMaster.Master" AutoEventWireup="true" CodeFile="AddCholi.aspx.cs" Inherits="Style_On_Rent.Admin.AddCholi" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <!-- Font Awesome / Bootstrap Icons -->
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

        .add-choli-wrapper {
            padding: 24px 32px;
            max-width: 1200px;
            margin: 0 auto;
            box-sizing: border-box;
        }

        /* Top Nav & Action Header */
        .back-link {
            display: inline-flex;
            align-items: center;
            gap: 6px;
            color: var(--text-muted);
            text-decoration: none;
            font-size: 13px;
            margin-bottom: 8px;
            transition: color 0.2s;
        }

        .back-link:hover {
            color: var(--primary-maroon);
        }

        .page-header-row {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 24px;
        }

        .page-title {
            font-size: 24px;
            font-weight: 700;
            color: var(--text-dark);
            margin: 0;
        }

        .header-actions {
            display: flex;
            align-items: center;
            gap: 12px;
        }

        .btn-cancel {
            background-color: #ffffff;
            color: #4b5563;
            border: 1px solid #d1d5db;
            padding: 8px 20px;
            font-size: 13px;
            font-weight: 500;
            border-radius: 6px;
            cursor: pointer;
            text-decoration: none;
            transition: all 0.2s;
        }

        .btn-cancel:hover {
            background-color: #f9fafb;
            border-color: #9ca3af;
        }

        .btn-save {
            background-color: var(--primary-maroon);
            color: #ffffff;
            border: none;
            padding: 9px 22px;
            font-size: 13px;
            font-weight: 600;
            border-radius: 6px;
            cursor: pointer;
            transition: background-color 0.2s;
        }

        .btn-save:hover {
            background-color: var(--primary-maroon-hover);
        }

        /* Two Column Grid */
        .form-grid {
            display: grid;
            grid-template-columns: 2fr 1fr;
            gap: 24px;
            align-items: start;
        }

        /* Card Container */
        .form-card {
            background: #ffffff;
            border-radius: 8px;
            border: 1px solid #f0eae1;
            padding: 24px;
            box-sizing: border-box;
        }

        .card-header-row {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 20px;
        }

        .card-title {
            font-size: 15px;
            font-weight: 600;
            color: #111827;
            margin: 0;
        }

        .card-icon {
            color: #9ca3af;
            font-size: 15px;
        }


        /* Input Controls */
        .form-group {
            margin-bottom: 18px;
        }

        .form-group label {
            display: block;
            font-size: 12px;
            font-weight: 600;
            color: #374151;
            margin-bottom: 6px;
        }

        .form-control-input {
            width: 100%;
            height: 40px;
            padding: 0 14px;
            border: 1px solid #e5e7eb;
            border-radius: 6px;
            font-size: 13px;
            background-color: #ffffff;
            color: var(--text-dark);
            outline: none;
            box-sizing: border-box;
            transition: border-color 0.2s;
        }

        .form-control-input:focus {
            border-color: var(--primary-maroon);
        }

        .form-row {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 16px;
        }

        .form-control-select {
            width: 100%;
            height: 40px;
            padding: 0 14px;
            border: 1px solid #e5e7eb;
            border-radius: 6px;
            font-size: 13px;
            background-color: #ffffff;
            color: var(--text-dark);
            outline: none;
            box-sizing: border-box;
            cursor: pointer;
        }

        .form-control-select:focus {
            border-color: var(--primary-maroon);
        }

        .form-control-textarea {
            width: 100%;
            height: 110px;
            padding: 10px 14px;
            border: 1px solid #e5e7eb;
            border-radius: 6px;
            font-size: 13px;
            font-family: inherit;
            background-color: #ffffff;
            color: var(--text-dark);
            outline: none;
            box-sizing: border-box;
            resize: vertical;
        }

        .form-control-textarea:focus {
            border-color: var(--primary-maroon);
        }

        /* Media Upload Dropzone */
        .upload-dropzone {
            border: 1.5px dashed #f5c7cd;
            background-color: #fffafb;
            border-radius: 8px;
            padding: 36px 20px;
            text-align: center;
            cursor: pointer;
            position: relative;
            transition: all 0.2s;
        }

        .upload-dropzone:hover {
            border-color: var(--primary-maroon);
            background-color: #fff4f6;
        }

        .upload-icon {
            font-size: 32px;
            color: #4b5563;
            margin-bottom: 12px;
            display: inline-block;
        }

        .upload-text {
            font-size: 12px;
            color: #4b5563;
            margin: 0 0 6px 0;
        }

        .upload-browse {
            color: #73001e;
            font-weight: 600;
            text-decoration: underline;
            cursor: pointer;
        }

        .upload-hint {
            font-size: 10px;
            color: #9ca3af;
            margin: 0;
        }

        /* Hidden FileUpload Control */
        .hidden-file-input {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            opacity: 0;
            cursor: pointer;
        }

        .selected-file-label {
            font-size: 11px;
            color: #059669;
            margin-top: 8px;
            display: block;
            font-weight: 500;
        }

        .validation-error {
            display: block;
            color: #dc2626;
            font-size: 11px;
            margin-top: 4px;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="add-choli-wrapper">

        <!-- Back Link -->
        <asp:HyperLink ID="lnkBack" runat="server" NavigateUrl="~/CholiInventory.aspx" CssClass="back-link">
            <i class="fa-solid fa-arrow-left"></i> Back to Inventory
        </asp:HyperLink>

        <!-- Top Header & Action Buttons -->
        <div class="page-header-row">
            <h1 class="page-title">Add New Choli</h1>
            <div class="header-actions">
                <asp:Button ID="btnCancel" runat="server" Text="Cancel" CssClass="btn-cancel" CausesValidation="false" OnClick="btnCancel_Click" />
                <asp:Button ID="btnSave" runat="server" Text="Save Item" CssClass="btn-save" ValidationGroup="AddCholiGroup" OnClick="btnSave_Click" />
            </div>
        </div>

        <!-- 2 Column Layout -->
        <div class="form-grid">

            <!-- Left Column: Basic Information -->
            <div class="form-card">
                <div class="card-header-row">
                    <h2 class="card-title">Basic Information</h2>
                    <i class="fa-regular fa-circle-question card-icon"></i>
                </div>

                <!-- Item Name -->
                <div class="form-group">
                    <label>Item Name *</label>
                    <asp:TextBox ID="txtItemName" runat="server" CssClass="form-control-input" Placeholder="e.g. Royal Maroon Velvet Choli"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvItemName" runat="server" ControlToValidate="txtItemName" ErrorMessage="Item name is required." ValidationGroup="AddCholiGroup" CssClass="validation-error" Display="Dynamic" />
                </div>

                <!-- SKU & Category Row -->
                <div class="form-row">
                    <div class="form-group">
                        <label>SKU / Product Code *</label>
                        <asp:TextBox ID="txtSku" runat="server" CssClass="form-control-input" Placeholder="CH-VEL-001"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvSku" runat="server" ControlToValidate="txtSku" ErrorMessage="SKU is required." ValidationGroup="AddCholiGroup" CssClass="validation-error" Display="Dynamic" />
                    </div>

                    <div class="form-group">
                        <label>Category *</label>
                        <asp:DropDownList ID="ddlCategory" runat="server" CssClass="form-control-select">
                            <asp:ListItem Text="Select Category" Value="" />
                            <asp:ListItem Text="Bridal Wear" Value="Bridal Wear" />
                            <asp:ListItem Text="Navratri Special" Value="Navratri Special" />
                            <asp:ListItem Text="Party Wear" Value="Party Wear" />
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="rfvCategory" runat="server" ControlToValidate="ddlCategory" InitialValue="" ErrorMessage="Please select category." ValidationGroup="AddCholiGroup" CssClass="validation-error" Display="Dynamic" />
                    </div>
                </div>

                <!-- Description -->
                <div class="form-group" style="margin-bottom: 0;">
                    <label>Description</label>
                    <asp:TextBox ID="txtDescription" runat="server" TextMode="MultiLine" CssClass="form-control-textarea" Placeholder="Describe the intricate details, fabric feel, and occasion suitability..."></asp:TextBox>
                </div>
            </div>

            <!-- Right Column: Media Upload -->
            <div class="form-card">
                <div class="card-header-row">
                    <h2 class="card-title">Media</h2>
                    <i class="fa-regular fa-image card-icon"></i>
                </div>

                <div class="upload-dropzone">
                    <i class="fa-regular fa-file-image upload-icon"></i>
                    <p class="upload-text">
                        Drag & Drop images here or <span class="upload-browse">Browse</span>
                    </p>
                    <p class="upload-hint">JPEG, PNG, WEBP (Max 5MB)</p>

                    <!-- FileUpload Control -->
                    <asp:FileUpload ID="fuCholiImage" runat="server" CssClass="hidden-file-input" onchange="displaySelectedFileName(this)" />
                </div>

                <asp:Label ID="lblFileName" runat="server" CssClass="selected-file-label" Text="" />
            </div>

        </div>
    </div>

    <!-- Client Script to Show Selected File Name -->
    <script type="text/javascript">
        function displaySelectedFileName(input) {
    var lbl = document.getElementById('<%= lblFileName.ClientID %>');
    if (input.files && input.files[0]) {
        lbl.innerText = "Selected: " + input.files[0].name;
    } else {
        lbl.innerText = "";
    }
}
</script>
</asp:Content>