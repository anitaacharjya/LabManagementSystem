<%@ page import="com.lms.dbconnect.Dbconnect"%>
<%@ page import="java.util.List"%>
<%@ page import="com.lms.vo.User"%>
<%@ page import="com.lms.daoimpl.UserDaoImpl"%>
<%@ page import="java.sql.Connection"%>

<%
UserDaoImpl userdao = new UserDaoImpl();
List<User> userlist = userdao.getAllUsers();
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
                <h1 class="text-4xl font-bold text-gray-900">Users</h1>
                <a href="User.jsp" class="btn-primary flex items-center shadow-lg">
                    <i class="fas fa-plus mr-2"></i> Add New User
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
                                <th class="py-3 px-6 text-left">DOB</th>
                                <th class="py-3 px-6 text-left">Gender</th>
                                <th class="py-3 px-6 text-left">Address</th>
                                <th class="py-3 px-6 text-left">City</th>
                                <th class="py-3 px-6 text-left">State</th>
                                <th class="py-3 px-6 text-left">Country</th>
                                <th class="py-3 px-6 text-left">Marital Status</th>
                                <th class="py-3 px-6 text-left">Nationality</th>
                                <th class="py-3 px-6 text-left">Email</th>
                                <th class="py-3 px-6 text-left">Mobile No</th>
                                <th class="py-3 px-6 text-left">Identity Document</th>
                                <th class="py-3 px-6 text-left">Identity Number</th>
                                <th class="py-3 px-6 text-left">Blood Group</th>
                                <th class="py-3 px-6 text-left">Designation</th>
                                <th class="py-3 px-6 text-left">Username</th>
                                <th class="py-3 px-6 text-left">Password</th>
                                <th class="py-3 px-6 text-left">Admin</th>
                                <th class="py-3 px-6 text-left">Pre-Analysis</th>
                                <th class="py-3 px-6 text-left">Analysis</th>
                                <th class="py-3 px-6 text-left">Post-Analysis</th>
                                <th class="py-3 px-6 text-center">Actions</th>
                            </tr>
                        </thead>
                        <tbody class="text-black-700  ">
                            <%
                            int count = 1;
                            if (userlist != null) {
                                for (User user : userlist) {
                            %>
                            <tr class="table-row border-b border-gray-200">
                                <td class="py-3 px-6 text-left whitespace-nowrap"><%= count %></td>
                                <td class="py-3 px-6 text-left whitespace-nowrap"><%= user.getName() %></td>
                                <td class="py-3 px-6 text-left whitespace-nowrap"><%= user.getDob() %></td>
                                <td class="py-3 px-6 text-left whitespace-nowrap"><%= user.getGender() %></td>
                                <td class="py-3 px-6 text-left whitespace-nowrap"><%= user.getAddress() %></td>
                                <td class="py-3 px-6 text-left whitespace-nowrap"><%= user.getCity() %></td>
                                <td class="py-3 px-6 text-left whitespace-nowrap"><%= user.getState() %></td>
                                <td class="py-3 px-6 text-left whitespace-nowrap"><%= user.getCountry() %></td>
                                <td class="py-3 px-6 text-left whitespace-nowrap"><%= user.getMaritalStatus() %></td>
                                <td class="py-3 px-6 text-left whitespace-nowrap"><%= user.getNationality() %></td>
                                <td class="py-3 px-6 text-left whitespace-nowrap"><%= user.getEmail() %></td>
                                <td class="py-3 px-6 text-left whitespace-nowrap"><%= user.getMobile() %></td>
                                <td class="py-3 px-6 text-left whitespace-nowrap"><%= user.getIdentityDocument() %></td>
                                <td class="py-3 px-6 text-left whitespace-nowrap"><%= user.getIdentityNumber() %></td>
                                <td class="py-3 px-6 text-left whitespace-nowrap"><%= user.getBloodGroup() %></td>
                                <td class="py-3 px-6 text-left whitespace-nowrap"><%= user.getDesignation() %></td>
                                <td class="py-3 px-6 text-left whitespace-nowrap"><%= user.getUsername() %></td>
                                <td class="py-3 px-6 text-left whitespace-nowrap"><%= user.getPassword() %></td>
                                <td class="py-3 px-6 text-left whitespace-nowrap"><%= user.getAdminAccess() %></td>
                                <td class="py-3 px-6 text-left whitespace-nowrap"><%= user.getPreanalysisAccess() %></td>
                                <td class="py-3 px-6 text-left whitespace-nowrap"><%= user.getAnalysisAccess() %></td>
                                <td class="py-3 px-6 text-left whitespace-nowrap"><%= user.getPostanalysisAccess() %></td>
                                <td class="py-3 px-6 text-center whitespace-nowrap">
                                    <div class="flex items-center justify-center action-icons">
                                        <a href="updateUser.jsp?username=<%= user.getUsername() %>" class="w-4 mr-2 transform hover:text-blue-600">
                                            <i class="fas fa-edit"></i>
                                        </a> 
                                        <a href="deleteUser.jsp?username=<%= user.getUsername() %>" class="w-4 mr-2 transform hover:text-red-600">
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
