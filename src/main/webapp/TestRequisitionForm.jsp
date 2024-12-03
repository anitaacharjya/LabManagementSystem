<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.lms.daoimpl.PreAnalysisDaoImp"%>
<%@ page import="com.lms.vo.PreAnalysis"%>
<%@ page import="com.lms.vo.ExaminationDetails"%>
<%@ page import="java.text.SimpleDateFormat, java.util.Date" %>
<%@ page import="java.util.List"%>
<%@ page import="java.util.Map"%>
<%@ page import="java.time.LocalDateTime" %>
<%@ page import="java.time.format.DateTimeFormatter" %>
<%@ page import="com.lms.daoimpl.SampleDaoImpl"%>
<%@ page import="com.lms.vo.Prerequisition"%>

<%
PreAnalysisDaoImp preanalysis = new PreAnalysisDaoImp();
String patient_id = request.getParameter("patientNo");
PreAnalysis preanalysisData=preanalysis.getRecieptdetails(patient_id);  
Date now = new Date();
// Format the date according to your desired format
SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yy, hh:mm a"); // Example: 18/01/24, 01:20 PM
String currentTime = sdf.format(now);
%>
<%
    // Get the current date and time
    LocalDateTime date = LocalDateTime.now();

    // Format the date and time as "dd-MM-yyyy HH:mm:ss"
    DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd-MM-yyyy HH:mm:ss");
    String formattedDateTime = date.format(formatter);
%>

<%
	SampleDaoImpl sample =new SampleDaoImpl();
	Prerequisition prereq = sample.getPreRequisitionDetails(patient_id);
	
	%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Test Requisition Form</title>
    <style>
        @page {
            size: A4;
             margin: 10mm;
        }

        body {
            font-family: 'Arial', sans-serif;
            width: 223mm;
            height: 297mm;
            margin: 0 auto;
            padding: 0;
            box-sizing: border-box;
        }

        .container {
            width: 100%;
            margin: 0 auto;
            padding: 20mm;
            box-sizing: border-box;
            border: 2px solid black; /* Border for the entire page */
            height: 100%; /* Ensure the height is full for A4 */
        }

        .header {
            text-align: center;
            font-weight: bold;
            margin-bottom: 30px;
        }

        .header h1, .header p, .header h2 {
            margin: 0;
        }

        .header h1 {
            font-size: 24px;
        }

        .header p {
            font-size: 14px;
        }

        .header h2 {
            margin-top: 10px;
            font-size: 18px;
            text-decoration: underline;
        }

        .info-section {
            margin-bottom: 20px;
        }

        .info-section div {
            margin-bottom: 10px;
        }

        .info-section div span.label {
            font-weight: bold;
            display: inline-block;
            width: 150px;
        }
        .info-section {
        display: flex;
        justify-content: space-between;
    }
    
    .column {
        width: 48%;
    }
    
    .info-section div {
        margin-bottom: 10px;
    }
    
    .label {
        font-weight: bold;
        display: inline-block;
        width: 150px;
    }

        .divider {
            width: 100%;
            height: 1px;
            background-color: black;
            margin: 20px 0;
        }

        .test-parameters {
            margin-top: 20px;
        }

        .test-parameters table {
            width: 100%;
            border-collapse: collapse;
        }

        .test-parameters th, .test-parameters td {
            border: 1px solid black;
            padding: 8px;
            text-align: left;
        }

        .test-parameters th {
            background-color: #f0f0f0;
        }

        .signature-section {
            margin-top: 30px;
        }

        .signature-section div {
            float: right;
            text-align: center;
            margin-right: 50px;
        }

        .signature-section div p {
            margin-bottom: 50px;
        }

        .clearfix::after {
            content: "";
            display: table;
            clear: both;
        }
    </style>
     <script>
        // Open the modal
        function openModal() {
            document.getElementById("myModal").style.display = "block";
        }

        // Close the modal
        function closeModal() {
            document.getElementById("myModal").style.display = "none";
        }

        // Function to get selected value from dropdown
        function submitSelection() {
            var dropdown = document.getElementById("testDropdown");
            var selectedTest = dropdown.options[dropdown.selectedIndex].value;
            alert("You selected: " + selectedTest); // For demonstration
            closeModal(); // Close the modal after selection
        }
    </script>
