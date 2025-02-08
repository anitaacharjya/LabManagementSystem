<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.lms.dbconnect.Dbconnect"%>
<%@ page import="java.util.List"%>
<%@ page import="com.lms.vo.ExaminationDetails"%>
<%@ page import="com.lms.daoimpl.PreAnalysisDaoImp"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="com.lms.daoimpl.ExaminationDaoImpl"%>

<%
PreAnalysisDaoImp preanalysis = new PreAnalysisDaoImp();
List<ExaminationDetails> examlist = preanalysis.getAllExaminationDetails();
ExaminationDaoImpl subList= new ExaminationDaoImpl();
%>

<!DOCTYPE html>
<html class="h-full">
<head>
    <meta charset="UTF-8">
    <title>Examination</title>
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
         <div class="flex-1 p-10 overflow-auto"style="margin-top:-30px">
        <div class="flex-1 p-8">
            <div class="flex justify-between items-center mb-8">
                <h1 class="text-4xl font-bold text-gray-900">Pre Analysis</h1>
                 <a href="AddExamination.jsp" class="btn-primary flex items-center shadow-lg">
                    <i class="fas fa-plus mr-2"></i> Add Examination
                </a>
            </div>

            <!-- User Table -->
            <div class="bg-white shadow-lg rounded-lg overflow-hidden">
                <div class="overflow-x-auto">
                    <table class="min-w-full leading-normal">
                        <thead>
                            <tr class="table-header text-xs uppercase tracking-wider bg-blue">
                                <th class="py-3 px-6 text-left">SL No</th>
                                <th class="py-3 px-6 text-left">Exm_Code</th>
                                <th class="py-3 px-6 text-left">Exm_Name</th>
                                <th class="py-3 px-6 text-left">Sample_Category</th>
                                
                                
                               
                                <th class="py-3 px-6 text-left">Action</th>
                            </tr>
                        </thead>
                        <tbody class="text-black-700" id="sampalDetailsBody" >
                            <%
                            int count = 1;
                            if (examlist != null) {
                                for (ExaminationDetails exList : examlist) {
                            %>
                            <tr class="table-row border-b border-gray-200">
                                <td class="py-3 px-6 text-left whitespace-nowrap"><%= count %></td>
                                <td class="py-3 px-6 text-left whitespace-nowrap"><%= exList.getEx_code()   %></td>
                                <td class="py-3 px-6 text-left whitespace-nowrap"><%= exList.getEx_name() %></td>
                                
                                 <td class="py-3 px-6 text-left whitespace-nowrap">
                                 
                                  <%
								    int list = 1;
								    String excCode = exList.getEx_code();
								
								    List<String> a =subList.showExaminationSubtype(excCode);
								    for (String subname : a) {
								    	%>
								    	<h6><%= list + ": " + subname %></h6>
								        <% list++;
								    }
								    %>
                                 </td>
                                 
                               
                               
                               
                                
                                <td class="py-3 px-6 text-center whitespace-nowrap">
                                    <div class="flex items-center justify-center action-icons">
                                        <a href="EditExamination.jsp?examCode=<%= exList.getEx_code() %>" class="w-4 mr-2 transform hover:text-blue-600">
                                            <i class="fas fa-edit"></i>
                                        </a> 
                                        <a href="deleteUser.jsp?username=<%= exList.getEx_code()  %>" class="w-4 mr-2 transform hover:text-red-600">
                                            <i class="fas fa-trash-alt"></i>
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
                <!-- Pagination Controls -->
                        <div class="pagination" id="paginationControls"></div>
            </div>
        </div>
    </div>
 <script> 
 const rowsPerPage = 10;
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
