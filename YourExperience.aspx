<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="YourExperience.aspx.cs" Inherits="Style_On_Rent.YourExperience" %>










<asp:Content ID="HeadContent" ContentPlaceHolderID="head" runat="server">
<style>
.share-page {
    max-width: 780px;
    margin: auto;
    padding: 50px 20px 70px;
    font-family: Georgia, serif;
    color: #4a3b3b;
}
.share-page h1 {
    font: normal 32px Georgia, serif;
    color: #2b2b2b;
    margin: 0 0 8px;
}
.share-page .subtitle {
    font-size: 12px;
    color: #8d777b;
    margin: 0 0 30px;
    line-height: 1.6;
}

.review-card {
    background: #fff;
    border: 1px solid #eee;
    padding: 30px 35px;
    box-shadow: 0 2px 12px rgba(0,0,0,0.04);
}

.review-top {
    display: flex;
    gap: 18px;
    align-items: center;
    padding-bottom: 20px;
    border-bottom: 1px solid #f0e6e6;
    margin-bottom: 22px;
}
.review-top img {
    width: 70px;
    height: 70px;
    object-fit: cover;
}
.review-top-info h3 {
    font: normal 16px Georgia, serif;
    color: #620019;
    margin: 0 0 5px;
}
.review-top-info p {
    font-size: 11px;
    color: #8d777b;
    margin: 0;
}

.star-rating {
    text-align: center;
    margin-bottom: 5px;
    user-select: none;
}
.star-rating .star {
    font-size: 36px;
    color: #ddd;
    cursor: pointer;
    display: inline-block;
    padding: 0 3px;
    transition: color 0.15s ease, transform 0.15s ease;
}
.star-rating .star:hover {
    transform: scale(1.15);
}
.star-rating .star.active,
.star-rating .star.hover {
    color: #d5ad2d;
}
.stars-label {
    text-align: center;
    font-size: 11px;
    color: #8d777b;
    margin-bottom: 25px;
    letter-spacing: 1px;
}
.rating-value {
    display: block;
    text-align: center;
    font-size: 12px;
    color: #a17b35;
    margin-bottom: 15px;
    font-weight: bold;
    letter-spacing: 1px;
    min-height: 18px;
}

.form-group {
    margin-bottom: 22px;
}
.form-group label {
    display: block;
    font-size: 11px;
    color: #8d777b;
    margin-bottom: 7px;
    letter-spacing: 0.5px;
}
.form-group input[type="text"],
.form-group textarea {
    width: 100%;
    padding: 11px 14px;
    border: 1px solid #ddd;
    font-family: Georgia, serif;
    font-size: 13px;
    color: #4a3b3b;
    background: #fafafa;
    outline: none;
    box-sizing: border-box;
}
.form-group input[type="text"]:focus,
.form-group textarea:focus {
    border-color: #a17b35;
    background: #fff;
}
.form-group textarea {
    resize: vertical;
    min-height: 90px;
}
.form-row-2 {
    display: grid;
    grid-template-columns: 1fr 1fr;
    gap: 15px;
}

/* UPLOAD BOX */
.upload-wrap {
    position: relative;
}
.upload-box {
    border: 1px dashed #ccc;
    padding: 25px;
    text-align: center;
    font-size: 11px;
    color: #8d777b;
    background: #fafafa;
    cursor: pointer;
    display: block;
    transition: all 0.2s ease;
}
.upload-box .icon {
    font-size: 20px;
    color: #a17b35;
    display: block;
    margin-bottom: 8px;
}
.upload-box:hover {
    border-color: #a17b35;
    background: #fff8f5;
}
.upload-box input[type="file"] {
    display: none;
}
.upload-preview {
    margin-top: 15px;
    display: flex;
    gap: 10px;
    flex-wrap: wrap;
}
.upload-preview img {
    width: 80px;
    height: 80px;
    object-fit: cover;
    border-radius: 6px;
    border: 2px solid #f0e6e6;
}

.submit-btn {
    display: block;
    width: 100%;
    margin-top: 25px;
    padding: 15px;
    background: #d5ad2d;
    color: #fff;
    text-align: center;
    text-decoration: none;
    font-size: 12px;
    font-weight: bold;
    letter-spacing: 2px;
    border: none;
    cursor: pointer;
    font-family: Georgia, serif;
}
.submit-btn:hover {
    background: #c19c1f;
}

/* VALIDATION MESSAGES */
.validation-error {
    display: block;
    color: #c0392b;
    font-size: 12px;
    font-weight: bold;
    margin-bottom: 15px;
    padding: 12px 18px;
    background: #fdecea;
    border-left: 4px solid #c0392b;
    border-radius: 4px;
    letter-spacing: 0.3px;
}
.validation-success {
    display: block;
    color: #1e7e34;
    font-size: 12px;
    font-weight: bold;
    margin-bottom: 15px;
    padding: 12px 18px;
    background: #e8f5e9;
    border-left: 4px solid #1e7e34;
    border-radius: 4px;
    letter-spacing: 0.3px;
}
.field-error {
    display: block;
    color: #c0392b;
    font-size: 11px;
    font-weight: bold;
    margin-top: 6px;
}

@media(max-width: 600px) {
    .form-row-2 { grid-template-columns: 1fr; }
    .review-card { padding: 22px 20px; }
    .star-rating .star { font-size: 30px; }
}
</style>
</asp:Content>

