package com.lms.controller;

import com.lms.daoimpl.CommonFunction;
import com.lms.daoimpl.ExaminationDaoImpl;
import com.lms.daoimpl.SampleDaoImpl;
import com.lms.vo.Prerequisition;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/RequisitionServlet")
public class RequisitionServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Retrieve form parameters
    	String patientNo = request.getParameter("id");
        String patientName = request.getParameter("name");
        String clinicalHistory = request.getParameter("clinicalHistory");
        String addiction = request.getParameter("addiction");
        String allergicHistory = request.getParameter("allergi");
        String other = request.getParameter("other");
        String submitdateTime = request.getParameter("dateTime");
        String sampleCollectedBy = request.getParameter("sampleCollectedBy");
        
        
        // Create ExaminationVO object and set properties
        Prerequisition examVO = new Prerequisition();
        examVO.setClinicalHistory(clinicalHistory);
        examVO.setAddiction(addiction);
        examVO.setAllergicHistory(allergicHistory);
        examVO.setOther(other);
        examVO.setPatientNo(patientNo);
        examVO.setPatientName(patientName);
        examVO.setSampleCollectedBy(sampleCollectedBy);

        // Create DAO implementation object
        SampleDaoImpl smpl = new SampleDaoImpl();
        boolean isAdded = smpl.addPrerequisitionDetails(examVO);
        if(isAdded==true) {
        	CommonFunction obj=new CommonFunction();
        	int value=obj.updateOneItem("TBL_RECEIPT","sample_collection_date",submitdateTime,"patient_id",patientNo);
        }

        // Redirect based on result
        if (isAdded) {
            response.sendRedirect("SampleDetails.jsp"); 
        } else {
            response.sendRedirect("error.jsp"); 
        }
    }
}
