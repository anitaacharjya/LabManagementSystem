package com.lms.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lms.daoimpl.PreAnalysisDaoImp;
import com.lms.vo.ExaminationDetails;
import com.lms.vo.PreAnalysis;
import com.lms.vo.User;

/**
 * Servlet implementation class RecieptServlet
 */
@WebServlet("/RecieptServlet")
public class RecieptServlet extends HttpServlet { protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    // Extract user information
    String name = request.getParameter("name");
    String age = request.getParameter("age");
    String gender = request.getParameter("gender");
    String address = request.getParameter("address");
    String phoneNumber = request.getParameter("phonenumber");
    String email = request.getParameter("email");
    String date = request.getParameter("date");
    String billNo = request.getParameter("billno");
    String patientId = request.getParameter("patientid");
    String refferedBy = request.getParameter("reffer");
    String AdvancedAmount = request.getParameter("advamount");
    String Discount = request.getParameter("discount");
    String paymode = request.getParameter("paymentmode");
    
    
    
    String[] examNames = request.getParameterValues("examName[]");
    String[] examPrices = request.getParameterValues("examPrice[]");
    String[] examCodes = request.getParameterValues("examCode[]");
    double Totalbill=0;
    if (examNames != null && examPrices != null) {
        for (int i = 0; i < examPrices.length; i++) {
           
        	String examPrice = examPrices[i];  // This will be a string like "65.0"
        	double price = Double.parseDouble(examPrice);  // Parse as a double
        	Totalbill = Totalbill + price;  // Add to the total bill

        	// If you need to convert the total bill to an integer
        	Totalbill = (int) Totalbill;
        }
        int percentage=Integer.parseInt(Discount);
        double percentageAmount = (percentage / 100.0) * Totalbill;
        double finalbill=Totalbill-percentageAmount;
        
        
        
        
        PreAnalysis user = new PreAnalysis();
        user.setName(name);
        user.setAge(age);
        user.setGender(gender);
        user.setAddress(address);
        user.setPhoneNo(phoneNumber);
        user.setEmail(email);
        user.setDate(date);
        user.setBillNo(billNo);
        user.setPatientNo(patientId);
        user.setReferredby(refferedBy);
        user.setPaymentMode(paymode);
        user.setAdvanceamount(AdvancedAmount);
        user.setDiscount(Discount);
        user.setTotalBill(finalbill);
        user.setDiscountAmount(percentageAmount);

        // Save user details in the database
        PreAnalysisDaoImp userDao = new PreAnalysisDaoImp();
        boolean value=userDao.saveUser(user,examNames,examPrices,examCodes);
        
    }

    // Create a new User object


    
    // Redirect or send response
    response.sendRedirect("PreAnalysis.jsp");
}}
