<%@ page import="java.util.List"%>
<%@ page import="com.lms.daoimpl.PreAnalysisDaoImp"%>
<%@ page import="com.lms.vo.ExaminationDetails"%>

<%
    // Fetch examination names from the database
    PreAnalysisDaoImp examDao = new PreAnalysisDaoImp();
    List<ExaminationDetails> examNames = examDao.getExaminationNames();
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Examination Details</title>
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
    <style>
        .btn-primary {
            @apply bg-blue-500 text-white font-semibold py-2 px-4 rounded shadow-lg hover:bg-blue-600 transition duration-300 ease-in-out;
        }
        .table-header {
            @apply text-xs uppercase tracking-wider text-gray-700 bg-gray-200;
        }
        .invalid {
            border-color: red;
        }
    </style>
    <script>
        function addExaminationRow() {
            const table = document.getElementById("examinationTable");
            const newRow = table.insertRow();
            
            const cell1 = newRow.insertCell(0);
            const cell2 = newRow.insertCell(1);
            const cell3 = newRow.insertCell(2);

            // Generate the dropdown with examination names
            let dropdownHTML = `<select name="examName[]" class="border rounded p-2 w-full bg-gray-50" onchange="fetchPrice(this)">`;
            dropdownHTML += `<option value="">Select Examination</option>`;
            <% for (ExaminationDetails examName : examNames) { %>
                dropdownHTML += `<option value="<%= examName.getEx_name() %>"><%= examName.getEx_name() %></option>`;
            <% } %>
            dropdownHTML += `</select>`;

            cell1.innerHTML = dropdownHTML;
            cell2.innerHTML = `<input type="text" name="examPrice[]" class="border rounded p-2 w-full bg-gray-50" placeholder="Price" readonly>`;
            cell3.innerHTML = `<button type="button" onclick="removeExaminationRow(this)" class="btn-primary">Remove</button>`;
        }

        function removeExaminationRow(button) {
            const row = button.parentNode.parentNode;
            row.parentNode.removeChild(row);
        }

        function fetchPrice(selectElement) {
            const examName = selectElement.value;
            const priceInput = selectElement.parentElement.nextElementSibling.querySelector('input[name="examPrice[]"]');

            if (examName) {
                const xhr = new XMLHttpRequest();
                xhr.open('GET', 'FetchPriceServlet?examName=' + encodeURIComponent(examName), true);
                xhr.onreadystatechange = function() {
                    if (xhr.readyState === 4 && xhr.status === 200) {
                        priceInput.value = xhr.responseText;
                    }
                };
                xhr.send();
            } else {
                priceInput.value = ""; // Clear the price field if no examination is selected
            }

            validateExaminations();
        }

        function validateExaminations() {
            const examSelectElements = document.getElementsByName('examName[]');
            const selectedExams = new Set();
            let isValid = true;

            for (let i = 0; i < examSelectElements.length; i++) {
                const selectElement = examSelectElements[i];
                const examName = selectElement.value;

                if (examName !== "") {
                    if (selectedExams.has(examName)) {
                        selectElement.classList.add('invalid');
                        isValid = false;
                    } else {
                        selectElement.classList.remove('invalid');
                    }
                    selectedExams.add(examName);
                } else {
                    selectElement.classList.remove('invalid');
                }
            }

            if (!isValid) {
                alert("Examination Type already selected.");
            }
            return isValid;
        }
    </script>
</head>

