<%@ page import="com.lms.dbconnect.Dbconnect"%>
<%@ page import="java.util.List"%>
<%@ page import="com.lms.vo.PreAnalysis"%>
<%@ page import="com.lms.vo.ExaminationDetails"%>
<%@ page import="com.lms.daoimpl.PreAnalysisDaoImp"%>
<%@ page import="com.lms.daoimpl.ExaminationDaoImpl"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.time.LocalDateTime" %>
<%@ page import="java.time.format.DateTimeFormatter" %>

<%
PreAnalysisDaoImp preanalysis = new PreAnalysisDaoImp();
List<PreAnalysis> preanalysislist = preanalysis.getSampleDetails();

LocalDateTime now = LocalDateTime.now();

// Format the date and time as "dd-MM-yyyy HH:mm:ss"
DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd-MM-yyyy HH:mm:ss");
String formattedDateTime = now.format(formatter);
%>

<!DOCTYPE html>
<html class="h-full">
<head>
    <meta charset="UTF-8">
    <title>Sample Details</title>
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" rel="stylesheet">
    <style>
    table {
        border-collapse: collapse; /* Ensures borders don't double up */
        width: 100%;
    }
    td {
        border: 1px solid #ccc; /* Adds borders around table header and data cells */
        padding: 8px;
        text-align: left;
    }
    .table-header {
        background-color: #2563eb; /* Darker color for better contrast */
        color: #fff;
    }
    .table-row:hover {
        background-color: #f3f4f6; /* Lighter hover effect */
    }
    .search-input {
        border-radius: 0.375rem; /* Smooth input borders */
        padding: 0.5rem;
        border: 1px solid #ccc;
        width: 100%;
        background-color: #f9f9f9;
    }
    .action-icons i {
        transition: transform 0.2s ease-in-out;
    }
    .action-icons i:hover {
        transform: scale(1.2);
    }
    .btn-primary {
        background-color: #2563eb;
        border: none;
        color: #fff;
        padding: 0.5rem 1rem;
        border-radius: 0.375rem;
        font-size: 0.875rem;
        font-weight: 600;
    }
    .btn-primary:hover {
        background-color: #1d4ed8;
    }
    /* Modal styles */
    .modal {
        display: none; /* Hidden by default */
        position: fixed;
        z-index: 1000;
        left: 0;
        top: 0;
        width: 100%;
        height: 100%;
        overflow: auto;
        background-color: rgba(0,0,0,0.4);
        padding: 20px;
    }
    .modal-content {
        background-color: #ffffff;
        margin: auto;
        padding: 20px;
        border: 1px solid #ddd;
        border-radius: 8px;
        width: 90%;
        max-width: 600px; /* Adjusted width */
        max-height: 80vh; /* Adjusted height */
        overflow-y: auto; /* Scroll if content overflows */
        box-shadow: 0 4px 8px rgba(0,0,0,0.1);
    }
    .modal-header {
        display: flex;
        justify-content: space-between;
        align-items: center;
        border-bottom: 1px solid #ddd;
        padding-bottom: 10px;
        margin-bottom: 20px;
    }
    .modal-header h2 {
        margin: 0;
        font-size: 1.5rem;
        color: #333;
    }
    .modal-header .close {
        color: #aaa;
        font-size: 1.5rem;
        font-weight: bold;
        cursor: pointer;
    }
    .modal-header .close:hover {
        color: #000;
    }
    .modal-footer {
        display: flex;
        justify-content: flex-end;
        gap: 10px;
    }
    .modal-footer .btn-primary {
        background-color: #2563eb;
        border: none;
        color: #fff;
        padding: 0.75rem 1.5rem;
        border-radius: 0.375rem;
        font-size: 1rem;
        font-weight: 600;
    }
    .modal-footer .btn-primary:hover {
        background-color: #1d4ed8;
    }
   
    </style>
    <style>
    .pagination {
            margin-top: 20px;
            display: flex;
            justify-content: center;
            gap: 8px;
        }
        .pagination button {
            background-color: #2563eb;
            color: #fff;
            padding: 8px 16px;
            border: none;
            border-radius: 0.375rem;
            cursor: pointer;
        }
        .pagination button.disabled {
            background-color: #ccc;
            cursor: not-allowed;
        }
        .disabled {
		    background-color: #ccc;
		    cursor: not-allowed;
		}
		
		.bg-blue-500 {
		    background-color: #2563eb;
		    color: white;
		    font-weight: bold;
		}
    </style>
