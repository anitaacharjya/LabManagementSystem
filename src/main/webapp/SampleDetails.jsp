<%@ page import="com.lms.dbconnect.Dbconnect"%>
<%@ page import="java.util.List"%>
<%@ page import="com.lms.vo.PreAnalysis"%>
<%@ page import="com.lms.vo.ExaminationDetails"%>
<%@ page import="com.lms.daoimpl.PreAnalysisDaoImp"%>
<%@ page import="com.lms.daoimpl.ExaminationDaoImpl"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.time.LocalDateTime" %>
<%@ page import="java.time.format.DateTimeFormatter" %>
<%@ page import="java.util.*"%>

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
    .mb-8 {
    margin-bottom: 1rem;
    }
    table {
        border-collapse: collapse; /* Ensures borders don't double up */
        width: 100%;
        hight: 100%;
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
            justify-content: RIGHT;
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
		.search-input {
		    border-radius: 0.375rem;
		    padding: 0.5rem;
		    border: 1px solid blue;
		}
        .submit-container {
            margin-top: 10px;
        }
        .submit-btn {
            background-color: #4CAF50;
            color: white;
            padding: 10px 20px;
            border: none;
            cursor: pointer;
            border-radius: 5px;
        }
        .disabled-checkbox {
            opacity: 0.5;
            pointer-events: none;
        }

    </style>
</head>
<body class="bg-gray-100 h-full">
    <div class="flex h-full">
        <!-- Sidebar -->
        <%@include file="Components/Navbar.jsp"%>

        <!-- Main Content -->
         <div class="flex-1 p-10 overflow-auto"style="margin-top:-60px">
        <div class="flex-1 p-7">
            <div class="flex items-center mb-2">
			    <h1 class="text-2xl font-bold text-gray-900 mr-4">Sample Details</h1>
			
			    <!-- Single Search Bar -->
			    <!-- <input type="text" id="searchInput" placeholder="Search by Name or Patient Number"
       class="search-input border-blue-300 focus:outline-none focus:ring-2 focus:ring-blue-400 ml-2"
       style="width: 350px;"> -->
       
       <!-- Single Search Bar -->
			        <!-- Search Bar -->
    <input type="text" id="searchInput" placeholder="Search by Name or Patient Number"
           class="search-input border-blue-300 focus:outline-none focus:ring-2 focus:ring-blue-400" 
           style="width:350px; margin-right: auto;">
			
			    
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
									  
									    
									       <div class="row" >
									        
									        <div class="checkbox-container">
									               <%
													    List<String> submitDate = new ArrayList<String>();
													    int list = 1;
													    boolean submitFlag = true;
													    String patientno = preList.getPatientNo();
													    String sampleCollectionTime = "";
													
													    examList = preanalysis.getExaminationDetails(patientno);
													    for (ExaminationDetails preList1 : examList) {
													        String name = preList1.getEx_name();
													        String examName = preanalysis.getExaminationName(name);
													        String examsample = preanalysis.getSampleType(name);
													        sampleCollectionTime = examName + " - " + preList1.getSampleCollectionTime();
													        submitDate.add(sampleCollectionTime);
													    %>
									           
									             
									                <%
									        if (preList1.getSample_status() != null) {
									            if (preList1.getSample_status().equals("P")) { 
									        %>
									            
									              
									                 <label><input type="checkbox" class="sample-checkbox" value="<%= preList1.getId() %>-<%= examsample %>" onchange="toggleSubmitButton(this)">
									                <span class="text-red-600 font-bold">
										                <%= list + ": " + examName %>
										            </span>
									            
									        <%
									                submitFlag = false;
									            } else { 
									        %>      
									        
									             <span class="text-green-600 font-bold">
									                &nbsp;&nbsp;&nbsp;&nbsp;<%= list + ": " + examName %>
									            </span>
																		        <%
									            }
									        }
									        %>
									             </label></br>
									            <%} %>
									        </div>
									        <div class="submit-container hidden">
									            <button class="submit-btn" onclick="submitSamples(this)">Submit</button>
									        </div>
									    </div>
									    
									</td>
                                        <td class="py-3 px-6 text-left whitespace-nowrap"><%= preList.getDate() %></td>
                                        <td class="py-3 px-6 text-left whitespace-nowrap">
                                        <%
                                        int listdate=1;
                                        for(String date: submitDate){%>
                                        	<%= listdate + ": " + date %></br>
                                        <%
                                        listdate++;
                                        }%>
                                        </td>
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

    	/* LocalDateTime now1= LocalDateTime.now();
    	// Format the date and time as "dd-MM-yyyy HH:mm:ss"
    	DateTimeFormatter formatter1 = DateTimeFormatter.ofPattern("dd-MM-yyyy HH:mm:ss");
    	String formattedDateTime1 = now1.format(formatter1); */

        // Populate modal fields with the data
     var currentdate = new Date();
     var datetime = currentdate.getDate() + "-"
                + (currentdate.getMonth()+1)  + "-" 
                + currentdate.getFullYear() + "  "  
                + currentdate.getHours() + ":"  
                + currentdate.getMinutes() + ":" 
                + currentdate.getSeconds();
        document.getElementById('testname').value = testname;
        document.getElementById('collectionTime').value = datetime;
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
    // Function to check if any checkbox is selected in the specific row
    
    function toggleSubmitButton(checkbox) {

        // Find the closest parent row
        const row = checkbox.closest('.row');
        const submitContainer = row.querySelector('.submit-container');
        const checkboxes = row.querySelectorAll('.sample-checkbox');
        
        if (!row) {
        	alert('Row not found.');
           // return;
        }

       
        if (!submitContainer) {
            alert('Submit container not found inside the row.');
            //return;
        }

        let isChecked = false;

        // Check if any checkbox is checked
        checkboxes.forEach(checkbox => {
            if (checkbox.checked) {
                isChecked = true;
            }
        });
        //alert("AA "+isChecked);
        //alert("submitContainer "+submitContainer);
        // Show or hide the submit button for the row
        if (isChecked) {
            submitContainer.classList.remove('hidden');
            disableOtherRows(row, true);
        } else {
            submitContainer.classList.add('hidden');
            disableOtherRows(row, false);
        }
    }

    // Function to disable checkboxes in other rows
    function disableOtherRows(selectedRow, disable) {
        const allRows = document.querySelectorAll('.row');

        allRows.forEach(row => {
            if (row !== selectedRow) {
                const checkboxes = row.querySelectorAll('.sample-checkbox');
                checkboxes.forEach(checkbox => {
                    checkbox.disabled = disable;
                    checkbox.classList.toggle('disabled-checkbox', disable);
                });
            }
        });
    }

    // Function to collect and submit the selected checkbox values for the specific row
    function submitSamples(button) {
        const row = button.closest('.row');
        const selectedSamples = [];
        const checkboxes = row.querySelectorAll('.sample-checkbox');

        // Collect selected checkboxes' values
        checkboxes.forEach(checkbox => {
            if (checkbox.checked) {
                selectedSamples.push(checkbox.value);
            }
        });
        
        const selectedSamplesValue = [];
        for (let i = 0; i < selectedSamples.length; i++) {
          console.log(" i "+selectedSamples[i]);
            var value=selectedSamples[i].split("-");
            selectedSamplesValue.push((i + 1)+". "+value[1]);
            
        }
        // Display the selected sample values (replace with actual logic)
        confirm('Please check sample once again\n' + selectedSamplesValue.join('\n'));

        // Here you can add your actual submission logic (e.g., AJAX call to the server)
    }
</script>
    
       <script>
    const rowsPerPage = 6;
    let currentPage = 1;
    const pageGroupSize = 3; // Number of page numbers to display at once

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

        const currentPageGroup = Math.ceil(currentPage / pageGroupSize);

        const startPage = (currentPageGroup - 1) * pageGroupSize + 1;
        const endPage = Math.min(startPage + pageGroupSize - 1, totalPages);

        // Create Previous group button
        if (currentPageGroup > 1) {
            const prevGroupButton = document.createElement("button");
            prevGroupButton.innerText = "<";
            prevGroupButton.classList.add("enabled");
            prevGroupButton.onclick = () => {
                const prevGroupStartPage = startPage - pageGroupSize;
                displayTablePage(prevGroupStartPage);
            };
            paginationControls.appendChild(prevGroupButton);
        }

        // Create page number buttons
        for (let i = startPage; i <= endPage; i++) {
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

        // Create Next group button
        if (endPage < totalPages) {
            const nextGroupButton = document.createElement("button");
            nextGroupButton.innerText = ">";
            nextGroupButton.classList.add("enabled");
            nextGroupButton.onclick = () => {
                const nextGroupStartPage = endPage + 1;
                displayTablePage(nextGroupStartPage);
            };
            paginationControls.appendChild(nextGroupButton);
        }
    }

    // Initialize the table with the first page
    document.addEventListener("DOMContentLoaded", () => {
        displayTablePage(currentPage);
    });
</script>


<script>
    // Function to filter rows based on a single search input
    function filterTable() {
        const searchInput = document.getElementById("searchInput").value.toLowerCase();
        const tableBody = document.getElementById("sampalDetailsBody");
        const rows = tableBody.getElementsByTagName("tr");

        for (let row of rows) {
            const nameCell = row.cells[1].textContent.toLowerCase(); // Column for Name
            const patientNoCell = row.cells[12].textContent.toLowerCase(); // Column for Patient Number

            // Check if search input matches either Name or Patient Number
            if (
                nameCell.includes(searchInput) || 
                patientNoCell.includes(searchInput)
            ) {
                row.style.display = ""; // Show row if matches
            } else {
                row.style.display = "none"; // Hide row if no match
            }
        }
    }

    // Attach input event listener to the search field
    document.getElementById("searchInput").addEventListener("input", filterTable);
</script>

</body>
</html>
