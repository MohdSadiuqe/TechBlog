package com.tech.blog.dao;

import com.tech.blog.entities.User;
import java.sql.*;

public class UserDao {
    private Connection conn;

    // Constructor
    public UserDao(Connection conn) {
        this.conn = conn;
    }

    // Method to retrieve user by email and password
    public User getUserByEmailAndPassword(String email, String password) {
        User user = null;
        try {
            String query = "SELECT * FROM users WHERE email = ? AND password = ?";
            PreparedStatement pstmt = conn.prepareStatement(query);
            pstmt.setString(1, email);
            pstmt.setString(2, password);
            ResultSet rs = pstmt.executeQuery();

            if (rs.next()) {
                user = new User(
                        rs.getInt("id"),
                        rs.getString("name"),
                        rs.getString("email"),
                        rs.getString("password"),
                        rs.getString("gender"),
                        rs.getString("about")

                );
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return user;
    }

    // Method to register a new user
    public boolean saveUser(User user) {
        boolean success = false;
        try {
            String query = "INSERT INTO users (name, email, password, gender, about) VALUES (?, ?, ?, ?, ?)";
            PreparedStatement pstmt = conn.prepareStatement(query);
            pstmt.setString(1, user.getName());
            pstmt.setString(2, user.getEmail());
            pstmt.setString(3, user.getPassword()); // Make sure to hash passwords in real applications!
            pstmt.setString(4, user.getGender());
            pstmt.setString(5, user.getAbout());

            int rowsAffected = pstmt.executeUpdate();
            if (rowsAffected > 0) {
                success = true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return success;
    }

    // Method to update user profile
    public boolean updateUser(User user) {
        boolean success = false;
        try {
            String query = "UPDATE users SET name = ?, email = ?, password = ?, about = ? WHERE id = ?";
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setString(1, user.getName());
            ps.setString(2, user.getEmail());
            ps.setString(3, user.getPassword()); // Hash password before storing
            ps.setString(4, user.getAbout());
            ps.setInt(5, user.getId());

            int rowsAffected = ps.executeUpdate();
            if (rowsAffected > 0) {
                success = true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return success;
    }
    public User getUserByUserId(int userId) {
        User user=null;
        try{
            String query="SELECT * FROM users WHERE id=?";
            PreparedStatement ps=conn.prepareStatement(query);
            ps.setInt(1,userId);
            ResultSet rs=ps.executeQuery();
            if (rs.next()) {
                user=new User();
                String name=rs.getString("name");
                user.setName(name);

                user.setId(rs.getInt("id"));
                user.setEmail(rs.getString("email"));
                user.setPassword(rs.getString("password"));
                user.setGender(rs.getString("gender"));
                user.setAbout(rs.getString("about"));
                user.setProfile(rs.getString("profile"));
            }
        }
        catch (Exception e) {
            e.printStackTrace();
        }
        return user;
    }
}
