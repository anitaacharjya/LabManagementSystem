package com.lms.controller;

import com.itextpdf.kernel.pdf.PdfDocument;
import com.itextpdf.kernel.pdf.PdfWriter;
import com.itextpdf.layout.Document;
import com.itextpdf.layout.element.Paragraph;
import com.itextpdf.layout.element.Table;
import com.lms.daoimpl.PreAnalysisDaoImp;
import com.lms.vo.PreAnalysis;
import com.lms.vo.ExaminationDetails;

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
        String patientNo = request.getParameter("patientNo");

        PreAnalysisDaoImp preanalysis = new PreAnalysisDaoImp();
        PreAnalysis preanalysisData = preanalysis.getRecieptdetails(patientNo);

        ByteArrayOutputStream baos = new ByteArrayOutputStream();
        PdfWriter writer = new PdfWriter(baos);
        PdfDocument pdfDoc = new PdfDocument(writer);
        Document document = new Document(pdfDoc);

        // Add the header
        document.add(new Paragraph("ABC DIAGNOSTIC CENTER")
                .setBold().setFontSize(18).setTextAlignment(com.itextpdf.layout.property.TextAlignment.CENTER));
        document.add(new Paragraph("Clinical Pathology Laboratory").setTextAlignment(com.itextpdf.layout.property.TextAlignment.CENTER));
        document.add(new Paragraph("RECEIPT").setBold().setFontSize(14).setTextAlignment(com.itextpdf.layout.property.TextAlignment.CENTER));
        document.add(new Paragraph("\n"));

        // Add patient information
        document.add(new Paragraph("Name: " + preanalysisData.getName()));
        document.add(new Paragraph("Age: " + preanalysisData.getAge()));
        document.add(new Paragraph("Bill No.: " + preanalysisData.getBillNo()));
        document.add(new Paragraph("Payee: DIRECT Lab"));
        document.add(new Paragraph("Patient ID: " + preanalysisData.getPatientNo()));
        document.add(new Paragraph("Sex: " + preanalysisData.getGender()));
        document.add(new Paragraph("Phone: " + preanalysisData.getPhoneNo()));
        document.add(new Paragraph("Address: " + preanalysisData.getAddress()));
        document.add(new Paragraph("Bill Date: " + new SimpleDateFormat("dd/MM/yy, hh:mm a").format(new Date())));
        document.add(new Paragraph("Referred By: " + preanalysisData.getReferredby()));
        document.add(new Paragraph("Collected On: 18 Jan 2024"));
        document.add(new Paragraph("Payment Mode: " + preanalysisData.getPaymentMode()));
        document.add(new Paragraph("\n"));

        // Add examination details table
        float[] columnWidths = {2, 4, 2, 2};
        Table table = new Table(columnWidths);
        table.addHeaderCell("CODE");
        table.addHeaderCell("EXAMINATION");
        table.addHeaderCell("SAMPLE TYPE");
        table.addHeaderCell("CHARGES");

        List<ExaminationDetails> examList = preanalysis.getExaminationDetails(patientNo);
        double totalBill = 0;
        for (ExaminationDetails preList1 : examList) {
            table.addCell(preList1.getEx_code());
            table.addCell(preList1.getEx_name());
            table.addCell("Serum");
            table.addCell(preList1.getEx_price());
            totalBill += Double.parseDouble(preList1.getEx_price());
        }

        document.add(table);

        // Add total section
        document.add(new Paragraph("\n"));
        document.add(new Paragraph("Total: " + totalBill));
        document.add(new Paragraph("Total Paid: 0.00"));
        document.add(new Paragraph("Due: 1010.00"));

        document.close();

        // Set the response to download the PDF
        response.setContentType("application/pdf");
        response.setHeader("Content-Disposition", "attachment; filename=receipt.pdf");
        response.setContentLength(baos.size());
        baos.writeTo(response.getOutputStream());
        response.getOutputStream().flush();
    }
}
