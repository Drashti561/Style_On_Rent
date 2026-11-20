<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Wishlist.aspx.cs" Inherits="Style_On_Rent.Wishlist" %>





<asp:Content ID="HeadContent" ContentPlaceHolderID="head" runat="server">
<style>
.wishlist-page {
    max-width: 1000px;
    margin: auto;
    padding: 50px 20px 70px;
    font-family: Georgia, serif;
    color: #4a3b3b;
}
.wishlist-page h1 {
    text-align: center;
    font: normal 30px Georgia, serif;
    color: #620019;
    margin: 0 0 30px;
}
.wishlist-empty {
    text-align: center;
    font-size: 14px;
    color: #8d777b;
    padding: 50px 0;
}
.wishlist-empty a {
    color: #620019;
    text-decoration: none;
    border-bottom: 1px solid #620019;
}
.wishlist-table {
    width: 100%;
    border-collapse: collapse;
    background: #fff;
    border: 1px solid #eee;
    margin-bottom: 30px;
}
.wishlist-table th {
    background: #fafafa;
    padding: 15px;
    font-size: 11px;
    color: #620019;
    letter-spacing: 1px;
    text-align: left;
    border-bottom: 1px solid #eee;
}
.wishlist-table td {
    padding: 15px;
    border-bottom: 1px solid #f0e6e6;
    font-size: 12px;
    vertical-align: middle;
}
.wishlist-table img {
    width: 60px;
    height: 80px;
    object-fit: cover;
}
.btn-remove {
    background: #fff;
    color: #650019;
    border: 1px solid #650019;
    padding: 6px 14px;
    font-size: 10px;
    cursor: pointer;
    text-decoration: none;
}
.btn-remove:hover { background: #650019; color: #fff; }
.btn-cart {
    background: #650019;
    color: #fff;
    border: none;
    padding: 6px 14px;
    font-size: 10px;
    cursor: pointer;
    text-decoration: none;
    margin-right: 5px;
}
.btn-cart:hover { background: #450012; color: #fff; }
.btn-continue {
    color: #620019;
    text-decoration: none;
    font-size: 12px;
    border-bottom: 1px solid #620019;
    padding-bottom: 2px;
}
</style>
</asp:Content>

<asp:Content ID="MainContent" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div class="wishlist-page">
    <h1>Your Wishlist</h1>

    <asp:Panel ID="pnlEmpty" runat="server" Visible="false">
        <p class="wishlist-empty">
            Your wishlist is empty.
            <a href="Collections.aspx">Continue shopping →</a>
        </p>
    </asp:Panel>

    <asp:Panel ID="pnlWishlist" runat="server">
        <asp:Repeater ID="rptWishlist" runat="server" OnItemCommand="rptWishlist_ItemCommand">
            <HeaderTemplate>
                <table class="wishlist-table">
                    <thead>
                        <tr>
                            <th>Image</th>
                            <th>Product</th>
                            <th>Price</th>
                            <th>Actions</th>
                        </tr>
                    </thead>
                    <tbody>
            </HeaderTemplate>

            <ItemTemplate>
                <tr>
                    <td><img src='<%# Eval("Image") %>' alt='<%# Eval("Name") %>' /></td>
                    <td><%# Eval("Name") %></td>
                    <td><%# Eval("Price") %></td>
                    <td>
                        <asp:LinkButton ID="btnMoveToCart" runat="server"
                                        CssClass="btn-cart"
                                        CommandName="MoveToCart"
                                        CommandArgument='<%# Eval("ItemKey") %>'>Add to Cart</asp:LinkButton>
                        <asp:LinkButton ID="btnRemove" runat="server"
                                        CssClass="btn-remove"
                                        CommandName="Remove"
                                        CommandArgument='<%# Eval("ItemKey") %>'>Remove</asp:LinkButton>
                    </td>
                </tr>
            </ItemTemplate>

            <FooterTemplate>
                    </tbody>
                </table>
            </FooterTemplate>
        </asp:Repeater>

        <a href="Collections.aspx" class="btn-continue">← Continue Shopping</a>
    </asp:Panel>
</div>
</asp:Content>
