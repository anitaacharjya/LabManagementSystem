package com.lms.daoimpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.lms.dbconnect.Dbconnect;
import com.lms.vo.ExaminationDetails;

public class ExaminationDaoImpl {
	
	 Dbconnect dbconnect = new Dbconnect();
	public int addExaminationDetails(ExaminationDetails examDetail) {
		int value = 0;
		String input = examDetail.getEx_name();
		if(input!= null) {
			
		
		String uppercaseStr = input.toUpperCase();
        String cleanedStr = uppercaseStr.replaceAll("[^A-Z0-9 ]", "");
        String finalStr = cleanedStr.replace(" ", "_");
		            String sql = "INSERT INTO TBL_EXAMINATION (EXAMINATION_NAME, PRICE,EXAMINATION_CODE,EXAM_TABLE,GROUP_NAME) VALUES (?, ?,?,?,?)";
		            try (Connection conn = dbconnect.getConn();
		                 PreparedStatement stmt = conn.prepareStatement(sql)) {
		            	
		                stmt.setString(1, examDetail.getEx_name());
		                stmt.setString(2, examDetail.getEx_price());
		                stmt.setString(3, examDetail.getEx_code());
		                stmt.setString(4,finalStr );
		                stmt.setString(5, examDetail.getGroup());
		                
		               value = stmt.executeUpdate();

		            } catch (SQLException e) {
		                e.printStackTrace();
		                System.out.println("exception in saveExaminationDetails : "+e);
		            }
		}
					return value;
		        }
	
	

  public void addExaminationSubtype(String examName, String subtype,String code,String nornalValue,String unit,String price) throws SQLException {
        String sql = "INSERT INTO TBL_EXAM_SUBTYPE (EXAM_CODE,EXAM_NAME, SUBTYPE, NORMAL_VALUE,UNIT,PRICE) VALUES (?, ?,?,?,?,?)";
        try  {
        	Connection conn = dbconnect.getConn();
            PreparedStatement pstmt = conn.prepareStatement(sql);
        	pstmt.setString(1, code);
            pstmt.setString(2, examName);
            pstmt.setString(3, subtype);
            pstmt.setString(4, nornalValue);
            pstmt.setString(5, unit);
            pstmt.setString(6, price);
            pstmt.executeUpdate();
        }catch (SQLException e) {
            e.printStackTrace();
            System.out.println("exception in addExaminationSubtype : "+e);
        }
    }
  
  // show sublist of sample details
  public List<String> showExaminationSubtype(String code) throws SQLException {
      //String sql = "INSERT INTO TBL_EXAM_SUBTYPE (EXAM_CODE,EXAM_NAME, SUBTYPE) VALUES (?, ?,?)";
	  List<String> listOfSubSample= new ArrayList<String>();
      String sql="SELECT * FROM TBL_EXAM_SUBTYPE Where EXAM_CODE=?";
      try  {
      	Connection conn = dbconnect.getConn();
          PreparedStatement pstmt = conn.prepareStatement(sql);
      	  pstmt.setString(1, code);
      	  ResultSet rs = pstmt.executeQuery();
        
        // Loop through the result set
        while (rs.next()) {
        	String subSampleName=rs.getString("SUBTYPE");
        	String normalValue=rs.getString("NORMAL_VALUE");
        	String unit=rs.getString("UNIT");
        	String price=rs.getString("PRICE");
        	price=price+".00 rs";
        	String finalvalue=subSampleName+" - "+normalValue+" - "+unit+" - "+price;
        	listOfSubSample.add(finalvalue);
        }
         
      }catch (SQLException e) {
          e.printStackTrace();
          System.out.println("exception in addExaminationSubtype : "+e);
      }
      //System.out.println("addExaminationSubtype return list : "+listOfSubSample);
	return listOfSubSample;
  }
  