</head>
<body>
    <div class="container">
        <div class="header">
            <h1>ABC DIAGNOSTIC CENTRE (POLYCLINIC)</h1>
            <p>Address: Thana Road, Jhargram, WestBengal</p>
            <h2>TEST REQUISITION FORM</h2>
        </div>

       <div class="info-section">
    <table cellpadding="6" cellspacing="0" style="width: 100%; border-collapse: collapse; ">
        <tr>
            <td style="border-right: none;"><strong>Patient’s Name:</strong></td>
            <td style="border-left: none;"><%=preanalysisData.getName() %></td>
            <td style="border-right: none;"><strong>Age:</strong></td>
            <td style="border-left: none;"><%=preanalysisData.getAge() %></td>
        </tr>
        <tr>
            <td style="border-right: none;"><strong>Reciept Date:</strong></td>
            <td style="border-left: none;"><%=preanalysisData.getDate() %></td>
            <td style="border-right: none;"><strong>Sex:</strong></td>
            <td style="border-left: none;"><%=preanalysisData.getGender() %></td>
        </tr>
        <tr>
           <%--  <td style="border-right: none;"><strong>Sample Collection Time:</strong></td>
            <td style="border-left: none;"><%=preanalysisData.getSampleCollectionDate() %></td> --%>
            <td style="border-right: none;"><strong>Patient Id:</strong></td>
            <td style="border-left: none;"><%=preanalysisData.getPatientNo()%></td>
            <td style="border-right: none;"><strong>Contact No:</strong></td>
            <td style="border-left: none;">+91 9876543210</td>
        </tr>
        <tr>
            <td style="border-right: none;"><strong>Patient’s Address:</strong></td>
            <td style="border-left: none;"><%=preanalysisData.getAddress() %></td>
            <!--  <td style="border-right: none;"><strong>Sample Type:</strong></td>
            <td style="border-left: none;">Blood</td>-->
            
            
            <td style="border-right: none;"><strong>Sample Collected By:</strong></td>
            <td style="border-left: none;"><%=prereq.getSampleCollectedBy() %></td>
        </tr>
        <tr>
            <td style="border-right: none;"><strong>Ref. By:</strong></td>
            <td style="border-left: none;"><%=preanalysisData.getReferredby() %></td>
            
            
        </tr>
    </table>
</div>
	
  <div>
    <div>
    <p><strong>Clinical History:- </strong> <%=prereq.getClinicalHistory() %></p>
    </div>
    <div>
    <p><strong>Addiction if any:- </strong><%=prereq.getAddiction() %> </p>
    </div>
    <div>
    <p><strong>Allergic history:- </strong><%=prereq.getAllergicHistory() %>  </p>
    </div>
    <div>
    <p><strong>Any Other:- </strong><%=prereq.getOther() %>  </p>
    </div>
    <div>
      <br>
    </div>
  </div>

       <div class="test-parameters">
        <div class="divider" ></div>
            <h3>Tests/Investigation</h3>
            <table>
                <thead>
                    <tr>
                        
                        <th>Sample Type</th>
                        <th>Parameter To Test</th>
                        <th>Sample collect time</th>
                        <th>Sample Recived time</th>
                    </tr>
                </thead>
                <tbody>
                <%
                String patientno=preanalysisData.getPatientNo();
                String patientName=preanalysisData.getName();
                SampleDaoImpl sampledao=new SampleDaoImpl();
                
                List<String> examList = sampledao.getSampleDetails(patientno);

                for (String value : examList) {
                    String[] testName = value.split("~"); // Key is a String (test name)
                    if(testName!=null){
                    
            %>
                    <tr>
                        <td><%= testName[0] %> </td> <!-- Key from the map (e.g., "SUGAR") -->
                        <%-- <td>
                            <ul>
                            <% for (String sample1 : sampleNames) { %>
                                <li><%= sample1 %></li> <!-- Each sample name for the test -->
                            <% } %>
                            </ul>
                        </td> --%>
                         <td><%= testName[1] %> </td>
                         <td> <%= testName[2] %></td>
                         <td> <%= testName[3] %></td>
                         
                         
                         
                    </tr>
            <%
                    }}
            %>

                </tbody>
            </table>
        </div>

        <div class="signature-section clearfix">
            <div>
                <p>Checked By:</p>
                <p>______________________</p>
                <p>Technician A</p>
            </div>
        </div>
        <div>
        <p>Sample Transportation Box/Cool Box Temperature Receiving:  </p>
        <p>Frozen (< 2 ° C)  :</p>
        <p>Temp (18 - 22° C) :</p>
        </div>
    </div>
</body>
</html>
