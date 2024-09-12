package com.lms.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lms.daoimpl.CommonFuction;

@WebServlet("/voidServlet")
public class voidServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public voidServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.getWriter().append("Served at: ").append(request.getContextPath());
		
		response.getWriter().append("Served at: ").append(request.getContextPath());
		String patientno = request.getParameter("patientNo");
		CommonFuction common= new CommonFuction();
		int deleteValue=0;
		int value=common.updateOneItem("TBL_RECEIPT","void","Y", "patient_id",patientno);
		
			response.sendRedirect("PreAnalysis.jsp");
		
		
	  }
	}


