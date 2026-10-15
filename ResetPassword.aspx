<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ResetPassword.aspx.cs" Inherits="StyleOnRent.ResetPassword" %>

    

<!DOCTYPE html>
<html>
<head runat="server">
    <title>Reset Password - Style On Rent</title>

    <style>
        * {
            box-sizing: border-box;
        }

        body {
            margin: 0;
            padding: 0;
            font-family: Arial, sans-serif;
            background: #faf8f8;
            color: #292929;
        }

        .page-container {
            min-height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 20px;
        }

        .reset-card {
            width: 490px;
            min-height: 540px;
            background: #ffffff;
            border: 1px solid #eeeeee;
            border-radius: 12px;
            padding: 55px 48px;
            text-align: center;
            box-shadow: 0 15px 30px rgba(0,0,0,0.08);
        }

        .icon {
            font-size: 35px;
            color: #4b0015;
            margin-bottom: 18px;
        }

        h1 {
            font-family: Georgia, serif;
            font-size: 36px;
            font-weight: normal;
            margin: 0 0 12px;
        }

        .description {
            font-size: 16px;
            line-height: 25px;
            color: #766d6d;
            margin-bottom: 55px;
        }

        .form-group {
            text-align: left;
            margin-bottom: 25px;
        }

        .form-group label {
            display: block;
            font-size: 14px;
            margin-bottom: 10px;
            color: #514747;
        }

        .input-box {
            width: 100%;
            height: 45px;
            border: none;
            border-bottom: 1px solid #b99a9f;
            outline: none;
            font-size: 15px;
            padding: 8px 5px;
            background: transparent;
        }

        .input-box:focus {
            border-bottom: 2px solid #4b0015;
        }

        .reset-btn {
            width: 100%;
            height: 55px;
            background: #4b0015;
            color: white;
            border: none;
            font-size: 14px;
            letter-spacing: 1px;
            cursor: pointer;
            margin-top: 15px;
            transition: 0.3s;
        }

        .reset-btn:hover {
            background: #65001d;
        }

        .message {
            display: block;
            margin-top: 18px;
            font-size: 14px;
        }

        .back-link {
            display: block;
            margin-top: 35px;
            font-size: 14px;
            color: #766d6d;
            text-decoration: none;
        }

        .back-link:hover {
            color: #4b0015;
        }

        .validator {
            font-size: 12px;
            display: block;
            margin-top: 5px;
        }

        @media (max-width: 550px) {
            .reset-card {
                width: 100%;
                padding: 40px 25px;
            }

            h1 {
                font-size: 29px;
            }
        }
    </style>
</head>

<body>

    <form id="form1" runat="server">

        <div class="page-container">

            <div class="reset-card">

                <div class="icon">🔑</div>

                <h1>Create New Password</h1>

                <p class="description">
                    Set a new secure password for your account.
                </p>

                <!-- New Password -->
                <div class="form-group">

                    <label>New Password</label>

                    <asp:TextBox
                        ID="txtNewPassword"
                        runat="server"
                        CssClass="input-box"
                        TextMode="Password"
                        placeholder="Enter new password">
                    </asp:TextBox>

                    <asp:RequiredFieldValidator
                        ID="rfvNewPassword"
                        runat="server"
                        ControlToValidate="txtNewPassword"
                        ErrorMessage="New password is required."
                        CssClass="validator"
                        ForeColor="Red"
                        Display="Dynamic"
                        ValidationGroup="Reset">
                    </asp:RequiredFieldValidator>

                    <asp:RegularExpressionValidator
                        ID="revNewPassword"
                        runat="server"
                        ControlToValidate="txtNewPassword"
                        ValidationExpression="^.{8,}$"
                        ErrorMessage="Password must contain at least 8 characters."
                        CssClass="validator"
                        ForeColor="Red"
                        Display="Dynamic"
                        ValidationGroup="Reset">
                    </asp:RegularExpressionValidator>

                </div>

                <!-- Confirm Password -->
                <div class="form-group">

                    <label>Confirm Password</label>

                    <asp:TextBox
                        ID="txtConfirmPassword"
                        runat="server"
                        CssClass="input-box"
                        TextMode="Password"
                        placeholder="Confirm new password">
                    </asp:TextBox>

                    <asp:RequiredFieldValidator
                        ID="rfvConfirmPassword"
                        runat="server"
                        ControlToValidate="txtConfirmPassword"
                        ErrorMessage="Please confirm your password."
                        CssClass="validator"
                        ForeColor="Red"
                        Display="Dynamic"
                        ValidationGroup="Reset">
                    </asp:RequiredFieldValidator>

                    <asp:CompareValidator
                        ID="cvPassword"
                        runat="server"
                        ControlToValidate="txtConfirmPassword"
                        ControlToCompare="txtNewPassword"
                        ErrorMessage="Passwords do not match."
                        CssClass="validator"
                        ForeColor="Red"
                        Display="Dynamic"
                        ValidationGroup="Reset">
                    </asp:CompareValidator>

                </div>

                <!-- Reset Button -->
                <asp:Button
                    ID="btnResetPassword"
                    runat="server"
                    Text="RESET PASSWORD →"
                    CssClass="reset-btn"
                    OnClick="btnResetPassword_Click"
                    ValidationGroup="Reset" />

                <asp:Label
                    ID="lblMessage"
                    runat="server"
                    CssClass="message">
                </asp:Label>

                <asp:HyperLink
                    ID="lnkLogin"
                    runat="server"
                    NavigateUrl="Login.aspx"
                    CssClass="back-link">
                    Return to Login
                </asp:HyperLink>

            </div>

        </div>

    </form>

</body>
</html>