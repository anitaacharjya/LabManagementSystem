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
		String examGroup = request.getParameter("group");
		
		ExaminationDetails ex_details = new ExaminationDetails();
		ex_details.setEx_name(examname);
		ex_details.setEx_price(examprice);
		ex_details.setEx_code(examcode);
		ex_details.setGroup(examGroup);
		
		ExaminationDaoImpl dao = new ExaminationDaoImpl();
	    int f =	dao.addExaminationDetails(ex_details);
	    
        String[] examSubtypes = request.getParameterValues("examSubtypeName[]");
        String[] examSubRanges = request.getParameterValues("examNormalRange[]");
        String[] examSubUnits = request.getParameterValues("examUnit[]");
        String[] examSubPrices = request.getParameterValues("examPrice[]");
        String code = request.getParameter("code");
        System.out.println("Exam Subtype: " + examSubtypes.length);
        ExaminationDaoImpl examDao = new ExaminationDaoImpl();

        try {
            for (int i = 0; i < examSubtypes.length; i++) {
                
                String examSubtype = examSubtypes[i];
                String examSubRange=examSubRanges[i];
                String examSubUnit=examSubUnits[i];
                String examSubPrice=examSubPrices[i];
                

               
                if (examSubtype != null && !examSubtype.trim().isEmpty()) {
                	examDao.addExaminationSubtype(examname, examSubtype,examcode,examSubRange,examSubUnit,examSubPrice);
                   System.out.println(" inside "+i);
                }
            }
	
	if(f>0) {
		response.sendRedirect("ExaminationDetails.jsp");
	}	
	} catch (Exception e) {
        e.printStackTrace();
        response.sendRedirect("AddExaminationSample.jsp"); // Redirect to error page
    }
        
	}
}
