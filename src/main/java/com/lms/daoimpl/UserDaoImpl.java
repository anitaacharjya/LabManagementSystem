package com.lms.daoimpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.lms.dbconnect.Dbconnect;
import com.lms.vo.User;



public class UserDaoImpl {
	
	public User login(String username, String password) {
		Dbconnect dbconnect = new Dbconnect();
        User us = null;
        try {
        	Connection conn = dbconnect.getConn();
            String sql = "SELECT username,password FROM user WHERE username = ?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, username);
            

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                us = new User();
               
               us.setUsername(rs.getString(1));
               us.setPassword(rs.getString(2));
               

            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return us;
    }
	
	public boolean registerUser(User user) {
        
        boolean isRegistered = false;
        Dbconnect dbconnect = new Dbconnect();
        try {
        	Connection conn = dbconnect.getConn();
            // Create an SQL insert query
            String query = "INSERT INTO user (name, dob, gender, address, city, state, country, "
                         + "marital_status, nationality, email, mobile, telephone, identity_document, "
                         + "identity_number, employment_type, joining_date, blood_group, designation, "
                         + "username, password, admin, pre-analysis, analysis, "
                         + "post-analysis) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

            // Prepare the statement
            PreparedStatement  statement = conn.prepareStatement(query);

            // Set the values from the user object
            statement.setString(1, user.getName());
            statement.setString(2, user.getDob());
            statement.setString(3, user.getGender());
            statement.setString(4, user.getAddress());
            statement.setString(5, user.getCity());
            statement.setString(6, user.getState());
            statement.setString(7, user.getCountry());
            statement.setString(8, user.getMaritalStatus());
            statement.setString(9, user.getNationality());
            statement.setString(10, user.getEmail());
            statement.setString(11, user.getMobile());
            statement.setString(12, user.getTelephone());
            statement.setString(13, user.getIdentityDocument());
            statement.setString(14, user.getIdentityNumber());
            statement.setString(15, user.getEmploymentType());
            statement.setString(16, user.getJoiningDate());
            statement.setString(17, user.getBloodGroup());
            statement.setString(18, user.getDesignation());
            statement.setString(19, user.getUsername());
            statement.setString(20, user.getPassword());
            statement.setString(21, user.getAdminAccess());
            statement.setString(22, user.getPreanalysisAccess());
            statement.setString(23, user.getAnalysisAccess());
            statement.setString(24, user.getPostanalysisAccess());

            // Execute the query
            int rowsAffected = statement.executeUpdate();

            // Check if the insertion was successful
            if (rowsAffected > 0) {
                isRegistered = true;
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return isRegistered;
    }



}
