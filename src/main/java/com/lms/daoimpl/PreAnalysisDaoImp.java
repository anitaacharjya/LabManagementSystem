package com.lms.daoimpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.lms.dbconnect.Dbconnect;
import com.lms.vo.ExaminationDetails;
import com.lms.vo.PreAnalysis;

public class PreAnalysisDaoImp {
	
	
	 public List<PreAnalysis> getAllReciept() {
	        List<PreAnalysis> recieptList = new ArrayList<>();
	        Dbconnect dbconnect = new Dbconnect();
	        PreAnalysis preanalysis=null;
	        try {
	        	Connection conn = dbconnect.getConn();
	            // SQL query to select all fields from the register table
	            String sql = "SELECT * FROM TBL_RECEIPT";
	            PreparedStatement ps = conn.prepareStatement(sql);
	            ResultSet rs = ps.executeQuery();

	            // Loop through the result set
	            while (rs.next()) {
	                preanalysis = new PreAnalysis();

	                preanalysis.setName(rs.getString("name")); 
	                preanalysis.setAge(rs.getString("age"));
	                preanalysis.setAddress(rs.getString("address"));
	                preanalysis.setPhoneNo(rs.getString("phone_number"));
	                preanalysis.setGender(rs.getString("gender")); 
	                preanalysis.setReferredby(rs.getString("REC_BY"));
	                preanalysis.setBillNo(rs.getString("BILL_NUMBER"));
	                preanalysis.setPatientNo(rs.getString("Patient_NUMBER"));
	                preanalysis.setDate(rs.getString("createdate"));
	                preanalysis.setPaymentMode(rs.getString("payment_mode"));

	                
	                
	                // Add the preanalysiser object to the preanalysiser list
	                recieptList.add(preanalysis);
	            }
	        } catch (SQLException e) {
	        	System.out.println("Exception in getAllpreanalysisers "+e);
	        }
	        // Return the list of preanalysisers
	        return recieptList;
	    }

	 public List<ExaminationDetails> getAllExaminationDetails() {
	        List<ExaminationDetails> examList = new ArrayList<>();
	        Dbconnect dbconnect = new Dbconnect();
	        ExaminationDetails exdetails=null;
	        try {
	        	Connection conn = dbconnect.getConn();
	            // SQL query to select all fields from the register table
	            String sql = "SELECT * FROM TBL_EXAMINATION";
	            PreparedStatement ps = conn.prepareStatement(sql);
	            ResultSet rs = ps.executeQuery();

	            // Loop through the result set
	            while (rs.next()) {
	            	exdetails = new ExaminationDetails();

	                
	            	exdetails.setEx_code(rs.getString("examination_code"));
	            	exdetails.setEx_price(rs.getString("price"));
	            	exdetails.setEx_name(rs.getString("examination_name"));

	                
	                
	                // Add the preanalysiser object to the preanalysiser list
	                examList.add(exdetails);
	            }
	        } catch (SQLException e) {
	        	System.out.println("Exception in getAllpreanalysisers "+e);
	        }
	        // Return the list of preanalysisers
	        return examList;
	    }
	 
	 //examination Details
	// In your DAO class (e.g., ExaminationDaoImpl)
	 public List<ExaminationDetails> getExaminationNames() {
	     List<ExaminationDetails> examinationNames = new ArrayList<>();
	     Dbconnect dbconnect = new Dbconnect();
	     ExaminationDetails exdetails=null;
	     String query = "SELECT examination_name,examination_code FROM TBL_EXAMINATION"; // Example table name and column

	     try (Connection conn = dbconnect.getConn();
	          PreparedStatement stmt = conn.prepareStatement(query);
	          ResultSet rs = stmt.executeQuery()) {

	         while (rs.next()) {
	        	 exdetails = new ExaminationDetails();
	        	 
	        	 exdetails.setEx_name(rs.getString("examination_name")); 
	        	 rs.getString("examination_code");
	        	 examinationNames.add(exdetails);
	            
	         }
	     } catch (SQLException e) {
	         e.printStackTrace();
	     }

	     return examinationNames;
	 }


	 
}
