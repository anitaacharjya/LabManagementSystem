<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.lms.daoimpl.CommonFunction"%>
<%@ page import="com.lms.vo.ExaminationDetails"%>
<%@ page import="com.lms.daoimpl.ExaminationDaoImpl"%>
<!DOCTYPE html>
<html class="h-full">
<head>
    <meta charset="UTF-8">
    <title>Edit Examination</title>
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
    <style>
    input[readonly] {
        background-color: #e2e8f0;
        color: #4a5568;
    }
    </style>
</head>
<body class="bg-gray-100 h-full flex">
    <!-- Sidebar -->
    <%@include file="Components/Navbar.jsp" %>
    
    <!-- Fetching Exam Details to Edit -->
    <%
        String examCode = request.getParameter("examCode"); // Get exam code from query string
        ExaminationDaoImpl examDao = new ExaminationDaoImpl();
        ExaminationDetails exam = examDao.getExaminationByCode(examCode); // Fetch the details of the selected exam
        List<String> subtypes = examDao.getSubExaminatione(examCode);
        if (exam == null) {
            out.println("<h3 class='text-red-500 text-center'>Invalid Exam Code</h3>");
        } else {
    %>

    <!-- Main Content -->
    <div class="flex-1 p-10 flex justify-center items-center">
        <div class="container mx-auto bg-white p-10 rounded-lg shadow-lg w-full max-w-3xl">
            <div class="text-center mb-10">
                <h2 class="text-3xl font-semibold text-gray-800">Edit Examination Details</h2>
                <p class="text-gray-500 mt-2">Please edit the form and save the changes.</p>
            </div>
            <form action="EditExaminationServlet" method="post" onsubmit="return validateForm()">
               <%--  <input type="hidden" name="examId" value="<%= exam.getId() %>"> --%>
                <div class="grid grid-cols-1 gap-4">
                    <div>
                        <label for="group" class="block text-sm font-medium text-gray-700">Discipline / Group</label>
                        <select name="group" class="mt-1 block w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-blue-500 focus:border-blue-500 sm:text-sm">
                            <option value="Biochemistry" <%= exam.getGroup().equals("Biochemistry") ? "selected" : "" %>>BioChemistry</option>
                            <option value="Haematology" <%= exam.getGroup().equals("Haematology") ? "selected" : "" %>>Haematology</option>
                            <option value="Clicalpathology" <%= exam.getGroup().equals("Clicalpathology") ? "selected" : "" %>>Clical Pathology</option>
                        </select>
                    </div>

                    <div>
                        <label for="name" class="block text-sm font-medium text-gray-700">Exam Name</label>
                        <input type="text" id="name" name="name" value="<%= exam.getEx_name() %>" required
                            class="mt-1 block w-full px-4 py-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-blue-500 focus:border-blue-500 sm:text-sm">
                    </div>

                   <%--  <div>
                        <label for="price" class="block text-sm font-medium text-gray-700">Price</label>
                        <input type="text" id="price" name="price" value="<%= exam.getEx_price() %>" required
                            class="mt-1 block w-full px-4 py-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-blue-500 focus:border-blue-500 sm:text-sm">
                    </div> --%>

                    <div>
                        <label for="code" class="block text-sm font-medium text-gray-700">Examination Code</label>
                        <input type="text" id="code" name="code" value="<%= exam.getEx_code() %>" readonly
                            class="mt-1 block w-full px-4 py-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-blue-500 focus:border-blue-500 sm:text-sm">
                    </div>
                </div>

                <!-- Dynamic Subtype Fields for Editing -->
                <div id="subtypeContainer">
                    <label class="block text-sm font-medium text-gray-700">Exam Subtypes</label>
                    <% 
                         // Assuming subtypes are retrieved in this list
                        for (String subtype : subtypes) {
                            String[] subtypeData = subtype.split("~");
                            String subtypeName = subtypeData[0];
                            String normalRange = subtypeData[1];
                            String unit = subtypeData[2]; 
                            String price = subtypeData[3];
                            String method = subtypeData[4];
                    %>
                    <div class="grid grid-cols-4 gap-2 items-center mt-2">
                         <input type="text" name="examSubtypeName[]" value="<%= subtypeName %>" class="border rounded p-2 w-full bg-gray-50" placeholder="SubType Name">
                        
                        <input type="text" name="examUnit[]" value="<%= unit %>" class="border rounded p-2 w-full bg-gray-50" placeholder="Unit">
                        <input type="text" name="examPrice[]" value="<%= price %>" class="border rounded p-2 w-full bg-gray-50" placeholder="Price">
                        <input type="text" name="examMethod[]" value="<%= method %>" class="border rounded p-2 w-full bg-gray-50" placeholder="Method">
                        <textarea name="examNormalRange[]" class="border rounded p-2 w-full bg-gray-50" placeholder="Normal Range"><%= normalRange %></textarea>
                        <button type="button" onclick="removeSubtypeField(this)" class="bg-red-500 text-white font-bold py-2 px-4 ml-2 rounded">Remove</button>
                    </div>
                    <% } %>
                </div>

                <!-- Add More Subtypes Button -->
                <div class="mt-4">
                    <button type="button" onclick="addSubtypeField()" class="bg-blue-500 text-white font-bold py-2 px-4 rounded">
                        Add More Subtype
                    </button>
                </div>

                <div class="mt-8 flex justify-between">
                    <button type="submit" class="bg-green-600 hover:bg-green-700 text-white font-semibold py-2 px-6 rounded-lg shadow-lg transition duration-300">
                        Save Changes
                    </button>
                    <a href="ExaminationDetails.jsp" class="bg-blue-500 hover:bg-blue-600 text-white font-semibold py-2 px-6 rounded-lg shadow-lg transition duration-300">
                        Cancel
                    </a>
                </div>
            </form>
        </div>
    </div>
    <% } %>
    
    <script>
    // Same JavaScript for handling dynamic fields and validation as in your add page

    function addSubtypeField() {
        var subtypeContainer = document.createElement('div');
        subtypeContainer.className = 'grid grid-cols-4 gap-2 items-center mt-2';

        var subTypeNameField = document.createElement('input');
        subTypeNameField.type = 'text';
        subTypeNameField.name = 'examSubtypeName[]';
        subTypeNameField.placeholder = 'SubType Name';
        subTypeNameField.className = 'border rounded p-2 w-full bg-gray-50';

        var normalRangeField = document.createElement('input');
        normalRangeField.type = 'text';
        normalRangeField.name = 'examNormalRange[]';
        normalRangeField.placeholder = 'Normal Range';
        normalRangeField.className = 'border rounded p-2 w-full bg-gray-50';

        var unitField = document.createElement('input');
        unitField.type = 'text';
        unitField.name = 'examUnit[]';
        unitField.placeholder = 'Unit';
        unitField.className = 'border rounded p-2 w-full bg-gray-50';
        
        var priceField = document.createElement('input');
        priceField.type = 'text';
        priceField.name = 'examPrice[]';
        priceField.placeholder = 'Price';
        priceField.className = 'border rounded p-2 w-full bg-gray-50';

        var removeButton = document.createElement('button');
        removeButton.type = 'button';
        removeButton.className = 'bg-red-500 text-white font-bold py-2 px-4 ml-2 rounded';
        removeButton.innerText = 'Remove';
        removeButton.onclick = function() {
            removeSubtypeField(removeButton);
        };

        subtypeContainer.appendChild(subTypeNameField);
        subtypeContainer.appendChild(normalRangeField);
        subtypeContainer.appendChild(unitField);
        subtypeContainer.appendChild(priceField);
        subtypeContainer.appendChild(removeButton);

        document.getElementById('subtypeContainer').appendChild(subtypeContainer);
    }

    function removeSubtypeField(button) {
        var fieldWrapper = button.parentElement;
        fieldWrapper.remove();
    }

    function validateForm() {
        var isValid = true;
        var subTypeFields = document.getElementsByName('examSubtypeName[]');
        var normalRangeFields = document.getElementsByName('examNormalRange[]');
        var unitFields = document.getElementsByName('examUnit[]');

        for (var i = 0; i < subTypeFields.length; i++) {
            if (subTypeFields[i].value.trim() === '' || normalRangeFields[i].value.trim() === '' || unitFields[i].value.trim() === '') {
                isValid = false;
                alert("Please fill out all fields in row " + (i + 1));
                break;
            }
        }

        return isValid;
    }
    </script>
</body>
</html>
