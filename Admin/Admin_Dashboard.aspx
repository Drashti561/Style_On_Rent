<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMaster.Master" AutoEventWireup="true" CodeBehind="Admin_Dashboard.aspx.cs" Inherits="Style_On_Rent.Admin.Admin_Dashboard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <!-- Chart.js -->
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

    <style>
        .dashboard {
            background: #f8f6f6;
            min-height: 100vh;
            padding: 0;
        }

        .dashboard-header {
            height: 65px;
            background: white;
            border-bottom: 1px solid #eee;
            display: flex;
            align-items: center;
            justify-content: space-between;
            padding: 0 18px;
        }

        .header-left {
            display: flex;
            align-items: center;
            gap: 10px;
        }

        .header-logo {
            width: 65px;
            height: 45px;
            object-fit: cover;
            border-radius: 8px;
        }

        .header-title {
            font-size: 17px;
            font-weight: bold;
            color: #252525;
        }

        .header-subtitle {
            font-size: 11px;
            color: #888;
            margin-top: 2px;
        }

        .header-right {
            display: flex;
            align-items: center;
            gap: 18px;
        }

        .header-icon-link {
            color: #780019;
            font-size: 16px;
            text-decoration: none !important;
            display: inline-flex;
            align-items: center;
            justify-content: center;
            transition: transform 0.15s ease;
        }

        .header-icon-link:hover {
            transform: scale(1.15);
            color: #590017;
        }

        .dashboard-body {
            padding: 18px;
        }

        .top-actions {
            display: flex;
            align-items: center;
            justify-content: space-between;
            margin-bottom: 18px;
        }

        .search-box {
            width: 220px;
            height: 34px;
            background: #f1eeee;
            border: 1px solid #e2dddd;
            border-radius: 4px;
            display: flex;
            align-items: center;
            padding: 0 10px;
            color: #777;
        }

        .search-box i {
            font-size: 12px;
            margin-right: 8px;
        }

        .search-box input {
            width: 100%;
            border: none;
            outline: none;
            background: transparent;
            font-size: 12px;
        }

        .new-order-link {
            background: #780019;
            color: white !important;
            border: none;
            border-radius: 4px;
            height: 34px;
            padding: 0 14px;
            font-size: 12px;
            font-weight: 600;
            display: inline-flex;
            align-items: center;
            text-decoration: none !important;
            transition: background 0.2s ease;
        }

        .new-order-link:hover {
            background: #590017;
        }

        .new-order-link i {
            margin-right: 6px;
        }

        .summary-row {
            display: grid;
            grid-template-columns: repeat(4, 1fr);
            gap: 14px;
            margin-bottom: 18px;
        }

        .summary-card {
            background: white;
            border: 1px solid #eee;
            border-radius: 6px;
            padding: 16px;
            min-height: 98px;
        }

        .card-top {
            display: flex;
            align-items: center;
            justify-content: space-between;
        }

        .card-label {
            font-size: 11.5px;
            color: #777;
            text-transform: uppercase;
            font-weight: 600;
        }

        .card-icon {
            color: #780019;
            font-size: 22px;
        }

        .card-value {
            font-size: 24px;
            font-weight: bold;
            color: #292929;
            margin-top: 8px;
        }

        .card-bottom {
            font-size: 11px;
            color: #777;
            margin-top: 4px;
        }

        .revenue-box {
            background: white;
            border: 1px solid #eee;
            border-radius: 6px;
            padding: 16px;
            height: 320px;
        }

        .revenue-header {
            display: flex;
            align-items: center;
            justify-content: space-between;
            margin-bottom: 10px;
        }

        .revenue-title {
            font-size: 14px;
            font-weight: bold;
            color: #292929;
        }

        .revenue-options {
            display: flex;
            align-items: center;
            gap: 12px;
            font-size: 11px;
            color: #777;
        }

        .monthly-dot {
            width: 8px;
            height: 8px;
            display: inline-block;
            border-radius: 50%;
            background: #780019;
            margin-right: 4px;
        }

        .chart-container {
            height: 250px;
        }

        @media(max-width: 900px) {
            .summary-row {
                grid-template-columns: repeat(2, 1fr);
            }
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="dashboard">

        <!-- HEADER -->
        <div class="dashboard-header">
            <div class="header-left">
                <img src="Images/logo.png" class="header-logo" alt="Style On Rent" />
                <div>
                    <div class="header-title">Admin Dashboard</div>
                    <div class="header-subtitle">A summary of your rental business today.</div>
                </div>
            </div>

            <div class="header-right">
                <a href="Notification.aspx" class="header-icon-link" title="Notifications">
                    <i class="bi bi-bell"></i>
                </a>
                <a href="Profile.aspx" class="header-icon-link" title="My Profile">
                    <i class="bi bi-person-circle"></i>
                </a>
            </div>
        </div>

        <!-- BODY -->
        <div class="dashboard-body">

            <div class="top-actions">
                <div class="search-box">
                    <i class="bi bi-search"></i>
                    <input type="text" placeholder="Search dashboard..." />
                </div>

                <a href="AddOrder.aspx" class="new-order-link" title="Create New Order">
                    <i class="bi bi-plus-lg"></i> New Order
                </a>
            </div>

            <!-- SUMMARY CARDS (DYNAMIC LABELS) -->
            <div class="summary-row">

                <!-- TOTAL REVENUE -->
                <div class="summary-card">
                    <div class="card-top">
                        <span class="card-label">Total Revenue</span>
                        <i class="bi bi-wallet2 card-icon"></i>
                    </div>
                    <div class="card-value">
                        <asp:Label ID="lblTotalRevenue" runat="server" Text="₹0"></asp:Label>
                    </div>
                    
                </div>

                <!-- ACTIVE RENTALS -->
                <div class="summary-card">
                    <div class="card-top">
                        <span class="card-label">Active Rentals</span>
                        <i class="bi bi-hourglass-split card-icon"></i>
                    </div>
                    <div class="card-value">
                        <asp:Label ID="lblActiveRentals" runat="server" Text="0"></asp:Label>
                    </div>
                    
                </div>

                <!-- TOTAL CUSTOMERS -->
                <div class="summary-card">
                    <div class="card-top">
                        <span class="card-label">Total Customers</span>
                        <i class="bi bi-person-plus card-icon"></i>
                    </div>
                    <div class="card-value">
                        <asp:Label ID="lblTotalCustomers" runat="server" Text="0"></asp:Label>
                    </div>
                   
                </div>

                <!-- PENDING RETURNS -->
                <div class="summary-card">
                    <div class="card-top">
                        <span class="card-label">Pending Returns</span>
                        <i class="bi bi-file-earmark-text card-icon"></i>
                    </div>
                    <div class="card-value">
                        <asp:Label ID="lblPendingReturns" runat="server" Text="0"></asp:Label>
                    </div>
                    <div class="card-bottom">
                        <span style="color:#780019;">Due back or pending</span>
                    </div>
                </div>

            </div>

            <!-- REVENUE OVERVIEW -->
            <div class="revenue-box">
                <div class="revenue-header">
                    <div class="revenue-title">Revenue Overview</div>
                    <div class="revenue-options">
                        <span>
                            <span class="monthly-dot"></span> Monthly Revenue
                        </span>
                        <span>Last 6 Months</span>
                    </div>
                </div>

                <div class="chart-container">
                    <canvas id="revenueChart"></canvas>
                </div>
            </div>

        </div>
    </div>

    <!-- Hidden Fields to Pass Monthly Chart Data to JavaScript -->
    <asp:HiddenField ID="hfChartLabels" runat="server" />
    <asp:HiddenField ID="hfChartData" runat="server" />

    <!-- CHART JS SCRIPT -->
    <script>
const ctx = document.getElementById('revenueChart');

// Read server data from hidden fields
const rawLabels = document.getElementById('<%= hfChartLabels.ClientID %>').value;
        const rawData = document.getElementById('<%= hfChartData.ClientID %>').value;

        const chartLabels = rawLabels ? rawLabels.split(',') : ['May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct'];
        const chartDataPoints = rawData ? rawData.split(',').map(Number) : [0, 0, 0, 0, 0, 0];

        new Chart(ctx, {
            type: 'line',
            data: {
                labels: chartLabels,
                datasets: [{
                    label: 'Monthly Revenue',
                    data: chartDataPoints,
                    borderColor: '#780019',
                    backgroundColor: 'rgba(120, 0, 25, 0.08)',
                    borderWidth: 2,
                    pointRadius: 4,
                    pointHoverRadius: 6,
                    fill: true,
                    tension: 0.3
                }]
            },
            options: {
                responsive: true,
                maintainAspectRatio: false,
                plugins: {
                    legend: { display: false }
                },
                scales: {
                    y: {
                        beginAtZero: true,
                        ticks: {
                            font: { size: 10 },
                            callback: function (value) {
                                if (value >= 1000)
                                    return '₹' + (value / 1000) + 'K';
                                return '₹' + value;
                            }
                        },
                        grid: { color: '#eeeeee' }
                    },
                    x: {
                        ticks: { font: { size: 10 } },
                        grid: { display: false }
                    }
                }
            }
        });
    </script>
</asp:Content>