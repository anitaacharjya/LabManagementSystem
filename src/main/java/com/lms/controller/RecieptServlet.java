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

    // Create a new User object
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

    // Save user details in the database
    PreAnalysisDaoImp userDao = new PreAnalysisDaoImp();
    userDao.saveUser(user);

    // Extract examination details
    String[] examNames = request.getParameterValues("examName[]");
    String[] examPrices = request.getParameterValues("examPrice[]");
    String[] examCodes = request.getParameterValues("examCode[]");
    

    if (examNames != null && examPrices != null) {
        for (int i = 0; i < examNames.length; i++) {
            String examName = examNames[i];
            String examPrice = examPrices[i];
            String examCode = examCodes[i];

            if (examName != null && !examName.isEmpty()) {
                ExaminationDetails examDetail = new ExaminationDetails();
                examDetail.setEx_name(examName);
                examDetail.setEx_price(examPrice);
                examDetail.setEx_code(examCode);
                // Save examination details in the database
                PreAnalysisDaoImp examDao = new PreAnalysisDaoImp();
                examDao.saveExaminationDetails(examDetail,patientId);
            }
        }
    }

    // Redirect or send response
    response.sendRedirect("PreAnalysis.jsp");
}}
