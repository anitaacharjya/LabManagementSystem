package com.lms.controller;

import com.lms.daoimpl.CommonFunction;
import com.lms.daoimpl.ExaminationDaoImpl;
import com.lms.daoimpl.SampleDaoImpl;
import com.lms.vo.Prerequisition;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Paths;

@MultipartConfig(
	    fileSizeThreshold = 1024 * 1024, // 1 MB (threshold before file is written to disk)
	    maxFileSize = 300 * 1024, // 300 KB (max size for an individual file)
	    maxRequestSize = 1024 * 1024 * 5 // 5 MB (max size for the request)
	)

@WebServlet("/RequisitionServlet")
public class RequisitionServlet extends HttpServlet {
	private static final String UPLOAD_DIRECTORY = "D:\\Pallab\\LMS\\LabManagementSystem\\src\\main\\webapp\\Document\\";
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
        String newFileName=null;
        // Document upload 
        String uploadPath = getServletContext().getRealPath("") + File.separator + UPLOAD_DIRECTORY;
        File uploadDir = new File(UPLOAD_DIRECTORY);
        if (!uploadDir.exists()) {
            uploadDir.mkdir();
        }
        String filePath=null;
        Part filePart = request.getPart("supportingDocument");
        if (filePart != null && filePart.getSize() > 0) {
            String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString(); // Get the file name
            
            String originalFileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();
            String fileExtension = originalFileName.substring(originalFileName.lastIndexOf("."));
            
            newFileName = patientNo + fileExtension;
            filePath = UPLOAD_DIRECTORY + newFileName;
            
           
            
            try (InputStream inputStream = filePart.getInputStream()) {
                Files.copy(inputStream, Paths.get(filePath));
            }

            response.getWriter().println("File uploaded successfully: " + fileName);
        } else {
            response.getWriter().println("No file uploaded or file is too large!");
        }
        
        
        // Create ExaminationVO object and set properties
        Prerequisition examVO = new Prerequisition();
        examVO.setClinicalHistory(clinicalHistory);
        examVO.setAddiction(addiction);
        examVO.setAllergicHistory(allergicHistory);
        examVO.setOther(other);
        examVO.setPatientNo(patientNo);
        examVO.setPatientName(patientName);
        examVO.setSampleCollectedBy(sampleCollectedBy);
        examVO.setFilePath(newFileName);

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
