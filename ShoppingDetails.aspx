<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="ShoppingDetails.aspx.cs" Inherits="Style_On_Rent.ShoppingDetails" %>









<asp:Content ID="HeadContent" ContentPlaceHolderID="head" runat="server">
<style>
.checkout-page {
    max-width: 1200px; margin: auto;
    padding: 40px 20px 60px;
    font-family: Georgia, serif; color: #4a3b3b;
}
.checkout-page .eyebrow {
    text-align: center; font-size: 10px; letter-spacing: 2px;
    color: #a17b35; margin: 0 0 8px;
}
.checkout-page h1 {
    text-align: center; font: normal 28px Georgia, serif;
    color: #620019; margin: 0 0 35px;
}
.checkout-layout {
    display: grid; grid-template-columns: 1fr 340px;
    gap: 40px; align-items: start;
}
.checkout-box {
    background: #fff; border: 1px solid #eee;
    padding: 30px 35px; margin-bottom: 25px;
    box-shadow: 0 2px 10px rgba(0,0,0,0.03);
}
.checkout-box h2 {
    font: normal 18px Georgia, serif; color: #620019;
    margin: 0 0 20px; padding-bottom: 10px;
    border-bottom: 1px solid #f0e6e6;
}
.form-row {
    display: grid; grid-template-columns: 1fr 1fr;
    gap: 15px; margin-bottom: 15px;
}
.form-row.full { grid-template-columns: 1fr; }
.form-group { display: flex; flex-direction: column; }
.form-group label {
    font-size: 11px; color: #8d777b;
    margin-bottom: 5px; letter-spacing: 0.5px;
}
.input-field {
    padding: 10px 12px; border: 1px solid #ddd;
    font-family: Georgia, serif; font-size: 12px;
    background: #fafafa; outline: none; width: 100%;
    box-sizing: border-box;
}
.input-field:focus { border-color: #a17b35; background: #fff; }

.error-msg {
    color: #c00000; font-size: 11px; margin-top: 4px;
    font-family: Arial, sans-serif;
}

.payment-options { display: flex; flex-direction: column; gap: 12px; }
.payment-option {
    display: flex; align-items: center; gap: 10px;
    padding: 12px 15px; border: 1px solid #eee;
    background: #fafafa; cursor: pointer;
    font-size: 12px; color: #4a3b3b;
}
.payment-option:hover { border-color: #a17b35; }
.payment-option input { accent-color: #650019; }
.payment-option .logo {
    margin-left: auto; font-size: 10px;
    color: #8d777b; letter-spacing: 1px;
}

.order-summary {
    background: #fff; border: 1px solid #eee;
    padding: 25px; box-shadow: 0 2px 10px rgba(0,0,0,0.03);
    position: sticky; top: 20px;
}
.order-summary h2 {
    font: normal 18px Georgia, serif; color: #620019;
    margin: 0 0 20px; text-align: center; letter-spacing: 1px;
}
.summary-product {
    display: flex; gap: 12px;
    padding-bottom: 15px; border-bottom: 1px solid #f0e6e6;
    margin-bottom: 15px;
}
.summary-product-info h3 {
    font: normal 13px Georgia, serif;
    color: #620019; margin: 0 0 5px;
}
.summary-product-info p {
    font-size: 11px; color: #8d777b; margin: 2px 0;
}
.summary-product .price {
    margin-left: auto; font-size: 13px;
    color: #620019; font-weight: bold;
}
.summary-row {
    display: flex; justify-content: space-between;
    font-size: 12px; margin: 10px 0; color: #4a3b3b;
}
.summary-row.total {
    font-size: 16px; font-weight: bold; color: #620019;
    margin-top: 15px; padding-top: 15px;
    border-top: 1px solid #f0e6e6;
}
.place-order-btn {
    display: block; width: 100%; margin-top: 20px;
    padding: 14px; background: #650019; color: #fff;
    text-align: center; text-decoration: none;
    font-size: 12px; font-weight: bold;
    letter-spacing: 1px; border: none; cursor: pointer;
    transition: background 0.3s;
}
.place-order-btn:hover { background: #450012; color: #fff; }

@media(max-width: 850px) {
    .checkout-layout { grid-template-columns: 1fr; }
    .order-summary { position: static; }
    .form-row { grid-template-columns: 1fr; }
}
</style>
</asp:Content>

<asp:Content ID="MainContent" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div class="checkout-page">
    <p class="eyebrow">SECURE CHECKOUT</p>
    <h1>Shopping Details</h1>

    <div class="checkout-layout">

        <!-- LEFT : Forms -->
        <div class="checkout-left">

            <!-- Shipping Details -->
            <div class="checkout-box">
                <h2>Shipping Details</h2>
                
                <div class="form-row">
                    <!-- FULL NAME -->
                    <div class="form-group">
                        <label>FULL NAME</label>
                        <asp:TextBox ID="txtFullName" runat="server" CssClass="input-field" placeholder="Enter full name" />
                        <asp:RequiredFieldValidator 
                            ID="rfvFullName" 
                            runat="server" 
                            ControlToValidate="txtFullName" 
                            ErrorMessage="Full name is required" 
                            Text="* Full name is required" 
                            CssClass="error-msg" 
                            Display="Dynamic" 
                            EnableClientScript="false" 
                            ValidationGroup="CheckoutGroup" />
                    </div>

                    <!-- EMAIL -->
                    <div class="form-group">
                        <label>EMAIL</label>
                        <asp:TextBox ID="txtEmail" runat="server" CssClass="input-field" placeholder="Enter email" />
                        <asp:RequiredFieldValidator 
                            ID="rfvEmail" 
                            runat="server" 
                            ControlToValidate="txtEmail" 
                            ErrorMessage="Email is required" 
                            Text="* Email is required" 
                            CssClass="error-msg" 
                            Display="Dynamic" 
                            EnableClientScript="false" 
                            ValidationGroup="CheckoutGroup" />
                        <asp:RegularExpressionValidator 
                            ID="revEmail" 
                            runat="server" 
                            ControlToValidate="txtEmail" 
                            ErrorMessage="Enter a valid email address" 
                            Text="* Invalid email address" 
                            CssClass="error-msg" 
                            ValidationExpression="^[^@\s]+@[^@\s]+\.[^@\s]+$" 
                            Display="Dynamic" 
                            EnableClientScript="false" 
                            ValidationGroup="CheckoutGroup" />
                    </div>
                </div>

                <div class="form-row full">
                    <!-- ADDRESS -->
                    <div class="form-group">
                        <label>ADDRESS</label>
                        <asp:TextBox ID="txtAddress" runat="server" CssClass="input-field" placeholder="Enter full address" />
                        <asp:RequiredFieldValidator 
                            ID="rfvAddress" 
                            runat="server" 
                            ControlToValidate="txtAddress" 
                            ErrorMessage="Address is required" 
                            Text="* Address is required" 
                            CssClass="error-msg" 
                            Display="Dynamic" 
                            EnableClientScript="false" 
                            ValidationGroup="CheckoutGroup" />
                    </div>
                </div>

                <div class="form-row">
                    <!-- CITY -->
                    <div class="form-group">
                        <label>CITY</label>
                        <asp:TextBox ID="txtCity" runat="server" CssClass="input-field" placeholder="Enter city" />
                        <asp:RequiredFieldValidator 
                            ID="rfvCity" 
                            runat="server" 
                            ControlToValidate="txtCity" 
                            ErrorMessage="City is required" 
                            Text="* City is required" 
                            CssClass="error-msg" 
                            Display="Dynamic" 
                            EnableClientScript="false" 
                            ValidationGroup="CheckoutGroup" />
                    </div>

                    <!-- POSTAL CODE -->
                    <div class="form-group">
                        <label>POSTAL CODE</label>
                        <asp:TextBox ID="txtPostalCode" runat="server" CssClass="input-field" placeholder="Enter postal code" />
                        <asp:RequiredFieldValidator 
                            ID="rfvPostalCode" 
                            runat="server" 
                            ControlToValidate="txtPostalCode" 
                            ErrorMessage="Postal code is required" 
                            Text="* Postal code is required" 
                            CssClass="error-msg" 
                            Display="Dynamic" 
                            EnableClientScript="false" 
                            ValidationGroup="CheckoutGroup" />
                    </div>
                </div>

                <div class="form-row full">
                    <!-- PHONE -->
                    <div class="form-group">
                        <label>PHONE</label>
                        <asp:TextBox ID="txtPhone" runat="server" CssClass="input-field" placeholder="Enter phone number" />
                        <asp:RequiredFieldValidator 
                            ID="rfvPhone" 
                            runat="server" 
                            ControlToValidate="txtPhone" 
                            ErrorMessage="Phone number is required" 
                            Text="* Phone number is required" 
                            CssClass="error-msg" 
                            Display="Dynamic" 
                            EnableClientScript="false" 
                            ValidationGroup="CheckoutGroup" />
                        <asp:RegularExpressionValidator 
                            ID="revPhone" 
                            runat="server" 
                            ControlToValidate="txtPhone" 
                            ErrorMessage="Enter a valid 10-digit phone number" 
                            Text="* Enter a valid 10-digit phone number" 
                            CssClass="error-msg" 
                            ValidationExpression="^[0-9]{10}$" 
                            Display="Dynamic" 
                            EnableClientScript="false" 
                            ValidationGroup="CheckoutGroup" />
                    </div>
                </div>
            </div>

            <!-- Payment Method -->
            <div class="checkout-box">
                <h2>Payment Method</h2>
                <div class="payment-options">
                    <label class="payment-option">
                        <input type="radio" name="payment" value="bank" checked />
                        <span>Direct Bank Transfer</span>
                        <span class="logo">🔒</span>
                    </label>
                    <label class="payment-option">
                        <input type="radio" name="payment" value="card" />
                        <span>Credit / Debit Card</span>
                        <span class="logo">VISA</span>
                    </label>
                    <label class="payment-option">
                        <input type="radio" name="payment" value="upi" />
                        <span>UPI / Wallet</span>
                        <span class="logo">UPI</span>
                    </label>
                    <label class="payment-option">
                        <input type="radio" name="payment" value="cod" />
                        <span>Cash on Delivery</span>
                        <span class="logo">COD</span>
                    </label>
                </div>
            </div>

        </div>

        <!-- RIGHT : Order Summary (DYNAMIC) -->
        <div class="order-summary">
            <h2>Order Summary</h2>

            <div class="summary-product">
                <asp:Image ID="imgProduct" runat="server"
                           Width="60" Height="80"
                           style="object-fit:cover;" />

                <div class="summary-product-info">
                    <h3><asp:Label ID="lblProductName" runat="server" /></h3>
                    <p>Size: <asp:Label ID="lblSize" runat="server" Text="M" /> | Color: <asp:Label ID="lblColor" runat="server" /></p>
                    <p>Qty: 1</p>
                </div>
                <div class="price"><asp:Label ID="lblPrice" runat="server" /></div>
            </div>

            <div class="summary-row">
                <span>Subtotal</span>
                <span><asp:Label ID="lblSubtotal" runat="server" /></span>
            </div>
            <div class="summary-row">
                <span>Shipping</span>
                <span>₹0.00</span>
            </div>
            <div class="summary-row">
                <span>Tax</span>
                <span>₹0.00</span>
            </div>
            <div class="summary-row total">
                <span>Total</span>
                <span><asp:Label ID="lblTotal" runat="server" /></span>
            </div>

            <asp:Button 
                ID="btnPlaceOrder" 
                runat="server" 
                Text="PLACE ORDER" 
                CssClass="place-order-btn" 
                ValidationGroup="CheckoutGroup" 
                CausesValidation="true" 
                OnClick="btnPlaceOrder_Click" />
        </div>
    </div>
</div>
</asp:Content>