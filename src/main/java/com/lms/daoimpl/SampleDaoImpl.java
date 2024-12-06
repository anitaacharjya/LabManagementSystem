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
	 public boolean addTestSampleDetails(String Id,String collectionDate,String modalFrom) {
		        boolean result=false;
		        try {
		        	Connection conn = dbconnect.getConn();
		        	PreparedStatement psUpdate=null;
		        	
                       if(modalFrom.equals("Analysis")) {
                    	String updatesql ="UPDATE examination_details set sample_status=?,SMPL_RECEIVED_TIME=? where id=?";
   		            	psUpdate = conn.prepareStatement(updatesql);
   		            	psUpdate.setString(1,"R");
   		            	psUpdate.setString(2,collectionDate);
   		            	psUpdate.setString(3,Id);
		            	
                       }else {
                    	String updatesql ="UPDATE examination_details set sample_status=?,SMPL_COLLECTION_TIME=? where id=?";
   		            	psUpdate = conn.prepareStatement(updatesql);
   		            	psUpdate.setString(1,"C");
   		            	psUpdate.setString(2,collectionDate);
   		            	psUpdate.setString(3,Id);
                       }
		            	int rowsupdate = psUpdate.executeUpdate();
		            	System.out.println("rowsupdate "+rowsupdate);
			           if(rowsupdate>0) {
			        	   result=true;
			           }
		            
		            
		        } catch (Exception e) {
		            e.printStackTrace();
		        } 
		        return result;
		    }
	 // fetch sample details 
	// Fetch Pre Requisition details	    
	 public List<String> getSampleDetails(String patientID) {
		    List<String> list = new ArrayList<String>(); // Use a map with a list of values
		    try {
		        Connection conn = dbconnect.getConn();
		        // SQL query to select all fields from the register table
		        String sql = "SELECT * FROM examination_details WHERE patient_id = ?";
		        PreparedStatement ps = conn.prepareStatement(sql);
		        ps.setString(1, patientID);
		       // ps.setString(2, name);
		        ResultSet rs = ps.executeQuery();

		        // Loop through the result set
		        while (rs.next()) {
		            String testName = rs.getString("exam_name");
		            String collectTime=rs.getString("SMPL_COLLECTION_TIME");
		        	String recivedTime=rs.getString("SMPL_RECEIVED_TIME");
		            
		            if(testName!=null)
		            {
		            	String sqlTastDetails = "SELECT * FROM TBL_EXAM_SUBTYPE WHERE id = ?";
				        PreparedStatement psTest = conn.prepareStatement(sqlTastDetails);
				        psTest.setString(1, testName);
				       
				        ResultSet rsTest = psTest.executeQuery();
				        while (rsTest.next())
				        {
				        	String examName=rsTest.getString("EXAM_NAME");
				        	String parameter=rsTest.getString("SUBTYPE");
				        	
				        	String value=examName+"~"+parameter+"~"+collectTime+"~"+recivedTime;
				        	
				        	list.add(value);
				        }
				        
		            	
		            }
		           

		            
		        }
		    } catch (SQLException e) {
		        System.out.println("Exception in getSampleDetails: " + e);
		    }
		    return list; // Return the map with multiple values for each key
		}
	 
	 //Add Tast value 
		// add sample details	 
	 public boolean addTestValue(String Id,String testCompletionTime,String testValue) {
		        boolean result=false;
		        try {
		        	Connection conn = dbconnect.getConn();
		        	PreparedStatement psUpdate=null;
		        	String updatesql ="UPDATE examination_details set sample_status=?,TEST_COMPLETION_TIME=?,TEST_VALUE=? where id=?";
		            	psUpdate = conn.prepareStatement(updatesql);
		            	psUpdate.setString(1,"STV");
		            	psUpdate.setString(2,testCompletionTime);
		            	psUpdate.setString(3,testValue);
		            	psUpdate.setString(4,Id);
		            	int rowsupdate = psUpdate.executeUpdate();
		            	System.out.println("rowsupdate "+rowsupdate);
			           if(rowsupdate>0) {
			        	   result=true;
			           }
		            
		            
		        } catch (Exception e) {
		            e.printStackTrace();
		        } 
		        return result;
		    }

		 
		 
	}



