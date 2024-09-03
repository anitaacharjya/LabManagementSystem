<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.lms.daoimpl.CommonFuction"%>
<!DOCTYPE html>
<html class="h-full">
<head>
    <meta charset="UTF-8">
    <title>Register</title>
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
     <style>
    /* Style for readonly input */
	    input[readonly] {
	        background-color: #e2e8f0; /* Example: light gray background */
	        color: #4a5568; /* Example: dark gray text color */
	    }
	</style>
</head>
<body class="bg-gray-100 h-full flex">
    <!-- Sidebar -->
    <%@include file="Components/Navbar.jsp" %>
    <%
     CommonFuction commonfun = new CommonFuction();
     int examCode=commonfun.getMaxid("TBL_EXAMINATION", "ID_EXAMINATION");
     examCode=examCode+1;
     
      %>

    <!-- Main Content -->
    <div class="flex-1 p-10 flex justify-center items-center">
        <div class="container mx-auto bg-white p-10 rounded-lg shadow-lg w-full max-w-3xl">
            <div class="text-center mb-10">
                <h2 class="text-3xl font-semibold text-gray-800">Add New Examination Details</h2>
                <p class="text-gray-500 mt-2">Please fill out the form to add a new examination.</p>
            </div>
            <div class="col-md-12">
                <c:if test="${not empty Success}">
                    <h3 class="text-green-500 text-sm font-semibold mb-4">${Success}</h3>
                    <c:remove var="Success" scope="session" />
                </c:if>
                <c:if test="${not empty Failed}">
                    <h3 class="text-red-500 text-sm font-semibold mb-4">${Failed}</h3>
                    <c:remove var="Failed" scope="session" />
                </c:if>
            </div>
            <form action="AddExaminationServlet" method="post">
                <div class="grid grid-cols-1 gap-6">
                    <div>
                        <label for="name" class="block text-sm font-medium text-gray-700">Exam Name</label>
                        <input type="text" id="name" name="name" required
                            class="mt-1 block w-full px-4 py-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-blue-500 focus:border-blue-500 sm:text-sm">
                    </div>

                    <div>
                        <label for="price" class="block text-sm font-medium text-gray-700">Price</label>
                        <input type="text" id="price" name="price" required
                            class="mt-1 block w-full px-4 py-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-blue-500 focus:border-blue-500 sm:text-sm">
                    </div>
                   
                    <div>
                        <label for="code" class="block text-sm font-medium text-gray-700">Examination Code</label>
                        <input type="text" id="code" name="code" value=EX0<%=examCode%> readonly
                            class="mt-1 block w-full px-4 py-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-blue-500 focus:border-blue-500 sm:text-sm">
                    </div>
                </div>
                
                <div class="mt-8 flex justify-between">
                    <button type="submit"
                        class="bg-green-600 hover:bg-green-700 text-white font-semibold py-2 px-6 rounded-lg shadow-lg transition duration-300">
                        Add
                    </button>
                    <a href="home.jsp"
                        class="bg-blue-500 hover:bg-blue-600 text-white font-semibold py-2 px-6 rounded-lg shadow-lg transition duration-300">
                        Home
                    </a>
                </div>
            </form>
        </div>
    </div>
</body>
</html>