</head>
<body class="bg-gray-100 h-full">
    <div class="flex h-full">
        <!-- Sidebar -->
        <%@include file="Components/Navbar.jsp"%>

        <!-- Main Content -->
         <div class="flex-1 p-10 overflow-auto" style="margin-top:-30px">
            <div class="flex-1 p-8">
                <div class="flex justify-between items-center mb-8">
                    <h1 class="text-4xl font-bold text-gray-900">Sample Details</h1>
                    <a href="CreateReciept.jsp" class="btn-primary flex items-center shadow-lg">
                        <i class="fas fa-plus mr-2"></i> Create Recipt
                    </a>
                </div>

                <!-- User Table -->
                <div class="bg-white shadow-lg rounded-lg overflow-hidden">
                    <div class="overflow-x-auto">
                        <table class="min-w-full leading-normal">
                            <thead>
                                <tr class="table-header text-xs uppercase tracking-wider bg-blue">
                                    <th class="py-3 px-6 text-left">SL No</th>
                                    <th class="py-3 px-6 text-left">Name</th>
                                    <th class="py-3 px-6 text-left">Examination</th>
                                    <th class="py-3 px-6 text-left">Reciept Date</th>
                                    <th class="py-3 px-6 text-left"> Sample Collection Date</th>
                                    <th class="py-3 px-6 text-left">TRF Date</th>
                                    <th class="py-3 px-6 text-left">Age</th>
                                    <th class="py-3 px-6 text-left">Gender</th>
                                    <th class="py-3 px-6 text-left">Address</th>
                                    <th class="py-3 px-6 text-left">Phone Number</th>
                                    <th class="py-3 px-6 text-left">Create Date</th>
                                    <th class="py-3 px-6 text-left">Bill No</th>
                                    <th class="py-3 px-6 text-left">Patien Number</th>
                                    <th class="py-3 px-6 text-left">Refred By</th>
                                    <th class="py-3 px-6 text-left">Action</th>
                                </tr>
                            </thead>
                            <tbody class="text-black-700" id="sampalDetailsBody" >
                                <%
                                List<ExaminationDetails> examList=null;
                                int count = 1;
                                if (preanalysislist != null) {
                                    for (PreAnalysis preList : preanalysislist) {
                                    %>
                                    <tr class="table-row border-b border-gray-200">
                                        <td class="py-3 px-6 text-left whitespace-nowrap"><%= count %></td>
                                        <td class="py-3 px-6 text-left whitespace-nowrap"><%= preList.getName() %></td>
                                       <td class="py-3 px-6 text-left whitespace-nowrap">
                                        <%
                                        int list = 1;
                                        boolean submitFlag=true;
                                        String patientno = preList.getPatientNo();
                                        String sampleCollectionTime="";

                                        examList = preanalysis.getExaminationDetails(patientno);
                                        for (ExaminationDetails preList1 : examList) {
                                        	 String name=preList1.getEx_name();
                                        	 String examName=preanalysis.getExaminationName(name);
                                        	 String examsample=preanalysis.getSampleType(name);
                                        	 sampleCollectionTime=examName+" - "+preList1.getSampleCollectionTime();
                                        %>
                                            <div class="flex justify-between items-center mb-3">
                                                <h6 class="flex-1 mr-4 min-w-[150px]"><%= list + ": " +examName %></h6>
                                               <%
                                               if(preList1.getSample_status()!= null){
                                               if(preList1.getSample_status().equals("P")){ %> 
                                                <button onclick="openModal('<%= preList1.getId() %>', '<%= examsample %>', '<%= preList1.getEx_code() %>', '<%= formattedDateTime %>')" 
                                                    class="bg-red-600 text-white font-bold py-2 px-4 rounded-full shadow-md inline-flex items-center">
                                                    <i class="fas fa-vial mr-2"></i> Pending
                                                </button>
                                                <%
                                                submitFlag=false;
                                               } else { %>
                                                <button
                                                   class="bg-green-600 text-white font-bold py-2 px-4 rounded-full shadow-md inline-flex items-center">
                                                    <i class="fas fa-vial mr-2"></i> Collected
                                                </button>
                                                <%}} %>
                                            </div>
                                            <%
                                            list++;
                                        }
                                        %>
                                        <%if(submitFlag==true){ %>
                                         <a href="SubmitSampal.jsp?patientNo=<%= preList.getPatientNo()%>&patientName=<%= preList.getName() %>"
                                              class="bg-blue-600 text-white font-bold py-2 px-4 rounded-full shadow-md inline-flex items-center">
                                             <!-- Updated icon for sample collection -->
                                            TRF submit
                                        </a>
                                        <%}else{ %>
                                              <a href="#"
                                              class="bg-blue-300 text-white font-bold py-2 px-4 rounded-full shadow-md inline-flex items-center"  disabled>
                                             <!-- Updated icon for sample collection -->
                                            TRF submited
                                        </a>
                                        <%} %>
                                    </td>
                                        <td class="py-3 px-6 text-left whitespace-nowrap"><%= preList.getDate() %></td>
                                        <td class="py-3 px-6 text-left whitespace-nowrap"><%= sampleCollectionTime %></td>
                                        <td class="py-3 px-6 text-left whitespace-nowrap"><%= preList.getSampleCollectionDate() %></td>
                                        <td class="py-3 px-6 text-left whitespace-nowrap"><%= preList.getAge() %></td>
                                        <td class="py-3 px-6 text-left whitespace-nowrap"><%= preList.getGender() %></td>
                                        <td class="py-3 px-6 text-left whitespace-nowrap"><%= preList.getAddress() %></td>
                                        <td class="py-3 px-6 text-left whitespace-nowrap"><%= preList.getPhoneNo()%></td>
                                        <td class="py-3 px-6 text-left whitespace-nowrap"><%= preList.getDate() %></td>
                                        <td class="py-3 px-6 text-left whitespace-nowrap"><%= preList.getBillNo() %></td>
                                        <td class="py-3 px-6 text-left whitespace-nowrap"><%= preList.getPatientNo() %></td>
                                        <td class="py-3 px-6 text-left whitespace-nowrap"><%= preList.getReferredby() %></td>
                                      
                                        <td class="py-3 px-6 text-center whitespace-nowrap">
                                            <div class="flex items-center justify-center action-icons">
                                                <a href="TestRequisitionForm.jsp?patientNo=<%= preList.getPatientNo() %>" 
                                                  class="bg-blue-600 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded-full shadow-md inline-flex items-center">
                                                 <i class="fas fa-download mr-2"></i> View TRF Report
                                                </a>
                                               <%--  <a href="Reciept1.jsp?patientNo=<%= preList.getPatientNo() %>" 
                                                  class="bg-blue-600 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded-full shadow-md inline-flex items-center">
                                                 <i class="fas fa-download mr-2"></i> Submit Sample
                                                </a> --%>
                                            </div>
                                        </td>
                                    </tr>
                                    <%
                                        count++;
                                        }
                                    }
                                    %>
                                </tbody>
                            </table>
                        </div>
                        <!-- Pagination Controls -->
                        <div class="pagination" id="paginationControls"></div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Modal HTML -->
    <div id="myModal" class="modal">
        <div class="modal-content">
            <div class="modal-header">
                <h2>Pending Sample Details</h2>
                <span class="close" onclick="closeModal()"><i class="fa-solid fa-rectangle-xmark" style="color: #e30202;"></i></span>
            </div>
     <form id="sampleForm" action="TestSampleDetails" method="get">
    <div class="mb-4">
                <label for="name" class="block text-sm font-medium text-gray-700">Sample Type</label>
                <input type="text" id="testname" name="testname" class="search-input" readonly>
     </div>
     
      <div class="mb-4">
                <label for="name" class="block text-sm font-medium text-gray-700">Collection time</label>
                <input type="text" id="collectionTime" name="collectionTime" class="search-input" readonly>
     </div>
    

           <%--  <div class="mb-4">
                <label for="examName" class="block text-sm font-medium text-gray-700">Examination Name</label>
                <select name="examName" id="examName" class="mt-1 block w-full py-2 px-3 border border-gray-300 bg-white rounded-md shadow-sm focus:outline-none focus:ring-blue-500 focus:border-blue-500 sm:text-sm">
                    <option value="">Select Sample</option>
                    <% 
                        ExaminationDaoImpl subexam = new ExaminationDaoImpl();
                        List<String> list = subexam.showExaminationSubtype("EX08");
                        for (int i = 0; i < list.size(); i++) { 
                    %>
                        <option value="<%= list.get(i) %>"><%= list.get(i) %></option>
                    <% } %>
                </select>
            </div> --%>
      

    <!-- Container for dynamically added input fields -->
            <div id="dynamicFieldsContainer" class="mb-4">
            </div>
    
    <div class="mb-4">
        <!-- <label for="address" class="block text-sm font-medium text-gray-700">Name:</label> -->
        
        <input type="hidden" id="Id" name="Id" class="search-input" readonly>
        <input type="hidden" id="examCoad" name="examCoad" class="search-input" readonly>
    </div>
    <div class="modal-footer">
        <button type="submit" class="btn-primary" >Submit</button>
        
    </div>
