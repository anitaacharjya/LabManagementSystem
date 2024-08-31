package com.lms.daoimpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.lms.dbconnect.Dbconnect;
import com.lms.vo.ExaminationDetails;

public class CommonFuction {
	Dbconnect dbconnect = new Dbconnect();
	//Finde maxId
	 public int getMaxid(String tableName,String columnName) {
	        ExaminationDetails exdetails=null;
	        int value=0;
	        try {
	        	Connection conn = dbconnect.getConn();
	            String sql = "SELECT max("+columnName+") as maxval FROM "+tableName ;
	            PreparedStatement ps = conn.prepareStatement(sql);
	            ResultSet rs = ps.executeQuery();
	            while (rs.next()) {
	                value=rs.getInt("maxval");
	            }
	        } catch (SQLException e) {
	        	System.out.println("Exception in getMaxid "+e);
	        }
	        return value;
	    }

}
