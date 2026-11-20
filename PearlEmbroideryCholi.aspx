<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="PearlEmbroideryCholi.aspx.cs" Inherits="Style_On_Rent.PearlEmbroideryCholi" %>






<asp:Content ID="HeadContent" ContentPlaceHolderID="head" runat="server">
<style>
.collection { max-width: 1200px; margin: auto; padding: 30px 20px 40px; }
.heading { text-align: center; color: #650019; font: 30px Georgia, serif; margin: 0 0 25px; }
.products { display: grid; grid-template-columns: repeat(3, 1fr); gap: 24px 18px; }
.product { text-align: center; min-width: 0; position: relative; }
.product img { width: 100%; height: 285px; object-fit: cover; display: block; }
.product h3 { font: 15px Georgia, serif; color: #570018; margin: 10px 0 6px; }
.price { color: #650019; font-size: 12px; margin: 0 0 10px; }

.wishlist-btn {
    position: absolute; top: 8px; right: 8px;
    width: 26px; height: 26px; background: #fff;
    border-radius: 50%; display: flex;
    align-items: center; justify-content: center;
    color: #620019; font-size: 14px;
    box-shadow: 0 1px 5px rgba(0,0,0,.15);
    cursor: pointer; border: none;
    text-decoration: none; padding: 0;
    z-index: 2;
}
.wishlist-btn:hover { background: #620019; color: #fff; }

.actions { display: flex; gap: 5px; }
.actions a,
.actions .cart-btn,
.actions .rent-btn {
    flex: 1; padding: 9px 3px; font-size: 9px;
    text-decoration: none; color: white;
    border: none; cursor: pointer;
    display: flex; align-items: center; justify-content: center;
}
.cart-btn { background: #650019; }
.cart-btn:hover { background: #450012; color: #fff; }
.rent-btn { background: #d5ad2d; }
.rent-btn:hover { background: #bd9827; color: #fff; }

@media(max-width:650px) {
    .products { grid-template-columns: repeat(2, minmax(0,1fr)); gap: 20px 12px; }
    .heading { font-size: 25px; }
}
</style>
</asp:Content>

<asp:Content ID="MainContent" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div class="collection">
    <h1 class="heading">Pearl Embroidery Choli</h1>

    <div class="products">

        <div class="product">
            <img src="Images/Pearl_1.jfif" alt="Ivory Pearl Couture" />
            <asp:LinkButton ID="btnWish1" runat="server" CssClass="wishlist-btn" CommandArgument="pearl_1" OnClick="AddToWishlist_Click">♡</asp:LinkButton>
            <h3>Ivory Pearl Couture</h3>
            <p class="price">₹ 5,999 / rental</p>
            <div class="actions">
                <asp:LinkButton ID="btnAdd1" runat="server" CssClass="cart-btn" CommandArgument="pearl_1" OnClick="AddToCart_Click">Add to Cart</asp:LinkButton>
                <a href="DeliveryDetails.aspx" class="rent-btn">Rent now</a>
            </div>
        </div>

        <div class="product">
            <img src="Images/Pearl_2.jfif" alt="Pearl Mahal Ensemble" />
            <asp:LinkButton ID="btnWish2" runat="server" CssClass="wishlist-btn" CommandArgument="pearl_2" OnClick="AddToWishlist_Click">♡</asp:LinkButton>
            <h3>Pearl Mahal Ensemble</h3>
            <p class="price">₹ 5,499 / rental</p>
            <div class="actions">
                <asp:LinkButton ID="btnAdd2" runat="server" CssClass="cart-btn" CommandArgument="pearl_2" OnClick="AddToCart_Click">Add to Cart</asp:LinkButton>
                <a href="DeliveryDetails.aspx" class="rent-btn">Rent now</a>
            </div>
        </div>

        <div class="product">
            <img src="Images/Pearl_3.jfif" alt="Champagne Pearl Lehenga" />
            <asp:LinkButton ID="btnWish3" runat="server" CssClass="wishlist-btn" CommandArgument="pearl_3" OnClick="AddToWishlist_Click">♡</asp:LinkButton>
            <h3>Champagne Pearl Lehenga</h3>
            <p class="price">₹ 5,799 / rental</p>
            <div class="actions">
                <asp:LinkButton ID="btnAdd3" runat="server" CssClass="cart-btn" CommandArgument="pearl_3" OnClick="AddToCart_Click">Add to Cart</asp:LinkButton>
                <a href="DeliveryDetails.aspx" class="rent-btn">Rent now</a>
            </div>
        </div>

        <div class="product">
            <img src="Images/Pearl_4.jfif" alt="Blush Pearl Embroidery" />
            <asp:LinkButton ID="btnWish4" runat="server" CssClass="wishlist-btn" CommandArgument="pearl_4" OnClick="AddToWishlist_Click">♡</asp:LinkButton>
            <h3>Blush Pearl Embroidery</h3>
            <p class="price">₹ 4,999 / rental</p>
            <div class="actions">
                <asp:LinkButton ID="btnAdd4" runat="server" CssClass="cart-btn" CommandArgument="pearl_4" OnClick="AddToCart_Click">Add to Cart</asp:LinkButton>
                <a href="DeliveryDetails.aspx" class="rent-btn">Rent now</a>
            </div>
        </div>

        <div class="product">
            <img src="Images/Pearl_5.jfif" alt="Ivory Zari Elegance" />
            <asp:LinkButton ID="btnWish5" runat="server" CssClass="wishlist-btn" CommandArgument="pearl_5" OnClick="AddToWishlist_Click">♡</asp:LinkButton>
            <h3>Ivory Zari Elegance</h3>
            <p class="price">₹ 5,699 / rental</p>
            <div class="actions">
                <asp:LinkButton ID="btnAdd5" runat="server" CssClass="cart-btn" CommandArgument="pearl_5" OnClick="AddToCart_Click">Add to Cart</asp:LinkButton>
                <a href="DeliveryDetails.aspx" class="rent-btn">Rent now</a>
            </div>
        </div>

        <div class="product">
            <img src="Images/Pearl_6.jfif" alt="Pearl Bridal Choli" />
            <asp:LinkButton ID="btnWish6" runat="server" CssClass="wishlist-btn" CommandArgument="pearl_6" OnClick="AddToWishlist_Click">♡</asp:LinkButton>
            <h3>Pearl Bridal Choli</h3>
            <p class="price">₹ 5,299 / rental</p>
            <div class="actions">
                <asp:LinkButton ID="btnAdd6" runat="server" CssClass="cart-btn" CommandArgument="pearl_6" OnClick="AddToCart_Click">Add to Cart</asp:LinkButton>
                <a href="DeliveryDetails.aspx" class="rent-btn">Rent now</a>
            </div>
        </div>

    </div>
</div>
</asp:Content>