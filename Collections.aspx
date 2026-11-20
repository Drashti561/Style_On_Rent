<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Collections.aspx.cs" Inherits="Style_On_Rent.Collections" %>








<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .collection-page {
            background-color: #ffffff;
            padding: 45px 45px 55px;
        }

        .collection-title {
            text-align: center;
            font-family: Georgia, serif;
            font-size: 26px;
            font-weight: 400;
            color: #4b1b1b;
            margin: 0 0 45px 0;
            letter-spacing: 0.3px;
        }

        .product-grid {
            max-width: 1100px;
            margin: 0 auto;
            display: grid;
            grid-template-columns: repeat(3, 1fr);
            gap: 45px 22px;
        }

        .product-card {
            background-color: #ffffff;
            text-align: center;
        }

        .product-image {
            width: 100%;
            height: 420px;
            object-fit: cover;
            display: block;
        }

        .product-name {
            font-family: Georgia, serif;
            font-size: 16px;
            color: #4b1b1b;
            margin-top: 20px;
            margin-bottom: 20px;
            font-weight: 400;
            letter-spacing: 0.3px;
        }

        .product-buttons {
            display: flex;
            justify-content: center;
            gap: 10px;
        }

        .view-btn {
            min-width: 130px;
            height: 40px;
            display: flex;
            align-items: center;
            justify-content: center;
            background-color: #5b0b0b;
            color: #ffffff;
            text-decoration: none;
            font-family: Arial, sans-serif;
            font-size: 11px;
            letter-spacing: 1.5px;
            text-transform: uppercase;
            transition: 0.3s;
            border: none;
            cursor: pointer;
            padding: 0 18px;
        }
        .view-btn:hover {
            background-color: #430707;
            color: #ffffff;
        }

        .rent-btn {
            min-width: 130px;
            height: 40px;
            display: flex;
            align-items: center;
            justify-content: center;
            background-color: #8a6818;
            color: #ffffff;
            text-decoration: none;
            font-family: Arial, sans-serif;
            font-size: 11px;
            letter-spacing: 1.5px;
            text-transform: uppercase;
            transition: 0.3s;
            border: none;
            cursor: pointer;
            padding: 0 18px;
        }
        .rent-btn:hover {
            background-color: #6e5212;
            color: #ffffff;
        }

        @media (max-width: 900px) {
            .collection-page { padding: 35px 25px 45px; }
            .product-grid { grid-template-columns: repeat(2, 1fr); gap: 40px 18px; }
            .product-image { height: 380px; }
        }

        @media (max-width: 600px) {
            .collection-page { padding: 25px 15px 35px; }
            .collection-title { font-size: 20px; margin-bottom: 30px; }
            .product-grid { grid-template-columns: 1fr; gap: 40px; }
            .product-image { height: 420px; }
        }
    </style>
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <section class="collection-page">

        <h2 class="collection-title">Curated Collections</h2>

        <div class="product-grid">

            <!-- 1. Mustard Yellow -->
            <div class="product-card">
                <img src="Images/yellow.jfif" class="product-image" alt="Mustard Yellow" />
                <div class="product-name">Mustard Yellow</div>
                <div class="product-buttons">
                    <a href="MustardYellowLehengas.aspx" class="view-btn">View More</a>
                    <a href="DeliveryDetails.aspx" class="rent-btn">Rent Now</a>
                </div>
            </div>

            <!-- 2. Navy Blue -->
            <div class="product-card">
                <img src="Images/Navy_3.jfif" class="product-image" alt="Navy Blue" />
                <div class="product-name">Navy Blue</div>
                <div class="product-buttons">
                    <a href="NavyBlueLehengas.aspx" class="view-btn">View More</a>
                    <a href="DeliveryDetails.aspx" class="rent-btn">Rent Now</a>
                </div>
            </div>

            <!-- 3. Ivory Chikankari -->
            <div class="product-card">
                <img src="Images/Pearl_1.jfif" class="product-image" alt="Ivory Chikankari" />
                <div class="product-name">Ivory Chikankari</div>
                <div class="product-buttons">
                    <a href="PearlEmbroideryCholi.aspx" class="view-btn">View More</a>
                    <a href="DeliveryDetails.aspx" class="rent-btn">Rent Now</a>
                </div>
            </div>

            <!-- 4. Emerald Zardozi -->
            <div class="product-card">
                <img src="Images/Mustard_4.jfif" class="product-image" alt="Emerald Zardozi" />
                <div class="product-name">Emerald Zardozi</div>
                <div class="product-buttons">
                    <a href="EmeraldZardosi.aspx" class="view-btn">View More</a>
                    <a href="DeliveryDetails.aspx" class="rent-btn">Rent Now</a>
                </div>
            </div>

            <!-- 5. Blush Floral -->
            <div class="product-card">
                <img src="Images/CCC.jfif" class="product-image" alt="Blush Floral" />
                <div class="product-name">Blush Floral</div>
                <div class="product-buttons">
                    <a href="BlushFloralApplique.aspx" class="view-btn">View More</a>
                    <a href="DeliveryDetails.aspx" class="rent-btn">Rent Now</a>
                </div>
            </div>

            <!-- 6. Classic Bridal Red -->
            <div class="product-card">
                <img src="Images/Blush_2.jfif" class="product-image" alt="Classic Bridal Red" />
                <div class="product-name">Classic Bridal Red</div>
                <div class="product-buttons">
                    <a href="BridalLehengas.aspx" class="view-btn">View More</a>
                    <a href="DeliveryDetails.aspx" class="rent-btn">Rent Now</a>
                </div>
            </div>

        </div>
    </section>

</asp:Content>