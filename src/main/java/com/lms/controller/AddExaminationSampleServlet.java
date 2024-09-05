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

        ExaminationDaoImpl examDao = new ExaminationDaoImpl();

        try {
            for (int i = 0; i < examNames.length; i++) {
                String examName = examNames[i];
                String examSubtype = examSubtypes.length > i ? examSubtypes[i] : null;

                // Save examination details
                //examDao.addExaminationDetails(examName, code);

                // Save examination subtypes
                if (examSubtype != null && !examSubtype.trim().isEmpty()) {
                    examDao.addExaminationSubtype(examName, examSubtype,code);
                }
            }
            response.sendRedirect("SampleCtegory.jsp"); // Redirect to success page
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("AddExaminationSample.jsp"); // Redirect to error page
        }
    }
}
