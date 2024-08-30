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
	
	 Dbconnect dbconnect = new Dbconnect();

	
	
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
	                preanalysis.setEmail(rs.getString("email"));
	                preanalysis.setGender(rs.getString("gender")); 
	                preanalysis.setReferredby(rs.getString("reffered_by"));
	                preanalysis.setBillNo(rs.getString("bill_no"));
	                preanalysis.setPatientNo(rs.getString("patient_id"));
	                preanalysis.setDate(rs.getString("date"));
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

//fetch exam price
	 public double getExaminationPriceByName(String examName) {
		 Dbconnect dbconnect = new Dbconnect();
	        double price = 0.0;
	        // Implement the logic to fetch the price from the database based on the examName
	        String query = "SELECT price FROM TBL_EXAMINATION WHERE examination_name = ?";
	        
	        try (Connection con = dbconnect.getConn();
	             PreparedStatement ps = con.prepareStatement(query)) {
	            ps.setString(1, examName);
	            ResultSet rs = ps.executeQuery();
	            if (rs.next()) {
	                price = rs.getDouble("price");
	            }
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	        return price;
	        
	 }     
	        //save reciept
	        
	        public void saveUser(PreAnalysis user) {
	            String sql = "INSERT INTO TBL_RECEIPT (name, age, gender, address, phone_number, email, date, bill_no, patient_id, reffered_by) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
	            try (
	            	Connection conn = dbconnect.getConn();
	                 PreparedStatement stmt = conn.prepareStatement(sql)) {

	                stmt.setString(1, user.getName());
	                stmt.setString(2, user.getAge());
	                stmt.setString(3, user.getGender());
	                stmt.setString(4, user.getAddress());
	                stmt.setString(5, user.getPhoneNo());
	                stmt.setString(6, user.getEmail());
	                stmt.setString(7, user.getDate());
	                stmt.setString(8, user.getBillNo());
	                stmt.setString(9, user.getPatientNo());
	                stmt.setString(10, user.getReferredby());

	                stmt.executeUpdate();

	            } catch (SQLException e) {
	                e.printStackTrace();
	            }
	            
	            
	            
	        
	    }
	        
	        public void saveExaminationDetails(ExaminationDetails examDetail,String patient_id) {
	            String sql = "INSERT INTO examination_details (patient_id,exam_name, price) VALUES (?, ?,?)";
	            try (Connection conn = dbconnect.getConn();
	                 PreparedStatement stmt = conn.prepareStatement(sql)) {

	            	stmt.setString(1, patient_id);
	                stmt.setString(2, examDetail.getEx_name());
	                stmt.setString(3, examDetail.getEx_price());
	                stmt.executeUpdate();

	            } catch (SQLException e) {
	                e.printStackTrace();
	            }
	        }
	 
}
