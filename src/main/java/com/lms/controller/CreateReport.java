package com.lms.controller;

import java.io.IOException;
import java.net.URLEncoder;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class CreateReport
 */
@WebServlet("/CreateReport")
public class CreateReport extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public CreateReport() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("Inside CreateReport ");
		 String selectedSamplesValue = request.getParameter("selectedSamplesTest");
	     System.out.println("examCoad "+selectedSamplesValue);
	     response.sendRedirect("Reports.jsp?selectedSamples=" + URLEncoder.encode(selectedSamplesValue, "UTF-8"));
	}

}
