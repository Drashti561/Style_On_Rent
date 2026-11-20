<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="RentalCart.aspx.cs" Inherits="Style_On_Rent.RentalCart" %>







<asp:Content ID="HeadContent" ContentPlaceHolderID="head" runat="server">
<style>
.cart-page {
    max-width: 1200px;
    margin: auto;
    padding: 40px 20px 60px;
    font-family: Georgia, serif;
    color: #4a3b3b;
}
.cart-page h1 {
    font: normal 32px Georgia, serif;
    color: #620019;
    margin: 0 0 30px;
}
.cart-empty {
    text-align: center;
    font-size: 14px;
    color: #8d777b;
    padding: 60px 0;
}
.cart-empty a {
    color: #620019;
    text-decoration: none;
    border-bottom: 1px solid #620019;
}
.cart-layout {
    display: grid;
    grid-template-columns: 1fr 320px;
    gap: 40px;
    align-items: start;
}
.cart-item {
    display: flex;
    gap: 20px;
    padding: 20px 0;
    border-bottom: 1px solid #eee;
}
.cart-item img {
    width: 130px;
    height: 170px;
    object-fit: cover;
    flex-shrink: 0;
}
.cart-item-info {
    flex: 1;
}
.cart-item-info h3 {
    font: normal 18px Georgia, serif;
    color: #620019;
    margin: 0 0 8px;
}
.cart-item-info p {
    font-size: 12px;
    color: #8d777b;
    margin: 4px 0;
}
.cart-item-price {
    font-size: 16px;
    color: #620019;
    font-weight: bold;
    align-self: center;
}
.cart-remove {
    background: transparent;
    color: #a17b35;
    text-decoration: none;
    font-size: 22px;
    margin-left: 10px;
    border: none;
    cursor: pointer;
    padding: 0 8px;
}
.cart-remove:hover { color: #650019; }
.continue-link {
    display: inline-block;
    margin-top: 25px;
    color: #620019;
    font-size: 12px;
    text-decoration: none;
    border-bottom: 1px solid #620019;
    padding-bottom: 2px;
}

.summary {
    background: #650019;
    color: #fff;
    padding: 30px 25px;
    border-radius: 4px;
}
.summary h2 {
    font: normal 18px Georgia, serif;
    margin: 0 0 20px;
    text-align: center;
    letter-spacing: 1px;
}
.summary-row {
    display: flex;
    justify-content: space-between;
    font-size: 13px;
    margin: 12px 0;
}
.summary-total {
    display: flex;
    justify-content: space-between;
    font-size: 16px;
    font-weight: bold;
    margin-top: 20px;
    padding-top: 15px;
    border-top: 1px solid rgba(255,255,255,0.3);
}
.checkout-btn {
    display: block;
    width: 100%;
    margin-top: 25px;
    padding: 14px;
    background: #d5ad2d;
    color: #650019;
    text-align: center;
    text-decoration: none;
    font-size: 12px;
    font-weight: bold;
    letter-spacing: 1px;
    border: none;
    cursor: pointer;
}
.checkout-btn:hover { background: #c19c1f; color: #650019; }
.secure {
    text-align: center;
    font-size: 10px;
    margin-top: 15px;
    opacity: 0.8;
}

@media(max-width: 800px) {
    .cart-layout { grid-template-columns: 1fr; }
}
</style>
</asp:Content>

<asp:Content ID="MainContent" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div class="cart-page">
    <h1>Your Rental Cart</h1>

    <asp:Panel ID="pnlEmpty" runat="server" Visible="false">
        <p class="cart-empty">
            Your cart is empty.
            <a href="Collections.aspx">Continue shopping →</a>
        </p>
    </asp:Panel>

    <asp:Panel ID="pnlCart" runat="server">
        <div class="cart-layout">

            <!-- LEFT: Cart items -->
            <div class="cart-items">
                <asp:Repeater ID="rptCart" runat="server" OnItemCommand="rptCart_ItemCommand">
                    <ItemTemplate>
                        <div class="cart-item">
                            <img src='<%# Eval("Image") %>' alt='<%# Eval("Name") %>' />
                            <div class="cart-item-info">
                                <h3><%# Eval("Name") %></h3>
                                <p>Premium rental lehenga for your special day.</p>
                                <p>Qty: 1</p>
                            </div>
                            <div class="cart-item-price"><%# Eval("Price") %></div>
                            <asp:LinkButton ID="btnRemove" runat="server"
                                            CssClass="cart-remove"
                                            CommandName="Remove"
                                            CommandArgument='<%# Eval("ItemKey") %>'
                                            ToolTip="Remove">×</asp:LinkButton>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
            </div>

            <!-- RIGHT: Order Summary -->
            <div class="summary">
                <h2>Order Summary</h2>
                <div class="summary-row">
                    <span>Subtotal</span>
                    <span><asp:Label ID="lblSubtotal" runat="server" /></span>
                </div>
                <div class="summary-row">
                    <span>Delivery</span>
                    <span>₹0.00</span>
                </div>
                <div class="summary-row">
                    <span>Tax</span>
                    <span>₹0.00</span>
                </div>
                <div class="summary-total">
                    <span>Total</span>
                    <span><asp:Label ID="lblTotal" runat="server" /></span>
                </div>
                <a href="ShoppingDetails.aspx" class="checkout-btn">PROCEED TO CHECKOUT</a>
                <div class="secure">🔒 Secure Checkout</div>
            </div>
        </div>

        <a href="Collections.aspx" class="continue-link">← Continue Shopping</a>
    </asp:Panel>
</div>
</asp:Content>
