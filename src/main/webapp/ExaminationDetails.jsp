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
    <title>Employee</title>
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
                                <th class="py-3 px-6 text-left">Price</th>
                                
                               
                                <th class="py-3 px-6 text-left">Action</th>
                            </tr>
                        </thead>
                        <tbody class="text-black-700  ">
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
                                 
                                <td class="py-3 px-6 text-left whitespace-nowrap"><%= exList.getEx_price() %></td>
                               
                               
                                
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
            </div>
        </div>
    </div>
</body>
</html>
