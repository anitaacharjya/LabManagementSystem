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



}
