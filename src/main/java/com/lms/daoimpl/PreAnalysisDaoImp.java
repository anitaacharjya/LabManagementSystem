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
	                preanalysis.setSampleCollectionDate(rs.getString("sample_collection_date"));
	                // Add the preanalysiser object to the preanalysiser list
	                recieptList.add(preanalysis);
	            }
	        } catch (SQLException e) {
	        	System.out.println("Exception in getAllpreanalysisers "+e);
	        }
	        // Return the list of preanalysisers
	        return recieptList;
	    }

	 public List<PreAnalysis> getSampleDetails() {
	        List<PreAnalysis> recieptList = new ArrayList<>();
	        Dbconnect dbconnect = new Dbconnect();
	        PreAnalysis preanalysis=null;
	        try {
	        	Connection conn = dbconnect.getConn();
	            // SQL query to select all fields from the register table
	            String sql = "SELECT * FROM TBL_RECEIPT where void!='Y'";
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
	                preanalysis.setSampleCollectionDate(rs.getString("sample_collection_date"));
	                //preanalysis.setRecivedDate(rs.getString("SMPL_RECEIVED_TIME"));
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
	 public List<ExaminationDetails> getExaminationDetails(String patientID) {
	        List<ExaminationDetails> examList = new ArrayList<>();
	        ExaminationDetails exdetails=null;
	        try {
	        	Connection conn = dbconnect.getConn();
	            // SQL query to select all fields from the register table
	            String sql = "SELECT * FROM examination_details where patient_id ='"+patientID+"'";
	            System.out.println(" Sql "+sql);
	            PreparedStatement ps = conn.prepareStatement(sql);
	            ResultSet rs = ps.executeQuery();
             
	            // Loop through the result set
	            while (rs.next()) {
	            	exdetails = new ExaminationDetails();

	                
	            	
	            	exdetails.setEx_price(rs.getString("price"));
	            	exdetails.setEx_name(rs.getString("exam_name"));
	            	exdetails.setEx_code(rs.getString("examination_code"));
	            	exdetails.setSample_status(rs.getString("sample_status"));
	            	exdetails.setSample_id(rs.getNString("sample_id"));
	            	exdetails.setPatient_id(rs.getString("patient_id"));
	            	exdetails.setId(rs.getString("id"));
	            	exdetails.setSampleCollectionTime(rs.getString("SMPL_COLLECTION_TIME"));
	            	exdetails.setRecivedDate(rs.getString("SMPL_RECEIVED_TIME"));
	            	

	                
	                
	                // Add the preanalysiser object to the preanalysiser list
	                examList.add(exdetails);
	            }
	        } catch (SQLException e) {
	        	System.out.println("Exception in getExaminationDetails "+e);
	        }
	        // Return the list of preanalysisers
	        return examList;
	    }	
	 //TRF Detsils
	 public Map<String,String> getTRFDetails(String patientID) {
	        Map<String,String> trmMap = new HashMap<>();
	        
	        try {
	        	Connection conn = dbconnect.getConn();
	            // SQL query to select all fields from the register table
	            String sql = "SELECT * FROM TBL_PREREQUISITION where patient_id ='"+patientID+"'";
	            System.out.println(" Sql "+sql);
	            PreparedStatement ps = conn.prepareStatement(sql);
	            ResultSet rs = ps.executeQuery();
          
	            // Loop through the result set
	            while (rs.next()) {
	            
	            	trmMap.put("Other", rs.getString("other"));
	            	trmMap.put("Allergic History", rs.getString("allergic_history"));
	            	trmMap.put("Addiction", rs.getString("addiction"));
	            	trmMap.put("Clinical History", rs.getString("clinical_history"));
	      
	            	
	            }
	        } catch (SQLException e) {
	        	System.out.println("Exception in getExaminationDetails "+e);
	        }
	        // Return the list of preanalysisers
	        return trmMap;
	    }
	// In your DAO class (e.g., ExaminationDaoImpl)
	 public List<ExaminationDetails> getExaminationNames() {
	     List<ExaminationDetails> examinationNames = new ArrayList<>();
	     Dbconnect dbconnect = new Dbconnect();
	     ExaminationDetails exdetails=null;
	     String query = "SELECT ID,EXAM_NAME,EXAM_CODE,SUBTYPE,PRICE FROM TBL_EXAM_SUBTYPE"; // Example table name and column

	     try (Connection conn = dbconnect.getConn();
	          PreparedStatement stmt = conn.prepareStatement(query);
	          ResultSet rs = stmt.executeQuery()) {

	         while (rs.next()) {
	        	 exdetails = new ExaminationDetails();
	        	 
	        	 exdetails.setEx_name(rs.getString("SUBTYPE"));
	        	 exdetails.setId(rs.getString("ID"));
	        	 
	        	
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
	        String query = "SELECT price FROM TBL_EXAM_SUBTYPE WHERE ID = ?";
	        
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
	 
	//fetch exam code
		 public String getExaminationCodeByName(String examName) {
			 Dbconnect dbconnect = new Dbconnect();
		        String code = null;
		        // Implement the logic to fetch the price from the database based on the examName
		        String query = "SELECT ID FROM TBL_EXAM_SUBTYPE WHERE ID = ?";
		        
		        try (Connection con = dbconnect.getConn();
		             PreparedStatement ps = con.prepareStatement(query)) {
		            ps.setString(1, examName);
		            ResultSet rs = ps.executeQuery();
		            if (rs.next()) {
		            	code = rs.getString("ID");
		            	if(code!=null) {
		            		code="EX0"+code;
		            	}
		            }
		        } catch (SQLException e) {
		            e.printStackTrace();
		        }
		        return code;
		        
		 }     
	 
	        //save reciept
	        
	        public void saveUser(PreAnalysis user) {
	            String sql = "INSERT INTO TBL_RECEIPT (name, age, gender, address, phone_number, email, date, bill_no, patient_id, reffered_by,payment_mode,adv_amount,discount,void) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?,?,?,?,?)";
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
	                stmt.setString(11, user.getPaymentMode());
	                stmt.setString(12, user.getAdvanceamount());
	                stmt.setString(13, user.getDiscount());
	                stmt.setString(14, "N");

	                stmt.executeUpdate();

	            } catch (SQLException e) {
	                e.printStackTrace();
	            }
	            
	            
	            
	        
	    }
	        
public int saveExaminationDetails(ExaminationDetails examDetail,String patient_id) {
	int value = 0;
	            String sql = "INSERT INTO examination_details (patient_id,exam_name, price,EXAMINATION_CODE,sample_status) VALUES (?, ?,?,?,?)";
	            try (Connection conn = dbconnect.getConn();
	                 PreparedStatement stmt = conn.prepareStatement(sql)) {

	            	stmt.setString(1, patient_id);
	                stmt.setString(2, examDetail.getEx_name());
	                stmt.setString(3, examDetail.getEx_price());
	                stmt.setString(4, examDetail.getEx_code());
	                stmt.setString(5, "P");
	               value = stmt.executeUpdate();

	            } catch (SQLException e) {
	                e.printStackTrace();
	                System.out.println("exception in saveExaminationDetails : "+e);
	            }
				return value;
	        }

// Reciept details
public PreAnalysis getRecieptdetails(String patientID) {
    Dbconnect dbconnect = new Dbconnect();
    PreAnalysis preanalysis=null;
    try {
    	Connection conn = dbconnect.getConn();
        // SQL query to select all fields from the register table
        String sql = "SELECT * FROM TBL_RECEIPT where patient_id ='"+patientID+"'";
        System.out.println(" getRecieptdetails SQL "+sql);
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
            preanalysis.setAdvanceamount(rs.getString("adv_amount"));
            preanalysis.setSampleCollectionDate(rs.getString("sample_collection_date"));
            

        }
    } catch (SQLException e) {
    	System.out.println("Exception in getAllpreanalysisers "+e);
    }
    // Return the list of preanalysisers
    return preanalysis;
}
//Exam name
//fetch exam code
public String getExaminationName(String examName) {
	 Dbconnect dbconnect = new Dbconnect();
       String subtype = null;
       // Implement the logic to fetch the price from the database based on the examName
       String query = "SELECT SUBTYPE FROM TBL_EXAM_SUBTYPE WHERE ID = ?";
       
       try (Connection con = dbconnect.getConn();
            PreparedStatement ps = con.prepareStatement(query)) {
           ps.setString(1, examName);
           ResultSet rs = ps.executeQuery();
           if (rs.next()) {
        	   subtype = rs.getString("SUBTYPE");
           
           }
       } catch (SQLException e) {
           e.printStackTrace();
       }
       return subtype;
       
}

//fetch exam code
public String getSampleType(String examName) {
	 Dbconnect dbconnect = new Dbconnect();
     String subtype = null;
     // Implement the logic to fetch the price from the database based on the examName
     String query = "SELECT EXAM_NAME FROM TBL_EXAM_SUBTYPE WHERE ID = ?";
     
     try (Connection con = dbconnect.getConn();
          PreparedStatement ps = con.prepareStatement(query)) {
         ps.setString(1, examName);
         ResultSet rs = ps.executeQuery();
         if (rs.next()) {
      	   subtype = rs.getString("EXAM_NAME");
         
         }
     } catch (SQLException e) {
         e.printStackTrace();
     }
     return subtype;
     
}
	


}
