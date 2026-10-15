<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ForgotPassword.aspx.cs" Inherits="StyleOnRent.ForgotPassword" %>



<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Forgot Password - Style On Rent</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />

    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: Arial, sans-serif;
            background: #faf9f8;
            min-height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 20px;
        }

        .forgot-box {
            width: 100%;
            max-width: 460px;
            min-height: 525px;
            background: #fff;
            padding: 65px 58px 45px;
            box-shadow: 0 15px 30px rgba(0, 0, 0, 0.08);
            border-radius: 8px;
        }

        .icon-circle {
            width: 55px;
            height: 55px;
            margin: 0 auto 22px;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .icon-circle svg {
            width: 30px;
            height: 30px;
            stroke: #4b0015;
            fill: none;
            stroke-width: 1.8;
            stroke-linecap: round;
            stroke-linejoin: round;
        }

        h1 {
            font-family: Georgia, 'Times New Roman', serif;
            font-size: 34px;
            font-weight: normal;
            color: #222;
            text-align: center;
            margin-bottom: 12px;
        }

        .subtitle {
            text-align: center;
            color: #776b6d;
            font-size: 15px;
            line-height: 1.6;
            margin-bottom: 55px;
        }

        .form-group {
            margin-bottom: 35px;
        }

        .form-group label {
            display: block;
            color: #51484a;
            font-size: 14px;
            margin-bottom: 10px;
        }

        .input-box {
            width: 100%;
            height: 42px;
            border: none;
            border-bottom: 1px solid #e5b9c1;
            outline: none;
            background: transparent;
            font-size: 15px;
            color: #333;
            padding: 5px 0;
            font-family: Arial, sans-serif;
        }

        .input-box:focus {
            border-bottom: 2px solid #65001d;
        }

        .input-box::placeholder {
            color: #b9afb1;
        }

        .error-message {
            display: block;
            color: #c62828;
            font-size: 12px;
            margin-top: 7px;
        }

        .send-btn {
            width: 100%;
            padding: 17px;
            background: #4b0015;
            color: #fff;
            border: none;
            font-size: 14px;
            letter-spacing: 1px;
            cursor: pointer;
            transition: 0.3s;
            margin-top: 5px;
        }

        .send-btn:hover {
            background: #69001f;
        }

        .back-link {
            display: block;
            text-align: center;
            margin-top: 35px;
            color: #776b6d;
            font-size: 13px;
            text-decoration: none;
        }

        .back-link:hover {
            color: #65001d;
        }

        .message {
            display: block;
            text-align: center;
            margin-top: 15px;
            font-size: 13px;
        }

        @media (max-width: 480px) {
            .forgot-box {
                padding: 45px 25px 35px;
                min-height: auto;
            }

            h1 {
                font-size: 29px;
            }

            .subtitle {
                margin-bottom: 40px;
            }
        }
    </style>
</head>

<body>
    <form id="form1" runat="server">

        <div class="forgot-box">

            <!-- Simple Key Icon -->
            <div class="icon-circle">
                <svg viewBox="0 0 24 24">
                    <circle cx="8" cy="15" r="5"></circle>
                    <path d="M11.5 11.5L21 2"></path>
                    <path d="M17 6l2 2"></path>
                    <path d="M14 9l2 2"></path>
                </svg>
            </div>

            <h1>Reset Your Password</h1>

            <p class="subtitle">
                Enter your email address to receive a<br />
                secure OTP.
            </p>

            <!-- Email -->
            <div class="form-group">

                <asp:Label ID="lblEmail" runat="server"
                    Text="Email Address"
                    AssociatedControlID="txtEmail">
                </asp:Label>

                <asp:TextBox ID="txtEmail" runat="server"
                    CssClass="input-box"
                    TextMode="Email"
                    placeholder="Enter your email address">
                </asp:TextBox>

                <asp:RequiredFieldValidator ID="rfvEmail" runat="server"
                    ControlToValidate="txtEmail"
                    ErrorMessage="Email address is required."
                    CssClass="error-message"
                    Display="Dynamic"
                    ValidationGroup="ForgotPassword">
                </asp:RequiredFieldValidator>

                <asp:RegularExpressionValidator ID="revEmail" runat="server"
                    ControlToValidate="txtEmail"
                    ValidationExpression="^[^@\s]+@[^@\s]+\.[^@\s]+$"
                    ErrorMessage="Please enter a valid email address."
                    CssClass="error-message"
                    Display="Dynamic"
                    ValidationGroup="ForgotPassword">
                </asp:RegularExpressionValidator>

            </div>

            <!-- Send OTP -->
            <asp:Button ID="btnSendOTP" runat="server"
                Text="SEND OTP"
                CssClass="send-btn"
                OnClick="btnSendOTP_Click"
                ValidationGroup="ForgotPassword" />

            <asp:Label ID="lblMessage" runat="server"
                CssClass="message">
            </asp:Label>

            <!-- Back to Login -->
            <a href="Login.aspx" class="back-link">
                ← Back to Login
            </a>

        </div>

    </form>
</body>
</html>