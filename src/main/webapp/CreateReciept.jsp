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
    <script>
        function addExaminationRow() {
            const table = document.getElementById("examinationTable");
            const newRow = table.insertRow();
            
            const cell1 = newRow.insertCell(0);
            const cell2 = newRow.insertCell(1);
            const cell3 = newRow.insertCell(2);

            // Generate the dropdown with examination names
            let dropdownHTML = `<select name="examName[]" class="border rounded p-2 w-full">`;
            dropdownHTML += `<option value="">Select Examination</option>`;
            <% for (ExaminationDetails examName : examNames) { %>
                dropdownHTML += `<option value="<%= examName.getEx_name()  %>"><%= examName.getEx_name() %></option>`;
            <% } %>
            dropdownHTML += `</select>`;

            cell1.innerHTML = dropdownHTML;
            cell2.innerHTML = `<input type="text" name="examDate[]" class="border rounded p-2 w-full" placeholder="Examination Date">`;
            cell3.innerHTML = `<button type="button" onclick="removeExaminationRow(this)" class="btn-primary">Remove</button>`;
        }

        function removeExaminationRow(button) {
            const row = button.parentNode.parentNode;
            row.parentNode.removeChild(row);
        }
    </script>
</head>
<body class="bg-gray-100">
    <div class="container mx-auto p-8">
        <h1 class="text-3xl font-bold mb-6">User and Examination Details</h1>

        <!-- User Information Section -->
        <form action="SubmitDetails.jsp" method="post">
            <h2 class="text-2xl font-semibold mb-4">User Information</h2>
            <div class="grid grid-cols-2 gap-4 mb-6">
                <div>
                    <label class="block mb-2">Name:</label>
                    <input type="text" name="name" class="border rounded p-2 w-full" value="<%= request.getParameter("name") %>">
                </div>
                <div>
                    <label class="block mb-2">Email:</label>
                    <input type="email" name="email" class="border rounded p-2 w-full" value="<%= request.getParameter("email") %>">
                </div>
                <!-- Add other user details as necessary -->
            </div>

            <!-- Examination Details Section -->
            <h2 class="text-2xl font-semibold mb-4">Examination Details</h2>
            <div class="mb-4">
                <table id="examinationTable" class="min-w-full bg-white shadow-lg rounded-lg">
                    <thead>
                        <tr class="table-header text-xs uppercase tracking-wider bg-blue">
                            <th class="py-3 px-6 text-left">Examination Name</th>
                            <th class="py-3 px-6 text-left">Price</th>
                            <th class="py-3 px-6 text-left">Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>
                                <select name="examName[]" class="border rounded p-2 w-full">
                                    <option value="">Select Examination</option>
                                    <% for (ExaminationDetails examName : examNames) { %>
                                        <option value="<%= examName.getEx_name() %>"><%= examName.getEx_name() %></option>
                                    <% } %>
                                </select>
                            </td>
                            <td><input type="text" name="examDate[]" class="border rounded p-2 w-full" placeholder="Examination Date"></td>
                            <td><button type="button" onclick="removeExaminationRow(this)" class="btn-primary">Remove</button></td>
                        </tr>
                    </tbody>
                </table>
            </div>
            <button type="button" onclick="addExaminationRow()" class="btn-primary mb-4">Add Examination</button>

            <div class="mt-6">
                <button type="submit" class="btn-primary">Submit</button>
            </div>
        </form>
    </div>
</body>
</html>