</form>

        </div>
    </div>
 
    <script>
    
    document.getElementById('examName').addEventListener('change', function() {
        const selectedSample = this.value;

        if (selectedSample === "") {
            alert("Please select a sample.");
            return;
        }

        // Check if sample already exists in the dynamic fields
        if (document.getElementById("input-" + selectedSample)) {
            alert("This sample has already been added.");
            return;
        }

        // Get the container where new input fields will be added
        const container = document.getElementById('dynamicFieldsContainer');

        // Create a new div for each dynamic input
        const newDiv = document.createElement('div');
        newDiv.classList.add('flex', 'items-center', 'mb-2');
        newDiv.id = "input-" + selectedSample;  // Assign an id for easy removal

        // Create a new input element
        const newInput = document.createElement('input');
        newInput.type = 'text';
        newInput.name = 'addedSamples[]';
        newInput.value = selectedSample;
        newInput.classList.add('search-input', 'flex-1', 'mr-2');
        newInput.readOnly = true;  // Make the input readonly

        // Create a remove button
        const removeButton = document.createElement('button');
        removeButton.type = 'button';
        removeButton.classList.add('bg-red-600', 'text-white', 'font-bold', 'py-2', 'px-4', 'rounded-full', 'shadow-md');
        removeButton.innerText = "Remove";
        removeButton.onclick = function() {
            container.removeChild(newDiv);  // Remove the div when the button is clicked
        };

        // Append the input and remove button to the div
        newDiv.appendChild(newInput);
        newDiv.appendChild(removeButton);

        // Append the new div to the container
        container.appendChild(newDiv);

        // Reset the dropdown selection
        this.selectedIndex = 0;
    });

    function openModal(Id, testname, examCoad, collectionTime) {
        // Populate modal fields with the data
        document.getElementById('testname').value = testname;
        document.getElementById('collectionTime').value = collectionTime;
        document.getElementById('Id').value = Id;
        document.getElementById('examCoad').value = examCoad;

        // Show the modal
        document.getElementById('myModal').style.display = 'block';
        fetchSubtypes(testname);
    }

    function closeModal() {
        document.getElementById('myModal').style.display = 'none';

        // Clear all dynamically added fields
        const container = document.getElementById('dynamicFieldsContainer');
        container.innerHTML = '';
    }

    window.onclick = function(event) {
        if (event.target == document.getElementById('myModal')) {
            closeModal();
        }
    }
    function fetchSubtypes(examCoad) {
        const xhr = new XMLHttpRequest();
        xhr.open("GET", "GetExaminationSubtypes?examCoad=" + examCoad, true); // The servlet or JSP to handle this request
        xhr.onreadystatechange = function () {
            if (xhr.readyState == 4 && xhr.status == 200) {
                // Populate the dropdown with the response
                const subtypes = JSON.parse(xhr.responseText);  // Assuming the server returns a JSON array
                const selectElement = document.getElementById('examName');
                selectElement.innerHTML = '<option value="">Examination Name</option>';  // Clear previous options

                subtypes.forEach(function(subtype) {
                    const option = document.createElement('option');
                    option.value = subtype;
                    option.textContent = subtype;
                    selectElement.appendChild(option);
                });
            }
        };
        xhr.send();
    }

    
    </script>
    
        <script>
    const rowsPerPage = 2;
    let currentPage = 1;

    // Function to display the table rows for the current page
    function displayTablePage(page) {
        const tableBody = document.getElementById("sampalDetailsBody");
        const rows = tableBody.getElementsByTagName("tr");
        const totalRows = rows.length;
        const totalPages = Math.ceil(totalRows / rowsPerPage);

        // Ensure the page number is within valid range
        if (page < 1) page = 1;
        if (page > totalPages) page = totalPages;

        // Update current page
        currentPage = page;

        // Calculate the start and end row indices
        const startRow = (currentPage - 1) * rowsPerPage;
        const endRow = Math.min(startRow + rowsPerPage, totalRows);

        // Hide all rows initially
        for (let i = 0; i < totalRows; i++) {
            rows[i].style.display = "none";
        }

        // Display only the rows for the current page
        for (let i = startRow; i < endRow; i++) {
            rows[i].style.display = "";
        }

        // Update the pagination controls
        updatePaginationControls(totalPages);
    }

    // Function to update the pagination controls
    function updatePaginationControls(totalPages) {
        const paginationControls = document.getElementById("paginationControls");
        paginationControls.innerHTML = "";

        // Create Previous button
        const prevButton = document.createElement("button");
        prevButton.innerText = "Previous";
        prevButton.disabled = currentPage === 1;
        prevButton.classList.add(currentPage === 1 ? "disabled" : "enabled");
        prevButton.onclick = () => {
            if (currentPage > 1) {
                displayTablePage(currentPage - 1);
            }
        };
        paginationControls.appendChild(prevButton);

        // Create page number buttons
        for (let i = 1; i <= totalPages; i++) {
            const pageButton = document.createElement("button");
            pageButton.innerText = i;

            // Highlight the current page
            if (i === currentPage) {
                pageButton.classList.add("disabled", "bg-blue-500");
                pageButton.disabled = true;
            } else {
                pageButton.classList.add("enabled");
                pageButton.onclick = () => displayTablePage(i);
            }
            paginationControls.appendChild(pageButton);
        }

        // Create Next button
        const nextButton = document.createElement("button");
        nextButton.innerText = "Next";
        nextButton.disabled = currentPage === totalPages;
        nextButton.classList.add(currentPage === totalPages ? "disabled" : "enabled");
        nextButton.onclick = () => {
            if (currentPage < totalPages) {
                displayTablePage(currentPage + 1);
            }
        };
        paginationControls.appendChild(nextButton);
    }

    // Initialize the table with the first page
    document.addEventListener("DOMContentLoaded", () => {
        displayTablePage(currentPage);
    });
</script>
</body>
</html>
