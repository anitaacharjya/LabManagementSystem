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
	
	

  public void addExaminationSubtype(String examName, String subtype,String code,String nornalValue,String unit) throws SQLException {
        String sql = "INSERT INTO TBL_EXAM_SUBTYPE (EXAM_CODE,EXAM_NAME, SUBTYPE, NORMAL_VALUE,UNIT) VALUES (?, ?,?,?,?)";
        try  {
        	Connection conn = dbconnect.getConn();
            PreparedStatement pstmt = conn.prepareStatement(sql);
        	pstmt.setString(1, code);
            pstmt.setString(2, examName);
            pstmt.setString(3, subtype);
            pstmt.setString(4, nornalValue);
            pstmt.setString(5, unit);
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
        	String finalvalue=subSampleName+" - "+normalValue+" - "+unit;
        	listOfSubSample.add(finalvalue);
        }
         
      }catch (SQLException e) {
          e.printStackTrace();
          System.out.println("exception in addExaminationSubtype : "+e);
      }
      //System.out.println("addExaminationSubtype return list : "+listOfSubSample);
	return listOfSubSample;
  }

}
