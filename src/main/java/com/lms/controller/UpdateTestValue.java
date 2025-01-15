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
 * Servlet implementation class UpdateTestValue
 */
@WebServlet("/UpdateTestValue")
public class UpdateTestValue extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public UpdateTestValue() {
        super();
        // TODO Auto-generated constructor stub
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		boolean result=false; 
		 String Id = request.getParameter("Id");
		 String testValue=request.getParameter("testValue");;
		 

		 System.out.println(" Id "+Id);
		 System.out.println(" testValue "+testValue);
		 CommonFunction comm=new CommonFunction();
		 int value=comm.updateOneItem("examination_details", "TEST_VALUE", testValue, "Id", Id);
		 //result=sampledao.addTestValue(Id, testCompletionTime, testValue);
		 if(value>0) {
			 response.sendRedirect("PostAnalysis.jsp");	 
		 }
		 
	}


}
