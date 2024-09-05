<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="com.lms.daoimpl.PreAnalysisDaoImp"%>
<%@ page import="com.lms.vo.ExaminationDetails"%>
<%@ page import="javax.servlet.http.HttpServletRequest"%>
<%@ page import="javax.servlet.http.HttpServletResponse"%>
<%@ page import="javax.servlet.ServletException"%>
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
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body class="bg-gray-100 h-full flex">
    <!-- Sidebar -->
    <%@include file="Components/Navbar.jsp" %>

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
                        <select name="examName[]" class="border rounded p-2 w-full bg-gray-50" id="examNameDropdown" onchange="fetchExamDetails()">
                            <option value="">Select Examination</option>
                            <% 
                                PreAnalysisDaoImp examDao = new PreAnalysisDaoImp();
                                List<ExaminationDetails> examNames = examDao.getExaminationNames();
                                for (ExaminationDetails examName : examNames) { 
                            %>
                                <option value="<%= examName.getEx_name() %>"><%= examName.getEx_name() %></option>
                            <% } %>
                        </select>
                    </div>

                    <!-- Dynamic Subtype Input Fields -->
                    <div id="subtypeContainer">
                        <label for="subtype" class="block text-sm font-medium text-gray-700">Exam Subtype</label>
                        <div class="flex items-center">
                            <input type="text" name="examSubtype[]" class="border rounded p-2 w-full bg-gray-50 mt-1">
                            <button type="button" onclick="removeSubtypeField(this)" class="bg-red-500 text-white font-bold py-2 px-4 ml-2 rounded mt-1">
                                Remove
                            </button>
                        </div>
                    </div>

                    <!-- Button to Add More Subtypes -->
                    <div class="mt-4">
                        <button type="button" onclick="addSubtypeField()" class="bg-blue-500 text-white font-bold py-2 px-4 rounded">
                            Add More Subtype
                        </button>
                    </div>

                    <div>
                        <label for="examCode" class="block text-sm font-medium text-gray-700">Examination Code</label>
                        <input type="text" id="examCode" name="code" readonly
                            class="mt-1 block w-full px-4 py-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-blue-500 focus:border-blue-500 sm:text-sm">
                    </div>

                    <!-- Optional: Field for exam price -->
                    <!-- <div>
                        <label for="examPrice" class="block text-sm font-medium text-gray-700">Examination Price</label>
                        <input type="text" id="examPrice" name="price" readonly
                            class="mt-1 block w-full px-4 py-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-blue-500 focus:border-blue-500 sm:text-sm">
                    </div> -->
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

    <script>
        // Function to add more subtype input fields with a remove button
        function addSubtypeField() {
            var subtypeContainer = document.createElement('div');
            subtypeContainer.className = 'flex items-center mt-2';

            var newSubtypeField = document.createElement('input');
            newSubtypeField.type = 'text';
            newSubtypeField.name = 'examSubtype[]';
            newSubtypeField.className = 'border rounded p-2 w-full bg-gray-50';

            var removeButton = document.createElement('button');
            removeButton.type = 'button';
            removeButton.className = 'bg-red-500 text-white font-bold py-2 px-4 ml-2 rounded';
            removeButton.innerText = 'Remove';
            removeButton.onclick = function() {
                removeSubtypeField(removeButton);
            };

            subtypeContainer.appendChild(newSubtypeField);
            subtypeContainer.appendChild(removeButton);

            document.getElementById('subtypeContainer').appendChild(subtypeContainer);
        }

        // Function to remove a subtype input field
        function removeSubtypeField(button) {
            var fieldWrapper = button.parentElement;
            fieldWrapper.remove();
        }

        // Function to fetch exam details and update the input fields
        function fetchExamDetails() {
            var selectedExamName = $('#examNameDropdown').val();

            if (selectedExamName) {
                $.ajax({
                    url: 'FetchPriceServlet',
                    type: 'GET',
                    data: { examName: selectedExamName },
                    dataType: 'json',
                    success: function(response) {
                        $('#examCode').val(response.code);
                        $('#examPrice').val(response.price);
                    },
                    error: function(xhr, status, error) {
                        console.error('Error fetching exam details:', error);
                    }
                });
            } else {
                $('#examCode').val('');
                $('#examPrice').val('');
            }
        }
    </script>
</body>
</html>