<body class="bg-gray-100 h-full flex">
    <!-- Sidebar -->
    <%@include file="Components/Navbar.jsp" %>

    <!-- Main Content -->
    <div class="flex-1 p-10 flex justify-center items-center" style="margin-top:-40px">
        <div class="container mx-auto bg-white p-8 rounded shadow-lg w-full max-w-6xl">
            
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
            <form action="RecieptServlet" method="post" class="bg-white p-6 rounded-lg shadow-md" onsubmit="return validateExaminations();">
            <h2 class="text-2xl font-semibold mb-6 text-gray-800 "style="margin-top:-40px">Reciept</h2>
            <div class="grid grid-cols-1 md:grid-cols-4 gap-4 mb-5">
                <div>
                    <label class="block mb-2 text-black-700">Name:</label>
                    <input type="text" name="name"  class="mt-1 block w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-blue-500 focus:border-blue-500 sm:text-sm">
                </div>
                <div>
                    <label class="block mb-2 text-black-700">Age:</label>
                    <input type="text" name="age"  class="mt-1 block w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-blue-500 focus:border-blue-500 sm:text-sm"> 
                </div>
                <div>
                    <label class="block mb-2 text-black-700">Gender:</label>
                    <input type="text" name="gender"  class="mt-1 block w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-blue-500 focus:border-blue-500 sm:text-sm"> 
                </div>
                <div>
                    <label class="block mb-2 text-black-700">Address:</label>
                    <input type="text" name="address" class="border rounded p-3 w-full bg-gray-50" value="">
                </div>
                <div>
                    <label class="block mb-2 text-gray-700">Phone Number:</label>
                    <input type="text" name="phonenumber"  class="mt-1 block w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-blue-500 focus:border-blue-500 sm:text-sm">
                </div>
                <div>
                    <label class="block mb-2 text-black-700">Email:</label>
                    <input type="email" name="email"  class="mt-1 block w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-blue-500 focus:border-blue-500 sm:text-sm">
                </div>
                <div>
                    <label class="block mb-2 text-black-700">Date:</label>
                    <input type="text" name="date"  class="mt-1 block w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-blue-500 focus:border-blue-500 sm:text-sm"> 
                </div>
               
                <div>
                    <label class="block mb-2 text-black-700">Bill No:</label>
                    <input type="text" name="billno"  class="mt-1 block w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-blue-500 focus:border-blue-500 sm:text-sm">
                </div>
                <div>
                    <label class="block mb-2 text-black-700">Patient ID:</label>
                    <input type="text" name="patientid"  class="mt-1 block w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-blue-500 focus:border-blue-500 sm:text-sm">
                </div>
                <div>
                    <label class="block mb-2 text-black-700">Reffred By:</label>
                    <input type="text" name="reffer"  class="mt-1 block w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-blue-500 focus:border-blue-500 sm:text-sm">
                </div>
                <!-- Add other user details as necessary -->
            </div>

            <!-- Examination Details Section -->
            <div class="grid grid-cols-1 md:grid-cols-4 gap-8 mb-8">
            
            <div>
            <button type="button" onclick="addExaminationRow()" class="bg-blue-500  text-white font-bold py-2 px-4 rounded"><i class="fa-solid fa-plus"></i>Add Examination</button>
            </div>
            </div>
            <div class="mb-6">
                <table id="examinationTable" class="min-w-full bg-white shadow-lg rounded-lg border border-gray-300">
                    <thead>
                        <tr class="table-header">
                            <th class="py-4 px-6 text-center">Examination Name</th>
                            <th class="py-4 px-6 text-center">Price</th>
                            <th class="py-4 px-6 text-center">Action</th>
                        </tr>
                    </thead>
                    <tbody>
    <tr>
        <td>
            <select name="examName[]" class="border rounded p-2 w-full bg-gray-50" onchange="fetchPrice(this)">
                <option value="">Select Examination</option>
                <% for (ExaminationDetails examName : examNames) { %>
                    <option value="<%= examName.getEx_name() %>"><%= examName.getEx_name() %></option>
                <% } %>
            </select>
        </td>
        <td>
            <input type="text" name="examPrice[]" class="border rounded p-2 w-full bg-gray-50" placeholder="Price" readonly style="margin-left:20px">
        </td>
        <td style="text-align: center; vertical-align: middle;">
            <button type="button" onclick="removeExaminationRow(this)" class="bg-red-500 text-white font-bold py-2 px-4 rounded">
                <i class="fa-solid fa-trash"></i> Remove
            </button>
        </td>
    </tr>
</tbody>

                </table>
            </div>
            
            <div>
                <button type="submit" class="bg-green-500 hover:bg-yellow-600 text-white font-bold py-2 px-4 rounded">Submit</button>
            </div>
        </form>
        </div>
    </div>
</body>
</html>


