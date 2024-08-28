<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Receipt</title>
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
    <style>
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
            margin-top: 20px;
            padding: 10px;
            border: 1px solid black;
        }
        .left-section {
            display: flex;
            flex-direction: column;
            justify-content: space-between;
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
        }
    </style>
</head>
<body>
    <div class="a4-container">
        <!-- Header -->
        <div class="header">
            <h1>ABC DIAGNOSTIC CENTER </h1>
            <p>Clinical Pathology Laboratory</p>
            <h2>RECEIPT</h2>
        </div>

        <!-- Receipt Information -->
       
        <div style="border:1px solid black; display: grid; grid-template-columns: repeat(3, 1fr); gap: 10px">
        <div class="info-col"style="margin-left:20px;margin-top:20px;margin-bottom:20px;">
        <div><span class="info-label">Name:</span> Miss. Rita Basu</div>
        <div><span class="info-label">Age:</span> 43 years</div>
        <div><span class="info-label">Bill No.:</span> I - 15548</div>
        <div><span class="info-label">Payee:</span> DIRECT Lab</div>
        
    
    </div>
    <div class="info-col"style="margin-top:20px;margin-bottom:20px;">
        <div><span class="info-label">Patient ID:</span> 8236</div>
        <div><span class="info-label">Sex:</span> Female</div>
        <div><span class="info-label">Phone:</span> 6289285022</div>
        <div><span class="info-label">Address:</span> Jhargram</div>
    </div>
    <div class="info-col"style="margin-top:20px;margin-bottom:20px;">
        <div><span class="info-label">Bill Date:</span> 18/01/24, 01:20 PM</div>
        <div><span class="info-label">Referred By:</span> SELF</div>
        <div><span class="info-label">Collected On:</span> 18 Jan 2024</div>
        <div><span class="info-label">Payment Mode:</span> CASH</div>
    </div>
   
</div>

        <!-- Examination Table -->
        <div class="table-container">
            <table style="margin-top:40px;margin-bottom:40px">
                <thead>
                    <tr>
                        <th>CODE</th>
                        <th>EXAMINATION</th>
                        <th>SAMPLE TYPE</th>
                        <th>CHARGES</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>A203</td>
                        <td>Serum Urea</td>
                        <td>Serum</td>
                        <td>200.00</td>
                    </tr>
                    <tr>
                        <td>A208</td>
                        <td>Triglycerides</td>
                        <td>Serum</td>
                        <td>250.00</td>
                    </tr>
                    <tr>
                        <td>A218</td>
                        <td>Serum G P T (ALT)</td>
                        <td>Serum</td>
                        <td>200.00</td>
                    </tr>
                    <tr>
                        <td>A217</td>
                        <td>Alkaline Phosphatase</td>
                        <td>Serum</td>
                        <td>200.00</td>
                    </tr>
                    <tr>
                        <td>A200</td>
                        <td>Sugar (Fasting)</td>
                        <td>Fluoride - F</td>
                        <td>80.00</td>
                    </tr>
                    <tr>
                        <td>A201</td>
                        <td>Sugar (P P)</td>
                        <td>Fluoride - Pp</td>
                        <td>80.00</td>
                    </tr>
                </tbody>
            </table>
        </div>

        <!-- Total Section -->
        <div class="grid-container">
            <div class="left-section">
                <div>Collected By: LAB</div>
                <div>Received By: SOMENATH DAS</div>
                <div>Billed By: SOMENATH DAS</div>
            </div>
             
            <div class="right-section">
                <div class="total">Total: 1010.00</div>
                <div class="paid">Total Paid: 0.00</div>
                <div class="due">Due: 1010.00</div>
            </div>
        </div>
    </div>
</body>
</html>
