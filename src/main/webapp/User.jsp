<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html class="h-full">
<head>
    <meta charset="UTF-8">
    <title>Register</title>
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
</head>
<body class="bg-gray-100 h-full flex">
    <!-- Sidebar -->
    <%@include file="Components/Navbar.jsp" %>

    <!-- Main Content -->
    <div class="flex-1 p-10 flex justify-center items-center">
        <div class="container mx-auto bg-white p-8 rounded shadow-lg w-full max-w-6xl">
            <div class="text-center mb-8">
                <h2 class="text-2xl font-bold text-gray-800">Register A New User</h2>
            </div>
             <div class="title col-md-12 mt-2">
					<c:if test="${not empty Success}">
						<h3 class="text-green-500"
							style="font-size: 15px; font-weight: bold">${Success}</h3>
						<c:remove var="Success" scope="session" ></c:remove>
					</c:if>
					<c:if test="${not empty Failed}">
						<h3 class="text-red-500"
							style="font-size: 15px; font-weight: bold">${Failed}</h3>
						<c:remove var="Failed" scope="session" />
					</c:if>
				</div>
            <form action="UserRegisterServlet" method="post">
                <div class="grid grid-cols-1 md:grid-cols-4 gap-4">
                    <div>
                        <label for="name" class="block text-sm font-medium text-gray-700">Name:</label>
                        <input type="text" id="name" name="name" required
                            class="mt-1 block w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-blue-500 focus:border-blue-500 sm:text-sm">
                    </div>

                    <div>
                        <label for="dob" class="block text-sm font-medium text-gray-700">Date of Birth:</label>
                        <input type="date" id="dob" name="dob" required
                            class="mt-1 block w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-blue-500 focus:border-blue-500 sm:text-sm">
                    </div>

                    <div>
                        <label for="gender" class="block text-sm font-medium text-gray-700">Gender:</label>
                        <select id="gender" name="gender" required
                            class="mt-1 block w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-blue-500 focus:border-blue-500 sm:text-sm">
                            <option value="Male">Male</option>
                            <option value="Female">Female</option>
                            <option value="Other">Other</option>
                        </select>
                    </div>

                    <div>
                        <label for="address" class="block text-sm font-medium text-gray-700">Address:</label>
                        <textarea id="address" name="address" required
                            class="mt-1 block w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-blue-500 focus:border-blue-500 sm:text-sm"></textarea>
                    </div>

                    <div>
                        <label for="city" class="block text-sm font-medium text-gray-700">City:</label>
                        <input type="text" id="city" name="city" required
                            class="mt-1 block w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-blue-500 focus:border-blue-500 sm:text-sm">
                    </div>

                    <div>
                        <label for="state" class="block text-sm font-medium text-gray-700">State:</label>
                        <input type="text" id="state" name="state" required
                            class="mt-1 block w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-blue-500 focus:border-blue-500 sm:text-sm">
                    </div>

                    <div>
                        <label for="country" class="block text-sm font-medium text-gray-700">Country:</label>
                        <input type="text" id="country" name="country" required
                            class="mt-1 block w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-blue-500 focus:border-blue-500 sm:text-sm">
                    </div>

                    <div>
                        <label for="marital_status" class="block text-sm font-medium text-gray-700">Marital Status:</label>
                        <select id="marital_status" name="marital_status" required
                            class="mt-1 block w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-blue-500 focus:border-blue-500 sm:text-sm">
                            <option value="Single">Single</option>
                            <option value="Married">Married</option>
                        </select>
                    </div>

                    <div>
                        <label for="nationality" class="block text-sm font-medium text-gray-700">Nationality:</label>
                        <input type="text" id="nationality" name="nationality" required
                            class="mt-1 block w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-blue-500 focus:border-blue-500 sm:text-sm">
                    </div>

                    <div>
                        <label for="email" class="block text-sm font-medium text-gray-700">Email:</label>
                        <input type="email" id="email" name="email" required
                            class="mt-1 block w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-blue-500 focus:border-blue-500 sm:text-sm">
                    </div>

                    <div>
                        <label for="mobile" class="block text-sm font-medium text-gray-700">Mobile No:</label>
                        <input type="tel" id="mobile" name="mobile" pattern="[0-9]{10}" required
                            class="mt-1 block w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-blue-500 focus:border-blue-500 sm:text-sm">
                    </div>

                    <div>
                        <label for="telephone" class="block text-sm font-medium text-gray-700">Telephone:</label>
                        <input type="tel" id="telephone" name="telephone"
                            class="mt-1 block w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-blue-500 focus:border-blue-500 sm:text-sm">
                    </div>

                    <div>
                        <label for="identity_document" class="block text-sm font-medium text-gray-700">Identity Document:</label>
                        <select id="identity_document" name="identity_document" required
                            class="mt-1 block w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-blue-500 focus:border-blue-500 sm:text-sm">
                            <option value="Aadhar">Aadhar</option>
                            <option value="PAN">PAN</option>
                            <option value="Passport">Passport</option>
                            <option value="Driving License">Driving License</option>
                        </select>
                    </div>
                    
                    <div>
                        <label for="identity_number" class="block text-sm font-medium text-gray-700">Identity Number:</label>
                        <input type="text" id="identity_number" name="identity_number" required
                            class="mt-1 block w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-blue-500 focus:border-blue-500 sm:text-sm">
                    </div>

                    <div>
                        <label for="employment_type" class="block text-sm font-medium text-gray-700">Employment Type:</label>
                        <select id="employment_type" name="employment_type" required
                            class="mt-1 block w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-blue-500 focus:border-blue-500 sm:text-sm">
                            <option value="Full-Time">Full-Time</option>
                            <option value="Part-Time">Part-Time</option>
                            <option value="Contract">Contract</option>
                            <option value="Intern">Intern</option>
                        </select>
                    </div>
                    
                    <div>
                        <label for="joining_date" class="block text-sm font-medium text-gray-700">Joining Date:</label>
                        <input type="date" id="joining_date" name="joining_date" required
                            class="mt-1 block w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-blue-500 focus:border-blue-500 sm:text-sm">
                    </div>

                    <div>
                        <label for="blood_group" class="block text-sm font-medium text-gray-700">Blood Group:</label>
                        <input type="text" id="blood_group" name="blood_group" required
                            class="mt-1 block w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-blue-500 focus:border-blue-500 sm:text-sm">
                    </div>

                    <div>
                        <label for="designation" class="block text-sm font-medium text-gray-700">Designation:</label>
                        <input type="text" id="designation" name="designation" required
                            class="mt-1 block w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-blue-500 focus:border-blue-500 sm:text-sm">
                    </div>

                   
                   
                     <div>
                        <label for="username" class="block text-sm font-medium text-gray-700">Username:</label>
                        <input type="text" id="username" name="username" required
                            class="mt-1 block w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-blue-500 focus:border-blue-500 sm:text-sm">
                    </div>

                    <div>
                        <label for="password" class="block text-sm font-medium text-gray-700">Password:</label>
                        <input type="password" id="password" name="password" required
                            class="mt-1 block w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-blue-500 focus:border-blue-500 sm:text-sm">
                    </div>
                    
                     <div class="col-span-1 md:col-span-4">
                        <fieldset class="block text-sm font-medium text-gray-700 mb-2">
                            <legend class="mb-4">Access Control:</legend>
                            <div class="flex flex-wrap items-center gap-8">
                                <div class="flex items-center">
                                    <label class="mr-2">Admin Access:</label>
                                    <input type="radio" id="admin_yes" name="admin_access" value="Y" required>
                                    <label for="admin_yes" class="ml-1 mr-4">Yes</label>
                                    <input type="radio" id="admin_no" name="admin_access" value="N" required>
                                    <label for="admin_no" class="ml-1">No</label>
                                </div>

                                <div class="flex items-center">
                                    <label class="mr-2">Pre-Analysis Access:</label>
                                    <input type="radio" id="preanalysis_yes" name="preanalysis_access" value="Y" required>
                                    <label for="preanalysis_yes" class="ml-1 mr-4">Yes</label>
                                    <input type="radio" id="preanalysis_no" name="preanalysis_access" value="N" required>
                                    <label for="preanalysis_no" class="ml-1">No</label>
                                </div>

                                <div class="flex items-center">
                                    <label class="mr-2">Analysis Access:</label>
                                    <input type="radio" id="analysis_yes" name="analysis_access" value="Y" required>
                                    <label for="analysis_yes" class="ml-1 mr-4">Yes</label>
                                    <input type="radio" id="analysis_no" name="analysis_access" value="N" required>
                                    <label for="analysis_no" class="ml-1">No</label>
                                </div>

                                <div class="flex items-center">
                                    <label class="mr-2">Post-Analysis Access:</label>
                                    <input type="radio" id="postanalysis_yes" name="postanalysis_access" value="Y" required>
                                    <label for="postanalysis_yes" class="ml-1 mr-4">Yes</label>
                                    <input type="radio" id="postanalysis_no" name="postanalysis_access" value="N" required>
                                    <label for="postanalysis_no" class="ml-1">No</label>
                                </div>
                            </div>
                        </fieldset>
                    </div>
                </div>
                <div class="mt-4">
                    <input type="submit" value="Register"
                        class="bg-green-500 hover:bg-yellow-600 text-white font-bold py-2 px-4 rounded">
                    <a href="admin.jsp"
                        class="bg-blue-500 hover:bg-blue-600 text-white font-bold py-2 px-4 rounded">Home</a>
                </div>
            </form>
        </div>
    </div>
</body>
</html>
