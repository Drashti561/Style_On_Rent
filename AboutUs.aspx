<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="AboutUs.aspx.cs" Inherits="Style_On_Rent.AboutUs" %>









<asp:Content ID="HeadContent" ContentPlaceHolderID="head" runat="server">
<style>
.about-page {
    max-width: 1200px;
    margin: auto;
    padding: 40px 20px 60px;
    font-family: Georgia, serif;
    color: #4a3b3b;
}
.about-eyebrow {
    font-size: 10px;
    letter-spacing: 2px;
    color: #a17b35;
    margin: 0 0 8px;
}
.about-page h1 {
    font: normal 44px Georgia, serif;
    color: #2b2b2b;
    margin: 0 0 20px;
}
.about-intro {
    font-size: 13px;
    color: #8d777b;
    line-height: 1.8;
    max-width: 700px;
    margin: 0 0 50px;
}

/* Feature cards */
.feature-grid {
    display: grid;
    grid-template-columns: repeat(3, 1fr);
    gap: 20px;
    margin-bottom: 60px;
}
.feature-card {
    background: #fff;
    border: 1px solid #f0e6e6;
    padding: 28px 25px;
    box-shadow: 0 2px 10px rgba(0,0,0,0.03);
}
.feature-card .icon {
    font-size: 22px;
    color: #620019;
    margin-bottom: 12px;
    display: block;
}
.feature-card h4 {
    font: normal 15px Georgia, serif;
    color: #2b2b2b;
    margin: 0 0 10px;
}
.feature-card p {
    font-size: 11px;
    color: #8d777b;
    line-height: 1.7;
    margin: 0;
}

/* Get in Touch section */
.touch-section {
    display: grid;
    grid-template-columns: 1fr 1.3fr;
    gap: 50px;
    align-items: start;
    padding-top: 40px;
    border-top: 1px solid #f0e6e6;
}
.touch-left h2 {
    font: normal 34px Georgia, serif;
    color: #2b2b2b;
    margin: 0 0 15px;
}
.touch-left > p {
    font-size: 12px;
    color: #8d777b;
    line-height: 1.7;
    margin: 0 0 35px;
}
.contact-item {
    margin-bottom: 25px;
}
.contact-item .label {
    font-size: 10px;
    letter-spacing: 2px;
    color: #a17b35;
    margin-bottom: 5px;
    text-transform: uppercase;
}
.contact-item .value {
    font-size: 14px;
    color: #620019;
    font-weight: bold;
    text-decoration: none;
    display: block;
}
.contact-item .sub {
    font-size: 11px;
    color: #8d777b;
    margin-top: 3px;
}
.btn-showroom {
    display: inline-block;
    margin-top: 15px;
    padding: 11px 22px;
    background: #620019;
    color: #fff;
    font-size: 10px;
    font-weight: bold;
    letter-spacing: 1px;
    text-decoration: none;
}
.btn-showroom:hover {
    background: #450012;
}

/* Contact form */
.contact-form {
    background: #fff;
    border: 1px solid #f0e6e6;
    padding: 30px 32px;
    box-shadow: 0 2px 12px rgba(0,0,0,0.04);
}
.form-row {
    display: grid;
    grid-template-columns: 1fr 1fr;
    gap: 18px;
    margin-bottom: 18px;
}
.form-group {
    display: flex;
    flex-direction: column;
}
.form-group label {
    font-size: 10px;
    letter-spacing: 1.5px;
    color: #8d777b;
    margin-bottom: 6px;
    text-transform: uppercase;
}
.form-group input,
.form-group textarea {
    padding: 11px 13px;
    border: 1px solid #e5e5e5;
    font-family: Georgia, serif;
    font-size: 12px;
    color: #4a3b3b;
    background: #fafafa;
    outline: none;
    box-sizing: border-box;
}
.form-group input:focus,
.form-group textarea:focus {
    border-color: #a17b35;
    background: #fff;
}
.form-group textarea {
    resize: vertical;
    min-height: 90px;
}
.btn-send {
    display: inline-block;
    padding: 12px 28px;
    background: #d5ad2d;
    color: #fff;
    font-size: 11px;
    font-weight: bold;
    letter-spacing: 2px;
    border: none;
    cursor: pointer;
    font-family: Georgia, serif;
    margin-top: 5px;
}
.btn-send:hover {
    background: #c19c1f;
}

