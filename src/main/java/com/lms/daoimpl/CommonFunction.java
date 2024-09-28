package com.lms.daoimpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Base64;
import java.util.List;

import javax.crypto.Cipher;
import javax.crypto.SecretKey;
import javax.crypto.spec.SecretKeySpec;

import com.lms.dbconnect.Dbconnect;
import com.lms.vo.ExaminationDetails;

public class CommonFunction {
	Dbconnect dbconnect = new Dbconnect();
    private static final byte[] key = new byte[] { 
            'T', 'h', 'i', 's', 'I', 's', 'A', 'S', 
            'e', 'c', 'r', 'e', 't', 'K', 'e', 'y' 
        };
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
	 // Delete value G
	 public int deleteItem(String tableName,String columnName,String id) {
	        int value=0;
	        try {
	        	Connection conn = dbconnect.getConn();
	            String sql = "DELETE from "+tableName+" where "+columnName+"='"+id+"'";
	            System.out.println(" Sql "+sql);
	            PreparedStatement ps = conn.prepareStatement(sql);
	            value = ps.executeUpdate();
	        } catch (SQLException e) {
	        	System.out.println("Exception in deleteItem "+e);
	        }
	        return value;
	    }
	 //Pasword passwordencrypt
	    public static String passwordencryptdecrypted(String plainText, String action) throws Exception {
	        Cipher cipher;
	        String value = "";
	        SecretKey secretKey = new SecretKeySpec(key, "AES"); // Use the predefined key
	        cipher = Cipher.getInstance("AES");

	        if (action.equals("ENC")) {
	            byte[] plainTextByte = plainText.getBytes();
	            cipher.init(Cipher.ENCRYPT_MODE, secretKey);
	            byte[] encryptedByte = cipher.doFinal(plainTextByte);
	            Base64.Encoder encoder = Base64.getEncoder();
	            String encryptedText = encoder.encodeToString(encryptedByte);
	            value = encryptedText;
	        } else {
	            Base64.Decoder decoder = Base64.getDecoder();
	            byte[] encryptedTextByte = decoder.decode(plainText);
	            cipher.init(Cipher.DECRYPT_MODE, secretKey);
	            byte[] decryptedByte = cipher.doFinal(encryptedTextByte);
	            String decryptedText = new String(decryptedByte);
	            value = decryptedText;
	        }
	        return value;
	    }
	    
	    
	    //Update one column value 
	    
		 public int updateOneItem(String tableName,String columnName,String updateValue,String primaryId,String id) {
		        int value=0;
		        try {
		        	Connection conn = dbconnect.getConn();
		           // String sql = "DELETE from "+tableName+" where "+columnName+"='"+id+"'";
		        	String sql="UPDATE "+tableName+" set "+columnName+"='"+updateValue+"' where "+primaryId+"='"+id+"'";
		        	System.out.println(" update sql "+sql);
		            PreparedStatement ps = conn.prepareStatement(sql);
		            value = ps.executeUpdate();
		        } catch (SQLException e) {
		        	System.out.println("Exception in getMaxid "+e);
		        
		       
		    }
		      return value;
		 }
}
