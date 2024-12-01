

<!DOCTYPE html>
<html class="h-full">
<head>
     <meta charset="UTF-8">
    <title>Analysis</title>
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" rel="stylesheet">
    <link href="Components/Style.css" rel="stylesheet">
    <style>
    .mb-8 {
    margin-bottom: 1rem;
    }
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
    </style>
</head>
<body class="bg-gray-100 h-full">
    <div class="flex h-full">
        <!-- Sidebar -->
        <%@include file="Components/Navbar.jsp"%>

        <!-- Main Content -->
         <div class="flex-1 p-10 overflow-auto" style="margin-top:-60px">
            <div class="flex-4 p-7 ">
                <div class="flex justify-between items-center mb-8">
                    <h1 class="text-2xl font-bold text-gray-900">Sample Details</h1>
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
                                    <th class="py-3 px-6 text-left">Sample Collection Date</th>
                                    <th class="py-3 px-6 text-left">Sample Recived Date</th>
                                    <th class="py-3 px-6 text-left">TRF Details</th>
                                    <th class="py-3 px-6 text-left">Age</th>
                                    <th class="py-3 px-6 text-left">Gender</th>
                                    <th class="py-3 px-6 text-left">Address</th>
                                    <th class="py-3 px-6 text-left">Phone Number</th>
                                    
                                    <th class="py-3 px-6 text-left">Bill No</th>
                                    <th class="py-3 px-6 text-left">Patien Number</th>
                                    <th class="py-3 px-6 text-left">Refred By</th>
                                    <th class="py-3 px-6 text-left">Action</th>
                                </tr>
                            </thead>
                            <tbody class="text-black-700" id="sampalDetailsBody" >
                               
                                    <tr class="table-row border-b border-gray-200">
                                        <td class="py-3 px-6 text-left whitespace-nowrap">1</td>
                                        <td class="py-3 px-6 text-left whitespace-nowrap">Pallab</td>
                                       <td class="py-3 px-6 text-left whitespace-nowrap">
  
                                            <div class="flex justify-between items-center mb-3">
                                                <h6 class="flex-1 mr-4 min-w-[150px]">1.pallab</h6>

                                                <button
                                                   class="bg-green-600 text-white font-bold py-1 px-2 rounded-full shadow-md inline-flex items-center">
                                                    <i class="fas fa-vial mr-2"></i> Recived
                                                </button>

                                                    <button onclick="openModal()" 
                                                    class="bg-red-600 text-white font-bold py-1 px-2 rounded-full shadow-md inline-flex items-center">
                                                    <i class="fas fa-vial mr-2"></i> Pending
                                                </button>
                                              
                                            </div>
                                        
                                      
                                    </td>
                                        
                                        <td class="py-3 px-6 text-left whitespace-nowrap">
                                        01-09-2024
                                        </td>
                                        <td class="py-3 px-6 text-left whitespace-nowrap">
                                        01-09-2024
                                        </td>
	                                    <td class="py-3 px-6 text-left whitespace-nowrap">
	                                       ACB
	                                    </td>
                                        <td class="py-3 px-6 text-left whitespace-nowrap">26</td>
                                        <td class="py-3 px-6 text-left whitespace-nowrap">KJK</td>
                                        <td class="py-3 px-6 text-left whitespace-nowrap">Jhargarm</td>
                                        <td class="py-3 px-6 text-left whitespace-nowrap">9547709291</td>
                                        
                                        <td class="py-3 px-6 text-left whitespace-nowrap">P100</td>
                                        <td class="py-3 px-6 text-left whitespace-nowrap">P01</td>
                                        <td class="py-3 px-6 text-left whitespace-nowrap">Self</td>
                                        <td class="py-3 px-6 text-left whitespace-nowrap"> 

                                            <div class="flex justify-between items-center mb-3">
                                                <h6 class="flex-1 mr-4 min-w-[150px]">1:DFG</h6> 
                                                <button
                                                   class="bg-green-600 text-white font-bold py-1 px-2 rounded-full shadow-md inline-flex items-center">
                                                    <i class="fas fa-vial mr-2"></i> Done
                                                </button>

                                                    <button onclick="openModalTestValue()" 
                                                    class="bg-red-600 text-white font-bold py-1 px-2 rounded-full shadow-md inline-flex items-center">
                                                    <i class="fas fa-vial mr-2"></i> Pending
                                                </button>
                                                
                                            </div>
                                        
                                      
                                    </td>
                                    </tr>
                                    
                                                                        <tr class="table-row border-b border-gray-200">
                                        <td class="py-3 px-6 text-left whitespace-nowrap">2</td>
                                        <td class="py-3 px-6 text-left whitespace-nowrap">Pallab</td>
                                       <td class="py-3 px-6 text-left whitespace-nowrap">
  
                                            <div class="flex justify-between items-center mb-3">
                                                <h6 class="flex-1 mr-4 min-w-[150px]">1.pallab</h6>

                                                <button
                                                   class="bg-green-600 text-white font-bold py-1 px-2 rounded-full shadow-md inline-flex items-center">
                                                    <i class="fas fa-vial mr-2"></i> Recived
                                                </button>

                                                    <button onclick="openModal()" 
                                                    class="bg-red-600 text-white font-bold py-1 px-2 rounded-full shadow-md inline-flex items-center">
                                                    <i class="fas fa-vial mr-2"></i> Pending
                                                </button>
                                              
                                            </div>
                                        
                                      
                                    </td>
                                        
                                        <td class="py-3 px-6 text-left whitespace-nowrap">
                                        01-09-2024
                                        </td>
                                        <td class="py-3 px-6 text-left whitespace-nowrap">
                                        01-09-2024
                                        </td>
	                                    <td class="py-3 px-6 text-left whitespace-nowrap">
	                                       ACB
	                                    </td>
                                        <td class="py-3 px-6 text-left whitespace-nowrap">26</td>
                                        <td class="py-3 px-6 text-left whitespace-nowrap">KJK</td>
                                        <td class="py-3 px-6 text-left whitespace-nowrap">Jhargarm</td>
                                        <td class="py-3 px-6 text-left whitespace-nowrap">9547709291</td>
                                        
                                        <td class="py-3 px-6 text-left whitespace-nowrap">P100</td>
                                        <td class="py-3 px-6 text-left whitespace-nowrap">P01</td>
                                        <td class="py-3 px-6 text-left whitespace-nowrap">Self</td>
                                        <td class="py-3 px-6 text-left whitespace-nowrap"> 

                                            <div class="flex justify-between items-center mb-3">
                                                <h6 class="flex-1 mr-4 min-w-[150px]">1:DFG</h6> 
                                                <button
                                                   class="bg-green-600 text-white font-bold py-1 px-2 rounded-full shadow-md inline-flex items-center">
                                                    <i class="fas fa-vial mr-2"></i> Done
                                                </button>

                                                    <button onclick="openModalTestValue()" 
                                                    class="bg-red-600 text-white font-bold py-1 px-2 rounded-full shadow-md inline-flex items-center">
                                                    <i class="fas fa-vial mr-2"></i> Pending
                                                </button>
                                                
                                            </div>
                                        
                                      
                                    </td>
                               
                              
                              
                                                                       
                                   
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
<script>
    const rowsPerPage = 2;
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

</body>
</html>
