package com.lms.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lms.daoimpl.CommonFunction;
import com.lms.daoimpl.SampleDaoImpl;

/**
 * Servlet implementation class TestValueSubmit
 */
@WebServlet("/TestValueSubmit")
public class TestValueSubmit extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		boolean result=false; 
		String testCompletionTime = request.getParameter("collectionTimetv");
		 String Id = request.getParameter("Idtv");
		 String testValue=request.getParameter("testValue");;
		 
		 
		 System.out.println(" testCompletionTime "+testCompletionTime);
		 System.out.println(" Id "+Id);
		 System.out.println(" testValue "+testValue);
		 SampleDaoImpl sampledao= new SampleDaoImpl();
		 result=sampledao.addTestValue(Id, testCompletionTime, testValue);
		 if(result==true) {
			 response.sendRedirect("Analysis.jsp");
			 
		 }
		 
		 
	}

	

}
