package com.lms.daoimpl;

import java.sql.Connection;
import java.sql.PreparedStatement;

import com.lms.dbconnect.Dbconnect;
import com.lms.vo.Prerequisition;

public class SampleDaoImpl {
	boolean result = false;
	Dbconnect dbconnect = new Dbconnect();

	    public boolean addPrerequisitionDetails(Prerequisition examVO) {
	        
	        try {
	            

	        	Connection conn = dbconnect.getConn();
	            String query = "INSERT INTO TBL_PREREQUISITION (patient_id, name, clinical_history,addiction, allergic_history, other) VALUES (?, ?, ?, ?, ?, ?)";
	            PreparedStatement ps = conn.prepareStatement(query);
	            // Set parameters
	            ps.setString(1, examVO.getPatientNo());
	           ps.setString(2,examVO.getPatientName() );
	           ps.setString(3,examVO.getClinicalHistory() );
	           ps.setString(4,examVO.getAddiction() );
	           ps.setString(5,examVO.getAllergicHistory() );
	           ps.setString(6,examVO.getOther() );
	           

	            // Execute query
	            int rowsAffected = ps.executeUpdate();
	            result = rowsAffected > 0;
	        } catch (Exception e) {
	            e.printStackTrace();
	        } 
	        return result;
	    }

	    private int getNextExamId() {
	        // Implement logic to get the next examination ID from the database
	        return 1; // Placeholder
	    }
	}



