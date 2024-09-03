package com.lms.daoimpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

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
		            String sql = "INSERT INTO TBL_EXAMINATION (EXAMINATION_NAME, PRICE,EXAMINATION_CODE,EXAM_TABLE) VALUES (?, ?,?,?)";
		            try (Connection conn = dbconnect.getConn();
		                 PreparedStatement stmt = conn.prepareStatement(sql)) {
		            	
		                stmt.setString(1, examDetail.getEx_name());
		                stmt.setString(2, examDetail.getEx_price());
		                stmt.setString(3, examDetail.getEx_code());
		                stmt.setString(4,finalStr );
		                
		               value = stmt.executeUpdate();

		            } catch (SQLException e) {
		                e.printStackTrace();
		                System.out.println("exception in saveExaminationDetails : "+e);
		            }
		}
					return value;
		        }

}
