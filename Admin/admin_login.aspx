<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="admin_login.aspx.cs" Inherits="Style_On_Rent.Admin.admin_login" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title>Style On Rent - Admin Login</title>
    <style>
        * { box-sizing: border-box; }
        body { margin: 0; padding: 0; background-color: #faf9f9; font-family: Arial, sans-serif; }
        .main-container { min-height: 100vh; display: flex; justify-content: center; align-items: center; position: relative; }
        .login-card { width: 320px; background-color: white; padding: 28px 30px; border: 1px solid #eeeeee; box-shadow: 0 3px 12px rgba(0,0,0,0.08); border-radius: 4px; }
        .logo-area { text-align: center; margin-bottom: 8px; }
        .logo { width: 80px; height: 80px; object-fit: contain; }
        .brand-name { text-align: center; font-size: 14px; font-weight: bold; color: #222; }
        .admin-title { text-align: center; font-size: 12px; font-weight: bold; color: #333; margin-top: 5px; }
        .welcome-text { text-align: center; font-size: 11px; color: #777; margin-top: 5px; margin-bottom: 20px; }
        .form-group { margin-bottom: 14px; }
        .form-label { display: block; font-size: 10px; font-weight: bold; color: #333; margin-bottom: 5px; }
        .input-box { width: 100%; height: 34px; border: 1px solid #dddddd; padding: 0 10px; font-size: 12px; outline: none; border-radius: 3px; }
        .input-box:focus { border-color: #75001c; }
        .password-box { position: relative; }
        .password-box .input-box { padding-right: 35px; }
        .eye { position: absolute; right: 10px; top: 8px; cursor: pointer; font-size: 14px; color: #888; user-select: none; }
        .error { display: block; color: #c00000; font-size: 11px; margin-top: 4px; }
        .forgot-password { text-align: right; margin-top: -4px; margin-bottom: 18px; }
        .forgot-password a { color: #75001c; text-decoration: none; font-size: 11px; font-weight: bold; }
        .login-button { width: 100%; height: 36px; background-color: #75001c; color: white; border: none; cursor: pointer; font-size: 13px; font-weight: bold; border-radius: 3px; }
        .login-button:hover { background-color: #5d0016; }
        .footer { position: absolute; bottom: 12px; left: 20px; right: 20px; display: flex; justify-content: space-between; font-size: 12px; color: #777; }
        .footer-brand { color: #75001c; font-weight: bold; }
        .footer-links { display: flex; gap: 16px; }
    </style>

    <script type="text/javascript">
        function togglePassword() {
            var pwdField = document.getElementById("<%= txtPassword.ClientID %>");
            if (pwdField.type === "password") {
                pwdField.type = "text";
            } else {
                pwdField.type = "password";
            }
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div class="main-container">
            <div class="login-card">
                <div class="logo-area">
                    <img src="Images/logo.png" class="logo" alt="Style On Rent" />
                </div>

                <div class="brand-name">Style On Rent</div>
                <div class="admin-title">Admin Login</div>
                <div class="welcome-text">Welcome back! Please enter your details.</div>

                <!-- EMAIL -->
                <div class="form-group">
                    <label class="form-label">EMAIL ADDRESS</label>
                    <asp:TextBox ID="txtEmail" runat="server" CssClass="input-box" placeholder="admin@styleonrent.com" />
                    
                    <!-- Pure ASP.NET Validation (No jQuery required) -->
                    <asp:RequiredFieldValidator 
                        ID="rfvEmail" 
                        runat="server" 
                        ControlToValidate="txtEmail" 
                        ErrorMessage="Email is required" 
                        Text="* Email is required" 
                        CssClass="error" 
                        Display="Dynamic" 
                        EnableClientScript="false" 
                        ValidationGroup="AdminLoginGroup" />
                    
                    <asp:RegularExpressionValidator 
                        ID="revEmail" 
                        runat="server" 
                        ControlToValidate="txtEmail" 
                        ErrorMessage="Enter a valid email address" 
                        Text="* Enter a valid email address" 
                        CssClass="error" 
                        ValidationExpression="^[^@\s]+@[^@\s]+\.[^@\s]+$" 
                        Display="Dynamic" 
                        EnableClientScript="false" 
                        ValidationGroup="AdminLoginGroup" />
                </div>

                <!-- PASSWORD -->
                <div class="form-group">
                    <label class="form-label">PASSWORD</label>
                    <div class="password-box">
                        <asp:TextBox ID="txtPassword" runat="server" CssClass="input-box" TextMode="Password" placeholder="••••••••" />
                        <span class="eye" onclick="togglePassword()">👁</span>
                    </div>

                    <asp:RequiredFieldValidator 
                        ID="rfvPassword" 
                        runat="server" 
                        ControlToValidate="txtPassword" 
                        ErrorMessage="Password is required" 
                        Text="* Password is required" 
                        CssClass="error" 
                        Display="Dynamic" 
                        EnableClientScript="false" 
                        ValidationGroup="AdminLoginGroup" />
                </div>

                <div class="forgot-password">
                    <a href="ForgotPassword.aspx">Forgot password?</a>
                </div>

                <!-- LOGIN BUTTON -->
                <asp:Button 
                    ID="btnLogin" 
                    runat="server" 
                    Text="Sign in  &rarr;" 
                    CssClass="login-button" 
                    ValidationGroup="AdminLoginGroup" 
                    CausesValidation="true" 
                    OnClick="btnLogin_Click" />
            </div>

            <div class="footer">
                <div class="footer-brand">Style On Rent</div>
                <div class="footer-links">
                    <span>Privacy Policy</span>
                    <span>Terms of Service</span>
                    <span>Contact Support</span>
                </div>
                <div>&copy; 2026 Style On Rent. All rights reserved.</div>
            </div>
        </div>
    </form>
</body>
</html>