  // show sublist of sample de for modal
  public List<String> showExaminationSubtypeModal(String code) throws SQLException {
      //String sql = "INSERT INTO TBL_EXAM_SUBTYPE (EXAM_CODE,EXAM_NAME, SUBTYPE) VALUES (?, ?,?)";
	  List<String> listOfSubSample= new ArrayList<String>();
      String sql="SELECT * FROM TBL_EXAM_SUBTYPE Where ID=?";
      try  {
      	Connection conn = dbconnect.getConn();
          PreparedStatement pstmt = conn.prepareStatement(sql);
      	  pstmt.setString(1, code);
      	  ResultSet rs = pstmt.executeQuery();
        
        // Loop through the result set
        while (rs.next()) {
        	String subSampleName=rs.getString("SUBTYPE");
        	String normalValue=rs.getString("NORMAL_VALUE");
        	String unit=rs.getString("UNIT");
        	String price=rs.getString("PRICE");
        	price=price+".00 rs";
        	String finalvalue=subSampleName+" - "+normalValue+" - "+unit+" - "+price;
        	listOfSubSample.add(finalvalue);
        }
         
      }catch (SQLException e) {
          e.printStackTrace();
          System.out.println("exception in addExaminationSubtype : "+e);
      }
      //System.out.println("addExaminationSubtype return list : "+listOfSubSample);
	return listOfSubSample;
  }
  
  //Edite ExamninationDetails
  public ExaminationDetails getExaminationByCode(String examCode) {
	  ExaminationDetails examDtls=new ExaminationDetails();
	  String sql="SELECT * FROM TBL_EXAMINATION Where EXAMINATION_CODE=?";
	  try  {
		   
	      	Connection conn = dbconnect.getConn();
	          PreparedStatement pstmt = conn.prepareStatement(sql);
	      	  pstmt.setString(1, examCode);
	      	  ResultSet rs = pstmt.executeQuery();
	        
	        // Loop through the result set
	        while (rs.next()) {
	        	examDtls.setEx_code(examCode);
	        	examDtls.setEx_name(rs.getString("EXAMINATION_NAME"));
	        	examDtls.setEx_price(rs.getString("PRICE"));
	        	examDtls.setGroup(rs.getString("GROUP_NAME"));
	        	
	        }
	         
	      }catch (SQLException e) {
	          e.printStackTrace();
	          System.out.println("exception in addExaminationSubtype : "+e);
	      }
	  
	  return examDtls;
  }
  
  public List<String> getSubExaminatione(String examCode) {
	  List<String> list= new ArrayList<String>();
	  String sql="SELECT * FROM TBL_EXAM_SUBTYPE Where EXAM_CODE=?";
	  try  {
		   
	      	Connection conn = dbconnect.getConn();
	          PreparedStatement pstmt = conn.prepareStatement(sql);
	      	  pstmt.setString(1, examCode);
	      	  ResultSet rs = pstmt.executeQuery();
	        
	        // Loop through the result set
	        while (rs.next()) {
	        	String subType=rs.getString("SUBTYPE");
	        	String normalValue=rs.getString("NORMAL_VALUE");
	        	String unit=rs.getString("UNIT");
	        	String price=rs.getString("PRICE");
	        	String finalvalue=subType+","+normalValue+","+unit+","+price;
	        	list.add(finalvalue);
	        	
	        }
	         
	      }catch (SQLException e) {
	          e.printStackTrace();
	          System.out.println("exception in addExaminationSubtype : "+e);
	      }
	  
	  return list;
  }
  
  ///UPDATE
  public int UpdateExaminationDetails(ExaminationDetails examDetail) {
		int value = 0;
		String input = examDetail.getEx_name();
		if(input!= null) {
			
		
		String uppercaseStr = input.toUpperCase();
      String cleanedStr = uppercaseStr.replaceAll("[^A-Z0-9 ]", "");
      String finalStr = cleanedStr.replace(" ", "_");
		           // String sql = "INSERT INTO TBL_EXAMINATION (EXAMINATION_NAME, PRICE,EXAMINATION_CODE,EXAM_TABLE,GROUP_NAME) VALUES (?, ?,?,?,?)";
		            String sql ="UPDATE TBL_EXAMINATION set EXAMINATION_NAME=?,PRICE=?,GROUP_NAME=?,EXAM_TABLE=? where EXAMINATION_CODE=?";
		            try (Connection conn = dbconnect.getConn();
		                 PreparedStatement stmt = conn.prepareStatement(sql)) {
		            	
		                stmt.setString(1, examDetail.getEx_name());
		                stmt.setString(2, examDetail.getEx_price());
		                stmt.setString(3, examDetail.getGroup());
		                stmt.setString(4, finalStr);
		                stmt.setString(5, examDetail.getEx_code());
		                
		               value = stmt.executeUpdate();

		            } catch (SQLException e) {
		                e.printStackTrace();
		                System.out.println("exception in UpdateExaminationDetails : "+e);
		            }
		}
					return value;
		        }
	

}
