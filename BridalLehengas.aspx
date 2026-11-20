<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="BridalLehengas.aspx.cs" Inherits="Style_On_Rent.BridalLehengas" %>






<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .bridal-page { width: 100%; background: #ffffff; padding: 38px 48px 45px; }
        .page-heading { text-align: center; margin-bottom: 32px; }
        .page-heading h1 {
            margin: 0; color: #620019;
            font-family: Georgia, "Times New Roman", serif;
            font-size: 25px; font-weight: normal;
        }
        .page-heading p {
            margin: 7px 0 0; color: #8b777a;
            font-size: 10px; letter-spacing: 0.4px;
        }
        .bridal-grid {
            width: 100%; max-width: 1100px; margin: 0 auto;
            display: grid; grid-template-columns: repeat(3, 1fr);
            gap: 28px 22px;
        }
        .product-card { width: 100%; text-align: center; }
        .product-image-box {
            position: relative; width: 100%; height: 330px;
            overflow: hidden; background: #f6f1ef;
        }
        .product-image-box img {
            width: 100%; height: 100%; display: block;
            object-fit: cover; transition: transform 0.35s ease;
        }
        .product-card:hover .product-image-box img { transform: scale(1.03); }

        .wishlist-btn {
            position: absolute; top: 9px; right: 9px;
            width: 25px; height: 25px;
            border-radius: 50%; background: #ffffff;
            display: flex; align-items: center; justify-content: center;
            color: #620019; font-size: 13px;
            box-shadow: 0 1px 5px rgba(0,0,0,0.12);
            cursor: pointer; border: none;
            text-decoration: none;
            padding: 0;
        }
        .wishlist-btn:hover { background: #620019; color: #fff; }

        .product-name {
            margin-top: 11px; color: #5a4447;
            font-family: Georgia, "Times New Roman", serif;
            font-size: 10px; min-height: 28px;
        }
        .product-price {
            margin-top: 4px; color: #620019;
            font-size: 10px; font-weight: bold;
        }
        .product-buttons {
            display: flex; width: 100%;
            margin-top: 10px; gap: 5px;
        }
        .product-buttons a,
        .product-buttons .rent-btn,
        .product-buttons .details-btn {
            flex: 1; height: 27px;
            display: flex; align-items: center; justify-content: center;
            text-decoration: none; font-size: 8px; font-weight: bold;
            letter-spacing: 0.3px; border: none; cursor: pointer;
        }
        .rent-btn { background: #620019; color: #ffffff; }
        .rent-btn:hover { background: #430012; color: #fff; }
        .details-btn { background: #d8b23f; color: #ffffff; }
        .details-btn:hover { background: #bd9827; color: #fff; }
        .view-all { text-align: center; margin-top: 38px; }
        .view-all a {
            display: inline-flex; align-items: center; justify-content: center;
            min-width: 115px; height: 28px;
            border: 1px solid #620019; color: #620019;
            text-decoration: none; font-size: 8px; font-weight: bold;
            letter-spacing: 0.4px;
        }
        .view-all a:hover { background: #620019; color: #ffffff; }
        @media (max-width: 900px) {
            .bridal-page { padding: 32px 25px 40px; }
            .bridal-grid { grid-template-columns: repeat(2, 1fr); gap: 25px 18px; }
            .product-image-box { height: 350px; }
        }
        @media (max-width: 600px) {
            .bridal-page { padding: 28px 15px 35px; }
            .page-heading h1 { font-size: 22px; }
            .bridal-grid { grid-template-columns: 1fr; max-width: 380px; }
            .product-image-box { height: 430px; }
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section class="bridal-page">

        <div class="page-heading">
            <h1>Bridal Lehengas</h1>
            <p>Discover our elegant collection of bridal lehengas</p>
        </div>

        <div class="bridal-grid">

            <div class="product-card">
                <div class="product-image-box">
                    <img src="Images/AAA.jfif" alt="Bridal Lehenga 1" />
                    <asp:LinkButton ID="btnWish1" runat="server" CssClass="wishlist-btn" CommandArgument="bridal_1" OnClick="AddToWishlist_Click">♡</asp:LinkButton>
                </div>
                <div class="product-name">Classic Red Bridal Lehenga</div>
                <div class="product-price">₹ 4,500 / Day</div>
                <div class="product-buttons">
                    <asp:LinkButton ID="btnAdd1" runat="server" CssClass="rent-btn" CommandArgument="bridal_1" OnClick="AddToCart_Click">Add to Cart</asp:LinkButton>
                    <a href="DeliveryDetails.aspx" class="details-btn">Rent now</a>
                </div>
            </div>

            <div class="product-card">
                <div class="product-image-box">
                    <img src="Images/BBB.jfif" alt="Bridal Lehenga 2" />
                    <asp:LinkButton ID="btnWish2" runat="server" CssClass="wishlist-btn" CommandArgument="bridal_2" OnClick="AddToWishlist_Click">♡</asp:LinkButton>
                </div>
                <div class="product-name">Royal Maroon Bridal Lehenga</div>
                <div class="product-price">₹ 5,000 / Day</div>
                <div class="product-buttons">
                    <asp:LinkButton ID="btnAdd2" runat="server" CssClass="rent-btn" CommandArgument="bridal_2" OnClick="AddToCart_Click">Add to Cart</asp:LinkButton>
                    <a href="DeliveryDetails.aspx" class="details-btn">Rent now</a>
                </div>
            </div>

            <div class="product-card">
                <div class="product-image-box">
                    <img src="Images/CCC.jfif" alt="Bridal Lehenga 3" />
                    <asp:LinkButton ID="btnWish3" runat="server" CssClass="wishlist-btn" CommandArgument="bridal_3" OnClick="AddToWishlist_Click">♡</asp:LinkButton>
                </div>
                <div class="product-name">Pink Embroidered Bridal Lehenga</div>
                <div class="product-price">₹ 4,800 / Day</div>
                <div class="product-buttons">
                    <asp:LinkButton ID="btnAdd3" runat="server" CssClass="rent-btn" CommandArgument="bridal_3" OnClick="AddToCart_Click">Add to Cart</asp:LinkButton>
                    <a href="DeliveryDetails.aspx" class="details-btn">Rent Now</a>
                </div>
            </div>

            <div class="product-card">
                <div class="product-image-box">
                    <img src="Images/DDD.jfif" alt="Bridal Lehenga 4" />
                    <asp:LinkButton ID="btnWish4" runat="server" CssClass="wishlist-btn" CommandArgument="bridal_4" OnClick="AddToWishlist_Click">♡</asp:LinkButton>
                </div>
                <div class="product-name">Traditional Green Bridal Lehenga</div>
                <div class="product-price">₹ 4,600 / Day</div>
                <div class="product-buttons">
                    <asp:LinkButton ID="btnAdd4" runat="server" CssClass="rent-btn" CommandArgument="bridal_4" OnClick="AddToCart_Click">Add to Cart</asp:LinkButton>
                    <a href="DeliveryDetails.aspx" class="details-btn">Rent Now</a>
                </div>
            </div>

            <div class="product-card">
                <div class="product-image-box">
                    <img src="Images/EEE.jfif" alt="Bridal Lehenga 5" />
                    <asp:LinkButton ID="btnWish5" runat="server" CssClass="wishlist-btn" CommandArgument="bridal_5" OnClick="AddToWishlist_Click">♡</asp:LinkButton>
                </div>
                <div class="product-name">Designer Red Bridal Lehenga</div>
                <div class="product-price">₹ 5,200 / Day</div>
                <div class="product-buttons">
                    <asp:LinkButton ID="btnAdd5" runat="server" CssClass="rent-btn" CommandArgument="bridal_5" OnClick="AddToCart_Click">Add to Cart</asp:LinkButton>
                    <a href="DeliveryDetails.aspx" class="details-btn">Rent Now</a>
                </div>
            </div>

            <div class="product-card">
                <div class="product-image-box">
                    <img src="Images/FFF.jfif" alt="Bridal Lehenga 6" />
                    <asp:LinkButton ID="btnWish6" runat="server" CssClass="wishlist-btn" CommandArgument="bridal_6" OnClick="AddToWishlist_Click">♡</asp:LinkButton>
                </div>
                <div class="product-name">Elegant Beige Bridal Lehenga</div>
                <div class="product-price">₹ 4,900 / Day</div>
                <div class="product-buttons">
                    <asp:LinkButton ID="btnAdd6" runat="server" CssClass="rent-btn" CommandArgument="bridal_6" OnClick="AddToCart_Click">Add To Cart</asp:LinkButton>
                    <a href="DeliveryDetails.aspx" class="details-btn">Rent Now</a>
                </div>
            </div>

        </div>

        <div class="view-all">
            <a href="#">VIEW ALL LEHENGAS</a>
        </div>

    </section>
</asp:Content>