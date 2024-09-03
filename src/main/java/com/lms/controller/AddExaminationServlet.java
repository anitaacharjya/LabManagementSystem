package com.lms.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lms.daoimpl.ExaminationDaoImpl;
import com.lms.vo.ExaminationDetails;

/**
 * Servlet implementation class AddExaminationServlet
 */
@WebServlet("/AddExaminationServlet")
public class AddExaminationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public AddExaminationServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String examname = request.getParameter("name");
		String examprice = request.getParameter("price");
		String examcode = request.getParameter("code");
		
		ExaminationDetails ex_details = new ExaminationDetails();
		ex_details.setEx_name(examname);
		ex_details.setEx_price(examprice);
		ex_details.setEx_code(examcode);
		
		ExaminationDaoImpl dao = new ExaminationDaoImpl();
		
	int f =	dao.addExaminationDetails(ex_details);
	
	if(f>0) {
		response.sendRedirect("ExaminationDetails.jsp");
	}
		
		
	}

}
