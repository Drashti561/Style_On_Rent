<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="BlushFloralApplique.aspx.cs" Inherits="Style_On_Rent.BlushFloralApplique" %>








<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .floral-page { width: 100%; background: #fff; padding: 32px 48px 40px; }
        .page-heading { text-align: center; margin-bottom: 28px; }
        .page-heading h1 {
            margin: 0; color: #620019;
            font-family: Georgia, "Times New Roman", serif;
            font-size: 24px; font-weight: normal;
        }
        .page-heading p { margin: 6px 0 0; color: #8d777b; font-size: 9px; }
        .product-grid {
            width: 100%; max-width: 1050px; margin: auto;
            display: grid; grid-template-columns: repeat(3, 1fr);
            gap: 24px 20px;
        }
        .product-card { width: 100%; text-align: center; }
        .product-image {
            position: relative; width: 100%; height: 285px;
            overflow: hidden; background: #f5eeee;
        }
        .product-image img {
            width: 100%; height: 100%; display: block;
            object-fit: cover; transition: transform .3s ease;
        }
        .product-card:hover .product-image img { transform: scale(1.03); }
        .wishlist-btn {
            position: absolute; top: 7px; right: 7px;
            width: 23px; height: 23px; background: #fff;
            border-radius: 50%; display: flex;
            align-items: center; justify-content: center;
            color: #620019; font-size: 14px;
            box-shadow: 0 1px 5px rgba(0,0,0,.15);
            cursor: pointer; border: none;
            text-decoration: none; padding: 0;
        }
        .wishlist-btn:hover { background: #620019; color: #fff; }
        .product-name {
            margin-top: 8px; min-height: 25px;
            color: #594447;
            font-family: Georgia, "Times New Roman", serif;
            font-size: 9px;
        }
        .product-price {
            margin-top: 3px; color: #620019;
            font-size: 8px; font-weight: bold;
        }
        .product-buttons {
            width: 100%; display: flex; gap: 4px; margin-top: 8px;
        }
        .product-buttons a,
        .product-buttons .rent-btn,
        .product-buttons .details-btn {
            flex: 1; height: 25px;
            display: flex; align-items: center; justify-content: center;
            text-decoration: none; font-size: 7px; font-weight: bold;
            border: none; cursor: pointer;
        }
        .rent-btn { background: #620019; color: white; }
        .rent-btn:hover { background: #450012; color: #fff; }
        .details-btn { background: #d7b13b; color: white; }
        .details-btn:hover { background: #bd9827; color: #fff; }
        .view-all { text-align: center; margin-top: 30px; }
        .view-all a {
            display: inline-flex; align-items: center; justify-content: center;
            height: 26px; padding: 0 18px;
            border: 1px solid #620019; color: #620019;
            text-decoration: none; font-size: 7px; font-weight: bold;
        }
        .view-all a:hover { background: #620019; color: #fff; }
        @media(max-width:900px) {
            .floral-page { padding: 30px 25px; }
            .product-grid { grid-template-columns: repeat(2,1fr); }
            .product-image { height: 330px; }
        }
        @media(max-width:600px) {
            .floral-page { padding: 25px 15px; }
            .product-grid { grid-template-columns: 1fr; max-width: 380px; }
            .product-image { height: 430px; }
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section class="floral-page">

        <div class="page-heading">
            <h1>Blush Floral Applique</h1>
            <p>Discover our elegant floral bridal collection</p>
        </div>

        <div class="product-grid">

            <div class="product-card">
                <div class="product-image">
                    <img src="Images/Blush_1.jfif" alt="Rose Quartz Floral Lehenga" />
                    <asp:LinkButton ID="btnWish1" runat="server" CssClass="wishlist-btn" CommandArgument="blush_1" OnClick="AddToWishlist_Click">♡</asp:LinkButton>
                </div>
                <div class="product-name">Rose Quartz Floral Lehenga</div>
                <div class="product-price">₹ 4,500 / Day</div>
                <div class="product-buttons">
                    <asp:LinkButton ID="btnAdd1" runat="server" CssClass="rent-btn" CommandArgument="blush_1" OnClick="AddToCart_Click">Add to Cart</asp:LinkButton>
                    <a href="DeliveryDetails.aspx" class="details-btn">Rent now</a>
                </div>
            </div>

            <div class="product-card">
                <div class="product-image">
                    <img src="Images/Blush_2.jfif" alt="Petal Pink Organza Lehenga" />
                    <asp:LinkButton ID="btnWish2" runat="server" CssClass="wishlist-btn" CommandArgument="blush_2" OnClick="AddToWishlist_Click">♡</asp:LinkButton>
                </div>
                <div class="product-name">Petal Pink Organza Lehenga</div>
                <div class="product-price">₹ 4,800 / Day</div>
                <div class="product-buttons">
                    <asp:LinkButton ID="btnAdd2" runat="server" CssClass="rent-btn" CommandArgument="blush_2" OnClick="AddToCart_Click">Add to Cart</asp:LinkButton>
                    <a href="DeliveryDetails.aspx" class="details-btn">Rent now</a>
                </div>
            </div>

            <div class="product-card">
                <div class="product-image">
                    <img src="Images/Blush_3.jfif" alt="Blush Shimmer Lehenga" />
                    <asp:LinkButton ID="btnWish3" runat="server" CssClass="wishlist-btn" CommandArgument="blush_3" OnClick="AddToWishlist_Click">♡</asp:LinkButton>
                </div>
                <div class="product-name">Blush Shimmer Lehenga</div>
                <div class="product-price">₹ 4,700 / Day</div>
                <div class="product-buttons">
                    <asp:LinkButton ID="btnAdd3" runat="server" CssClass="rent-btn" CommandArgument="blush_3" OnClick="AddToCart_Click">Add to Cart</asp:LinkButton>
                    <a href="DeliveryDetails.aspx" class="details-btn">Rent now</a>
                </div>
            </div>

            <div class="product-card">
                <div class="product-image">
                    <img src="Images/Blush_4.jfif" alt="Rose Gold Draped Lehenga" />
                    <asp:LinkButton ID="btnWish4" runat="server" CssClass="wishlist-btn" CommandArgument="blush_4" OnClick="AddToWishlist_Click">♡</asp:LinkButton>
                </div>
                <div class="product-name">Rose Gold Draped Lehenga</div>
                <div class="product-price">₹ 4,600 / Day</div>
                <div class="product-buttons">
                    <asp:LinkButton ID="btnAdd4" runat="server" CssClass="rent-btn" CommandArgument="blush_4" OnClick="AddToCart_Click">Add to Cart</asp:LinkButton>
                    <a href="DeliveryDetails.aspx" class="details-btn">Rent now</a>
                </div>
            </div>

            <div class="product-card">
                <div class="product-image">
                    <img src="Images/Blush_5.jfif" alt="Classic Blush Floral Lehenga" />
                    <asp:LinkButton ID="btnWish5" runat="server" CssClass="wishlist-btn" CommandArgument="blush_5" OnClick="AddToWishlist_Click">♡</asp:LinkButton>
                </div>
                <div class="product-name">Classic Blush Floral Lehenga</div>
                <div class="product-price">₹ 4,900 / Day</div>
                <div class="product-buttons">
                    <asp:LinkButton ID="btnAdd5" runat="server" CssClass="rent-btn" CommandArgument="blush_5" OnClick="AddToCart_Click">Add to Cart</asp:LinkButton>
                    <a href="DeliveryDetails.aspx" class="details-btn">Rent now</a>
                </div>
            </div>

            <div class="product-card">
                <div class="product-image">
                    <img src="Images/Blush_6.jfif" alt="The Aura Floral Ensemble" />
                    <asp:LinkButton ID="btnWish6" runat="server" CssClass="wishlist-btn" CommandArgument="blush_6" OnClick="AddToWishlist_Click">♡</asp:LinkButton>
                </div>
                <div class="product-name">The Aura Floral Ensemble</div>
                <div class="product-price">₹ 5,000 / Day</div>
                <div class="product-buttons">
                    <asp:LinkButton ID="btnAdd6" runat="server" CssClass="rent-btn" CommandArgument="blush_6" OnClick="AddToCart_Click">Add to Cart</asp:LinkButton>
                    <a href="DeliveryDetails.aspx" class="details-btn">Rent now</a>
                </div>
            </div>

        </div>

        <div class="view-all">
            <a href="#">VIEW ALL LEHENGAS</a>
        </div>

    </section>
</asp:Content>