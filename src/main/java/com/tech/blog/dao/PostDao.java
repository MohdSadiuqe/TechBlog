package com.tech.blog.dao;

import com.tech.blog.entities.Category;
import com.tech.blog.entities.Posts;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class PostDao {
    Connection con;

    public PostDao(Connection con) {
        this.con = con;
    }

    // Fetch all categories
    public ArrayList<Category> getCategories() {
        ArrayList<Category> categoryList = new ArrayList<>();
        try {
            String query = "SELECT * FROM categories";
            PreparedStatement ps = con.prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Category category = new Category(rs.getInt("cid"), rs.getString("name"), rs.getString("description"));
                categoryList.add(category);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return categoryList;
    }

    // Get all posts
    public List<Posts> getPosts() {
        List<Posts> list = new ArrayList<>();
        try {
            String query = "SELECT * FROM posts";
            PreparedStatement ps = con.prepareStatement(query);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                int pid = rs.getInt("pid");
                String pTitle = rs.getString("pTitle");
                String pContent = rs.getString("pContent");
                String pCode = rs.getString("pCode");
                Timestamp pDate = rs.getTimestamp("pDate");
                int cid = rs.getInt("cid");
                int userId = rs.getInt("user_id");

                Posts post = new Posts(pid, pTitle, pContent, pCode, pDate, cid, userId);
                list.add(post);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    // Get posts by category ID
    public List<Posts> getPostsByCatId(int cid) {
        List<Posts> list = new ArrayList<>();
        try {
            String query = "SELECT * FROM posts WHERE cid=?";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, cid);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                int pid = rs.getInt("pid");
                String pTitle = rs.getString("pTitle");
                String pContent = rs.getString("pContent");
                String pCode = rs.getString("pCode");
                Timestamp pDate = rs.getTimestamp("pDate");
                int categoryId = rs.getInt("cid");
                int userId = rs.getInt("user_id");

                Posts post = new Posts(pid, pTitle, pContent, pCode, pDate, categoryId, userId);
                list.add(post);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    // Save a post
    public boolean savePost(Posts posts) {
        boolean flag = false;
        try {
            String query = "INSERT INTO posts(pTitle, pContent, pCode, cid, user_id) VALUES (?, ?, ?, ?, ?)";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, posts.getpTitle());
            ps.setString(2, posts.getpContent());
            ps.setString(3, posts.getpCode());
            ps.setInt(4, posts.getCid());
            ps.setInt(5, posts.getUserId());

            int rowsAffected = ps.executeUpdate();
            flag = rowsAffected > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return flag;
    }

    // Get a post by its ID
    public Posts getPostByPostId(int postId) {
        Posts post = null;
        try {
            String query = "SELECT * FROM posts WHERE pid=?";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, postId);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                post = new Posts(
                        rs.getInt("pid"),
                        rs.getString("pTitle"),
                        rs.getString("pContent"),
                        rs.getString("pCode"),
                        rs.getTimestamp("pDate"),
                        rs.getInt("cid"),
                        rs.getInt("user_id")
                );
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return post;
    }
}
