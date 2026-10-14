<%@ Page Title="Add New Category"
    Language="C#"
    MasterPageFile="~/Admin/AdminMaster.Master"
    AutoEventWireup="true"
    CodeFile="AddCategory.aspx.cs"
    Inherits="Style_On_Rent.Admin.AddCategory" %>

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

        .add-cat-container {
            padding: 24px 36px 60px 36px;
            max-width: 1240px;
            margin: 0 auto;
            box-sizing: border-box;
        }

        .back-nav-link {
            display: inline-flex;
            align-items: center;
            gap: 6px;
            color: #6b7280;
            text-decoration: none;
            font-size: 13px;
            font-weight: 500;
            margin-bottom: 12px;
            transition: color 0.15s;
        }
        .back-nav-link:hover { color: var(--primary-maroon); }

        .top-header-row {
            display: flex;
            justify-content: space-between;
            align-items: flex-start;
            margin-bottom: 24px;
        }

        .header-title-box h1 {
            font-size: 26px;
            font-weight: 700;
            color: var(--text-dark);
            margin: 0 0 4px 0;
            letter-spacing: -0.3px;
        }

        .header-title-box p {
            font-size: 13.5px;
            color: var(--text-muted);
            margin: 0;
        }

        .top-actions-box {
            display: flex;
            align-items: center;
            gap: 12px;
        }

        .btn-cancel-top {
            background-color: #ffffff;
            color: #374151 !important;
            border: 1px solid #d1d5db;
            padding: 9px 20px;
            font-size: 11.5px;
            font-weight: 700;
            letter-spacing: 0.5px;
            text-transform: uppercase;
            border-radius: 6px;
            text-decoration: none !important;
            cursor: pointer;
        }
        .btn-cancel-top:hover { background-color: #f9fafb; }

        .btn-save-maroon {
            background-color: var(--primary-maroon);
            color: #ffffff !important;
            border: none;
            padding: 9px 22px;
            font-size: 11.5px;
            font-weight: 700;
            letter-spacing: 0.5px;
            text-transform: uppercase;
            border-radius: 6px;
            cursor: pointer;
            display: inline-flex;
            align-items: center;
            gap: 8px;
            text-decoration: none !important;
        }
        .btn-save-maroon:hover { background-color: var(--primary-maroon-hover); }

        .form-layout-grid {
            display: grid;
            grid-template-columns: 2.1fr 1fr;
            gap: 24px;
            align-items: start;
        }

        .panel-card {
            background: #ffffff;
            border: 1px solid #ebdcd0;
            border-radius: 8px;
            padding: 24px 28px;
            box-sizing: border-box;
            margin-bottom: 24px;
            box-shadow: 0 1px 3px rgba(0, 0, 0, 0.02);
        }
        .panel-card:last-child { margin-bottom: 0; }

        .card-header-flex {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 20px;
        }

        .card-header-flex h2 {
            font-size: 16px;
            font-weight: 700;
            color: #111827;
            margin: 0;
        }

        .card-header-icon { color: #9ca3af; font-size: 16px; }

        .field-group { margin-bottom: 20px; }
        .field-group:last-child { margin-bottom: 0; }

        .field-label {
            display: block;
            font-size: 11px;
            font-weight: 700;
            color: #4b5563;
            letter-spacing: 0.5px;
            text-transform: uppercase;
            margin-bottom: 8px;
        }

        .text-input {
            width: 100%;
            height: 42px;
            padding: 0 14px;
            border: 1px solid #ebdcd0;
            border-radius: 6px;
            font-size: 13.5px;
            color: var(--text-dark);
            background-color: #ffffff;
            outline: none;
            box-sizing: border-box;
        }
        .text-input:focus { border-color: var(--primary-maroon); }
        .text-input::placeholder { color: #c4b5a5; }

        .textarea-input {
            width: 100%;
            height: 110px;
            padding: 12px 14px;
            border: 1px solid #ebdcd0;
            border-radius: 6px;
            font-size: 13.5px;
            color: var(--text-dark);
            background-color: #ffffff;
            outline: none;
            box-sizing: border-box;
            resize: none;
            font-family: inherit;
        }
        .textarea-input:focus { border-color: var(--primary-maroon); }
        .textarea-input::placeholder { color: #c4b5a5; }

        .char-counter {
            text-align: right;
            font-size: 11px;
            color: #9ca3af;
            margin-top: 6px;
        }

        .media-subtitle {
            font-size: 12.5px;
            color: var(--text-muted);
            margin: -12px 0 16px 0;
        }

        .upload-dropzone {
            border: 1.5px dashed #d1c7bc;
            border-radius: 8px;
            padding: 36px 20px;
            text-align: center;
            background-color: #ffffff;
            cursor: pointer;
            margin-bottom: 20px;
        }
        .upload-dropzone:hover {
            border-color: var(--primary-maroon);
            background-color: #faf7f2;
        }

        .upload-cloud-icon-box {
            width: 44px;
            height: 44px;
            border-radius: 10px;
            background-color: #f8ece8;
            color: var(--primary-maroon);
            display: inline-flex;
            align-items: center;
            justify-content: center;
            font-size: 20px;
            margin-bottom: 12px;
        }

        .dropzone-title {
            font-size: 14.5px;
            font-weight: 600;
            color: #111827;
            margin-bottom: 4px;
        }

        .dropzone-hint {
            font-size: 11.5px;
            color: var(--text-muted);
        }

        .preview-header-label {
            font-size: 11px;
            font-weight: 700;
            color: #4b5563;
            letter-spacing: 0.5px;
            text-transform: uppercase;
            margin-bottom: 10px;
        }

        .preview-thumbs-flex {
            display: flex;
            align-items: center;
            gap: 14px;
            flex-wrap: wrap;
        }

        .add-more-thumb-box {
            width: 96px;
            height: 96px;
            border-radius: 6px;
            border: 1px solid #ebdcd0;
            background-color: #ffffff;
            display: flex;
            align-items: center;
            justify-content: center;
            color: #9ca3af;
            font-size: 20px;
            cursor: pointer;
        }
        .add-more-thumb-box:hover { color: var(--primary-maroon); border-color: var(--primary-maroon); }

        .select-input {
            width: 100%;
            height: 42px;
            padding: 0 14px;
            border: 1px solid #ebdcd0;
            border-radius: 6px;
            font-size: 13.5px;
            color: var(--text-dark);
            background-color: #ffffff;
            outline: none;
            box-sizing: border-box;
            cursor: pointer;
        }
        .select-input:focus { border-color: var(--primary-maroon); }

        .setting-subtext {
            font-size: 11.5px;
            color: var(--text-muted);
            line-height: 1.4;
            margin-top: 10px;
        }

        .btn-full-save {
            width: 100%;
            background-color: var(--primary-maroon);
            color: #ffffff !important;
            border: none;
            padding: 12px;
            font-size: 11.5px;
            font-weight: 700;
            letter-spacing: 0.5px;
            text-transform: uppercase;
            border-radius: 6px;
            cursor: pointer;
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 8px;
            margin-bottom: 10px;
            text-decoration: none !important;
        }
        .btn-full-save:hover { background-color: var(--primary-maroon-hover); }

        .btn-full-cancel {
            width: 100%;
            background-color: #ffffff;
            color: #374151 !important;
            border: 1px solid #d1d5db;
            padding: 11px;
            font-size: 11.5px;
            font-weight: 700;
            letter-spacing: 0.5px;
            text-transform: uppercase;
            border-radius: 6px;
            text-align: center;
            display: block;
            box-sizing: border-box;
            text-decoration: none !important;
            cursor: pointer;
        }
        .btn-full-cancel:hover { background-color: #f9fafb; }

        .asp-val-error {
            display: block;
            color: #dc2626;
            font-size: 11px;
            margin-top: 4px;
            font-weight: 500;
        }
    </style>

    <script type="text/javascript">
        function updateCharCount(val) {
            var len = val.value.length;
            var counter = document.getElementById("charCountText");
            if (counter) {
                counter.innerText = len + "/500 characters";
            }
        }
    </script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="add-cat-container">

        <a href="CholiCategories.aspx" class="back-nav-link">
            <i class="fa-solid fa-arrow-left"></i> Back to Categories
        </a>

        <div class="top-header-row">
            <div class="header-title-box">
                <h1>Add New Category</h1>
                <p>Define a new choli category for the rental inventory.</p>
            </div>

            <div class="top-actions-box">
                <a href="CholiCategories.aspx" class="btn-cancel-top">Cancel</a>
                <asp:LinkButton ID="btnTopSave" runat="server" CssClass="btn-save-maroon"
                    ValidationGroup="AddCategoryGroup" OnClick="btnSaveCategory_Click">
                    <i class="bi bi-floppy"></i> Save Category
                </asp:LinkButton>
            </div>
        </div>

        <div class="form-layout-grid">

            <!-- LEFT COLUMN -->
            <div>
                <div class="panel-card">
                    <div class="card-header-flex">
                        <h2>Basic Information</h2>
                        <i class="bi bi-info-circle card-header-icon"></i>
                    </div>

                    <div class="field-group">
                        <label class="field-label">CATEGORY NAME *</label>
                        <asp:TextBox ID="txtCategoryName" runat="server" CssClass="text-input"
                            placeholder="e.g., Bridal Velvet Lehengas" />
                        <asp:RequiredFieldValidator ID="rfvCatName" runat="server"
                            ControlToValidate="txtCategoryName"
                            ErrorMessage="Category name is required."
                            ValidationGroup="AddCategoryGroup"
                            CssClass="asp-val-error" Display="Dynamic" />
                    </div>

                    <div class="field-group">
                        <label class="field-label">DESCRIPTION</label>
                        <asp:TextBox ID="txtDescription" runat="server" TextMode="MultiLine"
                            CssClass="textarea-input"
                            placeholder="Describe the style, origin, or specific use cases..."
                            MaxLength="500" onkeyup="updateCharCount(this);" />
                        <div id="charCountText" class="char-counter">0/500 characters</div>
                    </div>
                </div>

                <div class="panel-card">
                    <div class="card-header-flex" style="margin-bottom: 6px;">
                        <h2>Category Media</h2>
                        <i class="bi bi-images card-header-icon"></i>
                    </div>
                    <p class="media-subtitle">Upload prominent images that represent this category.</p>

                    <asp:FileUpload ID="fuCategoryMedia" runat="server" AllowMultiple="true"
                        Style="display: none;" onchange="this.form.submit();" />

                    <div class="upload-dropzone"
                        onclick="document.getElementById('<%= fuCategoryMedia.ClientID %>').click();">
                        <div class="upload-cloud-icon-box">
                            <i class="bi bi-cloud-arrow-up"></i>
                        </div>
                        <div class="dropzone-title">Click or drag images to upload</div>
                        <div class="dropzone-hint">SVG, PNG, JPG or GIF (max. 800×400px, 5MB)</div>
                    </div>

                    <div class="preview-header-label">
                        PREVIEW (<asp:Literal ID="litPreviewCount" runat="server" Text="0" />)
                    </div>

                    <div class="preview-thumbs-flex">
                        <asp:Repeater ID="rptMediaPreviews" runat="server">
                            <ItemTemplate>
                                <div style="width:96px;height:96px;border-radius:6px;overflow:hidden;border:1px solid #ebdcd0;background:#faf7f2;">
                                    <img src='<%# Container.DataItem %>' alt="Preview"
                                        style="width:100%;height:100%;object-fit:cover;display:block;" />
                                </div>
                            </ItemTemplate>
                        </asp:Repeater>

                        <div class="add-more-thumb-box" title="Upload more images"
                            onclick="document.getElementById('<%= fuCategoryMedia.ClientID %>').click();">
                            <i class="bi bi-image"></i>
                        </div>
                    </div>
                </div>
            </div>

            <!-- RIGHT COLUMN -->
            <div>
                <div class="panel-card">
                    <div class="card-header-flex">
                        <h2>Settings</h2>
                        <i class="bi bi-gear card-header-icon"></i>
                    </div>

                    <div class="field-group">
                        <label class="field-label">STATUS</label>
                        <asp:DropDownList ID="ddlStatus" runat="server" CssClass="select-input">
                            <asp:ListItem Text="Active (Visible to customers)" Value="ACTIVE" Selected="True" />
                            <asp:ListItem Text="Inactive (Hidden from catalog)" Value="INACTIVE" />
                            <asp:ListItem Text="Premium Collection" Value="PREMIUM" />
                        </asp:DropDownList>
                        <p class="setting-subtext">Active categories will be immediately available in the rental catalog.</p>
                    </div>
                </div>

                <div class="panel-card">
                    <div class="card-header-flex" style="margin-bottom: 16px;">
                        <span class="field-label" style="margin: 0;">PUBLISH ACTIONS</span>
                    </div>

                    <asp:LinkButton ID="btnSidebarSave" runat="server" CssClass="btn-full-save"
                        ValidationGroup="AddCategoryGroup" OnClick="btnSaveCategory_Click">
                        <i class="bi bi-floppy"></i> Save Category
                    </asp:LinkButton>

                    <a href="CholiCategories.aspx" class="btn-full-cancel">Cancel</a>
                </div>
            </div>

        </div>
    </div>
</asp:Content>