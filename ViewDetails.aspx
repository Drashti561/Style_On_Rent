<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="ViewDetails.aspx.cs" Inherits="Style_On_Rent.ViewDetails" %>








<asp:Content ID="HeadContent" ContentPlaceHolderID="head" runat="server">
<style>
    .product-details-container {
        max-width: 1100px;
        margin: 40px auto;
        padding: 20px;
        font-family: 'Georgia', serif;
        color: #4a3b3b;
    }
    
    .breadcrumb {
        font-size: 12px;
        margin-bottom: 25px;
        color: #8d777b;
    }
    .breadcrumb a { color: #620019; text-decoration: none; }

    .product-grid {
        display: grid;
        grid-template-columns: 1fr 1fr;
        gap: 50px;
        align-items: start;
    }

    /* Left Image Section */
    .product-image-container {
        background: #fafafa;
        padding: 15px;
        border: 1px solid #eee;
        text-align: center;
    }
    .product-image-container img {
        width: 100%;
        max-height: 550px;
        object-fit: cover;
    }

    /* Right Info Section */
    .product-info-box {
        display: flex;
        flex-direction: column;
        gap: 18px;
    }

    .eyebrow {
        font-size: 11px;
        letter-spacing: 2px;
        color: #a17b35;
        text-transform: uppercase;
        margin: 0;
    }

    .product-title {
        font-size: 28px;
        color: #620019;
        margin: 0;
        font-weight: normal;
    }

    .product-price {
        font-size: 22px;
        font-weight: bold;
        color: #620019;
    }

    .divider {
        height: 1px;
        background-color: #f0e6e6;
        border: none;
        margin: 5px 0;
    }

    .detail-row {
        font-size: 13px;
        line-height: 1.6;
    }
    .detail-row strong {
        color: #620019;
    }

    /* Option Selection */
    .option-group {
        display: flex;
        flex-direction: column;
        gap: 8px;
    }
    .option-group label {
        font-size: 12px;
        font-weight: bold;
        color: #8d777b;
        letter-spacing: 0.5px;
    }

    .size-dropdown {
        padding: 10px;
        border: 1px solid #ddd;
        font-family: Georgia, serif;
        font-size: 13px;
        background: #fafafa;
        outline: none;
        width: 200px;
    }

    /* Buttons */
    .btn-action {
        display: inline-block;
        width: 100%;
        padding: 14px;
        background: #650019;
        color: #fff;
        text-align: center;
        text-decoration: none;
        font-size: 13px;
        font-weight: bold;
        letter-spacing: 1px;
        border: none;
        cursor: pointer;
        transition: background 0.3s ease;
    }
    .btn-action:hover {
        background: #450012;
        color: #fff;
    }

    @media (max-width: 768px) {
        .product-grid {
            grid-template-columns: 1fr;
            gap: 25px;
        }
    }
</style>
</asp:Content>

<asp:Content ID="MainContent" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div class="product-details-container">
    
    <div class="breadcrumb">
        <a href="Home.aspx">Home</a> / <a href="Products.aspx">Collection</a> / <asp:Label ID="lblBreadcrumb" runat="server" Text="Item Details"></asp:Label>
    </div>

    <div class="product-grid">
        
        <!-- Left Column: Image -->
        <div class="product-image-container">
            <asp:Image ID="imgProduct" runat="server" Alt="Product Image" />
        </div>

        <!-- Right Column: Details & Actions -->
        <div class="product-info-box">
            <p class="eyebrow">STYLE ON RENT • EXCLUSIVE</p>
            <h1 class="product-title"><asp:Label ID="lblProductName" runat="server"></asp:Label></h1>
            <div class="product-price"><asp:Label ID="lblPrice" runat="server"></asp:Label></div>

            <hr class="divider" />

            <div class="detail-row">
                <strong>Color:</strong> <asp:Label ID="lblColor" runat="server"></asp:Label>
            </div>

            <div class="detail-row">
                <strong>Rental Duration:</strong> 3 Days (Standard)
            </div>

            

            <hr class="divider" />

            <div class="detail-row">
                <strong>Description:</strong><br />
                <asp:Label ID="lblDescription" runat="server" Text="Premium designer wear suitable for weddings, festive occasions, and grand events. Maintained with dry cleaning and high hygiene standards."></asp:Label>
            </div>

        </div>

    </div>
</div>
</asp:Content>