@media(max-width: 850px) {
    .feature-grid { grid-template-columns: 1fr; }
    .touch-section { grid-template-columns: 1fr; gap: 35px; }
    .form-row { grid-template-columns: 1fr; }
    .about-page h1 { font-size: 34px; }
}
</style>
</asp:Content>

<asp:Content ID="MainContent" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div class="about-page">

    <p class="about-eyebrow">HOME / ABOUT US</p>
    <p class="about-eyebrow" style="margin-bottom:6px;">HERITAGE & CRAFTSMANSHIP</p>

    <h1>About Us</h1>
    <p class="about-intro">
        Style On Rent curates authentic bridal lehengas, heritage cholis, and royal festive ensembles
        with impeccable fittings and pristine dry-cleaning — offering mindful luxury rentals for
        every celebration nationwide.
    </p>

    <!-- Feature cards -->
    <div class="feature-grid">
        <div class="feature-card">
            <span class="icon">👑</span>
            <h4>100% Authentic Heritage</h4>
            <p>Woven with pure zari, hand embroidery and authentic materials for true heirloom energy.</p>
        </div>
        <div class="feature-card">
            <span class="icon">✨</span>
            <h4>Doorstep Alterations</h4>
            <p>Complimentary fittings and alterations so you look picture perfect at every event.</p>
        </div>
        <div class="feature-card">
            <span class="icon">🛡</span>
            <h4>Sanitised Assurance</h4>
            <p>Every garment undergoes professional dry-clean and sanitisation before each rental.</p>
        </div>
    </div>

    <!-- Get in Touch -->
    <div class="touch-section">

        <!-- Left: contact info -->
        <div class="touch-left">
            <h2>Get in Touch</h2>
            <p>Have questions about rentals, custom fitting, or wholesale ties? Our concierge team is here to assist.</p>

            <div class="contact-item">
                <div class="label">Phone</div>
                <a href="tel:+919876543210" class="value">+91 98765 43210</a>
                <div class="sub">Mon–Sat, 10 AM – 7 PM</div>
            </div>

            <div class="contact-item">
                <div class="label">Email</div>
                <a href="mailto:care@styleonrent.com" class="value">care@styleonrent.com</a>
                <div class="sub">Replies within 24 business hours</div>
            </div>

            <div class="contact-item">
                <div class="label">Our Showroom</div>
                <div class="value">KCG Heritage Building, Ring Road</div>
                <div class="sub">Ahmedabad, Gujarat – 380015</div>
            </div>

            <a href="#" class="btn-showroom">BOOK A VIRTUAL STYLING SESSION</a>
        </div>

        <!-- Right: contact form -->
        <div class="contact-form">
            <div class="form-row">
                <div class="form-group">
                    <label>Your Name</label>
                    <asp:TextBox ID="txtName" runat="server" placeholder="eg: Aarav Sharma" />
                </div>
                <div class="form-group">
                    <label>Email Address</label>
                    <asp:TextBox ID="txtEmail" runat="server" placeholder="eg: hello@domain.com" />
                </div>
            </div>

            <div class="form-group" style="margin-bottom:18px;">
                <label>Subject</label>
                <asp:TextBox ID="txtSubject" runat="server" placeholder="How can we help you?" />
            </div>

            <div class="form-group" style="margin-bottom:18px;">
                <label>Message</label>
                <asp:TextBox ID="txtMessage" runat="server" TextMode="MultiLine"
                    placeholder="Tell us your rental date, occasion, or any specific outfit style you have in mind." />
            </div>

            <asp:Button ID="btnSendMessage" runat="server"
                Text="SEND MESSAGE"
                CssClass="btn-send"
                OnClick="btnSendMessage_Click" />
        </div>

    </div>
</div>
</asp:Content>
