package com.lms.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lms.daoimpl.SampleDaoImpl;

/**
 * Servlet implementation class SampleDetails
 */
@WebServlet("/TestSampleDetails")
public class TestSampleDetails extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public TestSampleDetails() {
        super();
        // TODO Auto-generated constructor stub
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		boolean result=false;
		 String collectionTime = request.getParameter("collectionTime");
		 String Id = request.getParameter("Id");
			/*
			 * String testName = request.getParameter("testname"); String[] addedSample =
			 * request.getParameterValues("addedSamples[]");
			 */
		 System.out.println(" collectionTime "+collectionTime);
		 System.out.println(" Id "+Id);
		
		 
		 
		 SampleDaoImpl sampledao= new SampleDaoImpl();
		 result=sampledao.addTestSampleDetails(Id,collectionTime);
		 if(result==true) {
			 response.sendRedirect("SampleDetails.jsp");
		 }
		 
		 
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