<asp:Content ID="MainContent" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div class="share-page">
    <h1>Share Your Experience</h1>
    <p class="subtitle">Your feedback helps our community discover their perfect ensemble.</p>

    <div class="review-card">

        <!-- MAIN MESSAGE -->
        <asp:Label ID="lblMainMsg" runat="server" CssClass="validation-error" Visible="false" />

        <div class="review-top">
            <img src="Images/Blush_1.jfif" alt="Product" />
            <div class="review-top-info">
                <h3>Timeless Ivory Mirror Choli</h3>
                <p>Order #RNTL-8X92-XCVB</p>
            </div>
        </div>

        <div class="star-rating" id="starRating">
            <span class="star" data-value="1">★</span>
            <span class="star" data-value="2">★</span>
            <span class="star" data-value="3">★</span>
            <span class="star" data-value="4">★</span>
            <span class="star" data-value="5">★</span>
        </div>

        <span class="rating-value" id="ratingValue"></span>
        <div class="stars-label">YOUR RATING</div>

        <asp:HiddenField ID="hfRating" runat="server" Value="0" />

        <div class="form-group">
            <label>REVIEW TITLE</label>
            <asp:TextBox ID="txtReviewTitle" runat="server" placeholder="e.g. Absolutely Stunning!" />
            <asp:Label ID="lblTitleErr" runat="server" CssClass="field-error" Visible="false" Text="Please enter a review title." />
        </div>

        <div class="form-group">
            <label>YOUR REVIEW</label>
            <asp:TextBox ID="txtReviewBody" runat="server" TextMode="MultiLine"
                placeholder="What did you love about it? How was the fit and fabric?" />
            <asp:Label ID="lblBodyErr" runat="server" CssClass="field-error" Visible="false" Text="Please write your review." />
        </div>

        <div class="form-row-2">
            <div class="form-group">
                <label>YOUR NAME</label>
                <asp:TextBox ID="txtName" runat="server" placeholder="Enter name" />
                <asp:Label ID="lblNameErr" runat="server" CssClass="field-error" Visible="false" Text="Please enter your name." />
            </div>
            <div class="form-group">
                <label>EMAIL</label>
                <asp:TextBox ID="txtEmail" runat="server" placeholder="Enter email" />
                <asp:Label ID="lblEmailErr" runat="server" CssClass="field-error" Visible="false" Text="Please enter a valid email." />
            </div>
        </div>

        <div class="form-group">
            <label>ADD PHOTOS (OPTIONAL)</label>

            <div class="upload-wrap">
                <label class="upload-box">
                    <span class="icon">📷</span>
                    Drop your photos here or click to upload
                    <asp:FileUpload ID="fuPhotos" runat="server"
                                    AllowMultiple="true"
                                    accept="image/*"
                                    onchange="previewPhotos(this);" />
                </label>

                <div class="upload-preview" id="previewBox"></div>
            </div>
        </div>

        <asp:Button ID="btnSubmitReview" runat="server"
            Text="SUBMIT REVIEW"
            CssClass="submit-btn"
            OnClick="btnSubmitReview_Click" />
    </div>
</div>

<script type="text/javascript">
    // STAR RATING
    (function () {
        var stars = document.querySelectorAll('#starRating .star');
        var ratingValue = document.getElementById('ratingValue');
        var hiddenField = document.getElementById('<%= hfRating.ClientID %>');
        var selectedRating = 0;

        function setStars(value) {
            stars.forEach(function (s) {
                var v = parseInt(s.getAttribute('data-value'));
                if (v <= value) {
                    s.classList.add('active');
                } else {
                    s.classList.remove('active');
                }
            });
        }

        function updateLabel(value) {
            if (value === 0) {
                ratingValue.textContent = '';
            } else {
                ratingValue.textContent = value + ' / 5';
            }
        }

        stars.forEach(function (star) {
            star.addEventListener('click', function () {
                selectedRating = parseInt(this.getAttribute('data-value'));
                hiddenField.value = selectedRating;
                setStars(selectedRating);
                updateLabel(selectedRating);
            });

            star.addEventListener('mouseenter', function () {
                var v = parseInt(this.getAttribute('data-value'));
                stars.forEach(function (s) {
                    var sv = parseInt(s.getAttribute('data-value'));
                    if (sv <= v) s.classList.add('hover');
                    else s.classList.remove('hover');
                });
            });

            star.addEventListener('mouseleave', function () {
                stars.forEach(function (s) { s.classList.remove('hover'); });
            });
        });
    })();

    // PHOTO PREVIEW
    function previewPhotos(input) {
        var previewBox = document.getElementById('previewBox');
        previewBox.innerHTML = '';

        if (input.files && input.files.length > 0) {
            var maxShow = Math.min(input.files.length, 5);
            for (var i = 0; i < maxShow; i++) {
                var file = input.files[i];
                if (file.type.indexOf('image') === -1) continue;

                var reader = new FileReader();
                reader.onload = (function (src) {
                    return function (e) {
                        var img = document.createElement('img');
                        img.src = e.target.result;
                        previewBox.appendChild(img);
                    };
                })(file);
                reader.readAsDataURL(file);
            }
        }
    }
</script>
</asp:Content>