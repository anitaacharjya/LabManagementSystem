package com.lms.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lms.daoimpl.CommonFunction;

/**
 * Servlet implementation class SubmitPostAnalysisReport
 */
@WebServlet("/SubmitPostAnalysisReport")
public class SubmitPostAnalysisReport extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public SubmitPostAnalysisReport() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		 String patientNo = request.getParameter("patientNo");
		 String patientName = request.getParameter("patientName");
	     System.out.println("patientNo "+patientNo);
	     System.out.println("selected "+patientName);
	     CommonFunction comm=new CommonFunction();
		 int value=comm.updateOneItem("examination_details", "sample_status", "REPSUB", "patient_id",patientNo);
		 //result=sampledao.addTestValue(Id, testCompletionTime, testValue);
		 if(value>0) {
			 response.sendRedirect("PostAnalysis.jsp");	 
		 }
	}

	
}
