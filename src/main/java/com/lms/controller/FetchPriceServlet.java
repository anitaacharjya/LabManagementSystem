package com.lms.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lms.daoimpl.PreAnalysisDaoImp;


@WebServlet("/FetchPriceServlet")
public class FetchPriceServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String examName = request.getParameter("examName");
        
        if (examName != null && !examName.isEmpty()) {
            PreAnalysisDaoImp examDao = new PreAnalysisDaoImp();
            double price = examDao.getExaminationPriceByName(examName); // Implement this method in DAO
            
            response.setContentType("text/plain");
            response.getWriter().write(String.valueOf(price));
        } else {
            response.getWriter().write("0.0"); // Default value
        }
    }
}
