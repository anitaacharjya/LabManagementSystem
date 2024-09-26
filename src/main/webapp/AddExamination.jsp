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
            <form action="AddExaminationServlet" method="post" onsubmit="return validateForm()">
                <div class="grid grid-cols-1 gap-4">
                    <!-- <div>
                        <label for="group" class="block text-sm font-medium text-gray-700">Dicipline / Group</label>
                        <input type="text" id="group" name="group" required
                            class="mt-1 block w-full px-4 py-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-blue-500 focus:border-blue-500 sm:text-sm">
                    </div> -->
                     <div>
					    <label class="block text-sm font-medium text-gray-700">Dicipline / Group</label>
					    <select name="group" class="mt-1 block w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-blue-500 focus:border-blue-500 sm:text-sm">
					        <option value="" disabled selected>Select Dicipline / Group</option>
					        <option value="Biochemistry">BioChemistry</option>
					        <option value="Haematology">Haematology</option>
					        <option value="Clicalpathology">Clical Pathology</option>
					
					    </select>
					</div>
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
                 <!-- Dynamic Subtype Input Fields -->
                    <div id="subtypeContainer">
                        <!-- <label for="subtype" class="block text-sm font-medium text-gray-700">Exam Subtype</label>
                        <div class="flex items-center">
                            <input type="text" name="examSubtype[]" class="border rounded p-2 w-full bg-gray-50 mt-1">
                            <button type="button" onclick="removeSubtypeField(this)" class="bg-red-500 text-white font-bold py-2 px-4 ml-2 rounded mt-1">
                                Remove
                            </button>
                        </div> -->
                    </div>

                    <!-- Button to Add More Subtypes -->
                    <div class="mt-4">
                        <button type="button" onclick="addSubtypeField()" class="bg-blue-500 text-white font-bold py-2 px-4 rounded">
                            Add More Subtype
                        </button>
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
    subtypeContainer.className = 'grid grid-cols-4 gap-2 items-center mt-2'; // 3 columns layout for the input fields

    // SubType Name input
    var subTypeNameField = document.createElement('input');
    subTypeNameField.type = 'text';
    subTypeNameField.name = 'examSubtypeName[]';
    subTypeNameField.placeholder = 'SubType Name';
    subTypeNameField.className = 'border rounded p-2 w-full bg-gray-50';

    // Normal Range input
    var normalRangeField = document.createElement('input');
    normalRangeField.type = 'text';
    normalRangeField.name = 'examNormalRange[]';
    normalRangeField.placeholder = 'Normal Range';
    normalRangeField.className = 'border rounded p-2 w-full bg-gray-50';

    // Unit input
    var unitField = document.createElement('input');
    unitField.type = 'text';
    unitField.name = 'examUnit[]';
    unitField.placeholder = 'Unit';
    unitField.className = 'border rounded p-2 w-full bg-gray-50';

    // Remove button
    var removeButton = document.createElement('button');
    removeButton.type = 'button';
    removeButton.className = 'bg-red-500 text-white font-bold py-2 px-4 ml-2 rounded';
    removeButton.innerText = 'Remove';
    removeButton.onclick = function() {
        removeSubtypeField(removeButton);
    };

    // Append the inputs and button to the container
    subtypeContainer.appendChild(subTypeNameField);
    subtypeContainer.appendChild(normalRangeField);
    subtypeContainer.appendChild(unitField);
    subtypeContainer.appendChild(removeButton);

    // Append the container to the subtypeContainer div
    document.getElementById('subtypeContainer').appendChild(subtypeContainer);
}
    
  function validateForm() {
	    var isValid = true;
	    var subTypeFields = document.getElementsByName('examSubtypeName[]');
	    var normalRangeFields = document.getElementsByName('examNormalRange[]');
	    var unitFields = document.getElementsByName('examUnit[]');

	    // Iterate through each set of fields and check if any are empty
	    for (var i = 0; i < subTypeFields.length; i++) {
	        var subTypeName = subTypeFields[i].value.trim();
	        var normalRange = normalRangeFields[i].value.trim();
	        var unit = unitFields[i].value.trim();

	        if (subTypeName === '' || normalRange === '' || unit === '') {
	            isValid = false;
	            alert("Please fill out all fields in row " + (i + 1) + " (SubType Name, Normal Range, and Unit).");
	            break;
	        }
	    }

	    return isValid;
	}


    // Function to remove a subtype input field
    function removeSubtypeField(button) {
        var fieldWrapper = button.parentElement;
        fieldWrapper.remove();
    }
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
