<%@ Page Title="Customer Management"
    Language="C#"
    MasterPageFile="~/Admin/AdminMaster.Master"
    AutoEventWireup="true"
    CodeFile="Users.aspx.cs"
    Inherits="Style_On_Rent.Admin.Users" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css" />
    <style>
        :root {
            --primary-maroon: #73001e;
            --primary-maroon-hover: #590017;
            --text-dark: #1f2937;
            --text-muted: #6b7280;
            --page-bg: #faf7f2;
        }
        body { font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, Arial, sans-serif;
               background: var(--page-bg); color: var(--text-dark); margin: 0; }
        .users-page { padding: 24px 32px; max-width: 1200px; margin: 0 auto; }
        .users-header { display: flex; justify-content: space-between; align-items: center; margin-bottom: 24px; }
        .header-left { display: flex; align-items: center; gap: 20px; }
        .users-logo { width: 70px; }
        .page-title { font-size: 24px; font-weight: 700; color: var(--primary-maroon); margin: 0 0 4px 0; }
        .page-subtitle { font-size: 13px; color: var(--text-muted); margin: 0; }
        .add-customer-btn { background: var(--primary-maroon); color: #fff; border: none;
                            padding: 10px 18px; font-size: 13px; font-weight: 600;
                            border-radius: 6px; cursor: pointer; }
        .add-customer-btn:hover { background: var(--primary-maroon-hover); }
        .customer-toolbar { display: flex; justify-content: space-between; align-items: center;
                            margin-bottom: 20px; gap: 16px; }
        .search-area { position: relative; width: 380px; }
        .search-area i { position: absolute; left: 12px; top: 50%; transform: translateY(-50%);
                         color: #9ca3af; font-size: 14px; }
        .search-input { width: 100%; padding: 9px 12px 9px 36px; border: 1px solid #ebdcd0;
                        border-radius: 6px; font-size: 13px; background: #fffaf7; outline: none; }
        .search-input:focus { border-color: var(--primary-maroon); }
        .filter-btn { border: 1px solid #d1d5db; background: #fff; color: #374151;
                      padding: 8px 16px; font-size: 13px; border-radius: 6px; cursor: pointer; }
        .table-card { background: #fff; border-radius: 8px; border: 1px solid #f3ece4; overflow: hidden; }
        .users-table { width: 100%; border-collapse: collapse; font-size: 13px; }
        .users-table th { font-weight: 600; color: #687080; padding: 14px 16px; text-align: left;
                          border-bottom: 1px solid #e5e7eb; background: #fafbfc; font-size: 11px; }
        .users-table td { padding: 14px 16px; border-bottom: 1px solid #f3ece4; color: #4b5563; }
        .users-table tr:hover { background: #faf7f2; }
        .customer-name { color: #850019 !important; font-weight: 600; }
        .rental-badge { display: inline-flex; align-items: center; justify-content: center;
                        min-width: 26px; height: 20px; padding: 0 8px; border-radius: 12px;
                        background: #ffe0e7; color: #850019; font-size: 11px; font-weight: 600; }
        .zero-rental { background: #f1f2f4; color: #6b7280; }
        .action-buttons { display: flex; align-items: center; gap: 12px; }
        .action-btn { background: none; border: none; cursor: pointer; font-size: 15px;
                      text-decoration: none; display: inline-flex; }
        .view-btn { color: #2563eb; } .edit-btn { color: #f59e0b; } .delete-btn { color: #dc2626; }
        .table-footer { display: flex; justify-content: space-between; align-items: center;
                        padding: 16px 20px; border-top: 1px solid #f3ece4; background: #fff;
                        font-size: 13px; color: #6b7280; }
        .server-modal { position: fixed; top: 0; left: 0; width: 100%; height: 100%;
                        background: rgba(0,0,0,.4); display: flex; align-items: center;
                        justify-content: center; z-index: 9999; }
        .custom-modal-box { width: 400px; background: #fff; border-radius: 8px; padding: 24px;
                            box-shadow: 0 10px 25px rgba(0,0,0,.15); border-top: 5px solid var(--primary-maroon); }
        .modal-box-delete { border-top: 5px solid #dc2626 !important; text-align: center; }
        .custom-modal-title { margin: 0 0 6px; color: var(--primary-maroon); font-size: 18px; font-weight: 700; }
        .custom-modal-text { margin: 0 0 16px; color: var(--text-muted); font-size: 12px; }
        .add-form-group { margin-bottom: 14px; text-align: left; }
        .add-form-group label { display: block; font-size: 12px; font-weight: 600; margin-bottom: 5px; }
        .add-form-input, .edit-input { width: 100%; height: 34px; box-sizing: border-box;
                                       border: 1px solid #d1d5db; border-radius: 5px;
                                       padding: 0 10px; font-size: 13px; outline: none; background: #fffaf7; }
        .add-form-input:focus, .edit-input:focus { border-color: var(--primary-maroon); }
        .validation-error { display: block; margin-top: 4px; color: #dc2626; font-size: 11px; }
        .modal-actions { display: flex; justify-content: flex-end; gap: 10px; margin-top: 18px; }
        .cancel-btn { height: 32px; padding: 0 14px; border: 1px solid #d1d5db;
                      background: #e5e7eb; color: #374151; border-radius: 4px;
                      font-size: 12px; cursor: pointer; }
        .add-customer-save-btn { height: 32px; padding: 0 16px; border: none;
                                 background: var(--primary-maroon); color: #fff;
                                 border-radius: 4px; font-size: 12px; font-weight: 600; cursor: pointer; }
        .customer-modal-header { display: flex; align-items: center; justify-content: space-between;
                                 margin-bottom: 16px; }
        .close-modal { border: none; background: transparent; color: #9ca3af;
                       font-size: 18px; cursor: pointer; }
        .customer-detail { margin-bottom: 12px; font-size: 13px; }
        .customer-detail label { display: block; color: var(--text-muted); font-size: 11px;
                                 font-weight: 600; margin-bottom: 2px; }
        .btn-sm-red { background: #dc2626; color: #fff; border: none; padding: 6px 16px;
                      font-size: 12px; border-radius: 4px; cursor: pointer; font-weight: 600; }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="users-page">

        <div class="users-header">
            <div class="header-left">
                <img src="Images/logo.png" class="users-logo" alt="Style On Rent" />
                <div>
                    <h1 class="page-title">Customer Management</h1>
                    <p class="page-subtitle">View your customer list and their details.</p>
                </div>
            </div>
            <asp:Button ID="btnOpenAdd" runat="server" Text="+ Add New Customer"
                CssClass="add-customer-btn" CausesValidation="false"
                OnClick="btnOpenAdd_Click" />
        </div>

        <div class="customer-toolbar">
            <div class="search-area">
                <i class="bi bi-search"></i>
                <asp:TextBox ID="txtSearch" runat="server" CssClass="search-input"
                    placeholder="Search by name or phone..."
                    AutoPostBack="true" OnTextChanged="btnSearch_Click" />
            </div>
            <asp:Button ID="btnFilter" runat="server" Text="Filter"
                CssClass="filter-btn" CausesValidation="false" OnClick="btnFilter_Click" />
        </div>

        <div class="table-card">
            <table class="users-table">
                <thead>
                    <tr>
                        <th style="width:8%;">ID</th>
                        <th style="width:18%;">NAME</th>
                        <th style="width:18%;">PHONE NUMBER</th>
                        <th style="width:22%;">EMAIL</th>
                        <th style="width:12%; text-align:center;">TOTAL<br />RENTALS</th>
                        <th style="width:12%;">LAST RENTAL</th>
                        <th style="width:10%; text-align:center;">ACTION</th>
                    </tr>
                </thead>
                <tbody>
                    <asp:Repeater ID="rptCustomers" runat="server"
                        OnItemCommand="rptCustomers_ItemCommand">
                        <ItemTemplate>
                            <tr>
                                <td><%# Eval("Id", "{0:000}") %></td>
                                <td class="customer-name"><%# Eval("Name") %></td>
                                <td><%# Eval("Phone") %></td>
                                <td><%# Eval("Email") %></td>
                                <td style="text-align:center;">
                                    <span class='<%# Convert.ToInt32(Eval("TotalRentals")) == 0 ? "rental-badge zero-rental" : "rental-badge" %>'>
                                        <%# Eval("TotalRentals") %>
                                    </span>
                                </td>
                                <td><%# Eval("LastRental") %></td>
                                <td>
                                    <div class="action-buttons">
                                        <asp:LinkButton ID="btnView" runat="server"
                                            CssClass="action-btn view-btn" ToolTip="View"
                                            CommandName="ViewCustomer" CommandArgument='<%# Eval("Id") %>'
                                            CausesValidation="false"><i class="bi bi-eye"></i></asp:LinkButton>
                                        <asp:LinkButton ID="btnEdit" runat="server"
                                            CssClass="action-btn edit-btn" ToolTip="Edit"
                                            CommandName="EditCustomer" CommandArgument='<%# Eval("Id") %>'
                                            CausesValidation="false"><i class="bi bi-pencil-square"></i></asp:LinkButton>
                                        <asp:LinkButton ID="btnDelete" runat="server"
                                            CssClass="action-btn delete-btn" ToolTip="Delete"
                                            CommandName="DeleteCustomer" CommandArgument='<%# Eval("Id") %>'
                                            CausesValidation="false"><i class="bi bi-trash3"></i></asp:LinkButton>
                                    </div>
                                </td>
                            </tr>
                        </ItemTemplate>
                    </asp:Repeater>
                </tbody>
            </table>

            <div class="table-footer">
                <asp:Label ID="lblCustomerCount" runat="server" Text="0 Customers" />
                <div>
                    <a href="?page=1" style="padding:6px 12px;border:1px solid #f2d7da;border-radius:4px;text-decoration:none;color:#888;">&lsaquo;</a>
                    <a href="?page=1" style="padding:6px 12px;background:#590017;color:#fff;border-radius:4px;text-decoration:none;">1</a>
                    <a href="?page=2" style="padding:6px 12px;text-decoration:none;color:#4b5563;">2</a>
                    <a href="?page=2" style="padding:6px 12px;border:1px solid #f2d7da;border-radius:4px;text-decoration:none;color:#888;">&rsaquo;</a>
                </div>
            </div>
        </div>
    </div>

    <!-- ADD MODAL -->
    <asp:Panel ID="pnlAddCustomer" runat="server" CssClass="server-modal" Visible="false">
        <div class="custom-modal-box">
            <h3 class="custom-modal-title">Add New Customer</h3>
            <p class="custom-modal-text">Enter customer details below.</p>

            <div class="add-form-group">
                <label>NAME</label>
                <asp:TextBox ID="txtAddName" runat="server" CssClass="add-form-input" placeholder="Enter customer name" />
                <asp:RequiredFieldValidator ID="rfvAddName" runat="server" ControlToValidate="txtAddName"
                    ErrorMessage="Customer name is required." ValidationGroup="AddCustomer"
                    EnableClientScript="False" CssClass="validation-error" Display="Dynamic" />
            </div>
            <div class="add-form-group">
                <label>PHONE NUMBER</label>
                <asp:TextBox ID="txtAddPhone" runat="server" CssClass="add-form-input" placeholder="Enter phone number" />
                <asp:RequiredFieldValidator ID="rfvAddPhone" runat="server" ControlToValidate="txtAddPhone"
                    ErrorMessage="Phone number is required." ValidationGroup="AddCustomer"
                    EnableClientScript="False" CssClass="validation-error" Display="Dynamic" />
            </div>
            <div class="add-form-group">
                <label>EMAIL</label>
                <asp:TextBox ID="txtAddEmail" runat="server" CssClass="add-form-input" placeholder="Enter email address" />
                <asp:RequiredFieldValidator ID="rfvAddEmail" runat="server" ControlToValidate="txtAddEmail"
                    ErrorMessage="Email is required." ValidationGroup="AddCustomer"
                    EnableClientScript="False" CssClass="validation-error" Display="Dynamic" />
            </div>
            <div class="modal-actions">
                <asp:Button ID="btnCloseAdd" runat="server" Text="Cancel" CssClass="cancel-btn"
                    CausesValidation="false" OnClick="btnCloseAdd_Click" />
                <asp:Button ID="btnAddCustomer" runat="server" Text="Add Customer"
                    CssClass="add-customer-save-btn" ValidationGroup="AddCustomer"
                    CausesValidation="true" OnClick="btnAddCustomer_Click" />
            </div>
        </div>
    </asp:Panel>

    <!-- VIEW MODAL -->
    <asp:Panel ID="pnlViewCustomer" runat="server" CssClass="server-modal" Visible="false">
        <div class="custom-modal-box">
            <div class="customer-modal-header">
                <h3 class="custom-modal-title">Customer Details</h3>
                <asp:Button ID="btnCloseView" runat="server" Text="×" CssClass="close-modal"
                    CausesValidation="false" OnClick="btnCloseView_Click" />
            </div>
            <div class="customer-detail"><label>NAME</label>
                <asp:Label ID="lblViewName" runat="server" /></div>
            <div class="customer-detail"><label>PHONE NUMBER</label>
                <asp:Label ID="lblViewPhone" runat="server" /></div>
            <div class="customer-detail"><label>EMAIL</label>
                <asp:Label ID="lblViewEmail" runat="server" /></div>
            <div class="customer-detail"><label>TOTAL RENTALS</label>
                <asp:Label ID="lblViewRentals" runat="server" /></div>
            <div class="customer-detail"><label>LAST RENTAL</label>
                <asp:Label ID="lblViewLastRental" runat="server" /></div>
            <div class="modal-actions" style="margin-top:16px;">
                <asp:Button ID="btnCloseViewBtn" runat="server" Text="Close"
                    CssClass="btn-sm-red" CausesValidation="false" OnClick="btnCloseView_Click" />
            </div>
        </div>
    </asp:Panel>

    <!-- EDIT MODAL -->
    <asp:Panel ID="pnlEditCustomer" runat="server" CssClass="server-modal" Visible="false">
        <div class="custom-modal-box">
            <div class="customer-modal-header">
                <h3 class="custom-modal-title">Edit Customer</h3>
                <asp:Button ID="btnCloseEdit" runat="server" Text="×" CssClass="close-modal"
                    CausesValidation="false" OnClick="btnCloseEdit_Click" />
            </div>
            <asp:HiddenField ID="hdnEditId" runat="server" />
            <div class="add-form-group">
                <label>NAME</label>
                <asp:TextBox ID="txtEditName" runat="server" CssClass="edit-input" />
                <asp:RequiredFieldValidator ID="rfvEditName" runat="server" ControlToValidate="txtEditName"
                    ErrorMessage="Customer name is required." ValidationGroup="EditCustomer"
                    EnableClientScript="False" CssClass="validation-error" Display="Dynamic" />
            </div>
            <div class="add-form-group">
                <label>PHONE NUMBER</label>
                <asp:TextBox ID="txtEditPhone" runat="server" CssClass="edit-input" />
                <asp:RequiredFieldValidator ID="rfvEditPhone" runat="server" ControlToValidate="txtEditPhone"
                    ErrorMessage="Phone number is required." ValidationGroup="EditCustomer"
                    EnableClientScript="False" CssClass="validation-error" Display="Dynamic" />
            </div>
            <div class="add-form-group">
                <label>EMAIL</label>
                <asp:TextBox ID="txtEditEmail" runat="server" CssClass="edit-input" />
                <asp:RequiredFieldValidator ID="rfvEditEmail" runat="server" ControlToValidate="txtEditEmail"
                    ErrorMessage="Email is required." ValidationGroup="EditCustomer"
                    EnableClientScript="False" CssClass="validation-error" Display="Dynamic" />
            </div>
            <div class="modal-actions">
                <asp:Button ID="btnCancelEdit" runat="server" Text="Cancel"
                    CssClass="cancel-btn" CausesValidation="false" OnClick="btnCloseEdit_Click" />
                <asp:Button ID="btnSaveCustomer" runat="server" Text="Save Changes"
                    CssClass="add-customer-save-btn" ValidationGroup="EditCustomer"
                    CausesValidation="true" OnClick="btnSaveCustomer_Click" />
            </div>
        </div>
    </asp:Panel>

    <!-- DELETE MODAL -->
    <asp:Panel ID="pnlDeleteCustomer" runat="server" CssClass="server-modal" Visible="false">
        <div class="custom-modal-box modal-box-delete">
            <i class="bi bi-exclamation-triangle" style="font-size:38px;color:#dc2626;display:block;margin-bottom:10px;"></i>
            <h3 class="custom-modal-title" style="color:#111827;">Delete Customer</h3>
            <p class="custom-modal-text">Are you sure you want to delete this customer? This action cannot be undone.</p>
            <asp:HiddenField ID="hdnDeleteId" runat="server" />
            <div class="modal-actions" style="justify-content:center;gap:12px;">
                <asp:Button ID="btnCancelDelete" runat="server" Text="Cancel"
                    CssClass="cancel-btn" CausesValidation="false" OnClick="btnCancelDelete_Click" />
                <asp:Button ID="btnConfirmDelete" runat="server" Text="Yes, Delete"
                    CssClass="btn-sm-red" CausesValidation="false" OnClick="btnConfirmDelete_Click" />
            </div>
        </div>
    </asp:Panel>
</asp:Content>