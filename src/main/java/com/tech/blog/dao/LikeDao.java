package com.tech.blog.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class LikeDao {
    Connection con;

    public LikeDao(Connection connection) {
        this.con = connection;
    }

    // Insert a like into the database
    public boolean insertLike(int pid, int uid) {
        boolean flag = false;
        try {
            String query = "INSERT INTO `like` (pid, uid) VALUES (?, ?)";
            PreparedStatement ps = this.con.prepareStatement(query);
            ps.setInt(1, pid);
            ps.setInt(2, uid);
            ps.executeUpdate();
            flag = true;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return flag;
    }

    // Count the number of likes on a post
    public int countLikeOnPost(int pid) {
        int count = 0;
        try {
            String query = "SELECT COUNT(*) AS count FROM `like` WHERE pid=?";
            PreparedStatement ps = this.con.prepareStatement(query);
            ps.setInt(1, pid);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                count = rs.getInt("count"); // Corrected column alias
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return count;
    }

    // Check if a user has already liked the post
    public boolean isLikeByUser(int pid, int uid) {
        boolean flag = false;
        try {
            String query = "SELECT * FROM like WHERE pid = ? AND uid = ?";
            PreparedStatement ps = this.con.prepareStatement(query);
            ps.setInt(1, pid);
            ps.setInt(2, uid);
            ResultSet rs = ps.executeQuery();
            if (rs.next() && rs.getInt(1) > 0) {
                flag = true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return flag;
    }

    // Delete a like from the database
    public boolean deleteLike(int pid, int uid) {
        boolean flag = false;
        try {
            String query = "DELETE FROM `like` WHERE pid=? AND uid=?";
            PreparedStatement ps = this.con.prepareStatement(query);
            ps.setInt(1, pid);
            ps.setInt(2, uid);
            int rowsAffected = ps.executeUpdate(); // Corrected method
            flag = rowsAffected > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return flag;
    }
}
