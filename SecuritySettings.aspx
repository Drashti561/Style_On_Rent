<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="SecuritySettings.aspx.cs" Inherits="Style_On_Rent.SecuritySettings" %>








<asp:Content ID="HeadContent" ContentPlaceHolderID="head" runat="server">
<style>
.security-page {
    max-width: 700px;
    margin: auto;
    padding: 60px 20px 80px;
    font-family: Georgia, serif;
    color: #4a3b3b;
}
.security-page .lock-icon {
    font-size: 22px;
    color: #620019;
    margin-bottom: 10px;
}
.security-page h1 {
    font: normal 38px Georgia, serif;
    color: #2b2b2b;
    margin: 0 0 12px;
}
.security-page .subtitle {
    font-size: 12px;
    color: #8d777b;
    line-height: 1.7;
    margin: 0 0 40px;
    max-width: 420px;
}

/* Form */
.security-form .form-group {
    margin-bottom: 28px;
    position: relative;
}
.security-form label {
    display: block;
    font-size: 10px;
    color: #8d777b;
    letter-spacing: 2px;
    margin-bottom: 8px;
}
.security-form input {
    width: 100%;
    padding: 10px 35px 10px 0;
    border: none;
    border-bottom: 1px solid #ddd;
    font-family: Georgia, serif;
    font-size: 14px;
    color: #4a3b3b;
    background: transparent;
    outline: none;
    letter-spacing: 1px;
}
.security-form input:focus {
    border-bottom-color: #a17b35;
}
.security-form .eye {
    position: absolute;
    right: 0;
    bottom: 10px;
    font-size: 14px;
    color: #8d777b;
    cursor: pointer;
    user-select: none;
}

/* Password strength */
.strength {
    font-size: 10px;
    color: #8d777b;
    margin-top: 6px;
    text-align: right;
    letter-spacing: 1px;
}

/* Error & Success messages */
.msg-error {
    display: block;
    margin-top: 6px;
    font-size: 11px;
    color: #c0392b;
    font-weight: bold;
    letter-spacing: 0.5px;
}
.msg-success {
    display: block;
    margin-top: 10px;
    font-size: 12px;
    color: #1e7e34;
    font-weight: bold;
    letter-spacing: 0.5px;
    background: #e8f5e9;
    padding: 10px 14px;
    border-left: 3px solid #1e7e34;
}

/* Actions */
.security-actions {
    display: flex;
    justify-content: space-between;
    align-items: center;
    margin-top: 40px;
    flex-wrap: wrap;
    gap: 15px;
}
.forgot-link {
    font-size: 11px;
    color: #620019;
    text-decoration: none;
    border-bottom: 1px solid #620019;
    padding-bottom: 2px;
}
.btn-update {
    background: #650019;
    color: #fff;
    padding: 13px 30px;
    text-decoration: none;
    font-size: 10px;
    font-weight: bold;
    letter-spacing: 1px;
    border: none;
    cursor: pointer;
}
.btn-update:hover { background: #450012; color: #fff; }

@media(max-width: 500px) {
    .security-page h1 { font-size: 30px; }
    .security-actions { flex-direction: column; align-items: stretch; }
    .btn-update { text-align: center; }
}
</style>
</asp:Content>

<asp:Content ID="MainContent" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div class="security-page">
    <div class="lock-icon">🔒</div>

    <h1>Security Settings</h1>
    <p class="subtitle">Update your credentials to ensure your exclusive boutique access remains private and secure.</p>

    <div class="security-form">

        <div class="form-group">
            <label>CURRENT PASSWORD</label>
            <asp:TextBox ID="txtCurrent" runat="server" TextMode="Password"></asp:TextBox>
            <span class="eye">👁</span>
        </div>

        <div class="form-group">
            <label>NEW PASSWORD</label>
            <asp:TextBox ID="txtNew" runat="server" TextMode="Password"></asp:TextBox>
            <span class="eye">👁</span>
            <div class="strength">password strength</div>
        </div>

        <div class="form-group">
            <label>CONFIRM NEW PASSWORD</label>
            <asp:TextBox ID="txtConfirm" runat="server" TextMode="Password"></asp:TextBox>
            <span class="eye">👁</span>

            <!-- ❌ ERROR MESSAGE -->
            <asp:Label ID="lblError" runat="server"
                       CssClass="msg-error"
                       Visible="false"
                       Text="Passwords do not match"></asp:Label>
        </div>

        <!-- ✅ SUCCESS MESSAGE -->
        <asp:Label ID="lblSuccess" runat="server"
                   CssClass="msg-success"
                   Visible="false"
                   Text="✓ Password changed successfully"></asp:Label>

        <div class="security-actions">
            <a href="ForgotPassword.aspx" class="forgot-link">Forgot Current Password?</a>
            <asp:Button ID="btnUpdate" runat="server"
                        CssClass="btn-update"
                        Text="UPDATE PASSWORD"
                        OnClick="btnUpdate_Click" />
        </div>
    </div>
</div>
</asp:Content>