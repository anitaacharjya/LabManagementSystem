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
@WebServlet("/SampleDetails")
public class TestSampleDetails extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public TestSampleDetails() {
        super();
        // TODO Auto-generated constructor stub
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		boolean result=false;
		 String name = request.getParameter("name");
		 String patientId = request.getParameter("patientId");
		 String testName = request.getParameter("testname");
		 String[] addedSample = request.getParameterValues("addedSamples[]");
		 System.out.println(" Name "+name);
		 System.out.println(" patientId "+patientId);
		 System.out.println(" testName "+testName);
		 System.out.println(" examNames "+addedSample.length);
		 SampleDaoImpl sampledao= new SampleDaoImpl();
		 for(int i=0;i<addedSample.length;i++) {
			 String sample=addedSample[i];
			 System.out.println(" sample"+sample);
			result=sampledao.addTestSampleDetails(name,testName,patientId,sample);
			 
		 }
		 if(result==true) {
			 response.sendRedirect("SampleDetails.jsp");
		 }
		 
		 
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
