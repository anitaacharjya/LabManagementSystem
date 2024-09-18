<%@ page import="com.lms.dbconnect.Dbconnect"%>
<%@ page import="java.util.List"%>
<%@ page import="com.lms.vo.PreAnalysis"%>
<%@ page import="com.lms.vo.ExaminationDetails"%>
<%@ page import="com.lms.daoimpl.PreAnalysisDaoImp"%>
<%@ page import="java.sql.Connection"%>

<%
PreAnalysisDaoImp preanalysis = new PreAnalysisDaoImp();
List<PreAnalysis> preanalysislist = preanalysis.getAllReciept();
%>

<!DOCTYPE html>
<html class="h-full">
<head>
    <meta charset="UTF-8">
    <title>Pre Analysis</title>
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
                                <th class="py-3 px-6 text-middle">SL No</th>
                                <th class="py-3 px-6 text-middle">Name</th>
                                <th class="py-3 px-6 text-middle">Examination</th>
                                <th class="py-3 px-6 text-middle">Date</th>
                                <th class="py-3 px-6 text-middle">Age</th>
                                <th class="py-3 px-6 text-middle">Gender</th>
                                <th class="py-3 px-6 text-middle">Address</th>
                                <th class="py-3 px-6 text-middle">Phone Number</th>
                                <th class="py-3 px-6 text-middle">Create Date</th>
                                <th class="py-3 px-6 text-middle">Bill No</th>
                                <th class="py-3 px-6 text-middle">Patien Number</th>
                                <th class="py-3 px-6 text-middle">Payment Mode</th>
                                <th class="py-3 px-6 text-middle">Refred By</th>
                                <th class="py-3 px-6 text-middle">Status</th>
                                <th class="py-3 px-6 text-middle">Action</th>
                            </tr>
                        </thead>
                        <tbody class="text-black-700  ">
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
                                int list=1;
                                String patientno=preList.getPatientNo();

                                examList = preanalysis.getExaminationDetails(patientno);
                                for (ExaminationDetails preList1 : examList) {
                                %>
                                   <h6><%= list + ": " + preList1.getEx_name() %></h6>
                                    <% list++; %>
                                <% }%>
                                </td>
                                <td class="py-3 px-6 text-left whitespace-nowrap"><%= preList.getDate() %></td>
                                <td class="py-3 px-6 text-left whitespace-nowrap"><%= preList.getAge() %></td>
                                <td class="py-3 px-6 text-left whitespace-nowrap"><%= preList.getGender() %></td>
                                <td class="py-3 px-6 text-left whitespace-nowrap"><%= preList.getAddress() %></td>
                                <td class="py-3 px-6 text-left whitespace-nowrap"><%= preList.getPhoneNo()%></td>
                                <td class="py-3 px-6 text-left whitespace-nowrap"><%= preList.getDate() %></td>
                                <td class="py-3 px-6 text-left whitespace-nowrap"><%= preList.getBillNo() %></td>
                                <td class="py-3 px-6 text-left whitespace-nowrap"><%= preList.getPatientNo() %></td>
                                <td class="py-3 px-6 text-left whitespace-nowrap"><%= preList.getPaymentMode() %></td>
                                <td class="py-3 px-6 text-left whitespace-nowrap"><%= preList.getReferredby() %></td>
                                <td class="py-3 px-6 text-left whitespace-nowrap">Panding</td>
                                
                                <td class="py-3 px-6 text-center whitespace-nowrap">
                                    <div class="flex items-center justify-center action-icons">
                                        
                                        <a href="Reciept.jsp?patientNo=<%= preList.getPatientNo() %>" 
                                          class="bg-blue-600 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded-full shadow-md inline-flex items-center">
                                         <i class="fa-solid fa-eye" style="margin-right:7px"></i> View Reciept
                                        </a>
                                        <div style="margin-left:12px">
                                         <a href="voidServlet?patientNo=<%= preList.getPatientNo() %>" 
                                          class="bg-red-600  text-white font-bold py-2 px-4 rounded-full shadow-md inline-flex items-center">
                                         <i class="fa-solid fa-ban" style="margin-right:7px"></i> Void
                                        </a>
                                        </div>
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
