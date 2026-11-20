<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="NavyBlueLehengas.aspx.cs" Inherits="Style_On_Rent.NavyBlueLehengas" %>






<asp:Content ID="HeadContent" ContentPlaceHolderID="head" runat="server">
<style>
.collection{max-width:1200px;margin:auto;padding:28px 20px 40px}
.eyebrow{text-align:center;color:#a17b35;font-size:10px;letter-spacing:2px}
.heading{text-align:center;color:#650019;font:normal 30px Georgia,serif;margin:8px 0 25px}
.products{display:grid;grid-template-columns:repeat(3,minmax(0,1fr));gap:24px 18px}
.product{text-align:center;min-width:0;position:relative}
.product img{display:block;width:100%;height:285px;object-fit:cover}
.product h3{font:normal 14px Georgia,serif;color:#570018;margin:10px 0 5px}
.price{color:#650019;font-size:11px;margin:0 0 10px}

.wishlist-btn{
    position:absolute;top:8px;right:8px;
    width:26px;height:26px;background:#fff;
    border-radius:50%;display:flex;align-items:center;justify-content:center;
    color:#620019;font-size:14px;box-shadow:0 1px 5px rgba(0,0,0,.15);
    cursor:pointer;border:none;text-decoration:none;padding:0;z-index:2;
}
.wishlist-btn:hover{background:#620019;color:#fff}

.actions{display:flex;gap:5px}
.actions a,
.actions .cart-btn,
.actions .rent-btn{
    flex:1;padding:8px 3px;color:white;text-decoration:none;font-size:9px;font-weight:bold;
    border:none;cursor:pointer;display:flex;align-items:center;justify-content:center;
}
.cart-btn{background:#650019}
.cart-btn:hover{background:#450012;color:#fff}
.rent-btn{background:#d5ad2d}
.rent-btn:hover{background:#bd9827;color:#fff}

@media(max-width:650px){.products{grid-template-columns:repeat(2,minmax(0,1fr));gap:20px 12px}.heading{font-size:25px}}
</style>
</asp:Content>

<asp:Content ID="MainContent" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<section class="collection">
<p class="eyebrow">THE WEDDING EDIT</p>
<h1 class="heading">Navy Blue Lehengas</h1>
<div class="products">

<div class="product">
<img src="Images/Navy_1.jfif" alt="Royal Midnight Lehenga"/>
<asp:LinkButton ID="btnWish1" runat="server" CssClass="wishlist-btn" CommandArgument="navy_1" OnClick="AddToWishlist_Click">♡</asp:LinkButton>
<h3>Royal Midnight Lehenga</h3>
<p class="price">₹ 5,499 / rental</p>
<div class="actions">
<asp:LinkButton ID="btnAdd1" runat="server" CssClass="cart-btn" CommandArgument="navy_1" OnClick="AddToCart_Click">Add to Cart</asp:LinkButton>
<a href="DeliveryDetails.aspx" class="rent-btn">Rent now</a>
</div>
</div>

<div class="product">
<img src="Images/Navy_2.jfif" alt="Blue Zari Floral Lehenga"/>
<asp:LinkButton ID="btnWish2" runat="server" CssClass="wishlist-btn" CommandArgument="navy_2" OnClick="AddToWishlist_Click">♡</asp:LinkButton>
<h3>Blue Zari Floral Lehenga</h3>
<p class="price">₹ 4,899 / rental</p>
<div class="actions">
<asp:LinkButton ID="btnAdd2" runat="server" CssClass="cart-btn" CommandArgument="navy_2" OnClick="AddToCart_Click">Add to Cart</asp:LinkButton>
<a href="DeliveryDetails.aspx" class="rent-btn">Rent now</a>
</div>
</div>

<div class="product">
<img src="Images/Navy_3.jfif" alt="Navy Blue Regal Ensemble"/>
<asp:LinkButton ID="btnWish3" runat="server" CssClass="wishlist-btn" CommandArgument="navy_3" OnClick="AddToWishlist_Click">♡</asp:LinkButton>
<h3>Navy Blue Regal Ensemble</h3>
<p class="price">₹ 5,299 / rental</p>
<div class="actions">
<asp:LinkButton ID="btnAdd3" runat="server" CssClass="cart-btn" CommandArgument="navy_3" OnClick="AddToCart_Click">Add to Cart</asp:LinkButton>
<a href="DeliveryDetails.aspx" class="rent-btn">Rent now</a>
</div>
</div>

<div class="product">
<img src="Images/Navy_4.jfif" alt="Traditional Navy Silk"/>
<asp:LinkButton ID="btnWish4" runat="server" CssClass="wishlist-btn" CommandArgument="navy_4" OnClick="AddToWishlist_Click">♡</asp:LinkButton>
<h3>Traditional Navy Silk</h3>
<p class="price">₹ 4,799 / rental</p>
<div class="actions">
<asp:LinkButton ID="btnAdd4" runat="server" CssClass="cart-btn" CommandArgument="navy_4" OnClick="AddToCart_Click">Add to Cart</asp:LinkButton>
<a href="DeliveryDetails.aspx" class="rent-btn">Rent now</a>
</div>
</div>

<div class="product">
<img src="Images/Navy_5.jfif" alt="Royal Blue Heritage"/>
<asp:LinkButton ID="btnWish5" runat="server" CssClass="wishlist-btn" CommandArgument="navy_5" OnClick="AddToWishlist_Click">♡</asp:LinkButton>
<h3>Royal Blue Heritage</h3>
<p class="price">₹ 5,199 / rental</p>
<div class="actions">
<asp:LinkButton ID="btnAdd5" runat="server" CssClass="cart-btn" CommandArgument="navy_5" OnClick="AddToCart_Click">Add to Cart</asp:LinkButton>
<a href="DeliveryDetails.aspx" class="rent-btn">Rent now</a>
</div>
</div>

<div class="product">
<img src="Images/Navy_6.jfif" alt="Midnight Blue Work"/>
<asp:LinkButton ID="btnWish6" runat="server" CssClass="wishlist-btn" CommandArgument="navy_6" OnClick="AddToWishlist_Click">♡</asp:LinkButton>
<h3>Midnight Blue Work</h3>
<p class="price">₹ 4,999 / rental</p>
<div class="actions">
<asp:LinkButton ID="btnAdd6" runat="server" CssClass="cart-btn" CommandArgument="navy_6" OnClick="AddToCart_Click">Add to Cart</asp:LinkButton>
<a href="DeliveryDetails.aspx" class="rent-btn">Rent now</a>
</div>
</div>

</div>
</section>
</asp:Content>