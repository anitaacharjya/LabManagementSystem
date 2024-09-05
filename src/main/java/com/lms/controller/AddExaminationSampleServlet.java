package com.lms.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lms.daoimpl.ExaminationDaoImpl;
import com.lms.daoimpl.PreAnalysisDaoImp;

@WebServlet("/AddExaminationSampleServlet")
public class AddExaminationSampleServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Extract parameters from the request
        String[] examNames = request.getParameterValues("examName[]");
        String[] examSubtypes = request.getParameterValues("examSubtype[]");
        String code = request.getParameter("code");
        
        System.out.println("Exam Name: " + examNames.length);
        System.out.println("Exam Subtype: " + examSubtypes.length);
        ExaminationDaoImpl examDao = new ExaminationDaoImpl();
        String examName = examNames[0];

        try {
            for (int i = 0; i < examSubtypes.length; i++) {
                
                String examSubtype = examSubtypes[i];
                System.out.println("examSubtype "+examSubtype );
                System.out.println("examName "+examName );

               
                if (examSubtype != null && !examSubtype.trim().isEmpty()) {
                	examDao.addExaminationSubtype(examName, examSubtype,code);
                   System.out.println(" inside "+i);
                }
            }
            response.sendRedirect("SampleCtegory.jsp"); // Redirect to success page
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("AddExaminationSample.jsp"); // Redirect to error page
        }
    }
}
