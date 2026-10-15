<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="StyleOnRent.Login" %>



<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">

    <title>Login - Style On Rent</title>

    <style>

        * {
            box-sizing: border-box;
        }

        body {
            margin: 0;
            padding: 0;
            font-family: Arial, sans-serif;
            background: #faf8f7;
        }

        .login-container {
            width: 440px;
            margin: 80px auto;
            background: #ffffff;
            padding: 35px;
            border: 1px solid #e5e0dd;
            border-radius: 8px;
            box-shadow: 0 5px 20px rgba(0,0,0,0.08);
        }

        .title {
            text-align: center;
            color: #6b1f32;
            font-size: 30px;
            margin-bottom: 8px;
        }

        .subtitle {
            text-align: center;
            color: #777;
            margin-bottom: 30px;
        }

        .form-group {
            margin-bottom: 20px;
        }

        .form-group label {
            display: block;
            margin-bottom: 7px;
            font-weight: bold;
            color: #333;
        }

        .input {
            width: 100%;
            padding: 12px;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 15px;
        }

        .input:focus {
            outline: none;
            border-color: #6b1f32;
        }

        .error {
            color: red;
            font-size: 13px;
        }

        .btn-login {
            width: 100%;
            padding: 13px;
            background: #6b1f32;
            color: white;
            border: none;
            border-radius: 5px;
            font-size: 16px;
            cursor: pointer;
        }

        .btn-login:hover {
            background: #531626;
        }

        .message {
            display: block;
            text-align: center;
            margin-top: 15px;
            font-size: 14px;
        }

        .register-link {
            text-align: center;
            margin-top: 20px;
        }

        .register-link a {
            color: #6b1f32;
            text-decoration: none;
            font-weight: bold;
        }

        .forgot-link {
            text-align: right;
            margin-bottom: 20px;
        }

        .forgot-link a {
            color: #6b1f32;
            text-decoration: none;
            font-size: 14px;
        }

    </style>

</head>

<body>

<form id="form1" runat="server">

    <div class="login-container">

        <div class="title">
            Style On Rent
        </div>

        <div class="subtitle">
            Welcome back! Please login.
        </div>


        <!-- Email -->

        <div class="form-group">

            <asp:Label
                ID="lblEmail"
                runat="server"
                Text="Email">
            </asp:Label>

            <asp:TextBox
                ID="txtEmail"
                runat="server"
                CssClass="input"
                TextMode="Email"
                placeholder="Enter your email">
            </asp:TextBox>

            <asp:RequiredFieldValidator
                ID="rfvEmail"
                runat="server"
                ControlToValidate="txtEmail"
                ErrorMessage="Email is required"
                CssClass="error"
                ValidationGroup="Login">
            </asp:RequiredFieldValidator>

            <br />

            <asp:RegularExpressionValidator
                ID="revEmail"
                runat="server"
                ControlToValidate="txtEmail"
                ErrorMessage="Enter a valid email"
                CssClass="error"
                ValidationExpression="^[^@\s]+@[^@\s]+\.[^@\s]+$"
                ValidationGroup="Login">
            </asp:RegularExpressionValidator>

        </div>


        <!-- Password -->

        <div class="form-group">

            <asp:Label
                ID="lblPassword"
                runat="server"
                Text="Password">
            </asp:Label>

            <asp:TextBox
                ID="txtPassword"
                runat="server"
                CssClass="input"
                TextMode="Password"
                placeholder="Enter your password">
            </asp:TextBox>

            <asp:RequiredFieldValidator
                ID="rfvPassword"
                runat="server"
                ControlToValidate="txtPassword"
                ErrorMessage="Password is required"
                CssClass="error"
                ValidationGroup="Login">
            </asp:RequiredFieldValidator>

        </div>


        <!-- Forgot Password -->

        <div class="forgot-link">

            <a href="ForgotPassword.aspx">
                Forgot Password?
            </a>

        </div>


        <!-- Login Button -->

        <asp:Button
            ID="btnLogin"
            runat="server"
            Text="Login"
            CssClass="btn-login"
            ValidationGroup="Login"
            OnClick="btnLogin_Click" />


        <!-- Message -->

        <asp:Label
            ID="lblMessage"
            runat="server"
            CssClass="message">
        </asp:Label>


        <!-- Registration Link -->

        <div class="register-link">

            Don't have an account?

            <a href="Registration.aspx">
                Create Account
            </a>

        </div>

    </div>

</form>

</body>
</html>

