<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Profile.aspx.cs" Inherits="Style_On_Rent.Profile" %>





<asp:Content ID="HeadContent" ContentPlaceHolderID="head" runat="server">
<style>
.profile-page {
    max-width: 1100px;
    margin: auto;
    padding: 50px 20px 70px;
    font-family: Georgia, serif;
    color: #4a3b3b;
}
.profile-layout {
    display: grid;
    grid-template-columns: 300px 1fr;
    gap: 45px;
    align-items: start;
}

.profile-card {
    background: #fff;
    border: 1px solid #eee;
    padding: 30px 25px;
    text-align: center;
    box-shadow: 0 2px 12px rgba(0,0,0,0.04);
}
.profile-card .avatar {
    width: 90px;
    height: 90px;
    border-radius: 50%;
    object-fit: cover;
    margin: 0 auto 15px;
    border: 3px solid #faf3e0;
    display: block;
}
.profile-card .name {
    font: normal 24px Georgia, serif;
    color: #2b2b2b;
    margin: 0 0 6px;
}
.profile-card .member-tag {
    font-size: 10px;
    color: #a17b35;
    letter-spacing: 2px;
    margin-bottom: 25px;
}

.profile-nav {
    display: flex;
    flex-direction: column;
    gap: 2px;
    text-align: left;
    margin-top: 25px;
    border-top: 1px solid #f5eeee;
    padding-top: 20px;
}
.profile-nav a {
    display: flex;
    align-items: center;
    justify-content: space-between;
    padding: 12px 12px;
    font-size: 12px;
    color: #8d777b;
    text-decoration: none;
    letter-spacing: 0.5px;
}
.profile-nav a:hover { background: #fafafa; color: #620019; }
.profile-nav a.active {
    color: #620019;
    font-weight: bold;
    background: #faf3e0;
}
.profile-nav a .arrow { font-size: 11px; color: #a17b35; }

.details-head {
    display: flex;
    justify-content: space-between;
    align-items: center;
    margin-bottom: 30px;
    flex-wrap: wrap;
    gap: 15px;
}
.details-head h1 {
    font: normal 30px Georgia, serif;
    color: #2b2b2b;
    margin: 0;
}
.btn-edit {
    background: #620019;
    color: #fff;
    padding: 10px 22px;
    text-decoration: none;
    font-size: 10px;
    font-weight: bold;
    letter-spacing: 1px;
    border: none;
    cursor: pointer;
}
.btn-edit:hover { background: #450012; color: #fff; }

/* Display mode rows */
.detail-row {
    display: grid;
    grid-template-columns: 160px 1fr;
    padding: 15px 0;
    font-size: 13px;
    border-bottom: 1px solid #f5eeee;
}
.detail-row .label {
    color: #8d777b;
    font-size: 11px;
    letter-spacing: 1px;
    text-transform: uppercase;
}
.detail-row .value { color: #2b2b2b; }

/* Edit mode rows */
.edit-row {
    display: grid;
    grid-template-columns: 160px 1fr;
    padding: 12px 0;
    font-size: 13px;
    align-items: center;
    border-bottom: 1px solid #f5eeee;
}
.edit-row .label {
    color: #8d777b;
    font-size: 11px;
    letter-spacing: 1px;
    text-transform: uppercase;
}
.edit-row input {
    width: 100%;
    padding: 10px 12px;
    border: 1px solid #ddd;
    font-family: Georgia, serif;
    font-size: 13px;
    background: #fafafa;
    outline: none;
    box-sizing: border-box;
}
.edit-row input:focus {
    border-color: #a17b35;
    background: #fff;
}

/* Action buttons */
.edit-actions {
    margin-top: 25px;
    display: flex;
    gap: 12px;
}
.btn-save {
    background: #650019;
    color: #fff;
    padding: 12px 28px;
    border: none;
    font-size: 11px;
    font-weight: bold;
    letter-spacing: 1px;
    cursor: pointer;
    font-family: Georgia, serif;
}
.btn-save:hover { background: #450012; }
.btn-cancel {
    background: #fff;
    color: #650019;
    border: 1px solid #650019;
    padding: 12px 28px;
    font-size: 11px;
    font-weight: bold;
    letter-spacing: 1px;
    cursor: pointer;
    font-family: Georgia, serif;
}
.btn-cancel:hover { background: #650019; color: #fff; }

/* Success message */
.msg-success {
    display: block;
    margin-bottom: 20px;
    font-size: 12px;
    color: #1e7e34;
    font-weight: bold;
    letter-spacing: 0.5px;
    background: #e8f5e9;
    padding: 12px 16px;
    border-left: 3px solid #1e7e34;
}

.profile-cards {
    display: grid;
    grid-template-columns: 1fr 1fr;
    gap: 20px;
    margin-top: 40px;
}
.profile-box {
    padding: 28px 25px;
    color: #fff;
}
.profile-box.dark { background: #4a2b2b; }
.profile-box.light {
    background: #fafafa;
    border: 1px solid #eee;
    color: #4a3b3b;
}
.profile-box h4 {
    font: normal 17px Georgia, serif;
    margin: 0 0 8px;
}
.profile-box p {
    font-size: 11px;
    line-height: 1.6;
    margin: 0 0 15px;
    opacity: 0.85;
}
.profile-box a {
    display: inline-block;
    padding: 9px 20px;
    font-size: 10px;
    font-weight: bold;
    letter-spacing: 1px;
    text-decoration: none;
    background: #d5ad2d;
    color: #4a2b2b;
}
.profile-box.light a { background: #620019; color: #fff; }
.profile-box .icon-big {
    font-size: 26px;
    margin-bottom: 10px;
    display: block;
}
.profile-box .badge {
    font-size: 10px;
    background: #d5ad2d;
    color: #4a2b2b;
    padding: 3px 10px;
    letter-spacing: 1px;
    display: inline-block;
    margin-bottom: 10px;
}

@media(max-width: 850px) {
    .profile-layout { grid-template-columns: 1fr; }
    .profile-cards { grid-template-columns: 1fr; }
    .detail-row,
    .edit-row { grid-template-columns: 1fr; gap: 5px; }
}
</style>
</asp:Content>

<asp:Content ID="MainContent" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div class="profile-page">
    <div class="profile-layout">

        <!-- LEFT : Profile Card -->
        <div class="profile-card">
            <img src="Images/Blush_1.jfif" alt="Avatar" class="avatar" />
            <h2 class="name"><asp:Label ID="lblSideName" runat="server" /></h2>
            <div class="member-tag">★ MEMBER SINCE 2022</div>

            <nav class="profile-nav">
                <a href="Profile.aspx" class="active">PERSONAL DETAILS <span class="arrow">›</span></a>
                <a href="ShoppingDetails.aspx">PAYMENTS <span class="arrow">›</span></a>
                <a href="DeliveryDetails.aspx">ADDRESSES <span class="arrow">›</span></a>
                <a href="Logout.aspx">LOG OUT <span class="arrow">›</span></a>
            </nav>
        </div>

        <!-- RIGHT : Details -->
        <div>
            <div class="details-head">
                <h1>Personal Details</h1>
                <asp:Button ID="btnEdit" runat="server"
                            Text="EDIT PROFILE"
                            CssClass="btn-edit"
                            OnClick="btnEdit_Click" />
            </div>

            <!-- SUCCESS MESSAGE -->
            <asp:Label ID="lblSuccess" runat="server"
                       CssClass="msg-success"
                       Visible="false"
                       Text="✓ Profile updated successfully"></asp:Label>

            <!-- DISPLAY MODE -->
            <asp:Panel ID="pnlDisplay" runat="server">
                <div class="detail-row">
                    <span class="label">Full Name</span>
                    <span class="value"><asp:Label ID="lblName" runat="server" /></span>
                </div>
                <div class="detail-row">
                    <span class="label">Email</span>
                    <span class="value"><asp:Label ID="lblEmail" runat="server" /></span>
                </div>
                <div class="detail-row">
                    <span class="label">Phone</span>
                    <span class="value"><asp:Label ID="lblPhone" runat="server" /></span>
                </div>
                <div class="detail-row">
                    <span class="label">Member Since</span>
                    <span class="value"><asp:Label ID="lblMemberSince" runat="server" /></span>
                </div>
            </asp:Panel>

            <!-- EDIT MODE -->
            <asp:Panel ID="pnlEdit" runat="server" Visible="false">
                <div class="edit-row">
                    <span class="label">Full Name</span>
                    <asp:TextBox ID="txtName" runat="server" />
                </div>
                <div class="edit-row">
                    <span class="label">Email</span>
                    <asp:TextBox ID="txtEmail" runat="server" />
                </div>
                <div class="edit-row">
                    <span class="label">Phone</span>
                    <asp:TextBox ID="txtPhone" runat="server" />
                </div>

                <div class="edit-actions">
                    <asp:Button ID="btnSave" runat="server"
                                Text="UPDATE PROFILE"
                                CssClass="btn-save"
                                OnClick="btnSave_Click" />
                    <asp:Button ID="btnCancel" runat="server"
                                Text="CANCEL"
                                CssClass="btn-cancel"
                                OnClick="btnCancel_Click" />
                </div>
            </asp:Panel>

            <!-- Bottom cards -->
            <div class="profile-cards">
                <div class="profile-box dark">
                    <span class="icon-big">👗</span>
                    <h4>Current Rental</h4>
                    <p>You have 2 active rentals currently with us.</p>
                    <a href="RentalCart.aspx">VIEW RENTALS →</a>
                </div>
                <div class="profile-box light">
                    <span class="badge">SAVED ITEMS</span>
                    <h4>12</h4>
                    <p>Curated pieces saved for your next event.</p>
                    <a href="Wishlist.aspx">VIEW WISHLIST →</a>
                </div>
            </div>
        </div>

    </div>
</div>
</asp:Content>
