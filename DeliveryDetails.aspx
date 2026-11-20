<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="DeliveryDetails.aspx.cs" Inherits="Style_On_Rent.DeliveryDetails" %>







<asp:Content ID="HeadContent" ContentPlaceHolderID="head" runat="server">
<style>
.delivery-page {
    max-width: 1100px;
    margin: auto;
    padding: 50px 20px 70px;
    font-family: Georgia, serif;
    color: #4a3b3b;
}
.delivery-page h1 {
    font: normal 34px Georgia, serif;
    color: #2b2b2b;
    margin: 0 0 10px;
}
.delivery-page .subtitle {
    font-size: 12px;
    color: #8d777b;
    margin: 0 0 35px;
    max-width: 500px;
    line-height: 1.6;
}
.form-card {
    background: #fff;
    border: 1px solid #eee;
    padding: 35px 40px;
    max-width: 600px;
    box-shadow: 0 2px 15px rgba(0,0,0,0.04);
}
.form-section { margin-bottom: 30px; }
.form-section h2 {
    font: normal 16px Georgia, serif;
    color: #620019;
    margin: 0 0 18px;
    padding-bottom: 8px;
    border-bottom: 1px solid #f0e6e6;
    display: flex;
    align-items: center;
    gap: 8px;
}
.form-section h2 .icon { font-size: 14px; }
.form-row {
    display: grid;
    grid-template-columns: 1fr 1fr;
    gap: 15px;
    margin-bottom: 15px;
}
.form-row.full { grid-template-columns: 1fr; }
.form-group { display: flex; flex-direction: column; }
.form-group label {
    font-size: 11px;
    color: #8d777b;
    margin-bottom: 5px;
    letter-spacing: 0.5px;
}
.form-group input,
.form-group textarea {
    padding: 10px 12px;
    border: 1px solid #ddd;
    font-family: Georgia, serif;
    font-size: 12px;
    color: #4a3b3b;
    background: #fafafa;
    outline: none;
}
.form-group input:focus,
.form-group textarea:focus {
    border-color: #a17b35;
    background: #fff;
}
.form-group textarea { resize: vertical; min-height: 60px; }

.form-actions {
    display: flex;
    justify-content: space-between;
    align-items: center;
    margin-top: 30px;
    padding-top: 20px;
    border-top: 1px solid #f0e6e6;
}
.btn-back {
    font-size: 11px;
    color: #8d777b;
    text-decoration: none;
    letter-spacing: 1px;
}
.btn-back:hover { color: #620019; }
.btn-next {
    background: #650019;
    color: #fff;
    padding: 12px 28px;
    text-decoration: none;
    font-size: 11px;
    font-weight: bold;
    letter-spacing: 1px;
    border: none;
    cursor: pointer;
    display: inline-block;
}
.btn-next:hover { background: #450012; color: #fff; }

@media(max-width: 650px) {
    .form-row { grid-template-columns: 1fr; }
    .form-card { padding: 25px 20px; }
}
</style>
</asp:Content>

<asp:Content ID="MainContent" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div class="delivery-page">
    <h1>Delivery Details</h1>
    <p class="subtitle">Please fill in the delivery information so we can ensure your rental arrives exactly when you need it.</p>

    <div class="form-card">
        <div class="form-section">
            <h2><span class="icon">👤</span> Recipient Information</h2>
            <div class="form-row">
                <div class="form-group">
                    <label>FIRST NAME</label>
                    <input type="text" placeholder="Enter first name" />
                </div>
                <div class="form-group">
                    <label>LAST NAME</label>
                    <input type="text" placeholder="Enter last name" />
                </div>
            </div>
        </div>

        <div class="form-section">
            <h2><span class="icon">📍</span> Delivery Address</h2>
            <div class="form-row">
                <div class="form-group">
                    <label>STREET ADDRESS</label>
                    <input type="text" placeholder="Enter street address" />
                </div>
                <div class="form-group">
                    <label>APT / SUITE</label>
                    <input type="text" placeholder="Optional" />
                </div>
            </div>
            <div class="form-row">
                <div class="form-group">
                    <label>CITY</label>
                    <input type="text" placeholder="Enter city" />
                </div>
                <div class="form-group">
                    <label>STATE / PROVINCE</label>
                    <input type="text" placeholder="Enter state" />
                </div>
            </div>
            <div class="form-row">
                <div class="form-group">
                    <label>POSTAL / ZIP CODE</label>
                    <input type="text" placeholder="Enter postal code" />
                </div>
            </div>
            <div class="form-row full">
                <div class="form-group">
                    <label>DELIVERY NOTES (OPTIONAL)</label>
                    <textarea placeholder="Any special instructions..."></textarea>
                </div>
            </div>
        </div>

        <div class="form-actions">
            <a href="Collections.aspx" class="btn-back">← CANCEL</a>
            <asp:LinkButton ID="btnNext" runat="server"
                            CssClass="btn-next"
                            OnClick="btnNext_Click">
                NEXT STEP →
            </asp:LinkButton>
        </div>
    </div>
</div>
</asp:Content>
