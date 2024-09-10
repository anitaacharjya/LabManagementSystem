<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.lms.daoimpl.PreAnalysisDaoImp"%>
<%@ page import="com.lms.vo.PreAnalysis"%>
<%@ page import="com.lms.vo.ExaminationDetails"%>
<%@ page import="java.text.SimpleDateFormat, java.util.Date" %>
<%@ page import="java.util.List"%>





<%
PreAnalysisDaoImp preanalysis = new PreAnalysisDaoImp();
String patient_id = request.getParameter("patientNo");
PreAnalysis preanalysisData=preanalysis.getRecieptdetails(patient_id);  
Date now = new Date();
// Format the date according to your desired format
SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yy, hh:mm a"); // Example: 18/01/24, 01:20 PM
String currentTime = sdf.format(now);
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
            height: 2px;
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
            <td style="border-right: none;"><strong>Sample Collection Date:</strong></td>
            <td style="border-left: none;"></td>
            <td style="border-right: none;"><strong>Sex:</strong></td>
            <td style="border-left: none;"><%=preanalysisData.getGender() %></td>
        </tr>
        <tr>
            <td style="border-right: none;"><strong>Sample Collection Time:</strong></td>
            <td style="border-left: none;"></td>
            <td style="border-right: none;"><strong>Lab ID No:</strong></td>
            <td style="border-left: none;">567890</td>
        </tr>
        <tr>
            <td style="border-right: none;"><strong>Sample Collected By:</strong></td>
            <td style="border-left: none;"></td>
            <td style="border-right: none;"><strong>Clinical History:</strong></td>
            <td style="border-left: none;"></td>
        </tr>
        <tr>
            <td style="border-right: none;"><strong>Patient’s Address:</strong></td>
            <td style="border-left: none;"><%=preanalysisData.getAddress() %></td>
            <td style="border-right: none;"><strong>Sample Type:</strong></td>
            <td style="border-left: none;">Blood</td>
        </tr>
        <tr>
            <td style="border-right: none;"><strong>Ref. By:</strong></td>
            <td style="border-left: none;">Dr. Smith</td>
            <td style="border-right: none;"><strong>Contact No:</strong></td>
            <td style="border-left: none;">+91 9876543210</td>
        </tr>
    </table>
</div>



        <div class="divider"></div>

        <div class="test-parameters">
            <h3>Tests/Investigation</h3>
            <table>
                <thead>
                    <tr>
                        <th>Test Parameter</th>
                        <th>Result</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>Blood Sugar</td>
                        <td>120 mg/dL</td>
                    </tr>
                    <tr>
                        <td>Cholesterol</td>
                        <td>190 mg/dL</td>
                    </tr>
                    <tr>
                        <td>Hemoglobin</td>
                        <td>14.5 g/dL</td>
                    </tr>
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
    </div>
</body>
</html>
