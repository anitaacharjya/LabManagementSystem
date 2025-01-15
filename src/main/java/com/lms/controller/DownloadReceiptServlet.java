package com.lms.controller;

import com.itextpdf.kernel.pdf.PdfDocument;
import com.itextpdf.kernel.pdf.PdfWriter;
import com.itextpdf.layout.Document;
import com.itextpdf.layout.borders.Border;
import com.itextpdf.layout.borders.SolidBorder;
import com.itextpdf.layout.element.Paragraph;
import com.itextpdf.layout.element.Table;
import com.itextpdf.layout.property.HorizontalAlignment;
import com.itextpdf.layout.property.UnitValue;
import com.itextpdf.layout.element.Cell;
import com.lms.daoimpl.PreAnalysisDaoImp;
import com.lms.vo.PreAnalysis;
import com.lms.vo.ExaminationDetails;

import com.itextpdf.kernel.colors.Color;
import com.itextpdf.kernel.colors.DeviceRgb;
import com.itextpdf.layout.element.Div;
import com.itextpdf.layout.element.Image;

import com.itextpdf.layout.element.Image;
import com.itextpdf.io.image.ImageData;
import com.itextpdf.io.image.ImageDataFactory;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@WebServlet("/downloadReceipt")
public class DownloadReceiptServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	
    	//String logoPath ="Images/Alllogo.jpeg"; 
    	String logoPath = getServletContext().getRealPath("Images/Alllogo.jpeg");
        String patientNo = request.getParameter("patientNo");

        PreAnalysisDaoImp preanalysis = new PreAnalysisDaoImp();
        PreAnalysis preanalysisData = preanalysis.getRecieptdetails(patientNo);

        ByteArrayOutputStream baos = new ByteArrayOutputStream();
        PdfWriter writer = new PdfWriter(baos);
        PdfDocument pdfDoc = new PdfDocument(writer);
        Document document = new Document(pdfDoc);
        // Add the header
        try {
        	ImageData logo = ImageDataFactory.create(logoPath);
        	Image logoImage = new Image(logo);
        	logoImage.setWidth(100); // Scale the image to fit the width
        	logoImage.setAutoScale(true);

        	// Create a Div to hold the image and add a border
        	Div imageContainer = new Div();
        	imageContainer.add(logoImage);
        	imageContainer.setBorder(new SolidBorder(0.5f)); // Black border with 2pt thickness
        	imageContainer.setPadding(5); // Optional: Add padding around the image inside the border
      
        	// Add the container to the document
        	document.add(imageContainer);
        	document.add(new Paragraph(" ").setFontSize(3));
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println(" Enception in "+e);
            document.add(new Paragraph("Error loading image."));
        }
          
        // Create a table with one column for the upper section (patient information in a box)
        float[] columnWidths = {4, 4, 4};  // Adjust the values based on your layout needs

        Table upperSectionTable = new Table(columnWidths);
        upperSectionTable.setWidth(UnitValue.createPercentValue(100));  // Table takes up full width
     // Apply outer border to the table
        //upperSectionTable.setBorder(new SolidBorder(0.5f));  // 1-point solid border

        // Add cells without internal borders
        addCellWithoutBorder(upperSectionTable, "Name: " + preanalysisData.getName());
        addCellWithoutBorder(upperSectionTable, "Age: " + preanalysisData.getAge());
        addCellWithoutBorder(upperSectionTable, "Bill No.: " + preanalysisData.getBillNo());
        addCellWithoutBorder(upperSectionTable, "Payee: DIRECT Lab");
        addCellWithoutBorder(upperSectionTable, "Patient ID: " + preanalysisData.getPatientNo());
        addCellWithoutBorder(upperSectionTable, "Sex: " + preanalysisData.getGender());
        addCellWithoutBorder(upperSectionTable, "Phone: " + preanalysisData.getPhoneNo());
        addCellWithoutBorder(upperSectionTable, "Address: " + preanalysisData.getAddress());
        addCellWithoutBorder(upperSectionTable, "Bill Date: " + new SimpleDateFormat("dd/MM/yy, hh:mm a").format(new Date()));
        addCellWithoutBorder(upperSectionTable, "Referred By: " + preanalysisData.getReferredby());
        addCellWithoutBorder(upperSectionTable, "Collected On: 18 Jan 2024");
        addCellWithoutBorder(upperSectionTable, "Payment Mode: " + preanalysisData.getPaymentMode());

        //document.add(upperSectionTable);
        // Add some spacing
        //document.add(new Paragraph(" ").setFontSize(3));

        // Add examination details table with four columns
        float[] columnWidths1 = {2, 4, 2, 2};
        Table examinationTable = new Table(columnWidths1);
        examinationTable.setWidth(UnitValue.createPercentValue(100));
        
        examinationTable.addHeaderCell("CODE");
        examinationTable.addHeaderCell("EXAMINATION");
        examinationTable.addHeaderCell("SAMPLE TYPE");
        examinationTable.addHeaderCell("CHARGES");

        List<ExaminationDetails> examList = preanalysis.getExaminationDetails(patientNo);
        double totalBill = 0;
        for (ExaminationDetails preList1 : examList) {
        	 String name=preList1.getEx_name();
        	 String examName=preanalysis.getExaminationName(name);
            examinationTable.addCell(preList1.getEx_code());
            examinationTable.addCell(examName);
            examinationTable.addCell("Serum");
            examinationTable.addCell(preList1.getEx_price());
            totalBill += Double.parseDouble(preList1.getEx_price());
        }

        //document.add(examinationTable);

        // Add some spacing
        //document.add(new Paragraph(" ").setFontSize(3));

        // Add the total and additional info section
        Table lowerSectionTable = new Table(new float[]{12, 3});  // Two columns for the total and info sections
        lowerSectionTable.setWidth(UnitValue.createPercentValue(100));  // Full width
        //lowerSectionTable.setBorder(new SolidBorder(2f));  // Outer border

     // Financial details section
        lowerSectionTable.addCell(createCell("Collected By: PALLAB",false, HorizontalAlignment.LEFT));
        lowerSectionTable.addCell(createCell("Total: " + totalBill,false, HorizontalAlignment.RIGHT));
        lowerSectionTable.addCell(createCell("Received By: SOMENATH DAS",false, HorizontalAlignment.LEFT));
        lowerSectionTable.addCell(createCell("Total Paid: 0.00",false, HorizontalAlignment.RIGHT));
        lowerSectionTable.addCell(createCell("Billed By: SOMENATH DAS",false, HorizontalAlignment.LEFT));
        lowerSectionTable.addCell(createCell("Due: 1010.00",false, HorizontalAlignment.RIGHT));

       

        //document.add(lowerSectionTable);
        
        Table maintable = new Table(1);
        maintable.setWidth(UnitValue.createPercentValue(100)); 
        
        maintable.addCell(upperSectionTable );
        
     // Add space after the upperSectionTable (empty cell with height)
        Cell spaceCell = new Cell();
        //spaceCell.setBorder(Border.NO_BORDER);  // No border for the empty cell
        
        spaceCell.setHeight(20);  // Adjust the height as needed for the gap
        maintable.addCell(spaceCell);
        
        maintable.addCell(examinationTable);
        
        
        maintable.addCell(lowerSectionTable);
        
        document.add(maintable);
        

        // Close the document
        document.close();
        String pdfName= preanalysisData.getName()+"-"+preanalysisData.getPatientNo();
        // Set the response to download the PDF
        response.setContentType("application/pdf");
        response.setHeader("Content-Disposition", "attachment; filename="+pdfName+".pdf");
        response.setContentLength(baos.size());
        baos.writeTo(response.getOutputStream());
        response.getOutputStream().flush();
        
        
    }
 // Method to add cells without internal borders
    private void addCellWithoutBorder(Table table, String content) {
        Cell cell = new Cell().add(new Paragraph(content));
        cell.setBorder(Border.NO_BORDER);
        table.addCell(cell);
    }
    private Cell createCell(String content, boolean hasBorder, HorizontalAlignment alignment) {
        Cell cell = new Cell().add(new Paragraph(content));
        if (hasBorder) {
            cell.setBorder(new SolidBorder(1)); // Apply border to each cell
        } else {
            cell.setBorder(Border.NO_BORDER);
        }
        cell.setHorizontalAlignment(alignment);
        
        return cell;
    }
}
