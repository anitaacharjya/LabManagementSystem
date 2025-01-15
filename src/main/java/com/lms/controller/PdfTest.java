package com.lms.controller;

import com.itextpdf.io.image.ImageData;
import com.itextpdf.io.image.ImageDataFactory;
import com.itextpdf.kernel.colors.ColorConstants;
import com.itextpdf.kernel.events.PdfDocumentEvent;
import com.itextpdf.kernel.events.Event;
import com.itextpdf.kernel.font.PdfFont;
import com.itextpdf.kernel.font.PdfFontFactory;
import com.itextpdf.kernel.pdf.*;
import com.itextpdf.layout.Document;
import com.itextpdf.layout.element.*;
import com.itextpdf.layout.property.TextAlignment;
import com.itextpdf.layout.property.UnitValue;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.itextpdf.kernel.colors.ColorConstants;
import com.itextpdf.kernel.font.PdfFont;
import com.itextpdf.kernel.font.PdfFontFactory;
import com.itextpdf.kernel.pdf.*;
import com.itextpdf.layout.Document;
import com.itextpdf.layout.element.*;
import com.itextpdf.layout.property.TextAlignment;
import com.itextpdf.layout.property.UnitValue;


//@WebServlet("/PdfTest")
//public class PdfTest extends HttpServlet {
//	private static final long serialVersionUID = 1L;
//
//	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        String dest = "output.pdf";
//        ByteArrayOutputStream baos = new ByteArrayOutputStream();
//        PdfWriter writer = new PdfWriter(baos);
//        PdfDocument pdfDoc = new PdfDocument(writer);
//        Document document = new Document(pdfDoc);
//        
//        PdfFont boldFont = PdfFontFactory.createFont();
//        PdfFont regularFont = PdfFontFactory.createFont();
//
//        // Add header table
//        Table headerTable = new Table(UnitValue.createPercentArray(new float[]{3, 3, 3, 3})).useAllAvailableWidth();
//        headerTable.addCell(createCell("Name: Pallab", boldFont));
//        headerTable.addCell(createCell("Patient ID: P036", boldFont));
//        headerTable.addCell(createCell("Bill Date: 07/01/25, 10:03 pm", boldFont));
//        headerTable.addCell(createCell("Referred By: self", boldFont));
//        headerTable.addCell(createCell("Age: 25"));
//        headerTable.addCell(createCell("Sex: male"));
//        headerTable.addCell(createCell("Phone: 7656654567"));
//        headerTable.addCell(createCell("Collected On: 18 Jan 2024"));
//        headerTable.addCell(createCell("Bill No.: B-1036"));
//        headerTable.addCell(createCell("Address: Jhararm"));
//        headerTable.addCell(createCell("Payee: DIRECT Lab"));
//        headerTable.addCell(createCell("Payment Mode: cash"));
//        
//        document.add(headerTable);
//
//        // Add examination table
//        Table table = new Table(UnitValue.createPercentArray(new float[]{2, 4, 3, 2})).useAllAvailableWidth();
//        table.addHeaderCell(createHeaderCell("CODE"));
//        table.addHeaderCell(createHeaderCell("EXAMINATION"));
//        table.addHeaderCell(createHeaderCell("SAMPLE TYPE"));
//        table.addHeaderCell(createHeaderCell("CHARGES"));
//
//        table.addCell(createCell("EX052"));
//        table.addCell(createCell("GLUCOSE (PP)"));
//        table.addCell(createCell("Serum"));
//        table.addCell(createCell("65.0"));
//
//        table.addCell(createCell("EX053"));
//        table.addCell(createCell("GLUCOSE (F)"));
//        table.addCell(createCell("Serum"));
//        table.addCell(createCell("55.0"));
//
//        document.add(table);
//
//        // Add footer
//        Paragraph footer = new Paragraph("Please produce the slip for report. Report not delivered in the morning. Next date report delivery time 5PM.")
//                .setFontSize(10)
//                .setTextAlignment(TextAlignment.LEFT);
//        document.add(footer);
//        
//        // Add totals
//        Table totalTable = new Table(UnitValue.createPercentArray(1)).useAllAvailableWidth();
//        totalTable.addCell(createCell("Total bill: 114.0 rs"));
//        totalTable.addCell(createCell("Advance: 100 rs"));
//        totalTable.addCell(createCell("Discount Amount: 6.0 rs"));
//        totalTable.addCell(createCell("Due bill: 20 rs"));
//
//        document.add(totalTable);
//
//        document.close();
//        String pdfName= "Test";
//        response.setContentType("application/pdf");
//        response.setHeader("Content-Disposition", "attachment; filename="+pdfName+".pdf");
//        response.setContentLength(baos.size());
//        baos.writeTo(response.getOutputStream());
//        response.getOutputStream().flush();
//		
//	}
//	
//    private static Cell createCell(String content) {
//        return new Cell().add(new Paragraph(content);
//                .setBorder(null)
//                .setTextAlignment(TextAlignment.LEFT);
//    }
//
//    private static Cell createCell(String content, PdfFont font) {
//        return new Cell().add(new Paragraph(content).setFont(font))
//                .setBorder(null)
//                .setTextAlignment(TextAlignment.LEFT);
//    }
//
//    private static Cell createHeaderCell(String content) {
//        return new Cell().add(new Paragraph(content).setFont(PdfFontFactory.createFont(PdfFontFactory.HELVETICA_BOLD)))
//                .setBackgroundColor(ColorConstants.LIGHT_GRAY)
//                .setTextAlignment(TextAlignment.CENTER);
//    }
//
//
//	
//
//}
