<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="home.aspx.cs" Inherits="Style_On_Rent.home" %>



 




<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <style>

        /* HERO SECTION */

        .hero-section {
            width: 100%;
            min-height: 430px;
            background-image: linear-gradient(
                rgba(0,0,0,0.25),
                rgba(0,0,0,0.25)
            ),
            url('Images/new-arrivals.jpg.png');

            background-size: cover;
            background-position: center;
            display: flex;
            align-items: center;
            justify-content: center;
            text-align: center;
        }

        .hero-content {
            color: white;
            max-width: 700px;
        }

        .hero-content h1 {
            font-size: 48px;
            font-weight: bold;
            margin-bottom: 15px;
        }

        .hero-content p {
            font-size: 18px;
            margin-bottom: 25px;
        }

        .hero-btn {
            background-color: #800020;
            color: white;
            padding: 12px 30px;
            border-radius: 5px;
            text-decoration: none;
            display: inline-block;
        }

        .hero-btn:hover {
            background-color: #D4AF37;
            color: white;
        }


        /* SECTION */

        .home-section {
            padding: 50px 50px;
            text-align: center;
        }

        .section-title {
            color: #800020;
            font-size: 28px;
            font-weight: bold;
            margin-bottom: 10px;
        }

        .section-subtitle {
            color: #666;
            margin-bottom: 30px;
        }


        /* NEW COLLECTION (2 cards) */

        .new-collection-container {
            display: grid;
            grid-template-columns: repeat(2, 1fr);
            gap: 25px;
        }

        .new-collection-card {
            position: relative;
            height: 480px;
            overflow: hidden;
            border-radius: 12px;
            box-shadow: 0 3px 15px rgba(0,0,0,0.12);
            cursor: pointer;
        }

        .new-collection-card img {
            width: 100%;
            height: 100%;
            object-fit: cover;
            transition: transform 0.6s ease;
        }

        .new-collection-card:hover img {
            transform: scale(1.05);
        }

        .new-collection-card .overlay {
            position: absolute;
            bottom: 40px;
            left: 0;
            right: 0;
            text-align: center;
        }

        .new-collection-card .overlay h3 {
            font-size: 22px;
            color: white;
            font-weight: 400;
            margin-bottom: 12px;
            letter-spacing: 1px;
            text-shadow: 0 2px 8px rgba(0,0,0,0.5);
        }

        .new-collection-card .overlay a {
            display: inline-block;
            padding: 10px 26px;
            background: white;
            color: #800020;
            text-decoration: none;
            font-size: 11px;
            letter-spacing: 2px;
            text-transform: uppercase;
            border-radius: 4px;
        }


        /* CURATED COLLECTIONS (3 columns) */

        .curated-container {
            display: grid;
            grid-template-columns: repeat(3, 1fr);
            gap: 30px 22px;
        }

        .curated-card {
            text-align: center;
        }

        .curated-card .img-box {
            width: 100%;
            height: 380px;
            overflow: hidden;
            background: #f5eeee;
            border-radius: 12px;
            margin-bottom: 18px;
        }

        .curated-card .img-box img {
            width: 100%;
            height: 100%;
            object-fit: cover;
            transition: transform 0.5s ease;
        }

        .curated-card:hover .img-box img {
            transform: scale(1.05);
        }

        .curated-card h3 {
            font-size: 16px;
            font-weight: 400;
            color: #4b1b1b;
            margin-bottom: 14px;
            min-height: 40px;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .product-buttons {
            display: flex;
            justify-content: center;
            gap: 10px;
        }

        .product-buttons a {
            padding: 10px 20px;
            font-size: 10px;
            letter-spacing: 1.5px;
            text-transform: uppercase;
            text-decoration: none;
            border-radius: 4px;
            transition: all 0.3s ease;
        }

        .btn-view {
            background: #800020;
            color: white;
        }

        .btn-view:hover {
            background: #430707;
        }

        .btn-rent {
            background: #D4AF37;
            color: white;
        }

        .btn-rent:hover {
            background: #b3901f;
        }


        /* WHY CHOOSE US */

        .why-section {
            background-color: #fff8f5;
            padding: 50px;
            text-align: center;
        }

        .why-container {
            display: grid;
            grid-template-columns: repeat(3, 1fr);
            gap: 25px;
        }

        .why-card {
            background: white;
            padding: 30px 20px;
            border-radius: 12px;
            box-shadow: 0 3px 12px rgba(0,0,0,0.08);
        }

        .why-card h3 {
            color: #800020;
            margin-bottom: 10px;
        }

        .why-card p {
            color: #666;
        }


        /* RESPONSIVE */

        @media (max-width: 1000px) {
            .curated-container { grid-template-columns: repeat(2, 1fr); }
        }

        @media (max-width: 768px) {

            .hero-content h1 { font-size: 32px; }

            .new-collection-container,
            .curated-container,
            .why-container {
                grid-template-columns: 1fr;
            }

            .new-collection-card { height: 400px; }

            .home-section,
            .why-section {
                padding: 30px 20px;
            }
        }

    </style>

</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <!-- HERO -->

    <section class="hero-section">

        <div class="hero-content">

            <h1>NEW ARRIVALS</h1>

            <p>
                Explore our newly added premium collections,
                perfect for your special moments.
            </p>

            <a href="Collections.aspx" class="hero-btn">
                SHOP NOW
            </a>

        </div>

    </section>


    <!-- OUR NEW COLLECTION -->

    <section class="home-section">

        <h2 class="section-title">
            Our New Collection
        </h2>

        <p class="section-subtitle">
            Discover timeless elegance and royal heritage
        </p>


        <div class="new-collection-container">

            <div class="new-collection-card">

                <img src="Images/EEE.jfif" alt="Timeless Elegance" />

                <div class="overlay">
                    <h3>Timeless Elegance</h3>
                    <a href="Collections.aspx">View More</a>
                </div>

            </div>


            <div class="new-collection-card">

                <img src="Images/choli4.jpg" alt="Royal Heritage" />

                <div class="overlay">
                    <h3>Royal Heritage</h3>
                    <a href="Collections.aspx">View More</a>
                </div>

            </div>

        </div>

    </section>


    <!-- CURATED COLLECTIONS -->

    <section class="home-section" style="background:#fdf8f5;">

        <h2 class="section-title">
            Curated Collections
        </h2>

        <p class="section-subtitle">
            Choose your favourite design
        </p>


        <div class="curated-container">

            <div class="curated-card">
                <div class="img-box">
                    <img src="Images/Navy_3.jfif" alt="Bridal Yellow" />
                </div>
                <h3>Bridal Yellow</h3>
                <div class="product-buttons">
                    <a href="Collections.aspx" class="btn-view">View More</a>
                    <a href="ShoppingDetails.aspx" class="btn-rent">Rent Now</a>
                </div>
            </div>

            <div class="curated-card">
                <div class="img-box">
                    <img src="Images/Pearl_1.jfif" alt="Navy Blue" />
                </div>
                <h3>Navy Blue</h3>
                <div class="product-buttons">
                    <a href="Collections.aspx" class="btn-view">View More</a>
                    <a href="ShoppingDetails.aspx" class="btn-rent">Rent Now</a>
                </div>
            </div>

            <div class="curated-card">
                <div class="img-box">
                    <img src="Images/Mustard_4.jfif" alt="Ivory Chikankari" />
                </div>
                <h3>Ivory Chikankari</h3>
                <div class="product-buttons">
                    <a href="Collections.aspx" class="btn-view">View More</a>
                    <a href="ShoppingDetails.aspx" class="btn-rent">Rent Now</a>
                </div>
            </div>

            <div class="curated-card">
                <div class="img-box">
                    <img src="Images/yellow.jfif" alt="Emerald Zardozi" />
                </div>
                <h3>Emerald Zardozi</h3>
                <div class="product-buttons">
                    <a href="Collections.aspx" class="btn-view">View More</a>
                    <a href="ShoppingDetails.aspx" class="btn-rent">Rent Now</a>
                </div>
            </div>

            <div class="curated-card">
                <div class="img-box">
                    <img src="Images/CCC.jfif" alt="Blush Floral" />
                </div>
                <h3>Blush Floral</h3>
                <div class="product-buttons">
                    <a href="Collections.aspx" class="btn-view">View More</a>
                    <a href="ShoppingDetails.aspx" class="btn-rent">Rent Now</a>
                </div>
            </div>

            <div class="curated-card">
                <div class="img-box">
                    <img src="Images/Blush_2.jfif" alt="Classic Bridal Red" />
                </div>
                <h3>Classic Bridal Red</h3>
                <div class="product-buttons">
                    <a href="Collections.aspx" class="btn-view">View More</a>
                    <a href="ShoppingDetails.aspx" class="btn-rent">Rent Now</a>
                </div>
            </div>

        </div>

    </section>


    <!-- WHY CHOOSE US -->

    <section class="why-section">

        <h2 class="section-title">
            Why Choose Rental Choli?
        </h2>

        <div class="why-container">

            <div class="why-card">
                <h3>Premium Quality</h3>
                <p>High quality designer cholis for your special occasions.</p>
            </div>

            <div class="why-card">
                <h3>Affordable Rental</h3>
                <p>Get designer outfits at affordable rental prices.</p>
            </div>

            <div class="why-card">
                <h3>Easy Booking</h3>
                <p>Simple and easy online rental booking process.</p>
            </div>

        </div>

    </section>


</asp:Content>