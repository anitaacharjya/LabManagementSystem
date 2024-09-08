package com.lms.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lms.daoimpl.CommonFuction;

/**
 * Servlet implementation class PreAnalysisServlet
 */
@WebServlet("/PreAnalysisServlet")
public class PreAnalysisServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public PreAnalysisServlet() {
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.getWriter().append("Served at: ").append(request.getContextPath());
		String patientno = request.getParameter("patientNo");
		CommonFuction common= new CommonFuction();
		int deleteValue=0;
		int value=common.deleteItem("TBL_RECEIPT", "patient_id", patientno);
		if(value>0)
		{
			deleteValue=common.deleteItem("examination_details", "patient_id", patientno);
		}
		
			response.sendRedirect("PreAnalysis.jsp");
		
		
	  }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
