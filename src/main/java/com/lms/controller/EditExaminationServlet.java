package com.lms.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lms.daoimpl.CommonFunction;
import com.lms.daoimpl.ExaminationDaoImpl;
import com.lms.vo.ExaminationDetails;

@WebServlet("/EditExaminationServlet")
public class EditExaminationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
 
    public EditExaminationServlet() {
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
		CommonFunction comm=new CommonFunction();
	    int f =	dao.UpdateExaminationDetails(ex_details);
	   
	    int value=0;
	    if(f>0) {
	    	
	    	value=comm.deleteItem("TBL_EXAM_SUBTYPE", "EXAM_CODE", examcode);
	    }
	    
	    if(f>0 && value>0) {
        String[] examSubtypes = request.getParameterValues("examSubtypeName[]");
        String[] examSubRanges = request.getParameterValues("examNormalRange[]");
        String[] examSubUnits = request.getParameterValues("examUnit[]");
        String code = request.getParameter("code");
        
        ExaminationDaoImpl examDao = new ExaminationDaoImpl();

        try {
            for (int i = 0; i < examSubtypes.length; i++) {
                
                String examSubtype = examSubtypes[i];
                String examSubRange=examSubRanges[i];
                String examSubUnit=examSubUnits[i];
                

               
                if (examSubtype != null && !examSubtype.trim().isEmpty()) {
                	examDao.addExaminationSubtype(examname, examSubtype,examcode,examSubRange,examSubUnit);
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
}
