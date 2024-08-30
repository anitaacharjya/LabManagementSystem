<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Lab Management System</title>
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
    
    <style>
        body {
            background-image: url("Images/index2.jpg");
            min-height: 100vh;
            background-size: cover;
            background-position: center;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            margin: 0;
            position: relative;
        }

        .scrolling-container {
            width: 100%;
            overflow: hidden;
            white-space: nowrap;
            position: absolute;
            top: 0;
            left: 0;
            background-color: rgba(0, 0, 0, 0.5); /* Optional: semi-transparent background */
            color: white;
            padding: 10px 0;
            z-index: 10; /* Ensure it's above the main content */
        }

        .scrolling-text {
            display: inline-block;
            padding-left: 100%;
            animation: scroll 15s linear infinite;
        }

        .scrolling-text:hover {
            animation-play-state: paused; /* Pause the animation on hover */
        }

        @keyframes scroll {
            0% {
                transform: translateX(0);
            }
            100% {
                transform: translateX(-100%);
            }
        }

        .content {
            width: 100%;
            max-width: 600px;
            margin-top: 60px; /* Adjust based on the height of your scrolling container */
            padding: 20px;
            background: rgba(255, 255, 255, 0.9); /* Optional: semi-transparent background for better readability */
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            z-index: 5;
            position: relative;
        }
    </style>
</head>
<body>
    <div class="scrolling-container">
        <div class="scrolling-text font-bold text-center">
            Welcome to the Lab Management System! Stay tuned for updates and new features.
            <button style='font-size:15px'>Project1<i class="fa-solid fa-file-circle-plus"></i></button>
             <i class="fas fa-file-pdf" style="font-size: 20px; margin-left: 10px; color: red;"></i>
        </div>
    </div>
    <div class="content mx-auto mt-10 bg-white rounded-lg shadow-lg overflow-hidden">
        <div class="px-6 py-8 sm:px-10">
            <h2 class="text-3xl font-bold text-center text-gray-800 mb-6">Lab Management System</h2>
            <form action="ULoginServlet" method="post">
                <div class="mb-4">
                    <c:if test="${not empty Success}">
                        <p class="text-center text-green-600 font-semibold">${Success}</p>
                        <c:remove var="Success" scope="session" />
                    </c:if>
                    <c:if test="${not empty Failed}">
                        <p class="text-center text-red-600 font-semibold">${Failed}</p>
                        <c:remove var="Failed" scope="session" />
                    </c:if>
                </div>
                <div class="mb-4">
                    <label for="username" class="block text-sm font-medium text-gray-700">User Name</label>
                    <input type="text" name="username" id="username" required
                           class="block w-full px-3 py-2 mt-1 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-blue-500 focus:border-blue-500 sm:text-sm"
                           placeholder="User Name">
                </div>
                <div class="mb-4">
                    <label for="password" class="block text-sm font-medium text-gray-700">Password</label>
                    <input type="password" name="password" id="password" required
                           class="block w-full px-3 py-2 mt-1 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-blue-500 focus:border-blue-500 sm:text-sm"
                           placeholder="Password">
                </div>
                <div>
                    <button type="submit"
                            class="w-full px-4 py-2 font-bold text-white bg-gradient-to-r from-blue-500 to-blue-600 rounded-md hover:from-blue-600 hover:to-blue-700 focus:outline-none focus:ring-2 focus:ring-blue-500 focus:ring-opacity-50">
                        Log in
                    </button>
                </div>
            </form>
        </div>
        <div class="px-6 py-4 bg-gray-100 border-t">
            <p class="text-center text-sm text-gray-600">
                &copy; 2024 Lab Management System. All rights reserved by @AP.
            </p>
        </div>
    </div>
</body>
</html>
