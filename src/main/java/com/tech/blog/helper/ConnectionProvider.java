package com.tech.blog.helper;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class ConnectionProvider {
    private static Connection con; // Static variable to store the connection

    public static Connection getConnection() {
        if (con == null) { // Ensure only one connection is created
            try {
                // Load MySQL JDBC Driver
                Class.forName("com.mysql.cj.jdbc.Driver");

                // Database credentials
                String url = "jdbc:mysql://localhost:3306/TechBlog";
                String username = "root";
                String password = "1Hamzakhan#";

                // Establish connection
                con = DriverManager.getConnection(url, username, password);

            } catch (ClassNotFoundException e) {
                e.printStackTrace();
                throw new RuntimeException("MySQL Driver not found!", e);
            } catch (SQLException e) {
                e.printStackTrace();
                throw new RuntimeException("Failed to connect to database!", e);
            }
        }
        return con;
    }
}
