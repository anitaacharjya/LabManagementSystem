package com.lms.daoimpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

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
			/*
			 * String query =
			 * "INSERT INTO user (name, dob, gender, address, city, state, country, " +
			 * "marital_status, nationality, email, mobile, telephone, identity_document, "
			 * +
			 * "identity_number, employment_type, joining_date, blood_group, designation, "
			 * + "username, password, admin, pre-analysis, analysis, " +
			 * "post-analysis) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)"
			 * ;
			 */
        	String query = "INSERT INTO user (name, dob, gender, address, city, state, country, "
                    + "marital_status, nationality, email, mobile, telephone, identity_document, "
                    + "identity_number, employment_type, joining_date, blood_group, designation, "
                    + "username, password, `admin`, `pre-analysis`, `analysis`, `post-analysis`) "
                    + "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
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

	 public List<User> getAllUsers() {
	        List<User> userList = new ArrayList<>();
	        Dbconnect dbconnect = new Dbconnect();
	        try {
	        	Connection conn = dbconnect.getConn();
	            // SQL query to select all fields from the register table
	            String sql = "SELECT * FROM user";
	            PreparedStatement ps = conn.prepareStatement(sql);
	            ResultSet rs = ps.executeQuery();

	            // Loop through the result set
	            while (rs.next()) {
	                User us = new User();
	                // Set user object fields based on the result set
	                us.setName(rs.getString("name")); // name
	                us.setDob(rs.getString("dob")); // dob
	                us.setGender(rs.getString("gender")); // gender
	                us.setAddress(rs.getString("address")); // address
	                us.setCity(rs.getString("city")); // city
	                us.setState(rs.getString("state")); // state
	                us.setCountry(rs.getString("country")); // country
	                us.setMaritalStatus(rs.getString("marital_status")); // maritalStatus
	                us.setNationality(rs.getString("nationality")); // nationality
	                us.setEmail(rs.getString("email")); // email
	                us.setMobile(rs.getString("mobile")); // telephone
	                us.setIdentityDocument(rs.getString("identity_document")); // identityDocument
	                us.setIdentityNumber(rs.getString("identity_number")); // identityNumber
	                
	                us.setBloodGroup(rs.getString("blood_group")); // bloodGroup
	                us.setDesignation(rs.getString("designation")); // designation
	                us.setUsername(rs.getString("username"));
	                us.setPassword(rs.getString("password"));
	                us.setAdminAccess(rs.getString("admin"));
	                us.setPreanalysisAccess(rs.getString("pre-analysis"));
	                us.setAnalysisAccess(rs.getString("analysis"));
	                us.setPostanalysisAccess(rs.getString("post-analysis"));
	                
	                
	                // Add the user object to the user list
	                userList.add(us);
	            }
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	        // Return the list of users
	        return userList;
	    }

}
