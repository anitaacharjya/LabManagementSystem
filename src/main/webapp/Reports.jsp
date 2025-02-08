<%@ page import="com.lms.daoimpl.PreAnalysisDaoImp"%>
<%@ page import="com.lms.vo.PreAnalysis"%>
<%@ page import="com.lms.vo.ExaminationDetails"%>
<%@ page import="java.text.SimpleDateFormat, java.util.Date" %>
<%@ page import="java.util.List"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Report</title>
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
    <style>
       @page {
            size: A4;
             margin: 10mm;
        }
             
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f3f4f6;
        }
        .a4-container {
            background-color: white;
            width: 210mm; /* A4 width */
            min-height: 297mm; /* A4 height */
            padding: 10mm;
            margin: auto;
            box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
            border: 1px solid #ddd;
        }
        .header {
            text-align: center;
            margin-bottom: 20px;
        }
        .header h1 {
            font-size: 24px;
            font-weight: bold;
            margin: 0;
        }
        .header h2 {
            font-size: 18px;
            font-weight: bold;
            margin: 0;
            margin-top: 5px;
        }
        .header p {
            margin: 0;
            font-size: 14px;
        }
        .info-row {
            display: flex;
            justify-content: space-between;
            margin-bottom: 10px;
        }
        .info-label {
            font-weight: bold;
        }
        .table-container {
            margin-top: 20px;
        }
        table {
            width: 100%;
            border-collapse: collapse;
        }
        th, td {
            border: 1px solid #ddd;
            padding: 8px;
            text-align: left;
        }
        th {
            background-color: #f3f4f6;
        }
        .grid-container {
            display: grid;
            grid-template-columns: 2fr 1fr; /* This creates an 8:4 grid ratio */
            gap: 10px;
            padding: 10px;
            margin-top: 0;
           
        }
        .left-section {
            display: flex;
            flex-direction: column;
            font-size: 12px;
        }
        .right-section {
            text-align: right;
        }
        .footer {
            text-align: center;
            margin-top: 40px;
            font-size: 14px;
        }
        
        /* Print styles */
        @media print {
            body {
                margin: 0;
                padding: 0;
            }
            .a4-container {
                box-shadow: none;
                border: none;
                page-break-inside: avoid;
            }

		.a4-container {
		    background-color: white;
		    width: 210mm; /* A4 width */
		    min-height: 297mm; /* A4 height */
		    padding: 10mm;
		    margin: auto;
		    box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
		    border: 2px solid black; /* Added border */
		    border-radius: 8px; /* Optional: rounded corners for the border */
		}	
        }
        .watermark {
             position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%) rotate(-45deg); /* Center and rotate */
            font-size: 50px;
            color: rgba(0, 0, 0, 0.08); /* Light gray, very transparent */
            white-space: nowrap;
            z-index: 0;
            pointer-events: none; /* Prevent interaction with watermark */
        }
    </style>
</head>
<%
PreAnalysisDaoImp preanalysis = new PreAnalysisDaoImp();
String patient_id = request.getParameter("patient_id");
String testId = request.getParameter("selectedSamplesTest");
System.out.println("testId "+testId);
System.out.println("patient_id "+patient_id);
String[] numbers = testId.split(",");
int[] intArray = new int[numbers.length];
for (int i = 0; i < numbers.length; i++) {
    intArray[i] = Integer.parseInt(numbers[i]);
}
PreAnalysis preanalysisData=preanalysis.getRecieptdetails(patient_id);  
Date now = new Date();
// Format the date according to your desired format
SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yy, hh:mm a"); // Example: 18/01/24, 01:20 PM
String currentTime = sdf.format(now);
%>
<body>
    <div class="a4-container" >
    <div class="watermark">CONFIDENTIAL</div>
        <!-- Header -->
<div class="container-fluid">
    <div class="row">
        <div class="header" style="background-color:white; color: black; padding: 10px; border: 1px solid black; font-weight: bold; position: relative;">
            <!-- Full-Width Image -->
            <div class="col-sm-12">
                <img src="Images/Alllogo.jpeg" alt="Left Logo" style="width: 100%; height: auto;">
            </div>
        </div>
    </div>
</div>


    

  <div style="border:1px solid black;">
       
   <div style="border-bottom:1px solid black; display: grid; grid-template-columns: repeat(2, 1fr); gap: 10px">
        <div class="info-col"style="margin-left:20px;margin-top:20px;margin-bottom:20px;">
	        <div><span class="info-label">Name:</span> <%=preanalysisData.getName() %></div>
	        <div><span class="info-label">Patient ID:</span> <%=preanalysisData.getPatientNo()%></div>
	        <div><span class="info-label">Age/sex:</span> <%=preanalysisData.getAge() %>/<%=preanalysisData.getGender() %></div>
	       <%--  <div><span class="info-label">Sex:</span> <%=preanalysisData.getGender() %></div> --%>
	        <%-- <div><span class="info-label">Bill No:</span><%=preanalysisData.getBillNo() %></div> --%>
	        <!-- <div><span class="info-label">Payee:</span> DIRECT Lab</div> -->
	        
    
    </div>
    <div class="info-col"style="margin-top:20px;margin-bottom:20px; text-align: left;">
        
        
        <div><span class="info-label">Phone:</span> <%=preanalysisData.getPhoneNo() %></div>
        <div><span class="info-label">Address:</span> <%=preanalysisData.getAddress() %></div>
        <div><span class="info-label">Reporting Time:</span> <%=currentTime %></div>
        <div><span class="info-label">Other Info:</span> </div>
    </div>
    <%-- <div class="info-col"style="margin-top:20px;margin-bottom:20px;">
        
        <div><span class="info-label">Referred By:</span> <%=preanalysisData.getReferredby() %></div>
        <div><span class="info-label">Collected On:</span> 18 Jan 2024</div>
         <div><span class="info-label">Payment Mode:</span> <%=preanalysisData.getPaymentMode()%></div>
    </div> --%>
   
