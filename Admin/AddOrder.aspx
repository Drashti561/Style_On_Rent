<%@ Page Title="Create New Order" Language="C#" MasterPageFile="~/Admin/AdminMaster.Master" AutoEventWireup="true" CodeFile="AddOrder.aspx.cs" Inherits="Style_On_Rent.Admin.AddOrder" %>

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

        body { font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, Arial, sans-serif;
               background-color: var(--page-bg); color: var(--text-dark); margin: 0; padding: 0; }

        .add-order-wrapper { padding: 24px 32px; max-width: 1200px; margin: 0 auto; box-sizing: border-box; }

        .back-link { display: inline-flex; align-items: center; gap: 6px; color: var(--text-muted);
                     text-decoration: none; font-size: 13px; margin-bottom: 8px; transition: color 0.2s; }
        .back-link:hover { color: var(--primary-maroon); }

        .page-header-row { display: flex; justify-content: space-between; align-items: center; margin-bottom: 24px; }
        .page-title { font-size: 24px; font-weight: 700; color: var(--text-dark); margin: 0; }
        .header-actions { display: flex; align-items: center; gap: 12px; }

        .btn-cancel { background-color: #ffffff; color: #4b5563; border: 1px solid #d1d5db;
                      padding: 8px 20px; font-size: 13px; font-weight: 500; border-radius: 6px;
                      cursor: pointer; text-decoration: none; transition: all 0.2s; }
        .btn-cancel:hover { background-color: #f9fafb; border-color: #9ca3af; }

        .btn-save { background-color: var(--primary-maroon); color: #ffffff; border: none;
                    padding: 9px 22px; font-size: 13px; font-weight: 600; border-radius: 6px;
                    cursor: pointer; transition: background-color 0.2s; }
        .btn-save:hover { background-color: var(--primary-maroon-hover); }

        .form-grid { display: grid; grid-template-columns: 2fr 1fr; gap: 24px; align-items: start; }

        .form-card { background: #ffffff; border-radius: 8px; border: 1px solid #f0eae1;
                     padding: 24px; box-sizing: border-box; margin-bottom: 24px; }

        .card-header-row { display: flex; justify-content: space-between; align-items: center; margin-bottom: 18px; }
        .card-title { font-size: 15px; font-weight: 600; color: #111827; margin: 0; }

        .form-group { margin-bottom: 18px; }
        .form-group label { display: block; font-size: 12px; font-weight: 600; color: #374151; margin-bottom: 6px; }

        .form-control-input { width: 100%; height: 40px; padding: 0 14px; border: 1px solid #e5e7eb;
                              border-radius: 6px; font-size: 13px; background-color: #ffffff;
                              color: var(--text-dark); outline: none; box-sizing: border-box; }
        .form-control-input:focus { border-color: var(--primary-maroon); }

        .form-row { display: grid; grid-template-columns: 1fr 1fr; gap: 16px; }

        .form-control-select { width: 100%; height: 40px; padding: 0 14px; border: 1px solid #e5e7eb;
                               border-radius: 6px; font-size: 13px; background-color: #ffffff;
                               color: var(--text-dark); outline: none; box-sizing: border-box; cursor: pointer; }
        .form-control-select:focus { border-color: var(--primary-maroon); }

        .asp-val-error { display: block; color: #dc2626; font-size: 11.5px; margin-top: 5px; font-weight: 500; }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="add-order-wrapper">

        <!-- ✅ BACK LINK — FIXED -->
        <asp:HyperLink ID="lnkBackOrders" runat="server" NavigateUrl="~/Admin/Orders.aspx" CssClass="back-link">
            <i class="fa-solid fa-arrow-left"></i> Back to Orders
        </asp:HyperLink>

        <div class="page-header-row">
            <h1 class="page-title">Create New Order</h1>
            <div class="header-actions">
                <asp:Button ID="btnCancel" runat="server" Text="Cancel" CssClass="btn-cancel" CausesValidation="false" OnClick="btnCancel_Click" />
                <asp:Button ID="btnSaveOrder" runat="server" Text="Save Order" CssClass="btn-save" ValidationGroup="AddOrderGroup" OnClick="btnSaveOrder_Click" />
            </div>
        </div>

        <div class="form-grid">
            <!-- LEFT -->
            <div>
                <div class="form-card">
                    <div class="card-header-row">
                        <h2 class="card-title">Customer Details</h2>
                        <i class="fa-regular fa-user" style="color: #9ca3af;"></i>
                    </div>

                    <div class="form-group">
                        <label>Customer Name *</label>
                        <asp:TextBox ID="txtCustomerName" runat="server" CssClass="form-control-input" Placeholder="e.g. Rahul Patel"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvCustomerName" runat="server" ControlToValidate="txtCustomerName" ErrorMessage="Customer name is required." ValidationGroup="AddOrderGroup" EnableClientScript="false" CssClass="asp-val-error" Display="Dynamic" />
                        <asp:RegularExpressionValidator ID="revCustomerName" runat="server" ControlToValidate="txtCustomerName" ValidationExpression="^[a-zA-Z\s\.]{2,50}$" ErrorMessage="Enter a valid customer name." ValidationGroup="AddOrderGroup" EnableClientScript="false" CssClass="asp-val-error" Display="Dynamic" />
                    </div>

                    <div class="form-row">
                        <div class="form-group">
                            <label>Email Address *</label>
                            <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control-input" Placeholder="e.g. rahul.p@example.com"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvEmail" runat="server" ControlToValidate="txtEmail" ErrorMessage="Email is required." ValidationGroup="AddOrderGroup" EnableClientScript="false" CssClass="asp-val-error" Display="Dynamic" />
                            <asp:RegularExpressionValidator ID="revEmail" runat="server" ControlToValidate="txtEmail" ValidationExpression="^[\w\.-]+@([\w-]+\.)+[\w-]{2,4}$" ErrorMessage="Enter a valid email address." ValidationGroup="AddOrderGroup" EnableClientScript="false" CssClass="asp-val-error" Display="Dynamic" />
                        </div>
                        <div class="form-group">
                            <label>Phone Number *</label>
                            <asp:TextBox ID="txtPhone" runat="server" CssClass="form-control-input" Placeholder="e.g. 9876543210"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvPhone" runat="server" ControlToValidate="txtPhone" ErrorMessage="Phone number is required." ValidationGroup="AddOrderGroup" EnableClientScript="false" CssClass="asp-val-error" Display="Dynamic" />
                            <asp:RegularExpressionValidator ID="revPhone" runat="server" ControlToValidate="txtPhone" ValidationExpression="^(\+91[\-\s]?)?[0]?(91)?[6789]\d{9}$" ErrorMessage="Enter a valid 10-digit mobile number." ValidationGroup="AddOrderGroup" EnableClientScript="false" CssClass="asp-val-error" Display="Dynamic" />
                        </div>
                    </div>
                </div>

                <div class="form-card">
                    <div class="card-header-row">
                        <h2 class="card-title">Rental Items</h2>
                        <i class="fa-solid fa-shirt" style="color: #9ca3af;"></i>
                    </div>

                    <div class="form-group">
                        <label>Garment / Choli Name *</label>
                        <asp:TextBox ID="txtItemTitle" runat="server" CssClass="form-control-input" Placeholder="e.g. Royal Maroon Wedding Sherwani"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvItemTitle" runat="server" ControlToValidate="txtItemTitle" ErrorMessage="Garment description is required." ValidationGroup="AddOrderGroup" EnableClientScript="false" CssClass="asp-val-error" Display="Dynamic" />
                        <asp:RegularExpressionValidator ID="revItemTitle" runat="server" ControlToValidate="txtItemTitle" ValidationExpression="^.{3,120}$" ErrorMessage="Between 3 and 120 characters." ValidationGroup="AddOrderGroup" EnableClientScript="false" CssClass="asp-val-error" Display="Dynamic" />
                    </div>

                    <div class="form-row">
                        <div class="form-group">
                            <label>Item Count *</label>
                            <asp:DropDownList ID="ddlItemCount" runat="server" CssClass="form-control-select">
                                <asp:ListItem Text="Select Item Count" Value="" />
                                <asp:ListItem Text="1 Item" Value="1 Item" />
                                <asp:ListItem Text="2 Items" Value="2 Items" Selected="True" />
                                <asp:ListItem Text="3 Items" Value="3 Items" />
                                <asp:ListItem Text="4+ Items" Value="4+ Items" />
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator ID="rfvItemCount" runat="server" ControlToValidate="ddlItemCount" InitialValue="" ErrorMessage="Please select item count." ValidationGroup="AddOrderGroup" EnableClientScript="false" CssClass="asp-val-error" Display="Dynamic" />
                        </div>
                        <div class="form-group">
                            <label>Total Rental Amount (₹) *</label>
                            <asp:TextBox ID="txtAmount" runat="server" CssClass="form-control-input" Placeholder="e.g. 12500"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvAmount" runat="server" ControlToValidate="txtAmount" ErrorMessage="Amount is required." ValidationGroup="AddOrderGroup" EnableClientScript="false" CssClass="asp-val-error" Display="Dynamic" />
                            <asp:RegularExpressionValidator ID="revAmount" runat="server" ControlToValidate="txtAmount" ValidationExpression="^[1-9]\d*(\.\d{1,2})?$" ErrorMessage="Enter a valid positive amount." ValidationGroup="AddOrderGroup" EnableClientScript="false" CssClass="asp-val-error" Display="Dynamic" />
                        </div>
                    </div>
                </div>
            </div>

            <!-- RIGHT -->
            <div>
                <div class="form-card">
                    <div class="card-header-row">
                        <h2 class="card-title">Rental Schedule</h2>
                        <i class="fa-regular fa-calendar-days" style="color: #9ca3af;"></i>
                    </div>

                    <div class="form-group">
                        <label>Start Date *</label>
                        <asp:TextBox ID="txtRentalStart" runat="server" TextMode="Date" CssClass="form-control-input"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvRentalStart" runat="server" ControlToValidate="txtRentalStart" ErrorMessage="Start date is required." ValidationGroup="AddOrderGroup" EnableClientScript="false" CssClass="asp-val-error" Display="Dynamic" />
                    </div>

                    <div class="form-group">
                        <label>End Date *</label>
                        <asp:TextBox ID="txtRentalEnd" runat="server" TextMode="Date" CssClass="form-control-input"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvRentalEnd" runat="server" ControlToValidate="txtRentalEnd" ErrorMessage="End date is required." ValidationGroup="AddOrderGroup" EnableClientScript="false" CssClass="asp-val-error" Display="Dynamic" />
                        <asp:CustomValidator ID="cvDateRange" runat="server" OnServerValidate="cvDateRange_ServerValidate" ErrorMessage="End date must be same or after start date." ValidationGroup="AddOrderGroup" EnableClientScript="false" CssClass="asp-val-error" Display="Dynamic" />
                    </div>

                    <div class="form-group">
                        <label>Initial Status *</label>
                        <asp:DropDownList ID="ddlInitialStatus" runat="server" CssClass="form-control-select">
                            <asp:ListItem Text="Active" Value="Active" Selected="True" />
                            <asp:ListItem Text="Pending" Value="Pending" />
                        </asp:DropDownList>
                    </div>
                </div>

                <div class="form-card" style="background-color: #fffaf7; border-color: #ebdcd0;">
                    <h3 style="font-size: 13px; font-weight: 600; color: var(--primary-maroon); margin: 0 0 8px 0;">Order Notes</h3>
                    <p style="font-size: 12px; color: var(--text-muted); margin: 0; line-height: 1.5;">
                        New orders are automatically assigned a unique order identifier (e.g. <code>#ORD-9083</code>).
                    </p>
                </div>
            </div>
        </div>
    </div>
</asp:Content>