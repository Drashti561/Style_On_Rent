<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Notification.aspx.cs" Inherits="Style_On_Rent.Notification" %>







<asp:Content ID="HeadContent" ContentPlaceHolderID="head" runat="server">
<style>
.notif-page {
    max-width: 1200px;
    margin: auto;
    padding: 45px 20px 70px;
    font-family: Georgia, serif;
    color: #4a3b3b;
}
.notif-layout {
    display: grid;
    grid-template-columns: 240px 1fr;
    gap: 45px;
    align-items: start;
}

/* Left sidebar */
.notif-side h2 {
    font: normal 22px Georgia, serif;
    color: #2b2b2b;
    margin: 0 0 22px;
}
.notif-side ul {
    list-style: none;
    padding: 0;
    margin: 0 0 30px;
}
.notif-side li {
    padding: 12px 0;
    font-size: 13px;
    color: #8d777b;
    cursor: pointer;
    border-bottom: 1px solid #f5eeee;
    display: flex;
    justify-content: space-between;
    align-items: center;
}
.notif-side li.active {
    color: #620019;
    font-weight: bold;
}
.notif-side li .count {
    font-size: 10px;
    color: #a17b35;
    background: #faf3e0;
    padding: 2px 8px;
    border-radius: 10px;
}
.side-card {
    background: #fafafa;
    border: 1px solid #eee;
    padding: 18px;
    font-size: 11px;
    color: #8d777b;
    line-height: 1.6;
}
.side-card strong {
    display: block;
    color: #620019;
    font-size: 12px;
    margin-bottom: 6px;
}
.side-card a {
    display: inline-block;
    margin-top: 10px;
    color: #620019;
    text-decoration: none;
    border-bottom: 1px solid #620019;
    font-size: 11px;
}

/* Right content */
.notif-main h3.section-title {
    font: normal 18px Georgia, serif;
    color: #620019;
    margin: 0 0 20px;
}