</div>

        <!-- Examination Table -->
        <div class="table-container">
        <div style="text-align: center; font-weight: bold; font-size: 20px;margin-bottom:5px;margin-top:-20px"">
        <p>Department of BioChemistery </p>
        </div>
        <hr style="height:0.5px;border-width:0;color:black;background-color:black">
        
            <table style="margin-top:20px;margin-bottom:0px">
                <thead>
                    <tr>
                        <th>Exam</th>
                        <th>Result(Unit)</th>
                        <th>Colletion Time</th>
                        <th>Tested Time</th>
                         <th>Normal value</th>
                        
                        
                    </tr>
                </thead>
                <tbody>
                 <%
                     int list=1;
                     int totalBill=0;
                     int avanceamount = 0;
                     int diascount = 0;
                     //String patientno=preanalysisData.getPatientNo();
                     System.out.println(" intArray "+intArray.length);
                     System.out.println(" patient_id "+patient_id);
                      for (int i=0;i<intArray.length;i++) {
                     List<ExaminationDetails> examList = preanalysis.getExaminationDetailsForReport(patient_id,intArray[i]);
	                     for (ExaminationDetails preList1 : examList) {
	                    	 System.out.println(" value "+intArray[i]);
	                    	 String name=preList1.getEx_name();
	                    	 String examName=preanalysis.getExaminationName(name);
	                     %>
	                    <tr>
	                        <td><%=examName %></td>
	                        <td><%=preList1.getTestValue() %></td>
	                        <td><%=preList1.getSampleCollectionTime()%></td>             
	                        <td><%=preList1.getTestCompletionTime() %></td>
	                        <td></td>
	                        
	                        
	                    </tr>
	                    <%
	                    double price=0;
	                    String priceStr = preList1.getEx_price();
	                    if (priceStr != null && !priceStr.trim().isEmpty()) {
	                        price = Double.parseDouble(priceStr.trim());
	                    }
	                    totalBill+=price;
	                    } 
                    }%>
                </tbody>
            </table>
        </div>

        <!-- <hr style="height:0.3px;border-width:0;color:black;background-color:black">
 -->
        <!-- Total Section -->
        <%-- <div class="" style="display: grid; grid-template-columns: 1.5fr 1fr; gap: 20px; align-items: start;padding-left: 3px;">
            <div class="left-section" >
               <P>Please produce the slip for report. Report not delivered in the morning.</P>
               <P>Next date report delivery time 5PM .</P>
            </div>
             
            <div class="right-section" style="border-left:1px solid black; ">
                <div class="total" style="padding-right: 10px;">Total bill: <%=preanalysisData.getTotalBill()+" rs" %></div>
                <%
                int dueprice=0;
                String amount = preanalysisData.getAdvanceamount();
                if (amount != null && !amount.trim().isEmpty()) {
                	dueprice = Integer.parseInt(amount);
                }
                dueprice=totalBill-dueprice;
                
                
                %>
                <div class="paid" style="padding-right: 10px;">Advance:<%=preanalysisData.getAdvanceamount()+" rs"%> </div>
                <div class="due" style="padding-right: 10px;">Discount Amount: <%=preanalysisData.getDiscountAmount()+" rs"%></div>
                <hr style="height:0.5px;border-width:0;background-color:black">
                <div class="due" style="padding-right: 10px;">Due bill: <%=dueprice+" rs"%></div>
            </div>
           
        </div> --%>
        
   </div> 
   <br>
    <div style="font-size: 8px;">
    <p>Please clinically correlate. Partial reproduction of test reports is strictly prohibited.</p>
     <p>The reports are strictly for the use of medical practitioners and are not medical diagnosis.</p>
    </div>
   
    <div style="border: 1px solid black; padding: 2px; background-color: white; font-family: Arial, sans-serif; font-size: 8px;">
        <h3 style="margin-top: 0; font-weight: bold; text-decoration: underline;font-size: 10px; font-weight: bold;">Comments:</h3>
        Creatinine is a catabolic end product of creatine. The amount produced each day is related to muscle mass. 
        Creatinine is freely filtered by the glomerulus (small amounts are reabsorbed and secreted by renal tubules). 
        Creatinine is measured for the assessment of kidney function (impaired renal perfusion, loss of functioning nephrons) 
        and in monitoring renal dialysis. The method commonly used for estimating creatinine makes use of Jaffe’s reaction 
        with an alkaline picrate reagent.
    </div>
        <%--  <form action="downloadReceipt" method="post">
    <input type="hidden" name="patientNo" value="<%=patient_id%>">
    <button type="submit" class="bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded">Download PDF</button>
    </form> --%>
    <div style="text-align: center; font-weight: bold; font-size: 15px;margin-top:5px;">
    </br>
    <h4>*** End Of Report ***</h4>
    </div>
    </div>
    
    
</body>
</html>
