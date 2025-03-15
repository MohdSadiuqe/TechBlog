package com.tech.blog.servlets;

import com.tech.blog.entities.Posts;
import com.tech.blog.entities.User;
import com.tech.blog.dao.PostDao;
import com.tech.blog.helper.ConnectionProvider;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Timestamp;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class AddPostServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        // Retrieve parameters
        String pTitle = request.getParameter("pTitle");
        String pContent = request.getParameter("pContent");
        String pCode = request.getParameter("pCode");
        int cid = Integer.parseInt(request.getParameter("cid"));

        // Retrieve current user from session
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("currentUser");

        if (user == null) {
            System.out.println("Session expired or user not logged in!");
            out.println("error");
            return;
        }

        int userId = user.getId();

        // Debugging logs (optional, replace with a logger in production)
        System.out.println("Received Post Data:");
        System.out.println("Title: " + pTitle);
        System.out.println("Content: " + pContent);
        System.out.println("Code: " + pCode);
        System.out.println("Category ID: " + cid);
        System.out.println("User ID: " + userId);

        // Create post object
        Posts post = new Posts();
        post.setpTitle(pTitle);
        post.setpContent(pContent);
        post.setpCode(pCode);
        post.setpDate(new Timestamp(System.currentTimeMillis())); // Current time
        post.setCid(cid);
        post.setUserId(userId);

        // Save post to database
        PostDao postDao = new PostDao(ConnectionProvider.getConnection());
        boolean saved = postDao.savePost(post);

        if (saved) {
            out.println("done");  // Success message
        } else {
            out.println("error");
        }
    }
}
