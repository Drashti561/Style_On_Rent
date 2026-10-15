<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="VerifyResetOTP.aspx.cs" Inherits="StyleOnRent.VerifyResetOTP" %>



<!DOCTYPE html>
<html>
<head runat="server">
    <title>Verify Your Identity - Style On Rent</title>

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

        .verify-card {
            width: 490px;
            min-height: 480px;
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
            margin-bottom: 65px;
        }

        .otp-input {
            width: 100%;
            height: 55px;
            border: none;
            border-bottom: 2px solid #e6bfc8;
            outline: none;
            text-align: center;
            font-size: 25px;
            letter-spacing: 15px;
            margin-bottom: 45px;
            background: transparent;
        }

        .otp-input:focus {
            border-bottom-color: #4b0015;
        }

        .verify-btn {
            width: 100%;
            height: 55px;
            background: #4b0015;
            color: white;
            border: none;
            font-size: 14px;
            letter-spacing: 1px;
            cursor: pointer;
            transition: 0.3s;
        }

        .verify-btn:hover {
            background: #65001d;
        }

        .resend {
            margin-top: 22px;
            font-size: 14px;
            color: #766d6d;
        }

        .resend a {
            color: #8a6500;
            text-decoration: underline;
            margin-left: 5px;
        }

        .message {
            display: block;
            margin-top: 15px;
            font-size: 14px;
        }

        @media (max-width: 550px) {
            .verify-card {
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

            <div class="verify-card">

                <div class="icon">🔒</div>

                <h1>Verify Your Identity</h1>

                <p class="description">
                    Enter the 4-digit code sent to your
                    <br />
                    mobile number to continue.
                </p>

                <asp:TextBox
                    ID="txtOTP"
                    runat="server"
                    CssClass="otp-input"
                    MaxLength="4"
                    TextMode="SingleLine"
                    placeholder="----">
                </asp:TextBox>

                <asp:RequiredFieldValidator
                    ID="rfvOTP"
                    runat="server"
                    ControlToValidate="txtOTP"
                    ErrorMessage="Please enter OTP."
                    ForeColor="Red"
                    Display="Dynamic"
                    ValidationGroup="Verify">
                </asp:RequiredFieldValidator>

                <asp:RegularExpressionValidator
                    ID="revOTP"
                    runat="server"
                    ControlToValidate="txtOTP"
                    ValidationExpression="^[0-9]{4}$"
                    ErrorMessage="Enter a valid 4-digit OTP."
                    ForeColor="Red"
                    Display="Dynamic"
                    ValidationGroup="Verify">
                </asp:RegularExpressionValidator>

                <br /><br />

                <asp:Button
                    ID="btnVerify"
                    runat="server"
                    Text="VERIFY & PROCEED"
                    CssClass="verify-btn"
                    OnClick="btnVerify_Click"
                    ValidationGroup="Verify" />

                <div class="resend">
                    Didn't receive the code?

                    <asp:LinkButton
                        ID="lnkResend"
                        runat="server"
                        OnClick="lnkResend_Click">
                        Resend Code
                    </asp:LinkButton>
                </div>

                <asp:Label
                    ID="lblMessage"
                    runat="server"
                    CssClass="message">
                </asp:Label>

            </div>

        </div>

    </form>

</body>
</html>