<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.lms.daoimpl.CommonFunction"%>
<%@ page import="java.time.LocalDateTime" %>
<%@ page import="java.time.format.DateTimeFormatter" %>
<!DOCTYPE html>
<html class="h-full">
<head>
    <meta charset="UTF-8">
    <title>Submit sample</title>
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
     <style>
    /* Style for readonly input */
	    input[readonly] {
	        background-color: #e2e8f0; /* Example: light gray background */
	        color: #4a5568; /* Example: dark gray text color */
	    }
	</style>
</head>
<body class="bg-gray-100 h-full flex">
    <!-- Sidebar -->
    <%@include file="Components/Navbar.jsp" %>
    <%
    

         CommonFunction commonfun = new CommonFunction();
         int examCode=commonfun.getMaxid("TBL_EXAMINATION", "ID_EXAMINATION");
         examCode=examCode+1;
         String patientName=request.getParameter("patientName");
         String patientno=request.getParameter("patientNo");
    %>
      <%
    // Get the current date and time
    LocalDateTime now = LocalDateTime.now();

    // Format the date and time as "dd-MM-yyyy HH:mm:ss"
    DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd-MM-yyyy HH:mm:ss");
    String formattedDateTime = now.format(formatter);
%>

    <!-- Main Content -->
    <div class="flex-1 p-10 flex justify-center items-center">
        <div class="container mx-auto bg-white p-10 rounded-lg shadow-lg w-full max-w-3xl">
            <div class="text-center mb-10">
                <h4 class="text-3xl font-semibold text-gray-800">Add details for Test Requisition form</h4>         
            </div>
            <form action="RequisitionServlet" method="post" enctype="multipart/form-data">
                <div class="grid grid-cols-1 gap-2">         
                    <div>
                        <label for="clinicalHistory" class="block text-sm font-medium text-gray-700">Name</label>
                        <input type="text" id="clinicalHistory" name="name" value="<%=patientName %>"
                            class="mt-1 block w-full px-4 py-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-blue-500 focus:border-blue-500 sm:text-sm" readonly>
                            <input type="hidden" id="clinicalHistory" name="id" value="<%=patientno %>"
                            class="mt-1 block w-full px-4 py-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-blue-500 focus:border-blue-500 sm:text-sm" readonly>
                    </div>
                    <div>
                        <label for="clinicalHistory" class="block text-sm font-medium text-gray-700">Sampale Submit Time</label>
                        <input type="text" id="clinicalHistory" name="dateTime" value="<%=formattedDateTime %>"
                            class="mt-1 block w-full px-4 py-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-blue-500 focus:border-blue-500 sm:text-sm" readonly>
                    </div>
                    <div>
                        <label for="clinicalHistory" class="block text-sm font-medium text-gray-700">Sample Collected By:</label>
                        <input type="text" id="sampleCollectedBy" name="sampleCollectedBy" required
                            class="mt-1 block w-full px-4 py-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-blue-500 focus:border-blue-500 sm:text-sm">
                    </div>
                    <div>
                        <label for="clinicalHistory" class="block text-sm font-medium text-gray-700">Clinical History</label>
                        <input type="text" id="clinicalHistory" name="clinicalHistory" required
                            class="mt-1 block w-full px-4 py-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-blue-500 focus:border-blue-500 sm:text-sm">
                    </div>
                     <div>
                        <label for="addiction" class="block text-sm font-medium text-gray-700">Addiction if any</label>
                        <input type="text" id="addiction" name="addiction" required
                            class="mt-1 block w-full px-4 py-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-blue-500 focus:border-blue-500 sm:text-sm">
                    </div>
                     <div>
                        <label for="allergi" class="block text-sm font-medium text-gray-700">Allergic history:</label>
                        <input type="text" id="allergi" name="allergi" required
                            class="mt-1 block w-full px-4 py-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-blue-500 focus:border-blue-500 sm:text-sm">
                    </div>
                     <div>
                        <label for="other" class="block text-sm font-medium text-gray-700">Any Other</label>
                        <textarea type="text" id="other" name="other" required
                            class="mt-1 block w-full px-4 py-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-blue-500 focus:border-blue-500 sm:text-sm"></textarea>
                    </div>
                    
                   <div>
					    <label for="documentUpload" class="block text-sm font-medium text-gray-700">Upload Supporting Document</label>
					    <input type="file" id="documentUpload" name="supportingDocument" accept=".pdf,.doc,.docx,.jpg,.png"
					        class="mt-1 block w-full px-4 py-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-blue-500 focus:border-blue-500 sm:text-sm"
					        onchange="validateFileSize(this)">
					    <p id="fileError" class="text-red-500 text-sm mt-1 hidden">File size must be less than 300 KB.</p>
					</div>
                </div>
                <div class="mt-8 flex justify-between">
                    <button type="submit"
                        class="bg-green-600 hover:bg-green-700 text-white font-semibold py-2 px-6 rounded-lg shadow-lg transition duration-300">
                        Add
                    </button>
                    <a href="home.jsp"
                        class="bg-blue-500 hover:bg-blue-600 text-white font-semibold py-2 px-6 rounded-lg shadow-lg transition duration-300">
                        Home
                    </a>
                </div>
            </form>
        </div>
    </div>
    <script>
            function validateFileSize(input) {
                const fileError = document.getElementById('fileError');
                const file = input.files[0]; // Get the selected file

                if (file && file.size > 300 * 1024) { // 300 KB = 300 * 1024 bytes
                    fileError.classList.remove('hidden'); // Show error message
                    input.value = ''; // Clear the file input
                } else {
                    fileError.classList.add('hidden'); // Hide error message
                }
            }
</script>
</body>
</html>
