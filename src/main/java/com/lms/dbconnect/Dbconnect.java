package com.lms.dbconnect;
import java.sql.Connection;
import java.sql.DriverManager;

public class Dbconnect {
    private static Connection conn;

    public static Connection getConn() {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://lms.chkg6o8wakuj.eu-north-1.rds.amazonaws.com/LMS","admin","Pallab2024");

        } catch (Exception e) {
            e.printStackTrace();
        }
        return conn;
    }
}
