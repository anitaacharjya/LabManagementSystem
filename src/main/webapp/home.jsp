<%@page import="java.util.Map"%>
<%@page import="java.sql.Connection"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html class="h-full">
<head>
<meta charset="UTF-8">
<title>Lab Management System</title>
<link
	href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css"
	rel="stylesheet">
	 <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<style>
/* Custom styles */
.bg-gradient {
	background: linear-gradient(to right, #4f46e5, #89f7fe);
}

.card {
    background-color: #e3f2fd; /* Light blue background */
    border: 2px solid #90caf9; /* Blue border */
    border-radius: 0.75rem;
    box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
    transition: transform 0.3s ease-in-out;
}

.card:hover {
    transform: translateY(-5px);
}

.card h3 {
    color: #0d47a1; /* Darker blue for the heading */
}

.summary-value {
    color: #0d47a1; /* Darker blue for the summary value */
    font-size: 2.5rem;
}
.table-header {
	background-color: #4f46e5;
	color: #ffffff;
}

.table-row:hover {
	background-color: rgba(79, 70, 229, 0.1);
}
</style>
</head>
<body class="bg-gray-100 h-full">
	<div class="flex h-full flex-col">
		<!-- Header -->
		<%@ include file="Components/Header.jsp" %>

		<!-- Sidebar -->
		<div class="flex flex-1">
			<%@ include file="Components/Navbar.jsp" %>

			<!-- Main Content -->
			<div class="flex-1 p-10">
				<h1 class="text-4xl font-bold mb-8 text-blue-900">Dashboard</h1>

				<!-- Summary Cards -->
				<div class="grid grid-cols-4 gap-6 mb-8">
					
					<div class="card p-6">
						<h3 class="text-lg font-semibold mb-2">Tests Conducted</h3>
						<p class="summary-value">150</p>
					</div>
					<div class="card p-6">
						<h3 class="text-lg font-semibold mb-2">Reports Generated</h3>
						<p class="summary-value">100</p>
					</div>
					<div class="card p-6">
						<h3 class="text-lg font-semibold mb-2">Pending Samples</h3>
						<p class="summary-value">50</p>
					</div>
					<div class="card p-6">
						<h3 class="text-lg font-semibold mb-2">Active Technicians</h3>
						<p class="summary-value">50</p>
					</div>
				</div>

				<!-- Tables -->
				<!-- <div class="grid grid-cols-2 gap-6">
					<div class="card p-6">
						<h3 class="text-lg font-semibold mb-4">Departments' Employees</h3>
						<table class="w-full">
							<thead>
								<tr class="table-header">
									<th class="py-2 px-4 text-left">ID</th>
									<th class="py-2 px-4 text-left">Dept Code</th>
									<th class="py-2 px-4 text-left">Employees</th>
								</tr>
							</thead>
							<tbody>
								<tr class="table-row border-b border-gray-200 hover:bg-gray-100">
									<td class="py-3 px-6 text-left whitespace-nowrap"></td>
									<td class="py-3 px-6 text-left whitespace-nowrap"></td>
									<td class="py-3 px-6 text-left whitespace-nowrap"></td>
								</tr>
							</tbody>
						</table>
					</div>
					<div class="card p-6">
						<h3 class="text-lg font-semibold mb-4">Employees per Shift</h3>
						<table class="w-full">
							<thead>
								<tr class="table-header">
									<th class="py-2 px-4 text-left">#</th>
									<th class="py-2 px-4 text-left">Shift Code</th>
									<th class="py-2 px-4 text-left">Employees</th>
								</tr>
							</thead>
							<tbody>
								<tr class="table-row border-b border-gray-200 hover:bg-gray-100">
									<td class="py-2 px-4"></td>
									<td class="py-2 px-4"></td>
									<td class="py-2 px-4"></td>
								</tr>
							</tbody>
						</table>
					</div>
				</div> -->
				 <!-- Charts and Reports -->
        <div class="mt-10">
            <canvas id="testsChart"></canvas>
        </div>
    </div>

   <!--  <script>
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
    </script> -->
			</div>
		</div>
		<!-- Footer -->
		<%-- <%@ include file="Components/Footer.jsp" %> --%>
	</div>
</body>
</html>
