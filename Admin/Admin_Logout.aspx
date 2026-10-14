<%@ Page Language="C#" AutoEventWireup="true"
    CodeFile="Admin_Logout.aspx.cs"
    Inherits="Style_On_Rent.Admin.Admin_Logout" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Logout - Style On Rent</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css" />

    <style>
        :root {
            --primary-maroon: #73001e;
            --primary-maroon-hover: #590017;
            --text-dark: #111827;
            --text-muted: #6b7280;
            --border-color: #f1e7df;
            --card-bg: #ffffff;
            --page-bg: #fbf9f6;
        }
        * { box-sizing: border-box; margin: 0; padding: 0; }
        body {
            font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, Arial, sans-serif;
            background-color: var(--page-bg);
            color: var(--text-dark);
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 20px;
        }
        .logout-card {
            background-color: var(--card-bg);
            width: 100%;
            max-width: 440px;
            border-radius: 12px;
            border: 1px solid var(--border-color);
            box-shadow: 0 10px 30px -5px rgba(0,0,0,.05), 0 4px 6px -2px rgba(0,0,0,.02);
            overflow: hidden;
            text-align: center;
        }
        .card-header-brand {
            padding: 28px 20px 20px 20px;
            border-bottom: 1px solid #f6eee7;
            background: linear-gradient(180deg, #fffcf9 0%, #ffffff 100%);
        }
        .brand-logo { width: 68px; height: auto; object-fit: contain; margin-bottom: 6px; }
        .console-tag { font-size: 11.5px; color: var(--text-muted); letter-spacing: .3px; }
        .card-body { padding: 32px 36px 28px 36px; }
        .icon-door-box {
            font-size: 26px; color: #1f2937; margin-bottom: 12px; display: inline-block;
        }
        .card-title { font-size: 19px; font-weight: 700; color: #111827; margin-bottom: 10px; }
        .card-desc { font-size: 12.5px; color: var(--text-muted); line-height: 1.55; margin-bottom: 26px; }
        .buttons-group { display: flex; align-items: center; justify-content: center; gap: 12px; }
        .btn-cancel {
            background-color: #ffffff; color: #374151; border: 1px solid #d1d5db;
            padding: 9px 24px; font-size: 12px; font-weight: 600; border-radius: 6px;
            text-decoration: none !important; cursor: pointer; min-width: 95px;
            display: inline-block; transition: all .15s ease;
        }
        .btn-cancel:hover { background-color: #f9fafb; border-color: #9ca3af; color: #111827; }
        .btn-logout {
            background-color: var(--primary-maroon); color: #ffffff !important;
            border: 1px solid var(--primary-maroon); padding: 9px 24px; font-size: 12px;
            font-weight: 600; border-radius: 6px; cursor: pointer;
            display: inline-flex; align-items: center; gap: 6px;
            min-width: 105px; justify-content: center; transition: all .15s ease;
            text-decoration: none !important;
        }
        .btn-logout:hover { background-color: var(--primary-maroon-hover); border-color: var(--primary-maroon-hover); }
        .card-footer {
            padding: 14px 20px; background-color: #faf6f2; border-top: 1px solid var(--border-color);
            font-size: 11px; color: #8c827a; letter-spacing: .2px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="logout-card">

            <div class="card-header-brand">
                <img src="Images/logo.png" alt="Style On Rent" class="brand-logo" />
                <div class="console-tag">Administrative Console</div>
            </div>

            <div class="card-body">
                <div class="icon-door-box">
                    <i class="bi bi-box-arrow-right"></i>
                </div>
                <h1 class="card-title">Ready to Leave?</h1>
                <p class="card-desc">
                    You are about to securely log out of your active administrative session.
                    Any unsaved changes may be lost.
                </p>

                <div class="buttons-group">
                    <asp:LinkButton ID="btnCancel" runat="server"
                        CssClass="btn-cancel" OnClick="btnCancel_Click">
                        Cancel
                    </asp:LinkButton>

                    <asp:LinkButton ID="btnLogout" runat="server"
                        CssClass="btn-logout" OnClick="btnLogout_Click">
                        <i class="bi bi-box-arrow-right"></i> Logout
                    </asp:LinkButton>
                </div>
            </div>

            <div class="card-footer">
                Secure Session &bull; Style On Rent Admin
            </div>

        </div>
    </form>
</body>
</html>