/* Priority actions cards */
.priority-grid {
    display: grid;
    grid-template-columns: 1fr 1fr;
    gap: 18px;
    margin-bottom: 40px;
}
.priority-card {
    padding: 22px 24px;
    color: #fff;
}
.priority-card.dark { background: #4a2b2b; }
.priority-card.gold { background: #f5e7c8; color: #4a2b2b; }
.priority-card h4 {
    font: normal 16px Georgia, serif;
    margin: 0 0 8px;
}
.priority-card p {
    font-size: 11px;
    line-height: 1.6;
    margin: 0 0 15px;
    opacity: 0.9;
}
.priority-card a {
    display: inline-block;
    padding: 8px 18px;
    font-size: 10px;
    font-weight: bold;
    letter-spacing: 1px;
    text-decoration: none;
    background: #d5ad2d;
    color: #4a2b2b;
}
.priority-card.gold a {
    background: #620019;
    color: #fff;
}

/* Recent activity */
.activity-list {
    display: flex;
    flex-direction: column;
    gap: 15px;
}
.activity-item {
    display: flex;
    gap: 15px;
    padding: 20px;
    background: #fff;
    border: 1px solid #eee;
    box-shadow: 0 2px 8px rgba(0,0,0,0.03);
    position: relative;
}
.activity-icon {
    width: 40px;
    height: 40px;
    border-radius: 50%;
    background: #faf3e0;
    display: flex;
    align-items: center;
    justify-content: center;
    font-size: 18px;
    flex-shrink: 0;
}
.activity-content {
    flex: 1;
}
.activity-content h4 {
    font: normal 14px Georgia, serif;
    color: #620019;
    margin: 0 0 6px;
}
.activity-content p {
    font-size: 11px;
    color: #8d777b;
    line-height: 1.6;
    margin: 0 0 10px;
}
.activity-content .thumb {
    display: flex;
    gap: 10px;
    align-items: center;
    margin-bottom: 10px;
}
.activity-content .thumb img {
    width: 50px;
    height: 65px;
    object-fit: cover;
}
.activity-content .thumb span {
    font-size: 11px;
    color: #4a3b3b;
}
.activity-actions {
    display: flex;
    gap: 8px;
}
.activity-actions a {
    padding: 7px 16px;
    font-size: 10px;
    font-weight: bold;
    letter-spacing: 1px;
    text-decoration: none;
    border: 1px solid #620019;
    color: #620019;
}
.activity-actions a.primary {
    background: #620019;
    color: #fff;
}
.activity-time {
    position: absolute;
    top: 18px;
    right: 20px;
    font-size: 10px;
    color: #a17b35;
    letter-spacing: 1px;
}

/* Load more */
.load-wrap { text-align: center; margin-top: 30px; }
.load-wrap a {
    display: inline-block;
    padding: 12px 35px;
    border: 1px solid #620019;
    color: #620019;
    text-decoration: none;
    font-size: 11px;
    font-weight: bold;
    letter-spacing: 1px;
}
.load-wrap a:hover { background: #620019; color: #fff; }

@media(max-width: 900px) {
    .notif-layout { grid-template-columns: 1fr; gap: 30px; }
    .priority-grid { grid-template-columns: 1fr; }
}
</style>
</asp:Content>

<asp:Content ID="MainContent" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div class="notif-page">
    <div class="notif-layout">

        <!-- LEFT SIDEBAR -->
        <div class="notif-side">
            <h2>Notifications</h2>
            <ul>
                <li class="active">All Notifications <span class="count">12</span></li>
                <li>Rentals <span class="count">4</span></li>
                <li>Payments <span class="count">3</span></li>
                <li>Suggestions <span class="count">5</span></li>
            </ul>

            <div class="side-card">
                <strong>Manage Notifications</strong>
                Need assistance with your scheduling or rental settings? Contact support.
                <a href="Contact.aspx">Contact support →</a>
            </div>
        </div>

        <!-- RIGHT MAIN -->
        <div class="notif-main">

            <!-- Priority Actions -->
            <h3 class="section-title">Priority Actions</h3>
            <div class="priority-grid">
                <div class="priority-card dark">
                    <h4>Return Required</h4>
                    <p>Please return your rented item. Requesting a deadline extension is not guaranteed.</p>
                    <a href="DeliveryDetails.aspx">VIEW ORDER</a>
                </div>
                <div class="priority-card gold">
                    <h4>Pricing Reminder</h4>
                    <p>Your booking for the Rajwada Lehenga is due to be returned by 15 Oct. Late fees apply after 6 PM.</p>
                    <a href="ViewDetails.aspx">VIEW DETAILS</a>
                </div>
            </div>

            <!-- Recent Activity -->
            <h3 class="section-title">Recent Activity</h3>
            <div class="activity-list">

                <!-- Item 1 -->
                <div class="activity-item">
                    <div class="activity-icon">📦</div>
                    <div class="activity-content">
                        <h4>Rental Dispatched</h4>
                        <p>Your order has been dispatched to you. Please ensure you're available on the mentioned delivery date.</p>
                        <div class="thumb">
                            <img src="Images/Navy_4.jfif" alt="Product" />
                            <span>Traditional Navy Silk<br />Order #RNTL-8X92-XCVB</span>
                        </div>
                        
                    </div>
                    <div class="activity-time">12:45 PM</div>
                </div>

                <!-- Item 2 -->
                <div class="activity-item">
                    <div class="activity-icon">✅</div>
                    <div class="activity-content">
                        <h4>Rental Confirmed</h4>
                        <p>Your booking for the Blush Floral Lehenga is confirmed at the Boutique location.</p>
                        <div class="thumb">
                            <img src="Images/Blush_2.jfif" alt="Product" />
                            <span>Elegant Embroidered Blush Lehenga<br />Order #RNTL-8X92-XCVB</span>
                        </div>
                        <div class="activity-actions">
                            <a href="ViewDetails.aspx" class="primary">VIEW DETAILS</a>
                        </div>
                    </div>
                  
                </div>

                <!-- Item 3 -->
                <div class="activity-item">
                    <div class="activity-icon">🎁</div>
                    <div class="activity-content">
                        <h4>Exclusive Offer</h4>
                        <p>As a valued client, enjoy a complimentary accessory rental with your next rental order.</p>
                        
                    </div>
                    <div class="activity-time">09:15 AM</div>
                </div>

            </div>

            <!-- Load More -->
            <div class="load-wrap">
                <a href="#">LOAD MORE</a>
            </div>

        </div>
    </div>
</div>
</asp:Content>

