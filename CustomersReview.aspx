<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="CustomersReview.aspx.cs" Inherits="Style_On_Rent.CustomersReview" %>







<asp:Content ID="HeadContent" ContentPlaceHolderID="head" runat="server">
<style>
.stories-page { max-width: 1200px; margin: auto; padding: 50px 20px 70px; font-family: Georgia, serif; color: #4a3b3b; }
.stories-page .eyebrow { font-size: 10px; letter-spacing: 2px; color: #a17b35; margin: 0 0 8px; }
.stories-page h1 { font: normal 36px Georgia, serif; color: #2b2b2b; margin: 0 0 8px; }
.stories-page .subtitle { font-size: 12px; color: #8d777b; margin: 0 0 35px; max-width: 480px; line-height: 1.7; }

.stats-grid { display: grid; grid-template-columns: repeat(4, 1fr); gap: 25px; padding: 30px 0; border-top: 1px solid #f0e6e6; border-bottom: 1px solid #f0e6e6; margin-bottom: 35px; }
.stat-box { display: flex; flex-direction: column; gap: 6px; }
.stat-box .big-num { font: normal 34px Georgia, serif; color: #620019; }
.stat-box .stars-small { color: #d5ad2d; font-size: 13px; letter-spacing: 2px; }
.stat-box .stat-label { font-size: 10px; color: #8d777b; letter-spacing: 1px; }
.stat-box .bar { height: 5px; background: #eee; margin-top: 4px; position: relative; }
.stat-box .bar span { position: absolute; left: 0; top: 0; height: 100%; background: #a17b35; }

.btn-write { display: inline-block; background: #650019; color: #fff; padding: 13px 28px; text-decoration: none; font-size: 11px; font-weight: bold; letter-spacing: 1px; margin-bottom: 40px; }
.btn-write:hover { background: #450012; color: #fff; }

.filter-row { display: flex; align-items: center; gap: 10px; margin-bottom: 25px; flex-wrap: wrap; }
.filter-row label { font-size: 11px; color: #8d777b; letter-spacing: 1px; }
.filter-row select { padding: 8px 12px; border: 1px solid #ddd; font-family: Georgia, serif; font-size: 11px; color: #4a3b3b; background: #fff; outline: none; }
.filter-row .reset-btn { padding: 8px 16px; border: 1px solid #ddd; background: #fff; font-family: Georgia, serif; font-size: 11px; color: #8d777b; cursor: pointer; }

.section-heading { font: normal 22px Georgia, serif; color: #620019; margin: 0 0 25px; }

.reviews-grid { display: grid; grid-template-columns: 1fr 1fr; gap: 25px; }
.review-item { border: 1px solid #eee; padding: 25px; background: #fff; box-shadow: 0 2px 10px rgba(0,0,0,0.03); }
.review-header { display: flex; gap: 12px; align-items: center; margin-bottom: 12px; }
.review-header img { width: 42px; height: 42px; object-fit: cover; border-radius: 50%; background: #f5eeee; }
.review-header-info h4 { font: normal 13px Georgia, serif; color: #620019; margin: 0 0 3px; }
.review-header-info .review-stars { font-size: 11px; color: #d5ad2d; letter-spacing: 2px; }
.review-title { font: normal 15px Georgia, serif; color: #2b2b2b; margin: 8px 0 10px; }
.review-text { font-size: 12px; color: #8d777b; line-height: 1.7; margin: 0 0 12px; }
.review-meta { font-size: 10px; color: #a17b35; letter-spacing: 1px; }

.view-all-wrap { text-align: center; margin-top: 40px; }
.btn-view-all { display: inline-block; border: 1px solid #620019; color: #620019; padding: 13px 30px; text-decoration: none; font-size: 11px; font-weight: bold; letter-spacing: 1px; }
.btn-view-all:hover { background: #620019; color: #fff; }

@media(max-width: 750px) {
    .stats-grid { grid-template-columns: repeat(2, 1fr); }
    .reviews-grid { grid-template-columns: 1fr; }
}
</style>
</asp:Content>

<asp:Content ID="MainContent" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div class="stories-page">

    <p class="eyebrow">REVIEWS & RATINGS</p>
    <h1>Customer Stories</h1>
    <p class="subtitle">Explore honest experiences shared by our customers and discover your next favourite outfit.</p>

    <div class="stats-grid">
        <div class="stat-box">
            <div class="big-num">4.8</div>
            <div class="stars-small">★★★★★</div>
            <div class="stat-label">AVERAGE RATING</div>
        </div>
        <div class="stat-box">
            <div class="stat-label">5 STAR</div>
            <div class="bar"><span style="width:80%"></span></div>
            <div class="stat-label">80%</div>
        </div>
        <div class="stat-box">
            <div class="stat-label">4 STAR</div>
            <div class="bar"><span style="width:15%"></span></div>
            <div class="stat-label">15%</div>
        </div>
        <div class="stat-box">
            <div class="stat-label">3 STAR & BELOW</div>
            <div class="bar"><span style="width:5%"></span></div>
            <div class="stat-label">5%</div>
        </div>
    </div>

    <a href="YourExperience.aspx" class="btn-write">✎ WRITE A REVIEW</a>

    <div class="filter-row">
        <label>FILTER:</label>
        <select>
            <option>All Ratings</option>
            <option>5 Star</option>
            <option>4 Star</option>
            <option>3 Star & Below</option>
        </select>
        <button class="reset-btn">Reset Filters</button>
    </div>

    <h2 class="section-heading">Most Helpful</h2>

    <asp:Repeater ID="rptReviews" runat="server">
        <HeaderTemplate>
            <div class="reviews-grid">
        </HeaderTemplate>

        <ItemTemplate>
            <div class="review-item">
                <div class="review-header">
                    <img src="Images/Blush_1.jfif" alt="User" />
                    <div class="review-header-info">
                        <h4><%# Eval("Name") %></h4>
                        <div class="review-stars"><%# Eval("Stars") %></div>
                    </div>
                </div>
                <h3 class="review-title"><%# Eval("Title") %></h3>
                <p class="review-text"><%# Eval("Body") %></p>
                <div class="review-meta">VERIFIED PURCHASE • <%# Eval("Date") %></div>
            </div>
        </ItemTemplate>

        <FooterTemplate>
            </div>
        </FooterTemplate>
    </asp:Repeater>

    <div class="view-all-wrap">
        <a href="#" class="btn-view-all">VIEW ALL REVIEWS</a>
    </div>

</div>
</asp:Content>