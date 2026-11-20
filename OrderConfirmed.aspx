<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="OrderConfirmed.aspx.cs" Inherits="Style_On_Rent.OrderConfirmed" %>








<asp:Content ID="HeadContent" ContentPlaceHolderID="head" runat="server">
<style>
.confirm-page {
    max-width: 700px;
    margin: auto;
    padding: 70px 20px 80px;
    font-family: Georgia, serif;
    color: #4a3b3b;
    text-align: center;
}
.confirm-page .check-icon {
    width: 60px;
    height: 60px;
    border-radius: 50%;
    background: #f7e6e6;
    display: flex;
    align-items: center;
    justify-content: center;
    margin: 0 auto 25px;
    font-size: 26px;
    color: #650019;
}
.confirm-page h1 {
    font: normal 42px Georgia, serif;
    color: #2b2b2b;
    margin: 0 0 15px;
}
.confirm-page .subtitle {
    font-size: 13px;
    color: #8d777b;
    line-height: 1.7;
    margin: 0 auto 35px;
    max-width: 420px;
}

.order-box {
    background: #fafafa;
    border: 1px solid #eee;
    padding: 20px 25px;
    margin-bottom: 30px;
    text-align: left;
}
.order-box .row {
    display: flex;
    justify-content: space-between;
    font-size: 11px;
    color: #8d777b;
    margin: 8px 0;
}
.order-box .row .label { letter-spacing: 1px; }
.order-box .row .value {
    color: #620019;
    font-weight: bold;
    letter-spacing: 1px;
}

.confirm-actions {
    display: flex;
    gap: 12px;
    justify-content: center;
    flex-wrap: wrap;
    margin-bottom: 25px;
}
.btn-primary {
    background: #650019;
    color: #fff;
    padding: 13px 28px;
    text-decoration: none;
    font-size: 10px;
    font-weight: bold;
    letter-spacing: 1px;
}
.btn-primary:hover { background: #450012; }
.btn-secondary {
    background: #fff;
    color: #650019;
    padding: 13px 28px;
    text-decoration: none;
    font-size: 10px;
    font-weight: bold;
    letter-spacing: 1px;
    border: 1px solid #650019;
}
.btn-secondary:hover { background: #650019; color: #fff; }
.contact-line {
    font-size: 11px;
    color: #8d777b;
    margin-top: 15px;
}
.contact-line a {
    color: #620019;
    text-decoration: none;
    border-bottom: 1px solid #620019;
}
</style>
</asp:Content>

<asp:Content ID="MainContent" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div class="confirm-page">
    <div class="check-icon">✓</div>

    <h1>Order Confirmed</h1>
    <p class="subtitle">Thank you for your rental. Your elegant ensemble is being prepared and will be shipped shortly.</p>

    <div class="order-box">
        <div class="row">
            <span class="label">ORDER NUMBER</span>
            <span class="value">RNTL-8X92-XCVB</span>
        </div>
        <div class="row">
            <span class="label">EST. DELIVERY</span>
            <span class="value">02 Oct - 06 Oct '26</span>
        </div>
    </div>

    <div class="confirm-actions">
        <a href="ShoppingDetails.aspx" class="btn-primary">VIEW ORDER DETAILS →</a>
        <a href="Collections.aspx" class="btn-secondary">CONTINUE SHOPPING</a>
    </div>

    <p class="contact-line">Need assistance? <a href="Collections.aspx">Contact our Concierge</a></p>
</div>
</asp:Content>
