package com.lms.daoimpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.lms.dbconnect.Dbconnect;
import com.lms.vo.ExaminationDetails;
import com.lms.vo.Prerequisition;

public class SampleDaoImpl {
	boolean result = false;
	Dbconnect dbconnect = new Dbconnect();

	    public boolean addPrerequisitionDetails(Prerequisition examVO) {
	        
	        try {
	            

	        	Connection conn = dbconnect.getConn();
	            String query = "INSERT INTO TBL_PREREQUISITION (patient_id, name, clinical_history,addiction, allergic_history, other,sample_collected_by) VALUES (?, ?, ?, ?, ?, ?,?)";
	            PreparedStatement ps = conn.prepareStatement(query);
	            // Set parameters
	            ps.setString(1, examVO.getPatientNo());
	           ps.setString(2,examVO.getPatientName() );
	           ps.setString(3,examVO.getClinicalHistory() );
	           ps.setString(4,examVO.getAddiction() );
	           ps.setString(5,examVO.getAllergicHistory() );
	           ps.setString(6,examVO.getOther() );
	           ps.setString(7,examVO.getSampleCollectedBy() );
	           

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
	    
// Fetch Pre Requisition details	    
		 public Prerequisition getPreRequisitionDetails(String patientID) {
		        List<Prerequisition> list = new ArrayList<>();
		        Prerequisition preReq=new Prerequisition();
		        try {
		        	Connection conn = dbconnect.getConn();
		            // SQL query to select all fields from the register table
		            String sql = "SELECT * FROM TBL_PREREQUISITION where patient_id ='"+patientID+"'";
		            System.out.println(" Sql "+sql);
		            PreparedStatement ps = conn.prepareStatement(sql);
		            ResultSet rs = ps.executeQuery();
	             
		            // Loop through the result set
		            while (rs.next()) {
		            	preReq.setAddiction(rs.getString("addiction"));
		            	preReq.setAllergicHistory(rs.getString("allergic_history"));
		            	preReq.setClinicalHistory(rs.getString("clinical_history"));
		            	preReq.setOther(rs.getString("other"));

		                
		                // Add the preanalysiser object to the preanalysiser list
		            	
		            }
		        } catch (SQLException e) {
		        	System.out.println("Exception in getExaminationDetails "+e);
		        }
		        // Return the list of preanalysisers
		        return preReq;
		    }
	// add sample details	 
	 public boolean addTestSampleDetails(String patientName,String testName,String patientId,String sample) {
		        boolean result=false;
		        try {
		        	Connection conn = dbconnect.getConn();
		            String query = "INSERT INTO TBL_TESTSAMPLE_DTLS (name,test_name,patient_id,sample_name) VALUES (?, ?, ?, ?)";
		            PreparedStatement ps = conn.prepareStatement(query);
		            // Set parameters
		           ps.setString(1,patientName);
		           ps.setString(2,testName);
		           ps.setString(3,patientId);
		           ps.setString(4,sample);
		     
		           

		            // Execute query
		            int rowsAffected = ps.executeUpdate();
		            if(rowsAffected>0) {
		            	result=true;
		            }
		            if(result==true) {
		            	String updatesql ="UPDATE examination_details set sample_status=? where patient_id=? and exam_name=?";
		            	PreparedStatement psUpdate = conn.prepareStatement(updatesql);
		            	psUpdate.setString(1,"C");
		            	psUpdate.setString(2,patientId);
		            	psUpdate.setString(3,testName);
		            	int rowsupdate = psUpdate.executeUpdate();
		            	System.out.println("rowsupdate "+rowsupdate);
			           
		            }
		            
		        } catch (Exception e) {
		            e.printStackTrace();
		        } 
		        return result;
		    }
	 // fetch sample details 
	// Fetch Pre Requisition details	    
	 public Map<String, List<String>> getSampleDetails(String patientID, String name) {
		    Map<String, List<String>> map = new HashMap<>(); // Use a map with a list of values
		    try {
		        Connection conn = dbconnect.getConn();
		        // SQL query to select all fields from the register table
		        String sql = "SELECT * FROM TBL_TESTSAMPLE_DTLS WHERE patient_id = ? AND name = ?";
		        PreparedStatement ps = conn.prepareStatement(sql);
		        ps.setString(1, patientID);
		        ps.setString(2, name);
		        ResultSet rs = ps.executeQuery();

		        // Loop through the result set
		        while (rs.next()) {
		            String testName = rs.getString("test_name");
		            String sampleName = rs.getString("sample_name");

		            // Check if the map already contains the test name
		            if (!map.containsKey(testName)) {
		                map.put(testName, new ArrayList<>()); // Initialize a new list if the test name is not yet in the map
		            }

		            // Add the sample name to the list of sample names for the test name
		            map.get(testName).add(sampleName);
		        }
		    } catch (SQLException e) {
		        System.out.println("Exception in getSampleDetails: " + e);
		    }
		    return map; // Return the map with multiple values for each key
		}

		 
		 
	}



