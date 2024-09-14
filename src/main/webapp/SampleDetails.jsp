<%@ page import="com.lms.dbconnect.Dbconnect"%>
<%@ page import="java.util.List"%>
<%@ page import="com.lms.vo.PreAnalysis"%>
<%@ page import="com.lms.vo.ExaminationDetails"%>
<%@ page import="com.lms.daoimpl.PreAnalysisDaoImp"%>
<%@ page import="com.lms.daoimpl.ExaminationDaoImpl"%>
<%@ page import="java.sql.Connection"%>

<%
PreAnalysisDaoImp preanalysis = new PreAnalysisDaoImp();
List<PreAnalysis> preanalysislist = preanalysis.getAllReciept();
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
                                    <th class="py-3 px-6 text-left">Collect Date</th>
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
                            <tbody class="text-black-700">
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
                                        String patientno = preList.getPatientNo();

                                        examList = preanalysis.getExaminationDetails(patientno);
                                        for (ExaminationDetails preList1 : examList) {
                                        %>
                                            <div class="flex justify-between items-center mb-3">
                                                <h6 class="flex-1 mr-4 min-w-[150px]"><%= list + ": " + preList1.getEx_name() %></h6>
                                               <%
                                               if(preList1.getSample_status()!= null){
                                               if(preList1.getSample_status().equals("P")){ %> 
                                                <button onclick="openModal('<%= preList.getPatientNo() %>', '<%= preList1.getEx_name() %>', '<%= preList.getAge() %>', '<%= preList.getName() %>')" 
                                                    class="bg-red-600 text-white font-bold py-2 px-4 rounded-full shadow-md inline-flex items-center">
                                                    <i class="fas fa-vial mr-2"></i> Pending
                                                </button>
                                                <%} else { %>
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
                                         <a href="SubmitSampal.jsp?patientNo=<%= preList.getPatientNo()%>&patientName=<%= preList.getName() %>"
                                              class="bg-blue-600 text-white font-bold py-2 px-4 rounded-full shadow-md inline-flex items-center">
                                             <!-- Updated icon for sample collection -->
                                            Submit
                                        </a>
                                    </td>
                                        <td class="py-3 px-6 text-left whitespace-nowrap"><%= preList.getDate() %></td>
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
                                                 <i class="fas fa-download mr-2"></i> View Report
                                                </a>
                                                <a href="Reciept1.jsp?patientNo=<%= preList.getPatientNo() %>" 
                                                  class="bg-blue-600 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded-full shadow-md inline-flex items-center">
                                                 <i class="fas fa-download mr-2"></i> Submit Sample
                                                </a>
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
     <form id="sampleForm" action="SampleDetails" method="get">
    <div class="mb-4">
        <label for="name" class="block text-sm font-medium text-gray-700">Test Name:</label>
        <input type="text" id="testname" name="testname" class="search-input" readonly>
    </div>

    <div class="mb-4">
        <label for="examName" class="block text-sm font-medium text-gray-700">Select Sample:</label>
        <select name="examName[]" id="examName" class="mt-1 block w-full py-2 px-3 border border-gray-300 bg-white rounded-md shadow-sm focus:outline-none focus:ring-blue-500 focus:border-blue-500 sm:text-sm">
            <option value="">Select Sample</option>
            <%
            
            ExaminationDaoImpl subexam= new ExaminationDaoImpl();
            List<String> list=subexam.showExaminationSubtype("EX08");
            
            
            for (int i = 0; i < list.size(); i++) { %>
                <option value="<%= list.get(i) %>"><%= list.get(i) %></option>
            <% } %>
        </select>
    </div>
        <div class="mb-4">
        <button type="button" class="btn-primary" id="addSampleBtn">
            <i class="fa-solid fa-plus"></i> Add Sample
        </button>
        <button type="button" class="btn-primary bg-red-600" id="removeSampleBtn">
            <i class="fa-solid fa-minus"></i> Remove Sample
        </button>
    </div>

    <div class="mb-4">
        <!-- <label for="addedSamples" class="block text-sm font-medium text-gray-700">Added Samples:</label> --> <span><div class="modal-footer">
       
       <!--  <button type="button" class="btn-primary" id="addSampleBtn"><i class="fa-solid fa-plus"></i> Add Sample</button> -->
    </div></span>
        <select  id="addedSamples"  name="addedSamples[]" class="mt-1 block w-full py-2 px-3 border border-gray-300 bg-white rounded-md shadow-sm focus:outline-none focus:ring-blue-500 focus:border-blue-500 sm:text-sm" multiple>
            <!-- Dynamically added options will appear here -->
        </select>
    </div>
    
    
    
    <div class="mb-4">
        <!-- <label for="address" class="block text-sm font-medium text-gray-700">Name:</label> -->
        <input type="text" id="name" name="name" class="search-input" readonly>
        <input type="text" id="patientId" name="patientId" class="search-input" readonly>
    </div>
    <div class="modal-footer">
        <button type="submit" class="btn-primary" >Submit</button>
        
    </div>
</form>

        </div>
    </div>

    <script>
    document.getElementById('addSampleBtn').addEventListener('click', function() {
        // Get the selected sample
        const sampleDropdown = document.getElementById('examName');
        const selectedSample = sampleDropdown.options[sampleDropdown.selectedIndex].text;
        const selectedSampleValue = sampleDropdown.value;

        // Check if a sample is selected
        if (selectedSampleValue === "") {
            alert("Please select a sample to add.");
            return;
        }

        // Check if the sample is already added
        const addedSamplesDropdown = document.getElementById('addedSamples');
        const options = addedSamplesDropdown.options;
        for (let i = 0; i < options.length; i++) {
            if (options[i].value === selectedSampleValue) {
                alert("This sample has already been added.");
                return; // Stop the function if duplicate is found
            }
        }

        // Create a new option element if not a duplicate
        const newOption = document.createElement('option');
        newOption.text = selectedSample;
        newOption.value = selectedSampleValue;

        // Add the new option to the added samples dropdown
        addedSamplesDropdown.add(newOption);

        // Optionally, reset the sample selection after adding
        sampleDropdown.selectedIndex = 0;
    });
    document.getElementById('removeSampleBtn').addEventListener('click', function() {
        // Get the added samples dropdown
        const addedSamplesDropdown = document.getElementById('addedSamples');

        // Check if a sample is selected for removal
        if (addedSamplesDropdown.selectedIndex === -1) {
            alert("Please select a sample to remove.");
            return;
        }

        // Remove the selected sample
        addedSamplesDropdown.remove(addedSamplesDropdown.selectedIndex);
    });
    document.getElementById('sampleForm').addEventListener('submit', function(event) {
        const addedSamples = document.getElementById('addedSamples');
        const selectedValues = [...addedSamples.options].map(option => option.value);
        console.log("Samples being submitted: ", selectedValues);
    });


    function openModal(patientId, testname, age, name) {
        // Populate modal fields with the data
        document.getElementById('testname').value = testname;
        document.getElementById('name').value = name;
        document.getElementById('patientId').value = patientId;

        // Show the modal
        document.getElementById('myModal').style.display = 'block';
    }

    function closeModal() {
        document.getElementById('myModal').style.display = 'none';

        // Clear the added samples list when closing
        const addedSamplesDropdown = document.getElementById('addedSamples');
        addedSamplesDropdown.innerHTML = ''; // Remove all options
    }

    window.onclick = function(event) {
        if (event.target == document.getElementById('myModal')) {
            closeModal();
        }
    }

    </script>
</body>
</html>
