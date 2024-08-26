<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Laboratory Management System Dashboard</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css"
        integrity="sha512-DTOQO9RWCH3ppGqcWaEA1BIZOC6xxalwEsw9c2QQeAIftl+Vegovlnee1c9QX4TctnWMn13TZye+giMm8e2LwA=="
        crossorigin="anonymous" referrerpolicy="no-referrer" />
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <style>
        .content {
            padding: 20px;
        }

        .stats-card {
            background-color: #2563eb;
            color: white;
            border-radius: 10px;
            padding: 20px;
            text-align: center;
            margin-bottom: 20px;
        }

        .stats-card h3 {
            font-size: 30px;
            margin-bottom: 10px;
        }

        .stats-card p {
            font-size: 18px;
        }
    </style>
</head>
<body class="bg-gray-100">
    <!-- Sidebar -->
    <div class="w-64 bg-blue-500 text-white p-6 h-screen fixed">
        <nav>
            <ul>
                <li class="mb-6">
                    <h2 style="font-weight:bold;font-size:20px">
                        <i class="fa-solid fa-user"></i> ${user.username}
                        <span class="text-green-500"><i class="fa-solid fa-circle"></i></span>
                    </h2>
                </li>
                <li class="mb-4">
                    <a href="home.jsp" class="block py-2 px-4" style="font-weight:bold;font-size:15px">
                        <i class="fa-solid fa-gauge"></i> Dashboard
                    </a>
                </li>
                <li class="mb-4">
                    <a href="PreAnalysis.jsp" class="block py-2 px-4" style="font-weight:bold;font-size:15px">
                        <i class="fa-solid fa-flask"></i> Pre Analysis
                    </a>
                </li>
                <li class="mb-4">
                    <a href="Analysis.jsp" class="block py-2 px-4" style="font-weight:bold;font-size:15px">
                        <i class="fa-solid fa-vials"></i> Analysis
                    </a>
                </li>
                <li class="mb-4">
                    <a href="PostAnalysis.jsp" class="block py-2 px-4" style="font-weight:bold;font-size:15px">
                        <i class="fa-solid fa-scroll"></i> Post Analysis
                    </a>
                </li>
            </ul>
        </nav>
    </div>

    <!-- Main Content -->
    <div class="content ml-72">
        <h1 class="text-3xl font-bold mb-6">Dashboard</h1>

        <!-- Stats Cards -->
        <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-6">
            <div class="stats-card">
                <h3>150</h3>
                <p>Tests Conducted</p>
            </div>
            <div class="stats-card">
                <h3>120</h3>
                <p>Reports Generated</p>
            </div>
            <div class="stats-card">
                <h3>15</h3>
                <p>Pending Samples</p>
            </div>
            <div class="stats-card">
                <h3>10</h3>
                <p>Active Technicians</p>
            </div>
        </div>

        <!-- Charts and Reports -->
        <div class="mt-10">
            <canvas id="testsChart"></canvas>
        </div>
    </div>

    <script>
        document.addEventListener("DOMContentLoaded", function () {
            const ctx = document.getElementById('testsChart').getContext('2d');
            const testsChart = new Chart(ctx, {
                type: 'line',
                data: {
                    labels: ['January', 'February', 'March', 'April', 'May', 'June'],
                    datasets: [{
                        label: 'Tests Conducted',
                        data: [65, 59, 80, 81, 56, 55],
                        fill: false,
                        borderColor: 'rgb(75, 192, 192)',
                        tension: 0.1
                    }]
                },
                options: {
                    scales: {
                        y: {
                            beginAtZero: true
                        }
                    }
                }
            });
        });
    </script>
</body>
</html>
