<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Registration.aspx.cs" Inherits="style.Registration" %>


<!DOCTYPE html>
<html>
<head runat="server">
    <title>Style On Rent - Create Account</title>
    <style>
        * { box-sizing: border-box; }
        body { margin: 0; padding: 0; background-color: #faf9f9; font-family: Arial, sans-serif; }
        .main-container { min-height: 100vh; display: flex; justify-content: center; align-items: center; padding: 20px; }
        .signup-card { width: 100%; max-width: 360px; background-color: #ffffff; padding: 30px 28px; border: 1px solid #eeeeee; border-radius: 6px; box-shadow: 0 4px 15px rgba(0, 0, 0, 0.05); text-align: center; }
        .logo-area { margin-bottom: 12px; }
        .logo { width: 90px; height: auto; object-fit: contain; }
        .brand-name { font-size: 20px; font-weight: bold; color: #222222; margin-bottom: 4px; font-family: 'Georgia', serif; }
        .page-title { font-size: 16px; font-weight: 600; color: #333333; margin-top: 10px; margin-bottom: 4px; }
        .welcome-text { font-size: 11px; color: #777777; margin-bottom: 20px; }
        .form-group { text-align: left; margin-bottom: 14px; }
        .form-label { display: block; font-size: 11px; font-weight: bold; color: #333333; margin-bottom: 5px; }
        .input-box { width: 100%; height: 36px; border: 1px solid #dddddd; border-radius: 3px; padding: 0 10px; font-size: 12px; color: #333333; outline: none; }
        .input-box:focus { border-color: #75001c; }
        .password-box { position: relative; }
        .password-box .input-box { padding-right: 35px; }
        .eye-icon { position: absolute; right: 10px; top: 50%; transform: translateY(-50%); cursor: pointer; color: #888888; font-size: 14px; user-select: none; }
        .checkbox-group { display: flex; align-items: center; font-size: 11px; color: #555555; margin-top: 15px; margin-bottom: 20px; text-align: left; }
        .checkbox-group input[type="checkbox"] { margin-right: 8px; accent-color: #75001c; }
        .checkbox-group a { color: #75001c; text-decoration: none; font-weight: bold; }
        .submit-button { width: 100%; height: 38px; background-color: #75001c; color: #ffffff; border: none; border-radius: 3px; font-size: 13px; font-weight: bold; cursor: pointer; }
        .submit-button:hover { background-color: #5d0016; }
        .footer-text { font-size: 11px; color: #666666; margin-top: 20px; }
        .footer-text a { color: #75001c; font-weight: bold; text-decoration: none; }
        .error { display: block; color: #c00000; font-size: 11px; margin-top: 4px; }
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
            <div class="signup-card">
                
                <div class="logo-area">
                    <img src="Images/logo.png" class="logo" alt="Style On Rent" />
                </div>

                <div class="brand-name">Style On Rent</div>
                <div class="page-title">Create Account</div>
                <div class="welcome-text">Join Style On Rent for a personalized fashion journey.</div>

                <!-- Full Name -->
                <div class="form-group">
                    <label class="form-label">FULL NAME</label>
                    <asp:TextBox ID="txtFullName" runat="server" CssClass="input-box" placeholder="Jane Doe" />
                    <asp:RequiredFieldValidator 
                        ID="rfvFullName" 
                        runat="server" 
                        ControlToValidate="txtFullName" 
                        ErrorMessage="Full name is required" 
                        Text="* Full name is required" 
                        CssClass="error" 
                        Display="Dynamic" 
                        EnableClientScript="false"
                        ValidationGroup="SignupGroup" />
                </div>

                <!-- Email Address -->
                <div class="form-group">
                    <label class="form-label">EMAIL ADDRESS</label>
                    <asp:TextBox ID="txtEmail" runat="server" CssClass="input-box" placeholder="jane@example.com" />
                    <asp:RequiredFieldValidator 
                        ID="rfvEmail" 
                        runat="server" 
                        ControlToValidate="txtEmail" 
                        ErrorMessage="Email is required" 
                        Text="* Email is required" 
                        CssClass="error" 
                        Display="Dynamic" 
                        EnableClientScript="false"
                        ValidationGroup="SignupGroup" />
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
                        ValidationGroup="SignupGroup" />
                </div>

                <!-- Password -->
                <div class="form-group">
                    <label class="form-label">PASSWORD</label>
                    <div class="password-box">
                        <asp:TextBox ID="txtPassword" runat="server" CssClass="input-box" TextMode="Password" placeholder="••••••••" />
                        <span class="eye-icon" onclick="togglePassword()">👁</span>
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
                        ValidationGroup="SignupGroup" />
                </div>

                <!-- Terms -->
                <div class="checkbox-group">
                    <asp:CheckBox ID="chkTerms" runat="server" />
                    <span>I agree to the <a href="Terms.aspx">Terms of Service</a> and <a href="Privacy.aspx">Privacy Policy</a>.</span>
                </div>

                <!-- Button -->
                <asp:Button 
                    ID="btnJoinNow" 
                    runat="server" 
                    Text="Join Now" 
                    CssClass="submit-button" 
                    ValidationGroup="SignupGroup" 
                    CausesValidation="true" 
                    OnClick="btnJoinNow_Click" />

                <div class="footer-text">
                    Already have an account? <a href="login.aspx">Sign in here</a>
                </div>

            </div>
        </div>
    </form>
</body>
</html>